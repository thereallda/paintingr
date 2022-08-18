## Test environments

-   R-hub windows-x86_64-release, R release
-   R-hub macos-highsierra-release, R release
-   R-hub ubuntu-gcc-release, R release

## R CMD check results

There were no ERRORs, WARNINGs or NOTEs.

## 0.1.0 Resubmission

### Review 2022-08-16

> Please call on.exit() directly after par() in each function in your
>
> R/colors.R. You only did it in print.palette, but please also add it in
>
> the same way in display_all_palettes. And please use it in the following
>
> way:
>
> display_all_palettes:
>
> ...
>
> oldpar \<- par(no.readonly = TRUE) \# code line i
>
> on.exit(par(oldpar)) \# code line i + 1
>
> ...
>
> par(mfrow=c(n,1)) \# somewhere after
>
> ...
>
> print.palette:
>
> ...
>
> oldpar \<- par(no.readonly = TRUE) \# code line i
>
> on.exit(par(oldpar)) \# code line i + 1
>
> ...
>
> par(mar = c(0.5, 0.5, 0.5, 0.5)) \# somewhere after
>
> ...
>
> Please fix and resubmit.

Fixed both functions as suggested.

In addition, I added a helper function `plot_pal()` inside `display_all_palettes()` for aligning multiple palettes inside one plot. The margin specified by `plot_pal()` will be reset when `display_all_palettes()` exits.

### Review 2022-08-14

> Please add \\value to .Rd files regarding exported methods and explain the functions results in the documentation. Please write about the structure of the output (class) and also what the output means. (If a function does not return a value, please document that too, e.g. \\value{No return value, called for side effects} or similar)
>
> Missing Rd-tags:
>
> display_all_palettes.Rd: \\value

Added return value descriptions for `display_all_palettes`.

> Please make sure that you do not change the user's options, par or working directory. If you really have to do so within functions, please ensure with an \*immediate\* call of on.exit() that the settings are reset when the function is exited. e.g.:
>
> ...
>
> oldpar \<- par(no.readonly = TRUE) \# code line i
>
> on.exit(par(oldpar)) \# code line i + 1
>
> ...
>
> par(mfrow=c(n,1)) \# somewhere after
>
> ...
>
> e.g.: R/colors.R

The function `print.palette` is designed to print the `palette` object. And it seems to have no effect to the margin after called.

```{r}
library(paintingr)
par('mar')
# [1] 5.1 4.1 4.1 2.1
print(paint_palette('Pearlgirl'))
par('mar')
# [1] 5.1 4.1 4.1 2.1
```

Also, this snippet (line 94-96 of R/color.R) is referred to the package `wesanderson` (<https://github.com/karthik/wesanderson/blob/master/R/colors.R#L87-L89>).
