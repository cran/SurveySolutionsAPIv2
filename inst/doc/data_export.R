## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(SurveySolutionsAPIv2)
library(data.table)

# Load pre-rendered demo data for offline vignette compilation
ext_exp <- system.file("extdata", "demo_export_list.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_exp)) {
  demo_exports <- readRDS(ext_exp)
} else {
  demo_exports <- data.table(
    JobId = 501L,
    ExportType = "Tabular",
    Status = "Completed",
    HasFile = TRUE
  )
}

## -----------------------------------------------------------------------------
# Sample export jobs
demo_exports[, .(JobId, ExportType, Status, HasFile, Progress, StartedAtUtc)]

## -----------------------------------------------------------------------------
# Create sample exportClass object
sample_dt <- data.table(
  interview__id = c("int-1", "int-2"),
  hh_size = c(4L, 5L),
  total_exp = c(120.5, 340.0)
)
vlabs <- data.table(
  VariableName = c("hh_size", "total_exp"),
  QuestionText = c("Household Size", "Total Food Expenditure (USD)")
)
exp_obj <- exportClass(sample_dt, varLabels = vlabs)

## -----------------------------------------------------------------------------
is.exportClass(exp_obj)

## -----------------------------------------------------------------------------
# List available attributes
getinfo(exp_obj, "arglist")

# Inspect variable labels attached to attributes
getinfo(exp_obj, "hh_size")
getinfo(exp_obj, "total_exp")

