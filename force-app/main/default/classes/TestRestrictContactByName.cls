
@isTest
private class TestRestrictContactByName {

    
@isTest
    static void testInsertInvalidLastName() {
        // Creamos un contacto con apellido INVALIDNAME
        Contact con = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME', Email = 'test@example.com');

        // Ejecutamos la prueba
        Test.startTest();
            Database.SaveResult result = Database.insert(con, false);
        Test.stopTest();

        // Verificamos que la inserción haya fallado
        System.assert(!result.isSuccess(), 'La inserción debería fallar');
        System.assert(result.getErrors().size() > 0, 'Debe haber al menos un error');
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }

}