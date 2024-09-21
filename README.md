
# yemmaps <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

yemmaps is an R package for accessing and working with geographic
boundary data for Yemen. It provides easy-to-use functions to retrieve
boundaries at different administrative levels—country, regions,
provinces, and districts—and integrates smoothly with tools like
ggplot2, leaflet, and sf for visualization. You can also join your own
data, like population or economic info, to these boundaries for mapping
and analysis.

## Installation

You can install the development version of yemmaps like so:

``` r
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(yemmaps)
library(ggplot2)
library(hrbrthemes)

theme_set(theme_ft_rc())

ggplot(yemmap_adm0) +
  geom_sf() +
  labs(title = "Administrative map of Yemen")
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
library(yemmaps)
library(ggplot2)
library(hrbrthemes)
library(ggrepel)

theme_set(theme_ft_rc())

ggplot(yemmap_adm1) +
  geom_sf(fill = "white") +
  ggrepel::geom_label_repel(
    aes(label = ADM1_EN, geometry = geometry),
    stat = "sf_coordinates"
  ) +
  labs(title = "Administrative map of Yemen", subtitle = "at the level of governorate")
#> Warning in st_point_on_surface.sfc(sf::st_zm(x)): st_point_on_surface may not
#> give correct results for longitude/latitude data
#> Warning: ggrepel: 2 unlabeled data points (too many overlaps). Consider
#> increasing max.overlaps
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />
