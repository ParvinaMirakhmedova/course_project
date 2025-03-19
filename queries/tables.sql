create table if not exists patients(
    patient_ID integer not null unique primary key--Patient_ID
    , full_name varchar(50) not null  --Name
    , age integer not null  --Age in years
    , sex char(1) --Gender
    , occupation varchar(50)  --Occupation
    , address varchar (100) not null -- Address
);


create table if not exists diabetic_retinopathy(
 	patient_ID integer not null
    , full_name varchar(50) not null  --Name
    , dm_type varchar(50)  --Diabetes Mellitus type
    , renal_function varchar(50)  -- is renal function saved or impaired
    , duration integer not null -- how long is ill
    , diabetic_retinopathy varchar(50) not null -- type of eye damage from DM
    , fbg integer not null -- fasting blood glucose
    , hereditary varchar(50) not null -- Hereditary
    , primary key(patient_ID)
    , foreign key(patient_ID) references patients(patient_ID)
);

create table if not exists diseases(
    patient_ID integer not null  --Patient_ID
    , neuropathy varchar(50)  --does Neuropathy present or not
    , nephropathy varchar(50)  -- does renal pathology present or not
    , smoking varchar(50) -- does patient smokes or not
    , bmi integer not null -- Body Mass index ( hallmark of obesity)
    , primary key(patient_ID)
    , foreign key(patient_ID) references patients(patient_ID)
);

create view v_patients as
select 
    p.patient_id
    , p.full_name
    , p.age
    , p.sex
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
select * from patients;
select * from diseases;
select* from diabetic_retinopathy;
select* from v_patients;
