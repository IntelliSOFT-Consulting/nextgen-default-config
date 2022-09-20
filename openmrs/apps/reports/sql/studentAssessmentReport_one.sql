select * from (
select identifier as 'PatientId', PatientName as 'PatientName', weight , Height , BodyFat , MultistageFitnessTest , CoreStrengthTest ,
SitandRecah , TTest , 5MspeedTest , 20MspeedTest, VerticalJumpTest from (
select distinct(pa.person_id) as pid, concat(coalesce(given_name, ''), "  ", coalesce(middle_name, ''), ' ', coalesce(family_name , '') ) as 'PatientName', 
gender as sex ,floor(datediff(curdate(),p.birthdate) / 365) as 'Age'
from person_attribute as pa 
INNER JOIN person_attribute_type as pat on pa.person_attribute_type_id = pat.person_attribute_type_id  
INNER JOIN person as p on pa.person_id = p.person_id 
LEFT JOIN person_name as pn on p.person_id = pn.person_id 
LEFT JOIN patient as pt on p.person_id = pt.patient_id
where pa.person_attribute_type_id is not null
)tDemographics
left join (
select patient_id, identifier, voided from patient_identifier
)tPatientIdentifier on tDemographics.pid = tPatientIdentifier.patient_id
left join ( 
select person_id , value_numeric  as 'Weight' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='WEIGHT' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='WEIGHT' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tWeight on tDemographics.pid = tWeight.person_id
left join (
select person_id , value_numeric  as 'Height' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='HEIGHT' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='HEIGHT' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tHeight on  tDemographics.pid = tHeight.person_id
left join (
select person_id , value_numeric  as 'BodyFat' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='Body Fat' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='Body Fat' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tBodyFat on tDemographics.pid = tBodyFat.person_id
left join (
select person_id , value_numeric  as 'MultistageFitnessTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='Multistage Fitness Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='Multistage Fitness Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tMultiStageFitness on tDemographics.pid = tMultiStageFitness.person_id
left join (
select person_id , value_numeric  as 'CoreStrengthTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='Core Strength Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='Core Strength Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tCoreStrength on  tDemographics.pid = tCoreStrength.person_id
left join (
select person_id , value_numeric  as 'SitandRecah' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='Sit and Recah Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='Sit and Recah Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tSitAndRecah on tDemographics.pid = tSitAndRecah.person_id
left join (
select person_id , value_numeric  as 'TTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='T-Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='T-Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tTest on tDemographics.pid = tSitAndRecah.person_id
left join (
select person_id , value_numeric  as '5MspeedTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='5M speed Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='5M speed Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)t5mSpeedTest on tDemographics.pid = t5mSpeedTest.person_id
left join (
select person_id , value_numeric  as '20MspeedTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='20M speed Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='20M speed Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)t20MspeedTest on  tDemographics.pid = t20MspeedTest.person_id
left join (
select person_id , value_numeric  as 'VerticalJumpTest' from (
select  person_id, concept_id, obs_datetime , encounter_id , value_numeric , voided from obs 
where concept_id =
(select concept_id from concept_name where name ='Vertical Jump Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='Vertical Jump Test' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tVerticalJump on  tDemographics.pid = tVerticalJump.person_id
)StudentTests where not (weight is null and Height is null and BodyFat is null and MultistageFitnessTest is null and CoreStrengthTest is null
and SitandRecah is null and TTest is null and 5MspeedTest is null and 20MspeedTest is null and VerticalJumpTest is null
)