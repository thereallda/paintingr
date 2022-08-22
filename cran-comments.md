## Test environments

-   R-hub windows-x86_64-release, R release
-   R-hub macos-highsierra-release, R release
-   R-hub ubuntu-gcc-release, R release

## R CMD check results

There were no ERRORs, WARNINGs or NOTEs.

## 0.1.0 Resubmission

### Review 2022-08-18

Remove function `plot_pal()`. 

Use function `par()` as suggested. Also, parameters of `par()` would be reset when functions (both `display_all_palettes()` and `print.palette()`) exit. 
