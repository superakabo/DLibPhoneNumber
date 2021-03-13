///
//  Generated code. Do not modify.
//  source: phonemetadata.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NumberFormat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NumberFormat',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aQS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pattern')
    ..aQS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'format')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadingDigitsPattern')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalPrefixFormattingRule')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'domesticCarrierCodeFormattingRule')
    ..aOB(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalPrefixOptionalWhenFormatting');

  NumberFormat._() : super();
  factory NumberFormat({
    $core.String? pattern,
    $core.String? format,
    $core.Iterable<$core.String>? leadingDigitsPattern,
    $core.String? nationalPrefixFormattingRule,
    $core.String? domesticCarrierCodeFormattingRule,
    $core.bool? nationalPrefixOptionalWhenFormatting,
  }) {
    final _result = create();
    if (pattern != null) {
      _result.pattern = pattern;
    }
    if (format != null) {
      _result.format = format;
    }
    if (leadingDigitsPattern != null) {
      _result.leadingDigitsPattern.addAll(leadingDigitsPattern);
    }
    if (nationalPrefixFormattingRule != null) {
      _result.nationalPrefixFormattingRule = nationalPrefixFormattingRule;
    }
    if (domesticCarrierCodeFormattingRule != null) {
      _result.domesticCarrierCodeFormattingRule = domesticCarrierCodeFormattingRule;
    }
    if (nationalPrefixOptionalWhenFormatting != null) {
      _result.nationalPrefixOptionalWhenFormatting = nationalPrefixOptionalWhenFormatting;
    }
    return _result;
  }
  factory NumberFormat.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NumberFormat.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NumberFormat clone() => NumberFormat()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NumberFormat copyWith(void Function(NumberFormat) updates) =>
      super.copyWith((message) => updates(message as NumberFormat)) as NumberFormat; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NumberFormat create() => NumberFormat._();
  NumberFormat createEmptyInstance() => create();
  static $pb.PbList<NumberFormat> createRepeated() => $pb.PbList<NumberFormat>();
  @$core.pragma('dart2js:noInline')
  static NumberFormat getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NumberFormat>(create);
  static NumberFormat? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pattern => $_getSZ(0);
  @$pb.TagNumber(1)
  set pattern($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPattern() => $_has(0);
  @$pb.TagNumber(1)
  void clearPattern() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get format => $_getSZ(1);
  @$pb.TagNumber(2)
  set format($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFormat() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get leadingDigitsPattern => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get nationalPrefixFormattingRule => $_getSZ(3);
  @$pb.TagNumber(4)
  set nationalPrefixFormattingRule($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNationalPrefixFormattingRule() => $_has(3);
  @$pb.TagNumber(4)
  void clearNationalPrefixFormattingRule() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get domesticCarrierCodeFormattingRule => $_getSZ(4);
  @$pb.TagNumber(5)
  set domesticCarrierCodeFormattingRule($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDomesticCarrierCodeFormattingRule() => $_has(4);
  @$pb.TagNumber(5)
  void clearDomesticCarrierCodeFormattingRule() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get nationalPrefixOptionalWhenFormatting => $_getBF(5);
  @$pb.TagNumber(6)
  set nationalPrefixOptionalWhenFormatting($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNationalPrefixOptionalWhenFormatting() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationalPrefixOptionalWhenFormatting() => clearField(6);
}

class PhoneNumberDesc extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PhoneNumberDesc',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalNumberPattern')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exampleNumber')
    ..p<$core.int>(
        9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'possibleLength', $pb.PbFieldType.P3)
    ..p<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'possibleLengthLocalOnly',
        $pb.PbFieldType.P3)
    ..hasRequiredFields = false;

  PhoneNumberDesc._() : super();
  factory PhoneNumberDesc({
    $core.String? nationalNumberPattern,
    $core.String? exampleNumber,
    $core.Iterable<$core.int>? possibleLength,
    $core.Iterable<$core.int>? possibleLengthLocalOnly,
  }) {
    final _result = create();
    if (nationalNumberPattern != null) {
      _result.nationalNumberPattern = nationalNumberPattern;
    }
    if (exampleNumber != null) {
      _result.exampleNumber = exampleNumber;
    }
    if (possibleLength != null) {
      _result.possibleLength.addAll(possibleLength);
    }
    if (possibleLengthLocalOnly != null) {
      _result.possibleLengthLocalOnly.addAll(possibleLengthLocalOnly);
    }
    return _result;
  }
  factory PhoneNumberDesc.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneNumberDesc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneNumberDesc clone() => PhoneNumberDesc()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneNumberDesc copyWith(void Function(PhoneNumberDesc) updates) =>
      super.copyWith((message) => updates(message as PhoneNumberDesc))
          as PhoneNumberDesc; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhoneNumberDesc create() => PhoneNumberDesc._();
  PhoneNumberDesc createEmptyInstance() => create();
  static $pb.PbList<PhoneNumberDesc> createRepeated() => $pb.PbList<PhoneNumberDesc>();
  @$core.pragma('dart2js:noInline')
  static PhoneNumberDesc getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhoneNumberDesc>(create);
  static PhoneNumberDesc? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get nationalNumberPattern => $_getSZ(0);
  @$pb.TagNumber(2)
  set nationalNumberPattern($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNationalNumberPattern() => $_has(0);
  @$pb.TagNumber(2)
  void clearNationalNumberPattern() => clearField(2);

  @$pb.TagNumber(6)
  $core.String get exampleNumber => $_getSZ(1);
  @$pb.TagNumber(6)
  set exampleNumber($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasExampleNumber() => $_has(1);
  @$pb.TagNumber(6)
  void clearExampleNumber() => clearField(6);

  @$pb.TagNumber(9)
  $core.List<$core.int> get possibleLength => $_getList(2);

  @$pb.TagNumber(10)
  $core.List<$core.int> get possibleLengthLocalOnly => $_getList(3);
}

class PhoneMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PhoneMetadata',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..aOM<PhoneNumberDesc>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'generalDesc',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fixedLine',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobile',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tollFree',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'premiumRate',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sharedCost',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'personalNumber',
        subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voip',
        subBuilder: PhoneNumberDesc.create)
    ..aQS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.int>(
        10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'countryCode', $pb.PbFieldType.O3)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'internationalPrefix')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalPrefix')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredExtnPrefix')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalPrefixForParsing')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationalPrefixTransformRule')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'preferredInternationalPrefix')
    ..aOB(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sameMobileAndFixedLinePattern')
    ..pc<NumberFormat>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberFormat', $pb.PbFieldType.PM,
        subBuilder: NumberFormat.create)
    ..pc<NumberFormat>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intlNumberFormat', $pb.PbFieldType.PM,
        subBuilder: NumberFormat.create)
    ..aOM<PhoneNumberDesc>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pager', subBuilder: PhoneNumberDesc.create)
    ..aOB(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainCountryForCode')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadingDigits')
    ..aOM<PhoneNumberDesc>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noInternationalDialling', subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uan', subBuilder: PhoneNumberDesc.create)
    ..aOB(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leadingZeroPossible')
    ..aOM<PhoneNumberDesc>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'emergency', subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voicemail', subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortCode', subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'standardRate', subBuilder: PhoneNumberDesc.create)
    ..aOM<PhoneNumberDesc>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'carrierSpecific', subBuilder: PhoneNumberDesc.create)
    ..aOB(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mobileNumberPortableRegion')
    ..aOM<PhoneNumberDesc>(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smsServices', subBuilder: PhoneNumberDesc.create);

  PhoneMetadata._() : super();
  factory PhoneMetadata({
    PhoneNumberDesc? generalDesc,
    PhoneNumberDesc? fixedLine,
    PhoneNumberDesc? mobile,
    PhoneNumberDesc? tollFree,
    PhoneNumberDesc? premiumRate,
    PhoneNumberDesc? sharedCost,
    PhoneNumberDesc? personalNumber,
    PhoneNumberDesc? voip,
    $core.String? id,
    $core.int? countryCode,
    $core.String? internationalPrefix,
    $core.String? nationalPrefix,
    $core.String? preferredExtnPrefix,
    $core.String? nationalPrefixForParsing,
    $core.String? nationalPrefixTransformRule,
    $core.String? preferredInternationalPrefix,
    $core.bool? sameMobileAndFixedLinePattern,
    $core.Iterable<NumberFormat>? numberFormat,
    $core.Iterable<NumberFormat>? intlNumberFormat,
    PhoneNumberDesc? pager,
    $core.bool? mainCountryForCode,
    $core.String? leadingDigits,
    PhoneNumberDesc? noInternationalDialling,
    PhoneNumberDesc? uan,
    $core.bool? leadingZeroPossible,
    PhoneNumberDesc? emergency,
    PhoneNumberDesc? voicemail,
    PhoneNumberDesc? shortCode,
    PhoneNumberDesc? standardRate,
    PhoneNumberDesc? carrierSpecific,
    $core.bool? mobileNumberPortableRegion,
    PhoneNumberDesc? smsServices,
  }) {
    final _result = create();
    if (generalDesc != null) {
      _result.generalDesc = generalDesc;
    }
    if (fixedLine != null) {
      _result.fixedLine = fixedLine;
    }
    if (mobile != null) {
      _result.mobile = mobile;
    }
    if (tollFree != null) {
      _result.tollFree = tollFree;
    }
    if (premiumRate != null) {
      _result.premiumRate = premiumRate;
    }
    if (sharedCost != null) {
      _result.sharedCost = sharedCost;
    }
    if (personalNumber != null) {
      _result.personalNumber = personalNumber;
    }
    if (voip != null) {
      _result.voip = voip;
    }
    if (id != null) {
      _result.id = id;
    }
    if (countryCode != null) {
      _result.countryCode = countryCode;
    }
    if (internationalPrefix != null) {
      _result.internationalPrefix = internationalPrefix;
    }
    if (nationalPrefix != null) {
      _result.nationalPrefix = nationalPrefix;
    }
    if (preferredExtnPrefix != null) {
      _result.preferredExtnPrefix = preferredExtnPrefix;
    }
    if (nationalPrefixForParsing != null) {
      _result.nationalPrefixForParsing = nationalPrefixForParsing;
    }
    if (nationalPrefixTransformRule != null) {
      _result.nationalPrefixTransformRule = nationalPrefixTransformRule;
    }
    if (preferredInternationalPrefix != null) {
      _result.preferredInternationalPrefix = preferredInternationalPrefix;
    }
    if (sameMobileAndFixedLinePattern != null) {
      _result.sameMobileAndFixedLinePattern = sameMobileAndFixedLinePattern;
    }
    if (numberFormat != null) {
      _result.numberFormat.addAll(numberFormat);
    }
    if (intlNumberFormat != null) {
      _result.intlNumberFormat.addAll(intlNumberFormat);
    }
    if (pager != null) {
      _result.pager = pager;
    }
    if (mainCountryForCode != null) {
      _result.mainCountryForCode = mainCountryForCode;
    }
    if (leadingDigits != null) {
      _result.leadingDigits = leadingDigits;
    }
    if (noInternationalDialling != null) {
      _result.noInternationalDialling = noInternationalDialling;
    }
    if (uan != null) {
      _result.uan = uan;
    }
    if (leadingZeroPossible != null) {
      _result.leadingZeroPossible = leadingZeroPossible;
    }
    if (emergency != null) {
      _result.emergency = emergency;
    }
    if (voicemail != null) {
      _result.voicemail = voicemail;
    }
    if (shortCode != null) {
      _result.shortCode = shortCode;
    }
    if (standardRate != null) {
      _result.standardRate = standardRate;
    }
    if (carrierSpecific != null) {
      _result.carrierSpecific = carrierSpecific;
    }
    if (mobileNumberPortableRegion != null) {
      _result.mobileNumberPortableRegion = mobileNumberPortableRegion;
    }
    if (smsServices != null) {
      _result.smsServices = smsServices;
    }
    return _result;
  }
  factory PhoneMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneMetadata clone() => PhoneMetadata()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneMetadata copyWith(void Function(PhoneMetadata) updates) =>
      super.copyWith((message) => updates(message as PhoneMetadata)) as PhoneMetadata; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhoneMetadata create() => PhoneMetadata._();
  PhoneMetadata createEmptyInstance() => create();
  static $pb.PbList<PhoneMetadata> createRepeated() => $pb.PbList<PhoneMetadata>();
  @$core.pragma('dart2js:noInline')
  static PhoneMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhoneMetadata>(create);
  static PhoneMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  PhoneNumberDesc get generalDesc => $_getN(0);
  @$pb.TagNumber(1)
  set generalDesc(PhoneNumberDesc v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGeneralDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeneralDesc() => clearField(1);
  @$pb.TagNumber(1)
  PhoneNumberDesc ensureGeneralDesc() => $_ensure(0);

  @$pb.TagNumber(2)
  PhoneNumberDesc get fixedLine => $_getN(1);
  @$pb.TagNumber(2)
  set fixedLine(PhoneNumberDesc v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFixedLine() => $_has(1);
  @$pb.TagNumber(2)
  void clearFixedLine() => clearField(2);
  @$pb.TagNumber(2)
  PhoneNumberDesc ensureFixedLine() => $_ensure(1);

  @$pb.TagNumber(3)
  PhoneNumberDesc get mobile => $_getN(2);
  @$pb.TagNumber(3)
  set mobile(PhoneNumberDesc v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMobile() => $_has(2);
  @$pb.TagNumber(3)
  void clearMobile() => clearField(3);
  @$pb.TagNumber(3)
  PhoneNumberDesc ensureMobile() => $_ensure(2);

  @$pb.TagNumber(4)
  PhoneNumberDesc get tollFree => $_getN(3);
  @$pb.TagNumber(4)
  set tollFree(PhoneNumberDesc v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTollFree() => $_has(3);
  @$pb.TagNumber(4)
  void clearTollFree() => clearField(4);
  @$pb.TagNumber(4)
  PhoneNumberDesc ensureTollFree() => $_ensure(3);

  @$pb.TagNumber(5)
  PhoneNumberDesc get premiumRate => $_getN(4);
  @$pb.TagNumber(5)
  set premiumRate(PhoneNumberDesc v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPremiumRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearPremiumRate() => clearField(5);
  @$pb.TagNumber(5)
  PhoneNumberDesc ensurePremiumRate() => $_ensure(4);

  @$pb.TagNumber(6)
  PhoneNumberDesc get sharedCost => $_getN(5);
  @$pb.TagNumber(6)
  set sharedCost(PhoneNumberDesc v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSharedCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearSharedCost() => clearField(6);
  @$pb.TagNumber(6)
  PhoneNumberDesc ensureSharedCost() => $_ensure(5);

  @$pb.TagNumber(7)
  PhoneNumberDesc get personalNumber => $_getN(6);
  @$pb.TagNumber(7)
  set personalNumber(PhoneNumberDesc v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPersonalNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearPersonalNumber() => clearField(7);
  @$pb.TagNumber(7)
  PhoneNumberDesc ensurePersonalNumber() => $_ensure(6);

  @$pb.TagNumber(8)
  PhoneNumberDesc get voip => $_getN(7);
  @$pb.TagNumber(8)
  set voip(PhoneNumberDesc v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVoip() => $_has(7);
  @$pb.TagNumber(8)
  void clearVoip() => clearField(8);
  @$pb.TagNumber(8)
  PhoneNumberDesc ensureVoip() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get id => $_getSZ(8);
  @$pb.TagNumber(9)
  set id($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasId() => $_has(8);
  @$pb.TagNumber(9)
  void clearId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get countryCode => $_getIZ(9);
  @$pb.TagNumber(10)
  set countryCode($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCountryCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearCountryCode() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get internationalPrefix => $_getSZ(10);
  @$pb.TagNumber(11)
  set internationalPrefix($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasInternationalPrefix() => $_has(10);
  @$pb.TagNumber(11)
  void clearInternationalPrefix() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get nationalPrefix => $_getSZ(11);
  @$pb.TagNumber(12)
  set nationalPrefix($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasNationalPrefix() => $_has(11);
  @$pb.TagNumber(12)
  void clearNationalPrefix() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get preferredExtnPrefix => $_getSZ(12);
  @$pb.TagNumber(13)
  set preferredExtnPrefix($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPreferredExtnPrefix() => $_has(12);
  @$pb.TagNumber(13)
  void clearPreferredExtnPrefix() => clearField(13);

  @$pb.TagNumber(15)
  $core.String get nationalPrefixForParsing => $_getSZ(13);
  @$pb.TagNumber(15)
  set nationalPrefixForParsing($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNationalPrefixForParsing() => $_has(13);
  @$pb.TagNumber(15)
  void clearNationalPrefixForParsing() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get nationalPrefixTransformRule => $_getSZ(14);
  @$pb.TagNumber(16)
  set nationalPrefixTransformRule($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNationalPrefixTransformRule() => $_has(14);
  @$pb.TagNumber(16)
  void clearNationalPrefixTransformRule() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get preferredInternationalPrefix => $_getSZ(15);
  @$pb.TagNumber(17)
  set preferredInternationalPrefix($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPreferredInternationalPrefix() => $_has(15);
  @$pb.TagNumber(17)
  void clearPreferredInternationalPrefix() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get sameMobileAndFixedLinePattern => $_getBF(16);
  @$pb.TagNumber(18)
  set sameMobileAndFixedLinePattern($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasSameMobileAndFixedLinePattern() => $_has(16);
  @$pb.TagNumber(18)
  void clearSameMobileAndFixedLinePattern() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<NumberFormat> get numberFormat => $_getList(17);

  @$pb.TagNumber(20)
  $core.List<NumberFormat> get intlNumberFormat => $_getList(18);

  @$pb.TagNumber(21)
  PhoneNumberDesc get pager => $_getN(19);
  @$pb.TagNumber(21)
  set pager(PhoneNumberDesc v) {
    setField(21, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPager() => $_has(19);
  @$pb.TagNumber(21)
  void clearPager() => clearField(21);
  @$pb.TagNumber(21)
  PhoneNumberDesc ensurePager() => $_ensure(19);

  @$pb.TagNumber(22)
  $core.bool get mainCountryForCode => $_getBF(20);
  @$pb.TagNumber(22)
  set mainCountryForCode($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasMainCountryForCode() => $_has(20);
  @$pb.TagNumber(22)
  void clearMainCountryForCode() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get leadingDigits => $_getSZ(21);
  @$pb.TagNumber(23)
  set leadingDigits($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasLeadingDigits() => $_has(21);
  @$pb.TagNumber(23)
  void clearLeadingDigits() => clearField(23);

  @$pb.TagNumber(24)
  PhoneNumberDesc get noInternationalDialling => $_getN(22);
  @$pb.TagNumber(24)
  set noInternationalDialling(PhoneNumberDesc v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasNoInternationalDialling() => $_has(22);
  @$pb.TagNumber(24)
  void clearNoInternationalDialling() => clearField(24);
  @$pb.TagNumber(24)
  PhoneNumberDesc ensureNoInternationalDialling() => $_ensure(22);

  @$pb.TagNumber(25)
  PhoneNumberDesc get uan => $_getN(23);
  @$pb.TagNumber(25)
  set uan(PhoneNumberDesc v) {
    setField(25, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasUan() => $_has(23);
  @$pb.TagNumber(25)
  void clearUan() => clearField(25);
  @$pb.TagNumber(25)
  PhoneNumberDesc ensureUan() => $_ensure(23);

  @$pb.TagNumber(26)
  $core.bool get leadingZeroPossible => $_getBF(24);
  @$pb.TagNumber(26)
  set leadingZeroPossible($core.bool v) {
    $_setBool(24, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasLeadingZeroPossible() => $_has(24);
  @$pb.TagNumber(26)
  void clearLeadingZeroPossible() => clearField(26);

  @$pb.TagNumber(27)
  PhoneNumberDesc get emergency => $_getN(25);
  @$pb.TagNumber(27)
  set emergency(PhoneNumberDesc v) {
    setField(27, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasEmergency() => $_has(25);
  @$pb.TagNumber(27)
  void clearEmergency() => clearField(27);
  @$pb.TagNumber(27)
  PhoneNumberDesc ensureEmergency() => $_ensure(25);

  @$pb.TagNumber(28)
  PhoneNumberDesc get voicemail => $_getN(26);
  @$pb.TagNumber(28)
  set voicemail(PhoneNumberDesc v) {
    setField(28, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasVoicemail() => $_has(26);
  @$pb.TagNumber(28)
  void clearVoicemail() => clearField(28);
  @$pb.TagNumber(28)
  PhoneNumberDesc ensureVoicemail() => $_ensure(26);

  @$pb.TagNumber(29)
  PhoneNumberDesc get shortCode => $_getN(27);
  @$pb.TagNumber(29)
  set shortCode(PhoneNumberDesc v) {
    setField(29, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasShortCode() => $_has(27);
  @$pb.TagNumber(29)
  void clearShortCode() => clearField(29);
  @$pb.TagNumber(29)
  PhoneNumberDesc ensureShortCode() => $_ensure(27);

  @$pb.TagNumber(30)
  PhoneNumberDesc get standardRate => $_getN(28);
  @$pb.TagNumber(30)
  set standardRate(PhoneNumberDesc v) {
    setField(30, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasStandardRate() => $_has(28);
  @$pb.TagNumber(30)
  void clearStandardRate() => clearField(30);
  @$pb.TagNumber(30)
  PhoneNumberDesc ensureStandardRate() => $_ensure(28);

  @$pb.TagNumber(31)
  PhoneNumberDesc get carrierSpecific => $_getN(29);
  @$pb.TagNumber(31)
  set carrierSpecific(PhoneNumberDesc v) {
    setField(31, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasCarrierSpecific() => $_has(29);
  @$pb.TagNumber(31)
  void clearCarrierSpecific() => clearField(31);
  @$pb.TagNumber(31)
  PhoneNumberDesc ensureCarrierSpecific() => $_ensure(29);

  @$pb.TagNumber(32)
  $core.bool get mobileNumberPortableRegion => $_getBF(30);
  @$pb.TagNumber(32)
  set mobileNumberPortableRegion($core.bool v) {
    $_setBool(30, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasMobileNumberPortableRegion() => $_has(30);
  @$pb.TagNumber(32)
  void clearMobileNumberPortableRegion() => clearField(32);

  @$pb.TagNumber(33)
  PhoneNumberDesc get smsServices => $_getN(31);
  @$pb.TagNumber(33)
  set smsServices(PhoneNumberDesc v) {
    setField(33, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasSmsServices() => $_has(31);
  @$pb.TagNumber(33)
  void clearSmsServices() => clearField(33);
  @$pb.TagNumber(33)
  PhoneNumberDesc ensureSmsServices() => $_ensure(31);
}

class PhoneMetadataCollection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PhoneMetadataCollection',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'i18n.phonenumbers'),
      createEmptyInstance: create)
    ..pc<PhoneMetadata>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metadata', $pb.PbFieldType.PM,
        subBuilder: PhoneMetadata.create);

  PhoneMetadataCollection._() : super();
  factory PhoneMetadataCollection({
    $core.Iterable<PhoneMetadata>? metadata,
  }) {
    final _result = create();
    if (metadata != null) {
      _result.metadata.addAll(metadata);
    }
    return _result;
  }
  factory PhoneMetadataCollection.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PhoneMetadataCollection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PhoneMetadataCollection clone() => PhoneMetadataCollection()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PhoneMetadataCollection copyWith(void Function(PhoneMetadataCollection) updates) =>
      super.copyWith((message) => updates(message as PhoneMetadataCollection))
          as PhoneMetadataCollection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PhoneMetadataCollection create() => PhoneMetadataCollection._();
  PhoneMetadataCollection createEmptyInstance() => create();
  static $pb.PbList<PhoneMetadataCollection> createRepeated() => $pb.PbList<PhoneMetadataCollection>();
  @$core.pragma('dart2js:noInline')
  static PhoneMetadataCollection getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhoneMetadataCollection>(create);
  static PhoneMetadataCollection? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PhoneMetadata> get metadata => $_getList(0);
}
