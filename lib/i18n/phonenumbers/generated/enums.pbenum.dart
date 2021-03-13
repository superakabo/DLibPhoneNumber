///
//  Generated code. Do not modify.
//  source: src/main/proto/enums.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Provenance extends $pb.ProtobufEnum {
  static const Provenance UNKNOWN = Provenance._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Provenance ITU = Provenance._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ITU');
  static const Provenance IR21 = Provenance._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IR21');
  static const Provenance GOVERNMENT = Provenance._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOVERNMENT');
  static const Provenance TELECOMS = Provenance._(40, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TELECOMS');
  static const Provenance WEB = Provenance._(50, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEB');
  static const Provenance INTERNAL = Provenance._(100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERNAL');

  static const $core.List<Provenance> values = <Provenance> [
    UNKNOWN,
    ITU,
    IR21,
    GOVERNMENT,
    TELECOMS,
    WEB,
    INTERNAL,
  ];

  static final $core.Map<$core.int, Provenance> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Provenance? valueOf($core.int value) => _byValue[value];

  const Provenance._($core.int v, $core.String n) : super(v, n);
}

