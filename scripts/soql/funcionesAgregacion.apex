//Consultar el número de ciudades
SELECT COUNT(City__c) FROM Property__C

//Consultar el número de propiedades únicas
SELECT COUNT_DISTINCT(City__c) FROM Property__C

//Consultar el valor promedio de las propiedades
SELECT MAX(Status__c), Broker__r.Name
FROM Property__c
GROUP BY Broker__r.Name
HAVING MAX(Status__c) = 'Closed'

SELECT MAX(Price__c), City__c FROM Property__c 
SELECT MAX(City__c), Price__c FROM Property__c