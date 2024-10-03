#' Yemen Administrative Boundaries Dataset (Admin Level 0)
#'
#' This dataset provides the administrative boundaries of
#' Yemen at Admin Level 0 (country level) as of February 01, 2019,
#' to November 27, 2019. It is in simple features ('sf') format and
#' represents the national boundary of Yemen.
#'
#' @source Central Statistical Organization (CSO), contributed
#' by OCHA Yemen. Downloaded from
#' \url{https://data.humdata.org/dataset/cod-ab-yem} on 20/09/2024.
#' @note This dataset is publicly available under the Creative
#' Commons Attribution for Intergovernmental Organisations license.
#' @section Time Period:
#' February 01, 2019 - November 27, 2019
#' @section Last Modified:
#' June 28, 2024
#' @section Update Frequency:
#' Updated yearly.
#' @section Methodology:
#' Data was downloaded from the Humanitarian Data Exchange (HDX).
#' @section License:
#' Creative Commons Attribution for Intergovernmental Organisations.
#'
#' @format A simple features ('sf') object with the following fields:
#' \describe{
#'   \item{ADM0_PCODE}{Character: Country code for Yemen.}
#'   \item{ADM0_EN}{Character: Country name in English}
#'   \item{ADM0_AR}{Character: Country name in Arabic}
#'   \item{geometry}{Multipolygon: Spatial geometry of the national boundary}
#' }
#'
#' @keywords datasets, geo, sf, boundaries, Yemen
"yemmap_adm0"

#' Yemen Administrative Boundaries Dataset
#' (Admin Level 1 - Governorate / Mohafada)
#'
#' This dataset provides the administrative boundaries of Yemen
#' at Admin Level 1 (governorate / mohafada level) as of February 01, 2019,
#' to November 27, 2019. It includes English and Arabic names for each
#' administrative division, as well as their corresponding administrative
#' codes. The dataset is in simple features ('sf') format and represents
#' the geometry of Yemen’s first-level administrative divisions.
#'
#' @source Central Statistical Organization (CSO), contributed by OCHA Yemen.
#' Downloaded from
#' \url{https://data.humdata.org/dataset/cod-ab-yem} on 20/09/2024.
#' @note This dataset is publicly available under the Creative Commons
#' Attribution for Intergovernmental Organisations license.
#' @section Time Period:
#' February 01, 2019 - November 27, 2019
#' @section Last Modified:
#' June 28, 2024
#' @section Update Frequency:
#' Updated yearly.
#' @section Methodology:
#' Data was downloaded from the Humanitarian Data Exchange (HDX).
#' @section License:
#' Creative Commons Attribution for Intergovernmental Organisations.
#'
#' @format A simple features ('sf') object with the following fields:
#' \describe{
#'   \item{ADM0_PCODE}{Character: Country code for Yemen.}
#'   \item{ADM1_PCODE}{Character: Administrative code for each
#'                     first-level division (governorate).}
#'   \item{ADM1_EN}{Character: Name of the administrative division in English.}
#'   \item{ADM1_AR}{Character: Name of the administrative division in Arabic.}
#'   \item{geometry}{Multipolygon: Spatial geometry of the governorate
#'     boundaries.}
#' }
#'
#' @keywords datasets, geo, sf, boundaries, Yemen
"yemmap_adm1"

#' Yemen Administrative Boundaries Dataset (Admin Level 2 -
#' District / Modeeriyyah)
#'
#' This dataset provides the administrative boundaries of Yemen
#' at Admin Level 2 (district / modeeriyyah  level) as of February 01, 2019,
#' to November 27, 2019. It includes English and Arabic names for each
#' administrative division, as well as their corresponding administrative
#' codes. The dataset is in simple features ('sf') format and represents
#' the geometry of Yemen’s first-level administrative divisions.
#'
#' @source Central Statistical Organization (CSO), contributed by OCHA Yemen.
#' Downloaded from
#' \url{https://data.humdata.org/dataset/cod-ab-yem} on 20/09/2024.
#' @note This dataset is publicly available under the Creative Commons
#' Attribution for Intergovernmental Organisations license.
#' @section Time Period:
#' February 01, 2019 - November 27, 2019
#' @section Last Modified:
#' June 28, 2024
#' @section Update Frequency:
#' Updated yearly.
#' @section Methodology:
#' Data was downloaded from the Humanitarian Data Exchange (HDX).
#' @section License:
#' Creative Commons Attribution for Intergovernmental Organisations.
#'
#' @format A simple features ('sf') object with the following fields:
#' \describe{
#'   \item{ADM0_PCODE}{Character: Country code for Yemen.}
#'   \item{ADM1_PCODE}{Character: Administrative code for each
#'                     first-level division (governorate).}
#'   \item{ADM2_PCODE}{Character: Administrative code for each
#'                     second-level division (district).}
#'   \item{ADM2_EN}{Character: Name of the administrative division in English.}
#'   \item{ADM2_AR}{Character: Name of the administrative division in Arabic.}
#'   \item{geometry}{Multipolygon: Spatial geometry of the district
#'     boundaries.}
#' }
#'
#' @keywords datasets, geo, sf, boundaries, Yemen
"yemmap_adm2"

#' Yemen Administrative Boundaries Dataset (Admin Level 3 -
#' Sub-district / Ozlah)
#'
#' This dataset provides the administrative boundaries of Yemen
#' at Admin Level 3 (sub-district / ozlah level) as of February 01, 2019,
#' to November 27, 2019. It includes English and Arabic names for each
#' administrative division, as well as their corresponding administrative
#' codes. The dataset is in simple features ('sf') format and represents
#' the geometry of Yemen’s first-level administrative divisions.
#'
#' @source Central Statistical Organization (CSO), contributed by OCHA Yemen.
#' Downloaded from
#' \url{https://data.humdata.org/dataset/cod-ab-yem} on 20/09/2024.
#' @note This dataset is publicly available under the Creative Commons
#' Attribution for Intergovernmental Organisations license.
#' @section Time Period:
#' February 01, 2019 - November 27, 2019
#' @section Last Modified:
#' June 28, 2024
#' @section Update Frequency:
#' Updated yearly.
#' @section Methodology:
#' Data was downloaded from the Humanitarian Data Exchange (HDX).
#' @section License:
#' Creative Commons Attribution for Intergovernmental Organisations.
#'
#' @format A simple features ('sf') object with the following fields:
#' \describe{
#'   \item{ADM0_PCODE}{Character: Country code for Yemen.}
#'   \item{ADM1_PCODE}{Character: Administrative code for each
#'                     first-level division (governorate).}
#'   \item{ADM2_PCODE}{Character: Administrative code for each
#'                     second-level division (district).}

#'   \item{ADM3_PCODE}{Character: Administrative code for each
#'                     third-level division (sub-district).}
#'   \item{ADM3_EN}{Character: Name of the administrative division in English.}
#'   \item{ADM3_AR}{Character: Name of the administrative division in Arabic.}
#'   \item{geometry}{Multipolygon: Spatial geometry of the sub-district
#'     boundaries.}
#' }
#'
#' @keywords datasets, geo, sf, boundaries, Yemen
"yemmap_adm3"


#' World Basemap
#'
#'
#' @format A simple features ('sf') object
#'
#' @keywords datasets, geo, sf
"world"

#' World Basemap cropped to Yemen
#'
#'
#' @format A simple features ('sf') object
#'
#' @keywords datasets, geo, sf
"world_cropped"
