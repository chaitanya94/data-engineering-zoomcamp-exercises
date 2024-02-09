----Create External Table---------
CREATE OR REPLACE EXTERNAL TABLE `mystic-aileron-412016.ny_taxi.green_taxi_external`
  OPTIONS (
    format ="PARQUET",
    uris = ['gs://mage-zoomcamp-chai-bucket/green_taxi_data.parquet']
);

SELECT count(*) FROM `mystic-aileron-412016.ny_taxi.green_taxi_external`;

SELECT COUNT(DISTINCT(pulocation_id)) FROM `mystic-aileron-412016.ny_taxi.green_taxi_external`;
SELECT COUNT(DISTINCT(pulocation_id)) FROM `mystic-aileron-412016.ny_taxi_bq.green_taxi_bq`;

SELECT count(*) FROM `mystic-aileron-412016.ny_taxi.green_taxi_external` WHERE fare_amount=0;

SELECT count(DISTINCT(pulocation_id)) FROM  `mystic-aileron-412016.ny_taxi.green_taxi_external`
WHERE TIMESTAMP_MICROS(CAST(lpep_pickup_datetime/1000 AS INT64)) BETWEEN "2022-06-01" AND "2022-06-30"

SELECT count(DISTINCT(pulocation_id)) FROM  `mystic-aileron-412016.ny_taxi_bq.green_taxi_bq`
WHERE TIMESTAMP_MICROS(CAST(lpep_pickup_datetime/1000 AS INT64)) BETWEEN '2022-06-01' AND '2022-06-30'