public class VerifyDate {
  // Método para gestionar posibles comprobaciones entre dos fechas
  public static Date CheckDates(Date date1, Date date2) {
    // si fecha2 está dentro de los 30 días siguientes a fecha1, utiliza fecha2.  De lo contrario, utiliza el final del mes.
    if(DateWithin30Days(date1,date2)) {
      return date2;
    } else {
      return SetEndOfMonthDate(date1);
    }
  }
  // método para comprobar si date2 está dentro de los 30 días siguientes a date1
  private static Boolean DateWithin30Days(Date date1, Date date2) {
    // comprueba si date2 está en el pasado
    if( date2 < date1) { return false; }
    // comprobar que date2 está dentro (>=) de los 30 días de date1
    Date date30Days = date1.addDays(30); // crear una fecha a 30 días de date1
    if( date2 >= date30Days ) { return false; }
    else { return true; }
  }
  // método para devolver el final del mes de una fecha dada
  private static Date SetEndOfMonthDate(Date date1) {
    Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
    Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
    return lastDay;
  }
}