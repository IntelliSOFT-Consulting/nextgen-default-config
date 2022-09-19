select PatientId as 'Student Id', PatientName as 'Student Name',  technicalPassing as 'Technical Passing' , receivingtheball as 'Receiving the ball', shootingTheBall as 'Shooting The Ball', DefendingAbility as 'Defending The Ball' , SoccerIq as 'Shooting IQ' , kickingBall as 'Kicking Ball', 
RuqbyIQ as 'Ruqby IQ', ArmAction as 'Arm Action' , Kneedrive as 'Knee Drive', Coordibation  , bodyPosition as 'Body Position' , Breathing , underwaterCatch as 'Under Water Catch' from (
select identifier as 'PatientId', PatientName as 'PatientName' , technicalPassing , receivingtheball, shootingTheBall, DefendingAbility , SoccerIq , kickingBall,
RuqbyIQ, ArmAction , Kneedrive , Coordibation , bodyPosition , Breathing , underwaterCatch from (
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
select distinct(person_id) , concept_short_name as 'technicalPassing' from(
select obs.person_id , obs.value_coded,concept_view.concept_short_name, obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Technical Passing' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tOccupa
)tTechnicalPassing on tDemographics.pid = tTechnicalPassing.person_id  
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'receivingtheball', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Receiving the ball' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tReceiveTheBall on tDemographics.pid = tReceiveTheBall.person_id
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'shootingTheBall', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Shooting the ball' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tShootingTheBall on tDemographics.pid = tShootingTheBall.person_id
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'DefendingAbility', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Defending ability' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tDefendingAbility on tDemographics.pid = tDefendingAbility.person_id
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'SoccerIq', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Soccer IQ' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tSoccerIq on tDemographics.pid = tSoccerIq.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'kickingBall', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Kicking the ball' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tKickingtheball on tDemographics.pid = tKickingtheball.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'RuqbyIQ', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Rugby IQ' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tRugbyIQ on tDemographics.pid = tRugbyIQ.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'ArmAction', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Arm Action' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tArmAction on tDemographics.pid = tArmAction.person_id 		
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'Kneedrive', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Knee Drive' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tKneedrive on tDemographics.pid = tKneedrive.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'Coordibation', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Coordibation' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tCoordibation on tDemographics.pid = tCoordibation.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'bodyPosition', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Body Position' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tBodyposition on tDemographics.pid = tBodyposition.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'Breathing', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Breathing' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tBreathing on tDemographics.pid = tBreathing.person_id 
left join (
select obs.person_id , obs.value_coded,concept_view.concept_short_name as 'underwaterCatch', obs.obs_id , obs.encounter_id , concept_view.concept_full_name
from obs 
inner join (select person_id , concept_id , max(encounter_id) maxdate from obs group by person_id) b on obs.person_id = b.person_id and obs.encounter_id = b.maxdate 
inner join concept_view on obs.value_coded=concept_view.concept_id inner join concept on obs.concept_id=concept.concept_id
where concept.concept_id= (select concept_id from concept_name where name = 'Underwater catch' and concept_name_type = 'Fully_specified') and obs.voided = 0
and obs_datetime between DATE_FORMAT('#startDate#','%Y-%m-01')  and DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')
)tUnderwaterCatch on tDemographics.pid = tUnderwaterCatch.person_id 
)tStudentAssessment where not (technicalPassing is null and receivingtheball is null and shootingTheBall is null and DefendingAbility is null and SoccerIq is null and kickingBall is null)









