//Instanciando un objeto del Sbject Account
Account acc = new Account(Name='OPAR company', Phone='555-1224', Industry='Technology');
insert acc; //Insertando el registro en la base de datos

System.debug('Cuenta insertada con Id: ' + acc.Id); //Mostrando el Id del registro insertado