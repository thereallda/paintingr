#' Complete list of palettes
#'
#' Use \code{\link{paint_palette}} to construct palettes of desired length.
#'
#' @export
painting_palettes <- list(

  "Pearlgirl" = c("#C35743", "#CDA66B", "#F3DFBA", "#9DB4C8", "#346893"),
  "Splash" = c("#977059", "#CAAD9D", "#CBC28D", "#4F99B4", "#176AA6"),
  "Autumn" = c("#C76041", "#E29B51", "#F5E25F", "#589188", "#2B3B40"),
  "Villeneuve" = c("#304601", "#678D4B", "#9FAF86", "#ABB6CD", "#DAD8C5"),
  "Ophelia" = c("#736B29", "#AE9477", "#56714C", "#59587F", "#c88B91"),
  "Kitchen" = c("#B81319", "#9C5C03", "#82A348", "#E9DB81", "#275F80"),
  "Spring" = c("#285786", "#8EA9BF", "#396E4A", "#90AC70", "#E17C6B", "#EFC3A4"),
  "Starrynight" = c("#17435F", "#4B86B2", "#78B3BE", "#F1EB93", "#BECC6C"),
  "Strawberries" = c("#97351D", "#B95A35", "#DDAC84", "#CDBB9F", "#706859"),
  "Seascape" = c("#114A79", "#4086AF", "#AFD2E0", "#ADCABB", "#689C9A"),
  "Twilight" = c("#13559F", "#599AB7", "#A9C4B4", "#FFCC48", "#DF832C", "#A83C1E")

)

#' Paintings palette generator
#'
#' @param name Name of desired palette. Choice are:
#'     \code{Pearlgirl}, \code{Splash}, \code{Autumn},
#'     \code{Villeneuve}, \code{Ophelia}, \code{Kitchen},
#'     \code{Spring}, \code{Starrynight}, \code{Strawberries},
#'     \code{Seascape}, \code{Twilight}
#'
#' @param n Number of colors you want.
#'
#' @param type Use "discrete" or "continuous". Use "continuous" to automatically
#'  interpolate between colors if you want more colors.
#'
#'
#' @return A vector of colors.
#' @export
#' @keywords colors palette
#' @examples
#' paint_palette("Ophelia")
#' paint_palette("Ophelia", n=3)
#' paint_palette("Autumn", n=100, type="continuous")
paint_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  plt <- painting_palettes[[name]]

  if (is.null(plt)) {
    stop("No such palette.")
  }

  if (missing(n)) {
    n <- length(plt)
  }

  if (type == "discrete" && n > length(plt)) {
    stop("Number of requested colors greater than the palette have")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(plt)(n),
                discrete = plt[1:n])
  structure(out, class = "palette", name = name)

}

#' Display all palettes
#'
#' @param n Number of palettes to display. All palettes will be displayed in default
#'
#' @export
#'
#' @examples
#' display_all_palettes()
display_all_palettes <- function(n=NULL) {
  # default display all palettes
  if (is.null(n)) {
    n <- length(painting_palettes)
    }

  par(mfrow=c(n,1))
  lapply(names(painting_palettes)[1:n], function(x) {
    print.palette(paint_palette(x))
  })
  par(mfrow=c(1,1))

}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)

  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))

  on.exit(par(old))

  image(x = 1:n,
        y = 1,
        z = as.matrix(1:n),
        col = x,
        ylab = "",
        xaxt = "n",
        yaxt = "n",
        bty = "n")

  rect(xleft = 0,
       ybottom = 0.9,
       xright = n + 1,
       ytop = 1.1,
       col = rgb(1, 1, 1, 0.8),
       border = NA)

  text(x = (n + 1) / 2, y = 1,
       labels = attr(x, "name"), cex = 1.5, family = "sans")
}
