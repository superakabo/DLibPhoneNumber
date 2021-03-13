///
//  Generated code. Do not modify.
//  source: src/main/proto/types.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class XmlNumberType extends $pb.ProtobufEnum {
  static const XmlNumberType XML_UNKNOWN = XmlNumberType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_UNKNOWN');
  static const XmlNumberType XML_NO_INTERNATIONAL_DIALLING = XmlNumberType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_NO_INTERNATIONAL_DIALLING');
  static const XmlNumberType XML_FIXED_LINE = XmlNumberType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_FIXED_LINE');
  static const XmlNumberType XML_MOBILE = XmlNumberType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_MOBILE');
  static const XmlNumberType XML_PAGER = XmlNumberType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_PAGER');
  static const XmlNumberType XML_TOLL_FREE = XmlNumberType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_TOLL_FREE');
  static const XmlNumberType XML_PREMIUM_RATE = XmlNumberType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_PREMIUM_RATE');
  static const XmlNumberType XML_SHARED_COST = XmlNumberType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_SHARED_COST');
  static const XmlNumberType XML_PERSONAL_NUMBER = XmlNumberType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_PERSONAL_NUMBER');
  static const XmlNumberType XML_VOIP = XmlNumberType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_VOIP');
  static const XmlNumberType XML_UAN = XmlNumberType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_UAN');
  static const XmlNumberType XML_VOICEMAIL = XmlNumberType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'XML_VOICEMAIL');

  static const $core.List<XmlNumberType> values = <XmlNumberType> [
    XML_UNKNOWN,
    XML_NO_INTERNATIONAL_DIALLING,
    XML_FIXED_LINE,
    XML_MOBILE,
    XML_PAGER,
    XML_TOLL_FREE,
    XML_PREMIUM_RATE,
    XML_SHARED_COST,
    XML_PERSONAL_NUMBER,
    XML_VOIP,
    XML_UAN,
    XML_VOICEMAIL,
  ];

  static final $core.Map<$core.int, XmlNumberType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static XmlNumberType? valueOf($core.int value) => _byValue[value];

  const XmlNumberType._($core.int v, $core.String n) : super(v, n);
}

class ValidNumberType extends $pb.ProtobufEnum {
  static const ValidNumberType UNKNOWN = ValidNumberType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ValidNumberType FIXED_LINE = ValidNumberType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FIXED_LINE');
  static const ValidNumberType MOBILE = ValidNumberType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOBILE');
  static const ValidNumberType FIXED_LINE_OR_MOBILE = ValidNumberType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FIXED_LINE_OR_MOBILE');
  static const ValidNumberType PAGER = ValidNumberType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAGER');
  static const ValidNumberType TOLL_FREE = ValidNumberType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TOLL_FREE');
  static const ValidNumberType PREMIUM_RATE = ValidNumberType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PREMIUM_RATE');
  static const ValidNumberType SHARED_COST = ValidNumberType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHARED_COST');
  static const ValidNumberType PERSONAL_NUMBER = ValidNumberType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PERSONAL_NUMBER');
  static const ValidNumberType VOIP = ValidNumberType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOIP');
  static const ValidNumberType UAN = ValidNumberType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UAN');
  static const ValidNumberType VOICEMAIL = ValidNumberType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOICEMAIL');

  static const $core.List<ValidNumberType> values = <ValidNumberType> [
    UNKNOWN,
    FIXED_LINE,
    MOBILE,
    FIXED_LINE_OR_MOBILE,
    PAGER,
    TOLL_FREE,
    PREMIUM_RATE,
    SHARED_COST,
    PERSONAL_NUMBER,
    VOIP,
    UAN,
    VOICEMAIL,
  ];

  static final $core.Map<$core.int, ValidNumberType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ValidNumberType? valueOf($core.int value) => _byValue[value];

  const ValidNumberType._($core.int v, $core.String n) : super(v, n);
}

class XmlShortcodeType extends $pb.ProtobufEnum {
  static const XmlShortcodeType SC_UNKNOWN = XmlShortcodeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_UNKNOWN');
  static const XmlShortcodeType SC_SHORT_CODE = XmlShortcodeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_SHORT_CODE');
  static const XmlShortcodeType SC_TOLL_FREE = XmlShortcodeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_TOLL_FREE');
  static const XmlShortcodeType SC_STANDARD_RATE = XmlShortcodeType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_STANDARD_RATE');
  static const XmlShortcodeType SC_PREMIUM_RATE = XmlShortcodeType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_PREMIUM_RATE');
  static const XmlShortcodeType SC_CARRIER_SPECIFIC = XmlShortcodeType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_CARRIER_SPECIFIC');
  static const XmlShortcodeType SC_EMERGENCY = XmlShortcodeType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_EMERGENCY');
  static const XmlShortcodeType SC_EXPANDED_EMERGENCY = XmlShortcodeType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_EXPANDED_EMERGENCY');
  static const XmlShortcodeType SC_SMS_SERVICES = XmlShortcodeType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SC_SMS_SERVICES');

  static const $core.List<XmlShortcodeType> values = <XmlShortcodeType> [
    SC_UNKNOWN,
    SC_SHORT_CODE,
    SC_TOLL_FREE,
    SC_STANDARD_RATE,
    SC_PREMIUM_RATE,
    SC_CARRIER_SPECIFIC,
    SC_EMERGENCY,
    SC_EXPANDED_EMERGENCY,
    SC_SMS_SERVICES,
  ];

  static final $core.Map<$core.int, XmlShortcodeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static XmlShortcodeType? valueOf($core.int value) => _byValue[value];

  const XmlShortcodeType._($core.int v, $core.String n) : super(v, n);
}

