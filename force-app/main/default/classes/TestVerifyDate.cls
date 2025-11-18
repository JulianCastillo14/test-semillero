@isTest
private class TestVerifyDate {

    @isTest static void fechaDentroDeLos30Dias() {
        Date fecha1 = Date.newInstance(2025, 11, 18);
        Date fecha2 = Date.newInstance(2025, 11, 23); 
        Date resultado = VerifyDate.CheckDates(fecha1, fecha2);
        System.assertEquals(fecha2, resultado, 'La fecha debería ser fecha2 ya que está dentro de los 30 días.');
    }

    @isTest static void fechaFueraDeLos30Dias(){
        Date fecha1 = Date.newInstance(2024, 1, 15);
        Date fecha2 = Date.newInstance(2024, 2, 20);
        Date resultado = VerifyDate.CheckDates(fecha1, fecha2);
        Date expectedDate = Date.newInstance(2024, 1, 31);
        System.assertEquals(expectedDate, resultado, 'La fecha debería ser el final del mes de fecha1.');
    }
}