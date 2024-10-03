yem_theme <- function(...) {
  hrbrthemes::theme_ipsum(...) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(family = "Roboto Condensed"),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.background = ggplot2::element_rect(
        fill = "#dfecf8",
        color = "#dfecf8"
      )
    )
}


#' Plot Yemen's map showing internal borders at the Admin Level 0
#'
#'
#' @return ggplot2 plot
#' @export
yem_plot_adm0 <- function() {
  world_cropped |>
    ggplot() +
    geom_sf(fill = "#f2f1ed") +
    geom_sf(
      data = yemmap_adm0,
      fill = "#ffffff",
      color = "#6e6e6e",
      linewidth = 0.6
    ) +
    yem_theme() +
    ggspatial::annotation_scale(text_family = "Roboto Condensed", line_width = 0.5, style = "ticks") +
    ggplot2::coord_sf(expand = FALSE, clip = "off")
}

#' Plot Yemen's map showing internal borders at the Admin Level 1
#'
#'
#' @return ggplot2 plot
#' @export
yem_plot_adm1 <- function() {
  sysfonts::font_add_google("Roboto Condensed", "Roboto Condensed")
  hrbrthemes::update_geom_font_defaults(family = "Roboto Condensed")
  showtext::showtext_auto()

  ggplot() +
    geom_sf(data = world_cropped, fill = "#f2f1ed") +
    geom_sf(
      data = yemmap_adm1,
      fill = "#ffffff",
      color = "#6e6e6e"
    ) +
    ggrepel::geom_label_repel(
      aes(
        label = .data[["ADM1_EN"]],
        geometry = .data[["geometry"]]
      ),
      stat = "sf_coordinates",
      data = yemmap_adm1,
      family = "Roboto Condensed"
    ) +
    yem_theme() +
    ggspatial::annotation_scale() +
    ggspatial::annotation_north_arrow(
      which_north = "true", location = "tr",
      style = ggspatial::north_arrow_nautical(fill = c("grey40", "white"), line_col = "grey20")
    ) +
    ggplot2::coord_sf(expand = FALSE, clip = "off")
}


#' Plot Yemen's map showing internal borders at the Admin Level 2
#'
#'
#' @return ggplot2 plot
#' @export
yem_plot_adm2 <- function() {
  sysfonts::font_add_google("Roboto Condensed", "Roboto Condensed")
  hrbrthemes::update_geom_font_defaults(family = "Roboto Condensed")
  showtext::showtext_auto()

  ggplot() +
    geom_sf(data = world_cropped, fill = "#f2f1ed") +
    geom_sf(
      data = yemmap_adm2,
      fill = "#ffffff",
      color = "#6e6e6e"
    ) +
    # ggrepel::geom_label_repel(
    #   aes(
    #     label = .data[["ADM2_EN"]],
    #     geometry = .data[["geometry"]]
    #   ),
    #   stat = "sf_coordinates",
    #   data = yemmap_adm2,
    #   family = "Roboto Condensed"
    # ) +
    yem_theme() +
    ggspatial::annotation_scale() +
    ggspatial::annotation_north_arrow(
      which_north = "true", location = "tr",
      style = ggspatial::north_arrow_nautical(fill = c("grey40", "white"), line_col = "grey20")
    ) +
    ggplot2::coord_sf(expand = FALSE, clip = "off")
}
