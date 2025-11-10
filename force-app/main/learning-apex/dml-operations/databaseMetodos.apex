List<Contact> conList = new List<Contact> {
        new Contact(FirstName='Karen',LastName='Smith',Department='Finance'),
        new Contact(FirstName='Santiago',LastName='Smith',Department='Technology'),
        new Contact(FirstName='Luciana',LastName='Roth',Department='Finance'),
        new Contact()};
//Usamos el método Database.insert con el segundo parámetro como false
Database.SaveResult[] srList = Database.insert(conList, false);
// Iteramos a través de los resultados devueltos
for (Database.SaveResult sr : srList) {
    if (sr.isSuccess()) {
        // Operacion exitosa
        System.debug('Contacto insertado exitosamente. Contact ID: ' + sr.getId());
    } else {
        // Operacion fallida, mostramos los errores
        for(Database.Error err : sr.getErrors()) {
            System.debug('El siguiente error ha ocurrido.');
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('Los campos del contacto que dan error son: ' + err.getFields());
	 }
    }
}