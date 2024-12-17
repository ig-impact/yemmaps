stopifnot(
  requireNamespace("readxl", quietly = TRUE),
  requireNamespace("httr2", quietly = TRUE),
  requireNamespace("janitor", quietly = TRUE)
)

url <- paste0(
  "https://data.humdata.org/dataset/1ffe81f1-b980-430f-b53e-dd79e936f291/",
  "resource/1327c5a4-6c6e-41ac-930a-1d502a2fa767/download/",
  "yem-population-projection-dataset-2024-v1.0.xlsx"
)


tmp_dir <- tempdir()
tmp_file <- tempfile(fileext = ".xlsx", tmpdir = tmp_dir)

httr2::request(url) |>
  httr2::req_perform(path = tmp_file)

raw_yem_population <- readxl::read_excel(tmp_file,
  skip = 1,
  .name_repair = "minimal"
) |>
  janitor::clean_names(replace = c("\\+" = "_plus"))


yem_population <- raw_yem_population |>
  collapse::fsubset(2:nrow(raw_yem_population)) |>
  collapse::gv(c(
    "yem_adm1_pcode" = "governorate_pcode",
    "yem_adm2_pcode" = "districte_pcode",
    "yem_population_cso_estimate" = "cso_estimated_population_2024",
    "yem_population_estimate" = "current_estimated_population",
    "yem_idps" = "total_id_ps_in_district"
  ), rename = TRUE)

usethis::use_data(yem_population, overwrite = TRUE)
