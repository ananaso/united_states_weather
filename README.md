# United States Weather (USWeather)

A weather app using only APIs provided by agencies of the United States federal government, built with Flutter.

## APIs
USWeather currently relies on APIs from the following agencies:
- [National Weather Service](https://www.weather.gov/documentation/services-web-api) ([API Spec](https://api.weather.gov/openapi.json))

## Development
### Running Tests
Prior to running tests, ensure you've built any mocks: `dart run build_runner build`

Tests don't return a very useful response when they fail to find a widget, like in React, so here's a helpful bit of print code to stick in a test to see what's rendering:
```dart
final errorCatcher = find.textContaining(RegExp(r'(\w+)'));
print(errorCatcher);
```

### Links I've Found Helpful
- [Guide to Parsing JSON in Dart/Flutter](https://codewithandrea.com/articles/parse-json-dart/)
