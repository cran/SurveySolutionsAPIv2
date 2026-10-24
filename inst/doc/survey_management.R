## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(SurveySolutionsAPIv2)
library(data.table)

# Load pre-rendered demo data for offline vignette compilation
ext_users <- system.file("extdata", "demo_users.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_users)) {
  demo_users <- readRDS(ext_users)
} else {
  demo_users <- UserClass(list(Users = data.frame(UserName = "interviewer01", Role = "Interviewer")))
}

ext_ass <- system.file("extdata", "demo_assignments.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_ass)) {
  demo_ass <- readRDS(ext_ass)
} else {
  demo_ass <- assignmentClass(list(Assignments = data.frame(Id = 101, ResponsibleName = "interviewer01")))
}

## -----------------------------------------------------------------------------
# Display active staff
demo_users[, .(UserName, Role, FullName, Supervisor)]

## -----------------------------------------------------------------------------
is.UserClass(demo_users)

## -----------------------------------------------------------------------------
# View sample assignments
demo_ass[, .(Id, ResponsibleName, Quantity, InterviewsCount, Archived)]

## -----------------------------------------------------------------------------
is.assignmentClass(demo_ass)

