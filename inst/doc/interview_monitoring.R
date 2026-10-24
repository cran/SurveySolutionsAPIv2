## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(SurveySolutionsAPIv2)
library(data.table)

# Load pre-rendered demo data for offline vignette compilation
ext_ints <- system.file("extdata", "demo_interviews.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_ints)) {
  demo_ints <- readRDS(ext_ints)
} else {
  demo_ints <- data.table(
    InterviewId = "a1b2c3d4-0001-4000-8000-000000000001",
    Status = "Completed",
    ResponsibleName = "interviewer01",
    ErrorsCount = 0L
  )
}

## -----------------------------------------------------------------------------
# Sample interview statuses
demo_ints[, .(InterviewId = substr(InterviewId, 1, 13), ResponsibleName, Status, ErrorsCount)]

## -----------------------------------------------------------------------------
# Summary breakdown of interview statuses
demo_ints[, .N, by = Status]

