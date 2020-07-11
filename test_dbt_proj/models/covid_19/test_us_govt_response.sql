select
  country_name, alpha_3_code, date, school_closing
from
    `bigquery-public-data.covid19_govt_response.oxford_policy_tracker`
where
    country_name = 'United States'
