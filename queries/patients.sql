select
	patient_ID 
    , full_name
    , age
    , sex 
    , gender 
    , occupation 
    , address
from patients;

select * from patients_1
where address is null;

select * from diseases_1
where bmi is null;

select* from diabetic_retinopathy_1
where fbg is null;