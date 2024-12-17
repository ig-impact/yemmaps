yem_colors <- c()

#' Custom ggplot2 theme from Yemen Maps
#'
#' @param ... arguemnts passed to [hrbrthemes::theme_ipsum]
#'
#' @return a ggplot2 theme
#' @export
yem_theme <- function(...) {
  main_font_family <- "Roboto Condensed"
  theme_ipsum(...) + # nolint object_usage_linter
    theme( # nolint object_usage_linter
      plot.title = element_text(family = main_font_family), # nolint object_usage_linter
      plot.subtitle = element_text(family = main_font_family),
      plot.caption = element_text(family = main_font_family), # nolint object_usage_linter
      panel.grid.major = element_blank(), # nolint object_usage_linter
      panel.grid.minor = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      panel.background = element_rect( # nolint object_usage_linter
        fill = "#dfecf8",
        color = "#dfecf8"
      )
    )
}
