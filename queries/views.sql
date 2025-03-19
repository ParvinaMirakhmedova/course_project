create view v_patients as
select 
    p.patient_id
    , p.full_name
    , p.age
    , p.gender
    , p.occupation
    , p.address
    , d.dm_type
    , d.renal_function
    , d.duration
    , d.diabetic_retinopathy
    , d.fbg
    , d.hereditary
    , ds.neuropathy
    , ds.nephropathy
    , ds.smoking
    , ds.bmi
from patients p
left join diabetic_retinopathy d on p.patient_id = d.patient_id
left join diseases ds on p.patient_id = ds.patient_id;
