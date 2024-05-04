import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeather(http.Client client) async {
  final http.Response response = await client
      .get(Uri.parse('https://api.weather.gov/gridpoints/LOX/148,36/forecast'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to load weather data');
  }
}

// TODO maybe learn how to build a serializable class for the API json responses
// @JsonSerializable()
// class GridpointForecastGeoJson {
// // ignoring this for now since it's not really explained clearly in docs
// // @context: JsonLdContext

// // curious to see if this is actually not always returned or not
// // id: string($uri)
//   String? id;

// // Are there other values in this enum?
// // type*: string {Enum: ["Feature"]}
//   Type type;

// // geometry*: GeoJsonGeometry
// // properties*: GridpointForecast

//   GridpointForecastGeoJson(this.type, [this.id]);
// }

// // ignore: constant_identifier_names
// enum Type { Feature }
