try {
    // Esto causará una excepción DmlException porque
    //  el campo 'Name' es obligatorio para la creación de una cuenta.
    Account acct = new Account();
    insert acct;
} catch (DmlException e) {
    System.debug('DML exception: ' + e.getMessage());
}