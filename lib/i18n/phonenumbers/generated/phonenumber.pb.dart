///
//  Generated code. Do not modify.
//  source: phonenumber.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'phonenumber.pbenum.dart';

export 'phonenumber.pbenum.dart';

class PhoneNumber extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PhoneNumber', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'i18n.phonenumbers'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryCode', $pb.PbFieldType.Q3)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalNumber', $pb.PbFieldType.QU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extension')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'italianLeadingZero')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawInput')
    ..e<PhoneNumber_CountryCodeSource>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryCodeSource', $pb.PbFieldType.OE, defaultOrMaker: PhoneNumber_CountryCodeSource.UNSPECIFIED, valueOf: PhoneNumber_CountryCodeSource.valueOf, enumValues: PhoneNumber_CountryCodeSource.values)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredDomesticCarrierCode')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberOfLeadingZeros', $pb.PbFieldType.O3, defaultOrMaker: 1)
  ;

  PhoneNumber._() : super();
  factory PhoneNumber({
    $core.int? countryCode,
    $fixnum.Int64? nationalNumber,
    $core.String? extension_3,
    $core.bool? italianLeadingZero,
    $core.String? rawInput,
    PhoneNumber_CountryCodeSource? countryCodeSource,
    $core.String? preferredDomesticCarrierCode,
    $core.int? numberOfLeadingZeros,
  }) {
    final _result = create();
    if (countryCode != null) {
      _result.countryCode = countryCode;
    }
    if (nationalNumber != null) {
      _result.nationalNumber = nationalNumber;
    }
    if (extension_3 != null) {
      _result.extension_3 = extension_3;
    }
    if (italianLeadingZero != null) {
      _result.italianLeadingZero = italianLeadingZero;
    }
    if (rawInput != null) {
      _result.rawInput = rawInput;
    }
    if (countryCodeSource != null) {
      _result.countryCodeSource = countryCodeSource;
    }
    if (preferredDomesticCarrierCode != null) {
      _result.preferredDomesticCarrierCode = preferredDomesticCarrierCode;
    }
    if (numberOfLeadingZeros != null) {
      _result.numberOfLeadingZeros = numberOfLeadingZeros;
    }
    return _result;
  }
  factory PhoneNumber.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhoneNumber.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhoneNumber clone() => PhoneNumber()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhoneNumber copyWith(void Function(PhoneNumber) updates) => super.copyWith((message) => updates(message as PhoneNumber)) as PhoneNumber; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhoneNumber create() => PhoneNumber._();
  PhoneNumber createEmptyInstance() => create();
  static $pb.PbList<PhoneNumber> createRepeated() => $pb.PbList<PhoneNumber>();
  @$core.pragma('dart2js:noInline')
  static PhoneNumber getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhoneNumber>(create);
  static PhoneNumber? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get countryCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set countryCode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCountryCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCountryCode() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nationalNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set nationalNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNationalNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNationalNumber() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get extension_3 => $_getSZ(2);
  @$pb.TagNumber(3)
  set extension_3($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasExtension_3() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtension_3() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get italianLeadingZero => $_getBF(3);
  @$pb.TagNumber(4)
  set italianLeadingZero($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasItalianLeadingZero() => $_has(3);
  @$pb.TagNumber(4)
  void clearItalianLeadingZero() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rawInput => $_getSZ(4);
  @$pb.TagNumber(5)
  set rawInput($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRawInput() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawInput() => clearField(5);

  @$pb.TagNumber(6)
  PhoneNumber_CountryCodeSource get countryCodeSource => $_getN(5);
  @$pb.TagNumber(6)
  set countryCodeSource(PhoneNumber_CountryCodeSource v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCountryCodeSource() => $_has(5);
  @$pb.TagNumber(6)
  void clearCountryCodeSource() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get preferredDomesticCarrierCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set preferredDomesticCarrierCode($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPreferredDomesticCarrierCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearPreferredDomesticCarrierCode() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get numberOfLeadingZeros => $_getI(7, 1);
  @$pb.TagNumber(8)
  set numberOfLeadingZeros($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNumberOfLeadingZeros() => $_has(7);
  @$pb.TagNumber(8)
  void clearNumberOfLeadingZeros() => clearField(8);
}

