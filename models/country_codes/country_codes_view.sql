with country_codes as (
    SELECT *
    FROM {{ref('country_code')}}
),
DEMOGRAPHICS as (
    SELECT *
    FROM {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),
final as (
    SELECT d.total_population, c.name
    FROM DEMOGRAPHICS d
    LEFT JOIN country_codes c ON c.name = d.iso3166_1
)

SELECT * FROM final