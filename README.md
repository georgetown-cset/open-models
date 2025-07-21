# Open Weight Models

There are 4 queries here:

1. [find_model_papers](sql/find_model_papers.sql) This is the primary query used to find the papers and metadata. It gets modified for different regex to find the correct papers for each model.
2. [language_model_downloads_one_month](sql/language_models_downloads_one_month.sql) This is a query pulling one month of the top-downloaded text generation models from Hugging Face.
3. [language_model_downloads_total_downlands](sql/language_models_total_downloads.sql) This is a query pulling all our download counts (multiple months but not forever) of the top-downloaded text-generation models from Hugging Face.
4. [base_models](sql/base_models.sql) This is a different way to pull "top" models, checking how often base models were used by other models on the leaderboard.