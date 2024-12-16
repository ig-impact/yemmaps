stopifnot(
  requireNamespace("httr2"),
  requireNamespace("archive"),
  requireNamespace("fs")
)

shp_url <- paste0(
  "https://data.humdata.org/dataset/6b2656e2-b915-4671-bfed-468d5edcd80a",
  "/resource/31161a5e-2111-4967-9f1e-4fceeb38a3a1/download",
  "/yem-administrative-divisions-shapefiles.zip"
)

shp_tmp_dir <- tempdir()
shp_tmp_zip <- tempfile(fileext = ".zip", tmpdir = shp_tmp_dir)

httr2::request(shp_url) |>
  httr2::req_perform(path = shp_tmp_zip)

archive::archive_extract(shp_tmp_zip, dir = shp_tmp_dir)

# Loading ADM0
yem_adm0 <- sf::st_read(
  fs::path(shp_tmp_dir, "yem_admbnda_adm0_govyem_cso_20191002.shp")
) |>
  collapse::gv(
    c(
      "yem_pcode_adm0" = "ADM0_PCODE",
      "yem_adm0_en" = "ADM0_EN",
      "yem_adm0_ar" = "ADM0_AR",
      "geometry"
    ),
    rename = TRUE
  )

usethis::use_data(yem_adm0, overwrite = TRUE)

# Loading ADM1
yem_adm1 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm1_govyem_cso_20191002.shp"
)) |>
  collapse::gv(
    c(
      "yem_pcode_adm0" = "ADM0_PCODE",
      "yem_pcode_adm1" = "ADM1_PCODE",
      "yem_adm1_en" = "ADM1_EN",
      "yem_adm1_ar" = "ADM1_AR",
      "geometry"
    ),
    rename = TRUE
  )
usethis::use_data(yem_adm1, overwrite = TRUE)

# Loading ADM2
yem_adm2 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm2_govyem_cso_20191002.shp"
)) |>
  collapse::gv(
    c(
      "yem_pcode_adm0" = "ADM0_PCODE",
      "yem_pcode_adm1" = "ADM1_PCODE",
      "yem_pcode_adm2" = "ADM2_PCODE",
      "yem_adm2_en" = "ADM2_EN",
      "yem_adm2_ar" = "ADM2_AR",
      "geometry"
    ),
    rename = TRUE
  )
usethis::use_data(yem_adm2, overwrite = TRUE)

# Loading ADM3
yem_adm3 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm3_govyem_cso_20191002.shp"
)) |>
  collapse::gv(
    c(
      "yem_pcode_adm0" = "ADM0_PCODE",
      "yem_pcode_adm1" = "ADM1_PCODE",
      "yem_pcode_adm2" = "ADM2_PCODE",
      "yem_pcode_adm3" = "ADM3_PCODE",
      "yem_adm3_en" = "ADM3_EN",
      "yem_adm3_ar" = "ADM3_AR",
      "geometry"
    ),
    rename = TRUE
  )
usethis::use_data(yem_adm3, overwrite = TRUE)

# World Basemap
world <- sf::st_read(
  system.file("extdata/world_basemap/world_basemap.shp", package = "yemmaps")
) |> sf::st_make_valid()
usethis::use_data(world, overwrite = TRUE)

sf::sf_use_s2(FALSE)

world_cropped <- world |>
  sf::st_crop(sf::st_bbox(yem_adm0)) |>
  sf::st_make_valid()

usethis::use_data(world_cropped, overwrite = TRUE)
