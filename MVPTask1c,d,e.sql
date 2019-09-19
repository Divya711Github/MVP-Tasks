/*1. c * For each property in question a), return the following:                                                                      
Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date */
 
 Select p.id AS [Property ID ], p.name as [Property Name ], tp.PaymentAmount as [Rental Amount ],
 trt.name as [Payment Frequency ], tp.StartDate [Start Date],tp.EndDate [End Date],
 sum(tp.PaymentAmount*CASE
 WHEN trt.Id='1' THEN datediff(week,tp.startdate,tp.enddate)/1
 WHEN trt.Id='2' THEN datediff(week,tp.startdate,tp.enddate)/2
 WHEN trt.Id='3' THEN datediff(week,tp.startdate,tp.enddate)*12/52
 END)AS[TOTAL Rent] FROM Property p
 INNER JOIN OwnerProperty op ON p.Id=op.PropertyId
 INNER JOIN TenantProperty tp ON tp.PropertyId=op.PropertyId
 INNER JOIN PropertyRentalPayment r ON P.Id=r.PropertyID
 INNER JOIN TargetRentType trt on trt.ID=p.TargetRentTypeId
 GROUP BY p.Id, p.Name, tp.StartDate,tp.EndDate,trt.Name,tp.PaymentAmount,op.OwnerId
 HAVING op.OwnerId='1426'

 /* Display the yield */
 Select op.PropertyId,
 p.Name, p.AddressId,
 p.Id,
 pf.Yield
 From Property p
 inner join OwnerProperty op  on p.id=op.PropertyId
 inner join PropertyFinance pf on pf.PropertyId=p.Id where op.OwnerId=1426



/* 1d. Display all the jobs available in the marketplace (jobs that owners have advertised for service suppliers */
 Select p.id, p.name PropertyName, j.ownerid, j.jobstatusid, j.jobrequestid, j.jobdescription, spjs.id, 
 spjs.code jobstatuscode, spjs.name jobstatus
 from dbo.property p
 inner join dbo.job j on p.id=j.propertyid 
 inner join dbo.jobmedia jm on j.id=jm.jobid 
 inner join dbo.serviceproviderjobstatus spjs on j.jobstatusid=spjs.id 
 where jm.isactive=1 
 and j.ownerid is not null
 and spjs.code not in ('Cancelled', 'Finished')
 order by spjs.name

/* 1e. Display all property names, current tenants first and last names and rental payments per week/ fortnight/month for the properties */ 

Select p.Name PropertyName, op.OwnerId, op.PropertyId, ps.FirstName, ps.LastName, TPF.Name FrequencyPay, TP.PaymentAmount 
from dbo.Property p
inner join dbo.OwnerProperty op on P.Id=op.PropertyId 
inner join dbo.tenantProperty tp on op.PropertyId=tp.Propertyid
inner join dbo.tenantpaymentfrequencies tpf on tp.paymentfrequencyid=tpf.id
inner join dbo.Propertyhomevalue phv on p.id=phv.propertyid and 
phv.isactive=1
inner join dbo.person ps on tp.tenantid=ps.id
where op.ownerid=1426


