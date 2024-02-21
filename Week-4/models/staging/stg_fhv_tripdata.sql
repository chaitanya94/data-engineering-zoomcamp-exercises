{{
    config(
        materialized='view'
    )
}}

with 

source as (

    select * 
    from {{ source('staging-fhv', 'fhv_taxi_data') }}
    where extract(year from pickup_datetime) = 2019 
),

renamed as (

    select
        cast(dispatching_base_num as string) as dispatching_base,
        cast(pickup_datetime as timestamp) as pickup_datetime,
        cast(drop_off_datetime as timestamp) as drop_off_datetime,
        {{ dbt.safe_cast("pulocation_id", api.Column.translate_type("integer")) }} as pickup_locationid,
        {{ dbt.safe_cast("dolocation_id", api.Column.translate_type("integer")) }} as dropoff_locationid,
        sr_flag,
        cast(affiliated_base_number as string) as affiliated_base

    from source

)

select * from renamed
