/* 1. Display a list of all property names and their property id’s for Owner Id: 1426. */
 Select * from OwnerProperty where OwnerId like '1426'
 Select * from PropertyHomeValue where PropertyId like '5637'

 Select op.PropertyId AS PropertyId_for_Owner, p.Name AS Property_Name
 From Property p
 Inner join OwnerProperty op on p.id = op.PropertyId
 where op.OwnerId = '1426'
 /* 2. Display the current home value for each property in question */

 
 Select op.Propertyid as PropertyId_for_owner, p.Name as Property_Name, phv.Value as Home_value 
 from Property p
 inner join OwnerProperty op on p.Id = op.PropertyId
 inner join PropertyHomeValue phv on p.Id = phv.PropertyId
 where op.OwnerId = '1426' and phv.IsActive = '1';

 