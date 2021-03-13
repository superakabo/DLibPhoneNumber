///
//  Generated code. Do not modify.
//  source: phonenumber.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PhoneNumber_CountryCodeSource extends $pb.ProtobufEnum {
  static const PhoneNumber_CountryCodeSource UNSPECIFIED = PhoneNumber_CountryCodeSource._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPECIFIED');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITH_PLUS_SIGN = PhoneNumber_CountryCodeSource._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FROM_NUMBER_WITH_PLUS_SIGN');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITH_IDD = PhoneNumber_CountryCodeSource._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FROM_NUMBER_WITH_IDD');
  static const PhoneNumber_CountryCodeSource FROM_NUMBER_WITHOUT_PLUS_SIGN = PhoneNumber_CountryCodeSource._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FROM_NUMBER_WITHOUT_PLUS_SIGN');
  static const PhoneNumber_CountryCodeSource FROM_DEFAULT_COUNTRY = PhoneNumber_CountryCodeSource._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FROM_DEFAULT_COUNTRY');

  static const $core.List<PhoneNumber_CountryCodeSource> values = <PhoneNumber_CountryCodeSource> [
    UNSPECIFIED,
    FROM_NUMBER_WITH_PLUS_SIGN,
    FROM_NUMBER_WITH_IDD,
    FROM_NUMBER_WITHOUT_PLUS_SIGN,
    FROM_DEFAULT_COUNTRY,
  ];

  static final $core.Map<$core.int, PhoneNumber_CountryCodeSource> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhoneNumber_CountryCodeSource? valueOf($core.int value) => _byValue[value];

  const PhoneNumber_CountryCodeSource._($core.int v, $core.String n) : super(v, n);
}

