## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(SurveySolutionsAPIv2)
library(data.table)

# Load pre-rendered demo data for offline vignette compilation
ext_st <- system.file("extdata", "demo_questionnaire_structure.rds", package = "SurveySolutionsAPIv2")
if (file.exists(ext_st)) {
  quest_struct <- readRDS(ext_st)
} else {
  quest_struct <- list(
    q = data.table(),
    val = data.table(),
    v = data.table(),
    answers = data.table()
  )
}

## -----------------------------------------------------------------------------
names(quest_struct)

## -----------------------------------------------------------------------------
dim(quest_struct$q)

## -----------------------------------------------------------------------------
# Display a sample of questions
quest_struct$q[1:6, .(intID, VariableName, type, QuestionText = substr(QuestionText, 1, 40))]

## ----echo = FALSE-------------------------------------------------------------
quest_struct$q[type == "Variable", .(VariableName, Expression = substr(Expression, 1, 35), VariableType)][1:5]

## -----------------------------------------------------------------------------
# Questions with routing conditions
conditions <- quest_struct$q[!is.na(ConditionExpression) & nchar(ConditionExpression) > 0,
                            .(VariableName, ConditionExpression = substr(ConditionExpression, 1, 50))]
head(conditions, 5)

## -----------------------------------------------------------------------------
dim(quest_struct$val)

## -----------------------------------------------------------------------------
# Inspect validation rules
quest_struct$val[1:5, .(VariableName, Expression = substr(Expression, 1, 30), SeverityLabel, Message = substr(Message, 1, 35))]

## -----------------------------------------------------------------------------
dim(quest_struct$answers)

## -----------------------------------------------------------------------------
# View codebook options for a sample question
sample_var <- quest_struct$answers[!is.na(AnswerText)][1, VariableName]
quest_struct$answers[VariableName == sample_var, .(VariableName, AnswerCode, AnswerText)]

