class WeatherModel{
  Coord? coord;
  List<Weather> weather;
  String? base;
  Main? main;
  int? visibility;
  Wind wind;
  Clouds? clouds;
  int? dt;
  Sys sys;
  int? timezone;
  int? id;



  String? name;
  int? cod;
  WeatherModel(this.coord , this.weather , this.base , this.main , this.visibility ,this.wind , this.clouds , this.dt , this.sys , this.timezone , this.id , this.name , this.cod);
  WeatherModel.fromJson(Map<String , dynamic> json) : this.coord = Coord.fromJson(json['coord']) ,
        this.weather = List.of(json['weather']).map((e) => Weather.fromJson(e)).toList(),
        this.base = json['base'] ,
        this.main = Main.fromJson(json['main']) ,
        this.visibility = json['visibility'],
        this.wind = Wind.fromJson(json['wind']),
        this.clouds = Clouds.fromJson(json['clouds']),
        this.dt = json['dt'] ,
        this.sys = Sys.fromJson(json['sys']),
        this.timezone = json['timezone'] ,
        this.id = json['id'] ,
        this.name = json['name'] ,
        this.cod = json['cod'];

  Map<String , dynamic> toJson() => {
    'coord' : coord,
    'base' : base,
    'main' : main,
    'visibility' : visibility,
    'dt' : dt,
    'sys' : sys,
    'timezone' : timezone,
    'id' : id,
    'name' : name,
    'cod' : cod
  };
}

class Coord{
  double? lon;
  double? lat;

  Coord(this.lon , this.lat);
  Coord.fromJson(Map<String , dynamic> json):
    lon = json['lon'],
    lat = json['lat']
  ;
  Map<String , dynamic> toJson() => {
    'lon' : lon,
    'lat' : lat
  };

}

class Weather{
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather(this.id , this.main , this.description , this.icon);
  Weather.fromJson(Map<String , dynamic> json): id = json['id'] , main = json['main'] , description = json['description'] , icon = json['icon'];

  Map<String , dynamic> toJson() => {
    'id' : id,
    'main' : main,
    'description' : description,
    'icon': icon
  };
}

class Main{
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  int? pressure;
  int? humidty;

  Main(this.temp , this.feels_like , this.temp_min , this.temp_max , this.pressure , this .humidty);
  Main.fromJson(Map<String , dynamic> json) : temp = json['temp'] , feels_like = json['feels_like'] , temp_min = json['temp_min'] ,
  temp_max = json['temp_max'],
  pressure = json['pressure'],
  humidty = json['humidty'];

  Map<String , dynamic> toJson() =>{
    'temp' : temp ,
    'feels_like' : feels_like,
    'temp_min' : temp_min,
    'temp_max' : temp_max,
    'pressure' : pressure,
    'humidty' : humidty
  };
}

class Wind{
  double? speed;
  int? deg;
  Wind(this.speed , this.deg);
  Wind.fromJson(Map<String , dynamic> json) : speed = json['speed'] , deg = json['deg'];
  Map<String , dynamic> toJson() => {
    'speed' : speed,
    'deg' : deg
  };
}

class Clouds{
  int? all;
  Clouds(this.all);
  Clouds.fromJson(Map<String , dynamic> json) : all = json['all'];
  Map<String , dynamic> toJson() =>{
    'all' : all
  };
}

class Sys{
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys(this.type , this.id , this.country , this.sunrise , this.sunset);
  Sys.fromJson(Map<String , dynamic> json) : type = json['type'] , id = json['id'] , country = json['country'] , sunrise = json['sunrise'] , sunset = json['sunset'];
  Map<String , dynamic> toJson() => {
    'type' : type,
    'id' : id,
    'country' : country,
    'sunrise' : sunrise,
    'sunset' : sunset,
  };
}

