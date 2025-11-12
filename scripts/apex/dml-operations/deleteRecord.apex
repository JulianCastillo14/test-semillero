Contact[] contactsDel = [SELECT Id, Name, LastName FROM Contact WHERE LastName='Smith'];
delete contactsDel;

//Elimina registros secundarios relacionados que se puedan eliminar en cascada
Account[] queriedAccounts = [SELECT Id FROM Account WHERE Name='SFDC Account'];
delete queriedAccounts;