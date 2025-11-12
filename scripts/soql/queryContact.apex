List<Contact> contacts = [SELECT Name, Email FROM Contact LIMIT 2];

System.debug(contacts);

// Child-to-Parent Relationship Query
SELECT Name, Account.Name FROM Contact

// Parent-to-Child Relationship Query
SELECT Name, (SELECT Name FROM Contacts) FROM Account

// Filtrar con una subconsulta
SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE LastName = 'Forbes')

//Consulta Child-to-Parent con objeto personalizado
SELECT Address__c, Picture__c, Broker__r.Name FROM Property__c

// Consulta Parent-to-Child con objeto personalizado
SELECT Name, (SELECT Address__c, Price__c FROM Properties__r) FROM Broker__c