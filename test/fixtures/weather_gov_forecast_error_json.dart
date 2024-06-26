import 'dart:convert';

String weatherGovForecastErrorJson = jsonEncode(weatherGovForecastErrorJsonMap);

const Map<String, Object> weatherGovForecastErrorJsonMap = <String, Object>{
  'type': 'urn:noaa:nws:api:UnexpectedProblem',
  'title': 'Unexpected Problem',
  'status': 500,
  'detail': 'An unexpected problem has occurred.',
  'instance': 'urn:noaa:nws:api:request:493c3a1d-f87e-407f-ae2c-24483f5aab63',
  'correlationId': '493c3a1d-f87e-407f-ae2c-24483f5aab63',
};
