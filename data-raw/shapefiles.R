requireNamespace("httr2", quietly = TRUE)
requireNamespace("archive", quietly = TRUE)
requireNamespace("fs", quietly = TRUE)

shp_url <- "https://data.humdata.org/dataset/6b2656e2-b915-4671-bfed-468d5edcd80a/resource/31161a5e-2111-4967-9f1e-4fceeb38a3a1/download/yem-administrative-divisions-shapefiles.zip"

shp_tmp_dir <- tempdir()
shp_tmp_zip <- tempfile(fileext = ".zip", tmpdir = shp_tmp_dir)

httr2::request(shp_url) |>
  httr2::req_perform(path = shp_tmp_zip)

archive::archive_extract(shp_tmp_zip, dir = shp_tmp_dir)

# Loading ADM0
yemmap_adm0 <- sf::st_read(
  fs::path(shp_tmp_dir, "yem_admbnda_adm0_govyem_cso_20191002.shp")
) |>
  dplyr::select(
    dplyr::all_of(c(
      "ADM0_PCODE",
      "ADM0_EN", "ADM0_AR",
      "geometry"
    ))
  )
usethis::use_data(yemmap_adm0, overwrite = TRUE)

# Loading ADM1
yemmap_adm1 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm1_govyem_cso_20191002.shp"
)) |>
  dplyr::select(dplyr::all_of(c(
    "ADM0_PCODE", "ADM1_PCODE",
    "ADM1_EN", "ADM1_AR",
    "geometry"
  )))
usethis::use_data(yemmap_adm1, overwrite = TRUE)

# Loading ADM2
yemmap_adm2 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm2_govyem_cso_20191002.shp"
)) |>
  dplyr::select(dplyr::all_of(c(
    "ADM0_PCODE", "ADM1_PCODE", "ADM2_PCODE",
    "ADM2_EN", "ADM2_AR",
    "geometry"
  )))
usethis::use_data(yemmap_adm2, overwrite = TRUE)

# Loading ADM3
yemmap_adm3 <- sf::st_read(fs::path(
  shp_tmp_dir,
  "yem_admbnda_adm3_govyem_cso_20191002.shp"
)) |>
  dplyr::select(dplyr::all_of(c(
    "ADM0_PCODE", "ADM1_PCODE", "ADM2_PCODE", "ADM3_PCODE",
    "ADM3_EN", "ADM3_AR",
    "geometry"
  )))
usethis::use_data(yemmap_adm3, overwrite = TRUE)

# World Basemap

world <- sf::st_read("world_basemap.shp") |> sf::st_make_valid()
usethis::use_data(world, overwrite = TRUE)

world_cropped <- world |>
  sf::st_crop(sf::st_bbox(yemmap_adm0)) |>
  sf::st_make_valid()

usethis::use_data(world_cropped, overwrite = TRUE)
