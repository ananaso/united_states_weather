import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/types/quantitative_value.dart';

void main() {
  group('QuantitativeValue', () {
    const jsonAllFields = {
      'maxValue': 12000,
      'minValue': 0,
      'qualityControl': 'G',
      'unitCode': 'wmoUnit:m',
      'value': 9001,
    };
    const jsonOptionalFieldsNulled = {
      'maxValue': null,
      'minValue': null,
      'qualityControl': null,
      'unitCode': 'wmoUnit:m',
      'value': null,
    };

    test(
      'deserializes JSON to all fields',
      () {
        const expectedQV = jsonAllFields;

        final actualQV = QuantitativeValue.fromJson(expectedQV);

        expect(actualQV.maxValue, expectedQV['maxValue']);
        expect(actualQV.minValue, expectedQV['minValue']);
        expect(actualQV.qualityControl?.name, expectedQV['qualityControl']);
        expect(actualQV.unitCode, expectedQV['unitCode']);
        expect(actualQV.value, expectedQV['value']);
      },
    );

    test('deserializes JSON with just the required fields', () {
      const expectedQV = jsonOptionalFieldsNulled;

      final actualQV = QuantitativeValue.fromJson(expectedQV);

      expect(actualQV.maxValue, null);
      expect(actualQV.minValue, null);
      expect(actualQV.qualityControl, null);
      expect(actualQV.value, null);
    });

    test('throws FormatException if unitCode is missing', () {
      const Map<String, dynamic> actualQv = {};

      expect(
        () => QuantitativeValue.fromJson(actualQv),
        throwsA(isA<FormatException>()),
      );
    });

    test('serializes all fields to JSON', () {
      const expectedJson = jsonAllFields;

      final qv = QuantitativeValue.fromJson(expectedJson);
      final actualJson = qv.toJson();

      expect(actualJson, expectedJson);
    });

    test('serializes nullable fields to JSON', () {
      const expectedJson = jsonOptionalFieldsNulled;

      final qv = QuantitativeValue.fromJson(expectedJson);
      final actualJson = qv.toJson();

      expect(actualJson, expectedJson);
    });
  });
}
