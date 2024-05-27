import 'package:united_states_weather/types/quality_control_flag.dart';

class QuantitativeValue {
  final num? value;
  final num? maxValue;
  final num? minValue;
  // TODO use regex to make type stricter (see docs)
  final String unitCode;
  final QualityControlFlag? qualityControl;

  const QuantitativeValue({
    required this.unitCode,
    this.value,
    this.maxValue,
    this.minValue,
    this.qualityControl,
  });

  factory QuantitativeValue.fromJson(Map<String, dynamic> json) {
    final value = json['value'] as num?;
    final maxValue = json['maxValue'] as num?;
    final minValue = json['minValue'] as num?;

    final unitCode = json['unitCode'];
    if (unitCode is! String) {
      throw FormatException(
        'Invalid JSON: required "unitCode" field of type String in $json',
      );
    }

    final qualityControlRaw = json['qualityControl'];
    var qualityControl = qualityControlRaw != null
        ? QualityControlFlag.values.byName(qualityControlRaw as String)
        : null;

    return QuantitativeValue(
      unitCode: unitCode,
      value: value,
      maxValue: maxValue,
      minValue: minValue,
      qualityControl: qualityControl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'maxValue': maxValue,
      'minValue': minValue,
      'unitCode': unitCode,
      'qualityControl': qualityControl?.name,
    };
  }
}
