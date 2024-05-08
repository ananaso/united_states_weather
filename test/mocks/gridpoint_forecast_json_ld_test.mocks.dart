const mockQV = {
  'unitCode': 'wmoUnit:percent',
  'value': 40,
  'maxValue': null,
  'minValue': null,
  'qualityControl': null,
};

const mockGFP = {
  'number': 14,
  'name': 'Saturday',
  'startTime': '2024-05-11T06:00:00-07:00',
  'endTime': '2024-05-11T18:00:00-07:00',
  'isDaytime': true,
  'temperature': 64,
  'temperatureUnit': 'F',
  'temperatureTrend': null,
  'probabilityOfPrecipitation': mockQV,
  'dewpoint': mockQV,
  'relativeHumidity': mockQV,
  'windSpeed': '5 to 15 mph',
  'windGust': null,
  'windDirection': 'WSW',
  'icon': 'https://api.weather.gov/icons/land/day/fog/bkn?size=medium',
  'shortForecast': 'Patchy Fog then Partly Sunny',
  'detailedForecast':
      'Patchy fog before 11am. Partly sunny, with a high near 64.',
};
