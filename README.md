# The Use of Open Models in Research

This repository contains code and data for the brief "The Use of Open Models in Research."

# Data

Included in the repository, in the [data](data) directory, are the following:

1. [Closed Models Papers and Annotations](data/Closed%20Models%20Papers%20and%20Annotations.xlsx), which contains all basic and annotation information on the closed model papers that were annotated for the report.
2. [Open Models Papers and Annotations](data/Open%20Models%20Papers%20and%20Annotations.xlsx), which contains all basic and annotation information on the open model papers that were annotated for the report.

# Code

There are 4 queries here, in [sql](sql):

1. [find_model_papers](sql/find_model_papers.sql) This is the primary query used to find the papers and metadata. It gets modified for different regex to find the correct papers for each model.
2. [language_model_downloads_one_month](sql/language_models_downloads_one_month.sql) This is a query pulling one month of the top-downloaded text generation models from Hugging Face.
3. [language_model_downloads_total_downloads](sql/language_models_total_downloads.sql) This is a query pulling all our download counts (multiple months but not forever) of the top-downloaded text-generation models from Hugging Face.
4. [base_models](sql/base_models.sql) This is a different way to pull "top" models, checking how often base models were used by other models on the leaderboard.
