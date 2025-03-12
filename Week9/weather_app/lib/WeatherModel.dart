class WeatherModel {
  String mainWeather = "";
  double temp = 0.0;
  int humidity = 0;
  String cityName = "";
  String icon = "";

  WeatherModel(
      this.cityName, this.humidity, this.icon, this.mainWeather, this.temp);
}
