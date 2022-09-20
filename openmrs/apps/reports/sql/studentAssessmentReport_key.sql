select 'Test' , 'Optimum Value'
union all
select property , property_value from global_property where property = 'Optimum Weight'
union all
select property , property_value from global_property where property = 'Optimum Height'
union all 
select property , property_value from global_property where property = 'Optimum Body Fat'
union all
select property , property_value from global_property where property = 'Optimum Multistage fitness'
union all
select property , property_value from global_property where property = 'Optimum Core Strength'
union all
select property , property_value from global_property where property = 'Optimum Sit And Recah Test'
union all
select property , property_value from global_property where property = 'Optimum T-Test'
union all
select property , property_value from global_property where property = 'Optimum 5m Speed Test'
union all
select property , property_value from global_property where property = 'Optimum 20m Speed Test'

