
<!-- README.md is generated from README.Rmd. Please edit that file -->

# paintingr

<!-- badges: start -->
<!-- badges: end -->

> “The greatest value of a picture is when it forces us to notice what
> we never expected to see.” - John Tukey

Color is one of the most important attributes of a figure. Dedicated
choice of color can help us deliver our idea more vividly.

------------------------------------------------------------------------

The goal of `paintingr` is to provide a set of palettes from paintings.

Structure of the package was based on coding from the
[wesanderson](https://github.com/karthik/wesanderson) packages.

## Installation

You can install the `paintingr` with:

``` r
install.packages('paintingr')
```

Or the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thereallda/paintingr")
```

## Usage

``` r
library(paintingr)
# display all palettes
display_all_palettes()
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

## Palettes

### Pearlgirl

Girl with a Pearl Earring - Johannes Vermeer (1665),
[Source](https://www.mauritshuis.nl/en/our-collection/artworks/670-girl-with-a-pearl-earring/)

``` r
paint_palette("Pearlgirl")
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

### Splash

A Bigger Splash - David Hockney (1967),
[Source](https://www.tate.org.uk/art/artworks/hockney-a-bigger-splash-t03254)

``` r
paint_palette("Splash")
```

<img src="man/figures/README-unnamed-chunk-9-1.png" width="100%" />

### Autumn

Autumn at Oirase - Kawase Hasui (1933),
[Source](https://www.pepperholm.com/products/autumn-at-oirase)

``` r
paint_palette("Autumn")
```

<img src="man/figures/README-unnamed-chunk-11-1.png" width="100%" />

### Villeneuve

Matin à Villeneuve - Henri Biva (1905),
[Source](https://en.wikipedia.org/wiki/Matin_%C3%A0_Villeneuve)

``` r
paint_palette("Villeneuve")
```

<img src="man/figures/README-unnamed-chunk-13-1.png" width="100%" />

### Ophelia

Ophelia - John Everett Millais (1851-1852),
[Source](https://www.tate.org.uk/art/artworks/millais-ophelia-n01506)

``` r
paint_palette("Ophelia")
```

<img src="man/figures/README-unnamed-chunk-15-1.png" width="100%" />

### Kitchen

Kitchen (Detail 2) - Liza Lou (1991–1996),
[Source](https://whitney.org/collection/works/34855)

``` r
paint_palette("Kitchen")
```

<img src="man/figures/README-unnamed-chunk-17-1.png" width="100%" />

### Spring

SPRING BY THE SEINE - Claude Monet (1875),
[Source](https://www.mcgawgraphics.com/products/claude-monet-spring-by-the-seine-1875)

``` r
paint_palette("Spring")
```

<img src="man/figures/README-unnamed-chunk-19-1.png" width="100%" />

### Strawberries

Strawberries - Édouard Manet (1882),
[Source](https://www.metmuseum.org/art/collection/search/436963)

``` r
paint_palette("Strawberries")
```

<img src="man/figures/README-unnamed-chunk-21-1.png" width="100%" />

### Seascape

Seascape at Saintes-Maries - Vincent van Gogh (1888),
[Source](https://en.wikipedia.org/wiki/Saintes-Maries_(Van_Gogh_series))

``` r
paint_palette("Seascape")
```

<img src="man/figures/README-unnamed-chunk-23-1.png" width="100%" />

### Twilight

Twilight, Venice - Claude Monet (1908),
[Source](https://commons.wikimedia.org/wiki/File:Claude_Monet_-_Twilight,_Venice.jpg)

``` r
paint_palette("Twilight")
```

<img src="man/figures/README-unnamed-chunk-25-1.png" width="100%" />

### Abstract

Abstract Composition - Jessica Dismorr (1915),
[Source](https://www.tate.org.uk/art/artworks/dismorr-abstract-composition-t01084)

``` r
paint_palette("Abstract")
```

<img src="man/figures/README-unnamed-chunk-27-1.png" width="100%" />

### Vesuivus

Vesuvius in Eruption - Joseph Wright of Derby (1776-1780),
[Source](https://www.bl.uk/collection-items/vesuvius-in-eruption)

``` r
paint_palette("Vesuvius")
```

<img src="man/figures/README-unnamed-chunk-29-1.png" width="100%" />

## Examples

`ggplot2`-based examples

### Heatmap

Use `type="continuous"` to automatically interpolate between colors if
you want more colors than the palette can offer (n \> 5/6).

``` r
library(ggplot2)
# Dummy data
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- seq(1,20)+runif(400, 0, 5)

# Heatmap 
pal <- paint_palette("Autumn", n=100, type="continuous")
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile() + 
  scale_fill_gradientn(colours = pal) + 
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) + 
  coord_equal() 
```

<img src="man/figures/README-unnamed-chunk-30-1.png" width="100%" />

``` r
# Heatmap with palette of "Vesuvius" 
pal2 <- paint_palette("Vesuvius", n=100, type="continuous")
ggplot(data, aes(X, Y, fill= Z)) + 
  geom_tile() + 
  scale_fill_gradientn(colours = pal2) + 
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_discrete(expand = c(0, 0)) + 
  coord_equal() 
```

<img src="man/figures/README-unnamed-chunk-31-1.png" width="100%" />

### Boxplot

``` r
# use iris data from `ggplot2` for demonstration
data(iris)

ggplot(iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  theme_classic() +
  theme(legend.position = "top") +
  scale_fill_manual(values = paint_palette("Villeneuve"))
```

<img src="man/figures/README-unnamed-chunk-32-1.png" width="100%" />

### Scatter

``` r
# Scatter
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point(aes(color = Species)) +
  theme_classic() +
  theme(legend.position = "top") +
  scale_color_manual(values = paint_palette("Kitchen"))
```

<img src="man/figures/README-unnamed-chunk-33-1.png" width="100%" />

### Violin plot

``` r
data(mpg)
# violin plot with 7 colors, Spring palette only have six colors add one more
ggplot(mpg, aes(x=class, y=hwy, fill=class)) + 
  geom_violin() +
  theme_classic() +
  scale_fill_manual(values = c(paint_palette("Spring", n=6), "black"))
```

<img src="man/figures/README-unnamed-chunk-34-1.png" width="100%" />

### Barplot

``` r
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar() +
  theme_classic() +
  scale_fill_manual(values = paint_palette("Ophelia"))
```

<img src="man/figures/README-unnamed-chunk-35-1.png" width="100%" />
