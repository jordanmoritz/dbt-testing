{{
    config(
        materialized='incremental',
        incremental_strategy='insert_overwrite',
        partition_by={"field": "date", "data_type": "date"}
    )
}}

select
    *
from {{ source('dbt_dataset_covid_19', 'test_us_govt_response') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where date > (select max(date) from {{ this }})

{% endif %}
