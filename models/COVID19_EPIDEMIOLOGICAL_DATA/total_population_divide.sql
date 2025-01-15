with pop as (
  select * from {{ source('COVID19_Epidemiological_Data','DEMOGRAPHICS') }}
),

final as (
  select {{ divide_by_hundred('total_population')}} as divide from pop
)

select * from final