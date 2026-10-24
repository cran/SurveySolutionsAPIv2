## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(SurveySolutionsAPIv2)

## -----------------------------------------------------------------------------
# Inspect stored credentials (masked in output)
suso_keys()

# Retrieve a specific active setting
suso_get_api_key("workspace")

## ----echo = FALSE-------------------------------------------------------------
message("Connected successfully to Survey Solutions!")

## ----echo = FALSE-------------------------------------------------------------
ext_ws <- system.file("extdata", "demo_workspaces.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_ws)) {
  ws_data <- readRDS(ext_ws)
  print(ws_data)
}

## ----echo = FALSE-------------------------------------------------------------
ext_ql <- system.file("extdata", "demo_questionnaire_list.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_ql)) {
  ql_data <- readRDS(ext_ql)
  print(ql_data[, .(Title, Variable, Version, QuestionnaireId)])
}

## -----------------------------------------------------------------------------
# Default maximum parallel requests
getOption("suso.maxpar.req", default = 100)

# Modify parallel request ceiling
suso_set_maxpar_req(50)

# Reset to standard
suso_set_maxpar_req(100)

