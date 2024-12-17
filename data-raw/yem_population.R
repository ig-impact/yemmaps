rlang::check_installed("janitor")
rlang::check_installed("readxl")
rlang::check_installed("usethis")

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
  janitor::clean_names(replace = c("\\+" = "_plus")) |>
  janitor::remove_empty("rows")


yem_population <- raw_yem_population |>
  collapse::fsubset(2:nrow(raw_yem_population)) |>
  collapse::gv(c(
    "yem_pcode_adm1" = "governorate_pcode",
    "yem_pcode_adm2" = "districte_pcode",
    "yem_population_cso_estimate" = "cso_estimated_population_2024",
    "yem_population_estimate" = "current_estimated_population",
    "yem_idps" = "total_id_ps_in_district"
  ), rename = TRUE) |>
  collapse::ftransformv(
    vars = c(
      "yem_idps",
      "yem_population_estimate",
      "yem_population_cso_estimate"
    ),
    FUN = as.numeric
  )

usethis::use_data(yem_population, overwrite = TRUE)
