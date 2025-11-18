public with sharing class TemperatureConverter {
    //Toma la temperatura en Farenheit y devuelve el equivalente en Celsius.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}