import 'dart:collection';

import 'package:quiver/collection.dart';

import 'CountryCodeToRegionCodeMap.dart';
import 'MetadataLoader.dart';
import 'MetadataManager.dart';
import 'MetadataSource.dart';
import 'enums.dart';
import 'generated/phonemetadata.pb.dart';
import 'generated/phonenumber.pb.dart';
import 'internal/MatcherApi.dart';
import 'internal/RegexBasedMatcher.dart';
import 'internal/RegexCache.dart';

class PhoneNumberUtil {
  static const String REGION_CODE_FOR_NON_GEO_ENTITY = '001';

  static const int MAX_LENGTH_FOR_NSN = 17;

  static const int MAX_LENGTH_COUNTRY_CODE = 3;

  static const String VALID_PUNCTUATION = '-x\u2010-\u2015\u2212\u30FC\uFF0D-\uFF0F ' +
      '\u00A0\u00AD\u200B\u2060\u3000()\uFF08\uFF09\uFF3B\uFF3D.\\[\\]/~\u2053\u223C\uFF5E';

  static const String PLUS_SIGN = '+';

  static const int _MIN_LENGTH_FOR_NSN = 2;

  static const int _MAX_INPUT_STRING_LENGTH = 250;

  static const String _UNKNOWN_REGION = 'ZZ';

  static const int _NANPA_COUNTRY_CODE = 1;

  static const String _COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX = '3';

  static final Map<int, String> _MOBILE_TOKEN_MAPPINGS = UnmodifiableMapView(mobileTokenMap);

  static final Set<int> _GEO_MOBILE_COUNTRIES_WITHOUT_MOBILE_AREA_CODES =
      UnmodifiableSetView(geoMobileCountriesWithoutMobileAreaCodes);

  static final Set<int> _GEO_MOBILE_COUNTRIES = UnmodifiableSetView(geoMobileCountries);

  static const String _STAR_SIGN = '*';

  static const String _RFC3966_EXTN_PREFIX = ';ext=';

  static const String _RFC3966_PREFIX = 'tel:';

  static const String _RFC3966_PHONE_CONTEXT = ';phone-context=';

  static const String _RFC3966_ISDN_SUBADDRESS = ';isub=';

  static final Map<String, String> _DIALLABLE_CHAR_MAPPINGS = UnmodifiableMapView(diallableCharMap);

  static final Map<String, String> _ALPHA_MAPPINGS = UnmodifiableMapView(alphaMap);

  static final Map<String, String> _ALPHA_PHONE_MAPPINGS = UnmodifiableMapView(combinedMap);

  static final Map<String, String> _ALL_PLUS_NUMBER_GROUPING_SYMBOLS = UnmodifiableMapView(allPlusNumberGroupings);

  static HashMap<int, String> mobileTokenMap = HashMap.from({54: '9'});

  static HashSet<int> geoMobileCountriesWithoutMobileAreaCodes = HashSet.from([86]);

  static HashSet<int> geoMobileCountries = HashSet.from([52, 54, 55, 62])
    ..addAll(geoMobileCountriesWithoutMobileAreaCodes);

  static HashMap<String, String> asciiDigitMappings = HashMap.from({
    '0': '0',
    '1': '1',
    '2': '2',
    '3': '3',
    '4': '4',
    '5': '5',
    '6': '6',
    '7': '7',
    '8': '8',
    '9': '9',
  });

  static HashMap<String, String> alphaMap = HashMap.from({
    'A': '2',
    'B': '2',
    'C': '2',
    'D': '3',
    'E': '3',
    'F': '3',
    'G': '4',
    'H': '4',
    'I': '4',
    'J': '5',
    'K': '5',
    'L': '5',
    'M': '6',
    'N': '6',
    'O': '6',
    'P': '7',
    'Q': '7',
    'R': '7',
    'S': '7',
    'T': '8',
    'U': '8',
    'V': '8',
    'W': '9',
    'X': '9',
    'Y': '9',
    'Z': '9'
  });

  static HashMap<String, String> combinedMap = HashMap()..addAll(_ALPHA_MAPPINGS)..addAll(asciiDigitMappings);

  static HashMap<String, String> diallableCharMap = HashMap()
    ..addAll(asciiDigitMappings)
    ..addAll({
      PLUS_SIGN: PLUS_SIGN,
      '*': '*',
      '#': '#',
    });

  static HashMap<String, String> allPlusNumberGroupings = HashMap.fromIterable({
    ..._ALPHA_MAPPINGS.keys.toSet().map((e) => e.toLowerCase()),
    ..._ALPHA_MAPPINGS.keys.toSet(),
  })
    ..addAll(asciiDigitMappings)
    ..addAll({
      '-': '-',
      '\uFF0D': '-',
      '\u2010': '-',
      '\u2011': '-',
      '\u2012': '-',
      '\u2013': '-',
      '\u2014': '-',
      '\u2015': '-',
      '\u2212': '-',
      '/': '/',
      '\uFF0F': '/',
      ' ': ' ',
      '\u3000': ' ',
      '\u2060': ' ',
      '.': '.',
      '\uFF0E': '.',
    });

  static final RegExp _SINGLE_INTERNATIONAL_PREFIX = RegExp('[\\d]+(?:[~\u2053\u223C\uFF5E][\\d]+)?');

  static const String _VALID_PUNCTUATION = '-x\u2010-\u2015\u2212\u30FC\uFF0D-\uFF0F ' +
      '\u00A0\u00AD\u200B\u2060\u3000()\uFF08\uFF09\uFF3B\uFF3D.\\[\\]/~\u2053\u223C\uFF5E';

  static const String _DIGITS = '\\p{Nd}';

  static final String _VALID_ALPHA = _ALPHA_MAPPINGS.keys.toSet().toList().toString().replaceAll('[, \\[\\]]', '') +
      _ALPHA_MAPPINGS.keys.toSet().toList().toString().toLowerCase().replaceAll('[, \\[\\]]', '');

  static const String PLUS_CHARS = '+\uFF0B';

  static final RegExp PLUS_CHARS_PATTERN = RegExp('[$PLUS_CHARS]+');

  static final RegExp _SEPARATOR_PATTERN = RegExp('[$VALID_PUNCTUATION]+');

  static final RegExp _CAPTURING_DIGIT_PATTERN = RegExp('($_DIGITS)');

  static final String _VALID_START_CHAR = '[$PLUS_CHARS$_DIGITS]';

  static final RegExp _VALID_START_CHAR_PATTERN = RegExp(_VALID_START_CHAR);

  static const String _SECOND_NUMBER_START = '[\\\\/] *x';

  static final RegExp SECOND_NUMBER_START_PATTERN = RegExp(_SECOND_NUMBER_START);

  static const String _UNWANTED_END_CHARS = '[[\\P{N}&&\\P{L}]&&[^#]]+\$';

  static final RegExp UNWANTED_END_CHAR_PATTERN = RegExp(_UNWANTED_END_CHARS);

  static final RegExp _VALID_ALPHA_PHONE_PATTERN = RegExp('(?:.*?[A-Za-z]){3}.*');

  static final String _VALID_PHONE_NUMBER =
      '$_DIGITS{$_MIN_LENGTH_FOR_NSN}|[$PLUS_CHARS]*+(?:[$VALID_PUNCTUATION$_STAR_SIGN]*$_DIGITS){3,}[$VALID_PUNCTUATION$_STAR_SIGN$_VALID_ALPHA$_DIGITS]*';

  static const String _DEFAULT_EXTN_PREFIX = ' ext. ';

  static final String _EXTN_PATTERNS_FOR_PARSING = _createExtnPattern(true);

  static final String EXTN_PATTERNS_FOR_MATCHING = _createExtnPattern(false);

  static String _extnDigits(int maxLength) {
    return '($_DIGITS{1,$maxLength})';
  }

  static String _createExtnPattern(bool forParsing) {
    int extLimitAfterExplicitLabel = 20;
    int extLimitAfterLikelyLabel = 15;
    int extLimitAfterAmbiguousChar = 9;
    int extLimitWhenNotSure = 6;

    String possibleSeparatorsBetweenNumberAndExtLabel = '[ \u00A0\\t,]*';
    String possibleCharsAfterExtLabel = '[:\\.\uFF0E]?[ \u00A0\\t,-]*';
    String optionalExtnSuffix = '#?';

    String explicitExtLabels =
        '(?:e?xt(?:ensi(?:o\u0301?|\u00F3))?n?|\uFF45?\uFF58\uFF54\uFF4E?|\u0434\u043E\u0431|anexo)';

    String ambiguousExtLabels = '(?:[x\uFF58#\uFF03~\uFF5E]|int|\uFF49\uFF4E\uFF54)';

    String ambiguousSeparator = '[- ]+';

    String rfcExtn = _RFC3966_EXTN_PREFIX + _extnDigits(extLimitAfterExplicitLabel);
    String explicitExtn = possibleSeparatorsBetweenNumberAndExtLabel +
        explicitExtLabels +
        possibleCharsAfterExtLabel +
        _extnDigits(extLimitAfterExplicitLabel) +
        optionalExtnSuffix;
    String ambiguousExtn = possibleSeparatorsBetweenNumberAndExtLabel +
        ambiguousExtLabels +
        possibleCharsAfterExtLabel +
        _extnDigits(extLimitAfterAmbiguousChar) +
        optionalExtnSuffix;
    String americanStyleExtnWithSuffix = ambiguousSeparator + _extnDigits(extLimitWhenNotSure) + '#';

    String extensionPattern = '$rfcExtn|$explicitExtn|$ambiguousExtn|$americanStyleExtnWithSuffix';

    if (forParsing) {
      String possibleSeparatorsNumberExtLabelNoComma = '[ \u00A0\\t]*';
      String autoDiallingAndExtLabelsFound = '(?:,{2}|;)';

      String autoDiallingExtn = possibleSeparatorsNumberExtLabelNoComma +
          autoDiallingAndExtLabelsFound +
          possibleCharsAfterExtLabel +
          _extnDigits(extLimitAfterLikelyLabel) +
          optionalExtnSuffix;
      String onlyCommasExtn = possibleSeparatorsNumberExtLabelNoComma +
          '(?:,)+' +
          possibleCharsAfterExtLabel +
          _extnDigits(extLimitAfterAmbiguousChar) +
          optionalExtnSuffix;
      return extensionPattern + '|' + autoDiallingExtn + '|' + onlyCommasExtn;
    }
    return extensionPattern;
  }

  static final RegExp _EXTN_PATTERN =
      RegExp('(?:' + _EXTN_PATTERNS_FOR_PARSING + ')\$', unicode: true, caseSensitive: false);

  static final RegExp _VALID_PHONE_NUMBER_PATTERN =
      RegExp('$_VALID_PHONE_NUMBER(?:$_EXTN_PATTERNS_FOR_PARSING)?', unicode: true, caseSensitive: false);

  static final RegExp NON_DIGITS_PATTERN = RegExp('(\\D+)');

  static final RegExp _FIRST_GROUP_PATTERN = RegExp('(\\\$\\d)');

  static const String _NP_STRING = '\$NP';

  static const String _FG_STRING = '\$FG';

  static const String _CC_STRING = '\$CC';

  static final RegExp _FIRST_GROUP_ONLY_PREFIX_PATTERN = RegExp('\\(?\\\$1\\)?');

  static PhoneNumberUtil? _instance;

  static const String _REGION_CODE_FOR_NON_GEO_ENTITY = '001';

  final MetadataSource _metadataSource;

  final Map<int, List<String>> _countryCallingCodeToRegionCodeMap;

  final MatcherApi _matcherApi = RegexBasedMatcher();

  final Set<String> _nanpaRegions = HashSet<String>();

  final RegexCache _regexCache = RegexCache(100);

  final Set<String> _supportedRegions = HashSet<String>();

  final Set<int> _countryCodesForNonGeographicalRegion = HashSet<int>();

  PhoneNumberUtil(this._metadataSource, this._countryCallingCodeToRegionCodeMap) {
    for (var entry in _countryCallingCodeToRegionCodeMap.entries.toSet()) {
      List<String> regionCodes = entry.value;
      if (regionCodes.length == 1 && REGION_CODE_FOR_NON_GEO_ENTITY == regionCodes[0]) {
        _countryCodesForNonGeographicalRegion.add(entry.key);
      } else {
        _supportedRegions.addAll(regionCodes);
      }
    }
    if (_supportedRegions.remove(REGION_CODE_FOR_NON_GEO_ENTITY)) {
      print('invalid metadata (country calling code was mapped to the non-geo ' +
          'entity as well as specific region(s))');
    }
    final code = _countryCallingCodeToRegionCodeMap[_NANPA_COUNTRY_CODE];
    if (code != null) _nanpaRegions.addAll(code);
  }

  static String extractPossibleNumber(String number) {
    final m = _VALID_START_CHAR_PATTERN.firstMatch(number);
    if (m != null) {
      number = number.substring(m.start, number.length);

      final trailingCharsMatcher = UNWANTED_END_CHAR_PATTERN.matchAsPrefix(number);
      if (trailingCharsMatcher != null) {
        number = number.substring(trailingCharsMatcher.start);
      }

      final secondNumber = SECOND_NUMBER_START_PATTERN.matchAsPrefix(number);
      if (secondNumber != null) {
        number = number.substring(0, secondNumber.start);
      }

      return number;
    }
    return '';
  }

  static bool isViablePhoneNumber(String number) {
    if (number.length < _MIN_LENGTH_FOR_NSN) return false;
    return _VALID_PHONE_NUMBER_PATTERN.hasMatch(number);
  }

  static StringBuffer normalize(StringBuffer number) {
    final m = _VALID_ALPHA_PHONE_PATTERN.hasMatch(number.toString());
    if (m) {
      final temp = number
          .toString()
          .replaceRange(0, number.length, _normalizeHelper(number.toString(), _ALPHA_PHONE_MAPPINGS, true));
      number
        ..clear()
        ..write(temp);
    } else {
      final temp = number.toString().replaceRange(0, number.length, normalizeDigitsOnly(number.toString()));
      number
        ..clear()
        ..write(temp);
    }
    return number;
  }

  static String _normalizeHelper(String number, Map<String, String> normalizationReplacements, bool removeNonMatches) {
    StringBuffer normalizedNumber = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      final character = number[i];
      final newDigit = normalizationReplacements[character.toUpperCase()];
      if (newDigit != null) {
        normalizedNumber.write(newDigit);
      } else if (!removeNonMatches) {
        normalizedNumber.write(character);
      }
    }
    return normalizedNumber.toString();
  }

  static String normalizeDigitsOnly(String number) {
    return normalizeDigits(number, false).toString();
  }

  static StringBuffer normalizeDigits(String number, bool keepNonDigits) {
    StringBuffer normalizedDigits = StringBuffer();
    for (int i = 0; i < number.length; i++) {
      final c = number[i];
      final digit = int.tryParse(c, radix: 10);
      if (digit != null) {
        normalizedDigits.write(digit);
      } else if (keepNonDigits) {
        normalizedDigits.write(c);
      }
    }
    return normalizedDigits;
  }

  static String normalizeDiallableCharsOnly(String number) {
    return _normalizeHelper(number, _DIALLABLE_CHAR_MAPPINGS, true);
  }

  static String convertAlphaCharactersInNumber(String number) {
    return _normalizeHelper(number, _ALPHA_PHONE_MAPPINGS, false);
  }

  int getLengthOfGeographicalAreaCode(PhoneNumber number) {
    PhoneMetadata? metadata = getMetadataForRegion(getRegionCodeForNumber(number));
    if (metadata == null) {
      return 0;
    }

    if (!metadata.hasNationalPrefix() && !number.italianLeadingZero) {
      return 0;
    }

    PhoneNumberType type = getNumberType(number);
    int countryCallingCode = number.countryCode;
    if (type == PhoneNumberType.MOBILE &&
        _GEO_MOBILE_COUNTRIES_WITHOUT_MOBILE_AREA_CODES.contains(countryCallingCode)) {
      return 0;
    }

    if (!isNumberGeographical(phoneNumberType: type, countryCallingCode: countryCallingCode)) {
      return 0;
    }

    return getLengthOfNationalDestinationCode(number);
  }

  int getLengthOfNationalDestinationCode(PhoneNumber number) {
    PhoneNumber copiedProto;
    if (number.hasExtension_3()) {
      copiedProto = PhoneNumber();
      copiedProto.mergeFromMessage(number);
      copiedProto.clearExtension_3();
    } else {
      copiedProto = number;
    }

    String nationalSignificantNumber = formatToString(copiedProto, PhoneNumberFormat.INTERNATIONAL);
    final numberGroups = nationalSignificantNumber.split(NON_DIGITS_PATTERN);
    if (numberGroups.length <= 3) return 0;

    if (getNumberType(number) == PhoneNumberType.MOBILE) {
      String mobileToken = getCountryMobileToken(number.countryCode);
      if (mobileToken != '') {
        return numberGroups[2].length + numberGroups[3].length;
      }
    }

    return numberGroups[2].length;
  }

  String formatToString(PhoneNumber number, PhoneNumberFormat numberFormat) {
    if (number.nationalNumber == 0 && number.hasRawInput()) {
      String rawInput = number.rawInput;
      if (rawInput.length > 0) return rawInput;
    }
    StringBuffer formattedNumber = StringBuffer();
    format(number, numberFormat, formattedNumber);
    return formattedNumber.toString();
  }

  void format(PhoneNumber number, PhoneNumberFormat numberFormat, StringBuffer formattedNumber) {
    formattedNumber.clear();
    int countryCallingCode = number.countryCode;
    String nationalSignificantNumber = getNationalSignificantNumber(number);

    if (numberFormat == PhoneNumberFormat.E164) {
      formattedNumber.write(nationalSignificantNumber);
      _prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.E164, formattedNumber);
      return;
    }

    if (!_hasValidCountryCallingCode(countryCallingCode)) {
      formattedNumber.write(nationalSignificantNumber);
      return;
    }

    String regionCode = getRegionCodeForCountryCode(countryCallingCode);
    PhoneMetadata metadata = _getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)!;
    formattedNumber.write(_formatNsn(nationalSignificantNumber, metadata, numberFormat));
    _maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber);
    _prefixNumberWithCountryCallingCode(countryCallingCode, numberFormat, formattedNumber);
  }

  static String getCountryMobileToken(int countryCallingCode) {
    return _MOBILE_TOKEN_MAPPINGS[countryCallingCode] ?? '';
  }

  static void setInstance(PhoneNumberUtil util) {
    _instance = util;
  }

  Set<String> getSupportedRegions() {
    return UnmodifiableSetView(_supportedRegions);
  }

  Set<int> getSupportedGlobalNetworkCallingCodes() {
    return UnmodifiableSetView(_countryCodesForNonGeographicalRegion);
  }

  Set<int> getSupportedCallingCodes() {
    return UnmodifiableSetView(_countryCallingCodeToRegionCodeMap.keys.toSet());
  }

  static bool _descHasPossibleNumberData(PhoneNumberDesc desc) {
    return desc.possibleLength.length != 1 || desc.possibleLength[0] != -1;
  }

  static bool _descHasData(PhoneNumberDesc desc) {
    return desc.hasExampleNumber() || _descHasPossibleNumberData(desc) || desc.hasNationalNumberPattern();
  }

  Set<PhoneNumberType> getSupportedTypesForMetadata(PhoneMetadata metadata) {
    Set<PhoneNumberType> types = TreeSet<PhoneNumberType>();
    for (var type in PhoneNumberType.values) {
      if (type == PhoneNumberType.FIXED_LINE_OR_MOBILE || type == PhoneNumberType.UNKNOWN) {
        continue;
      }
      if (_descHasData(getNumberDescByType(metadata, type))) {
        types.add(type);
      }
    }
    return UnmodifiableSetView(types);
  }

  Set<PhoneNumberType> getSupportedTypesForRegion(String regionCode) {
    if (!_isValidRegionCode(regionCode)) {
      print('Invalid or unknown region code provided: ' + regionCode);
      return UnmodifiableSetView(TreeSet<PhoneNumberType>());
    }
    PhoneMetadata metadata = getMetadataForRegion(regionCode)!;
    return getSupportedTypesForMetadata(metadata);
  }

  Set<PhoneNumberType> getSupportedTypesForNonGeoEntity(int countryCallingCode) {
    PhoneMetadata? metadata = getMetadataForNonGeographicalRegion(countryCallingCode);
    if (metadata == null) {
      print('Unknown country calling code for a non-geographical entity ' + 'provided: $countryCallingCode');
      return UnmodifiableSetView(TreeSet<PhoneNumberType>());
    }
    return getSupportedTypesForMetadata(metadata);
  }

  static PhoneNumberUtil getInstance() {
    if (_instance == null) {
      setInstance(createInstance(MetadataManager.DEFAULT_METADATA_LOADER));
    }
    return _instance!;
  }

  static PhoneNumberUtil createInstance(MetadataLoader? metadataLoader) {
    if (metadataLoader == null) {
      throw Exception('metadataLoader could not be null.');
    }
    return _createInstance(MultiFileMetadataSourceImpl(metadataLoader));
  }

  static PhoneNumberUtil _createInstance(MetadataSource? metadataSource) {
    if (metadataSource == null) {
      throw Exception('metadataSource could not be null.');
    }
    return PhoneNumberUtil(metadataSource, CountryCodeToRegionCodeMap.getCountryCodeToRegionCodeMap());
  }

  static bool formattingRuleHasFirstGroupOnly(String nationalPrefixFormattingRule) {
    return nationalPrefixFormattingRule.length == 0 ||
        _FIRST_GROUP_ONLY_PREFIX_PATTERN.hasMatch(nationalPrefixFormattingRule);
  }

  bool isNumberGeographical({PhoneNumber? phoneNumber, PhoneNumberType? phoneNumberType, int? countryCallingCode}) {
    if (phoneNumber != null) {
      return isNumberGeographical(
        phoneNumberType: getNumberType(phoneNumber),
        countryCallingCode: phoneNumber.countryCode,
      );
    } else {
      return phoneNumberType == PhoneNumberType.FIXED_LINE ||
          phoneNumberType == PhoneNumberType.FIXED_LINE_OR_MOBILE ||
          (_GEO_MOBILE_COUNTRIES.contains(countryCallingCode) && phoneNumberType == PhoneNumberType.MOBILE);
    }
  }

  bool _isValidRegionCode(String? regionCode) {
    return regionCode != null && _supportedRegions.contains(regionCode);
  }

  bool _hasValidCountryCallingCode(int countryCallingCode) {
    return _countryCallingCodeToRegionCodeMap.containsKey(countryCallingCode);
  }

  String formatByPattern(PhoneNumber number, PhoneNumberFormat numberFormat, List<NumberFormat> userDefinedFormats) {
    int countryCallingCode = number.countryCode;
    String nationalSignificantNumber = getNationalSignificantNumber(number);
    if (!_hasValidCountryCallingCode(countryCallingCode)) {
      return nationalSignificantNumber;
    }

    String regionCode = getRegionCodeForCountryCode(countryCallingCode);
    PhoneMetadata metadata = _getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)!;

    StringBuffer formattedNumber = StringBuffer();

    NumberFormat? formattingPattern = chooseFormattingPatternForNumber(userDefinedFormats, nationalSignificantNumber);
    if (formattingPattern == null) {
      formattedNumber.write(nationalSignificantNumber);
    } else {
      final numFormatCopy = NumberFormat.create();
      numFormatCopy.mergeFromMessage(formattingPattern);
      String nationalPrefixFormattingRule = formattingPattern.nationalPrefixFormattingRule;
      if (nationalPrefixFormattingRule.length > 0) {
        String nationalPrefix = metadata.nationalPrefix;
        if (nationalPrefix.length > 0) {
          nationalPrefixFormattingRule = nationalPrefixFormattingRule.replaceFirst(_NP_STRING, nationalPrefix);
          nationalPrefixFormattingRule = nationalPrefixFormattingRule.replaceFirst(_FG_STRING, '\$1');
          numFormatCopy.nationalPrefixFormattingRule = nationalPrefixFormattingRule;
        } else {
          numFormatCopy.clearNationalPrefixFormattingRule();
        }
      }
      formattedNumber.write(formatNsnUsingPattern(nationalSignificantNumber, numFormatCopy, numberFormat));
    }
    _maybeAppendFormattedExtension(number, metadata, numberFormat, formattedNumber);
    _prefixNumberWithCountryCallingCode(countryCallingCode, numberFormat, formattedNumber);
    return formattedNumber.toString();
  }

  String formatNationalNumberWithCarrierCode(PhoneNumber number, String carrierCode) {
    int countryCallingCode = number.countryCode;
    String nationalSignificantNumber = getNationalSignificantNumber(number);
    if (!_hasValidCountryCallingCode(countryCallingCode)) {
      return nationalSignificantNumber;
    }

    String regionCode = getRegionCodeForCountryCode(countryCallingCode);
    PhoneMetadata metadata = _getMetadataForRegionOrCallingCode(countryCallingCode, regionCode)!;

    StringBuffer formattedNumber = StringBuffer();
    formattedNumber.write(_formatNsn(nationalSignificantNumber, metadata, PhoneNumberFormat.NATIONAL, carrierCode));
    _maybeAppendFormattedExtension(number, metadata, PhoneNumberFormat.NATIONAL, formattedNumber);
    _prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.NATIONAL, formattedNumber);
    return formattedNumber.toString();
  }

  PhoneMetadata? _getMetadataForRegionOrCallingCode(int countryCallingCode, String regionCode) {
    return (REGION_CODE_FOR_NON_GEO_ENTITY == regionCode)
        ? getMetadataForNonGeographicalRegion(countryCallingCode)
        : getMetadataForRegion(regionCode)!;
  }

  String formatNationalNumberWithPreferredCarrierCode(PhoneNumber number, String fallbackCarrierCode) {
    return formatNationalNumberWithCarrierCode(number,
        number.preferredDomesticCarrierCode.length > 0 ? number.preferredDomesticCarrierCode : fallbackCarrierCode);
  }

  String formatNumberForMobileDialing(PhoneNumber number, String regionCallingFrom, bool withFormatting) {
    int countryCallingCode = number.countryCode;
    if (!_hasValidCountryCallingCode(countryCallingCode)) {
      return number.hasRawInput() ? number.rawInput : '';
    }

    String formattedNumber = '';

    PhoneNumber numberNoExt = PhoneNumber.mergeFrom(number).clearExtension();
    String regionCode = getRegionCodeForCountryCode(countryCallingCode);
    PhoneNumberType numberType = getNumberType(numberNoExt);
    bool isValidNumber = (numberType != PhoneNumberType.UNKNOWN);
    if (regionCallingFrom == regionCode) {
      bool isFixedLineOrMobile = (numberType == PhoneNumberType.FIXED_LINE) ||
          (numberType == PhoneNumberType.MOBILE) ||
          (numberType == PhoneNumberType.FIXED_LINE_OR_MOBILE);

      if (regionCode == 'CO' && numberType == PhoneNumberType.FIXED_LINE) {
        formattedNumber = formatNationalNumberWithCarrierCode(numberNoExt, _COLOMBIA_MOBILE_TO_FIXED_LINE_PREFIX);
      } else if (regionCode == 'BR' && isFixedLineOrMobile) {
        formattedNumber = (numberNoExt.preferredDomesticCarrierCode.length > 0)
            ? formattedNumber = formatNationalNumberWithPreferredCarrierCode(numberNoExt, '')
            : '';
      } else if (countryCallingCode == _NANPA_COUNTRY_CODE) {
        PhoneMetadata regionMetadata = getMetadataForRegion(regionCallingFrom);
        if (canBeInternationallyDialled(numberNoExt) &&
            testNumberLength(getNationalSignificantNumber(numberNoExt), regionMetadata) != ValidationResult.TOO_SHORT) {
          formattedNumber = formatToString(numberNoExt, PhoneNumberFormat.INTERNATIONAL);
        } else {
          formattedNumber = formatToString(numberNoExt, PhoneNumberFormat.NATIONAL);
        }
      } else {
        if ((regionCode == REGION_CODE_FOR_NON_GEO_ENTITY ||
                ((regionCode == 'MX' || regionCode == 'CL' || regionCode == 'UZ') && isFixedLineOrMobile)) &&
            canBeInternationallyDialled(numberNoExt)) {
          formattedNumber = formatToString(numberNoExt, PhoneNumberFormat.INTERNATIONAL);
        } else {
          formattedNumber = formatToString(numberNoExt, PhoneNumberFormat.NATIONAL);
        }
      }
    } else if (isValidNumber && canBeInternationallyDialled(numberNoExt)) {
      return withFormatting
          ? formatToString(numberNoExt, PhoneNumberFormat.INTERNATIONAL)
          : formatToString(numberNoExt, PhoneNumberFormat.E164);
    }
    return withFormatting ? formattedNumber : normalizeDiallableCharsOnly(formattedNumber);
  }

  String formatOutOfCountryCallingNumber(PhoneNumber number, String regionCallingFrom) {
    if (!_isValidRegionCode(regionCallingFrom)) {
      print("Trying to format number from invalid region " + regionCallingFrom + ". International formatting applied.");
      return formatToString(number, PhoneNumberFormat.INTERNATIONAL);
    }
    int countryCallingCode = number.countryCode;
    String nationalSignificantNumber = getNationalSignificantNumber(number);
    if (!_hasValidCountryCallingCode(countryCallingCode)) {
      return nationalSignificantNumber;
    }
    if (countryCallingCode == _NANPA_COUNTRY_CODE) {
      if (isNANPACountry(regionCallingFrom)) {
        return "$countryCallingCode${formatToString(number, PhoneNumberFormat.NATIONAL)}";
      }
    } else if (countryCallingCode == _getCountryCodeForValidRegion(regionCallingFrom)) {
      return formatToString(number, PhoneNumberFormat.NATIONAL);
    }

    PhoneMetadata metadataForRegionCallingFrom = getMetadataForRegion(regionCallingFrom);
    String internationalPrefix = metadataForRegionCallingFrom.internationalPrefix;

    String internationalPrefixForFormatting = "";
    if (_SINGLE_INTERNATIONAL_PREFIX.hasMatch(internationalPrefix)) {
      internationalPrefixForFormatting = internationalPrefix;
    } else if (metadataForRegionCallingFrom.hasPreferredInternationalPrefix()) {
      internationalPrefixForFormatting = metadataForRegionCallingFrom.preferredInternationalPrefix;
    }

    String regionCode = getRegionCodeForCountryCode(countryCallingCode);
    PhoneMetadata metadataForRegion = _getMetadataForRegionOrCallingCode(countryCallingCode, regionCode);
    String formattedNationalNumber =
        _formatNsn(nationalSignificantNumber, metadataForRegion, PhoneNumberFormat.INTERNATIONAL);
    StringBuffer formattedNumber = StringBuffer(formattedNationalNumber);
    _maybeAppendFormattedExtension(number, metadataForRegion, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
    if (internationalPrefixForFormatting.length > 0) {
      formattedNumber
          .insert(0, " ")
          .insert(0, countryCallingCode)
          .insert(0, " ")
          .insert(0, internationalPrefixForFormatting);
    } else {
      _prefixNumberWithCountryCallingCode(countryCallingCode, PhoneNumberFormat.INTERNATIONAL, formattedNumber);
    }
    return formattedNumber.toString();
  }

  String formatInOriginalFormat(PhoneNumber number, String regionCallingFrom) {
    if (number.hasRawInput() && !_hasFormattingPatternForNumber(number)) {
      return number.getRawInput();
    }
    if (!number.hasCountryCodeSource()) {
      return format(number, PhoneNumberFormat.NATIONAL);
    }
    String formattedNumber;
    switch (number.getCountryCodeSource()) {
      case FROM_NUMBER_WITH_PLUS_SIGN:
        formattedNumber = format(number, PhoneNumberFormat.INTERNATIONAL);
        break;
      case FROM_NUMBER_WITH_IDD:
        formattedNumber = formatOutOfCountryCallingNumber(number, regionCallingFrom);
        break;
      case FROM_NUMBER_WITHOUT_PLUS_SIGN:
        formattedNumber = format(number, PhoneNumberFormat.INTERNATIONAL).substring(1);
        break;
      case FROM_DEFAULT_COUNTRY:
        // Fall-through to default case.
      default:
        String regionCode = getRegionCodeForCountryCode(number.getCountryCode());
        // We strip non-digits from the NDD here, and from the raw input later, so that we can
        // compare them easily.
        String nationalPrefix = getNddPrefixForRegion(regionCode, true /* strip non-digits */);
        String nationalFormat = format(number, PhoneNumberFormat.NATIONAL);
        if (nationalPrefix == null || nationalPrefix.length() == 0) {
          // If the region doesn't have a national prefix at all, we can safely return the national
          // format without worrying about a national prefix being added.
          formattedNumber = nationalFormat;
          break;
        }
        // Otherwise, we check if the original number was entered with a national prefix.
        if (_rawInputContainsNationalPrefix(
            number.getRawInput(), nationalPrefix, regionCode)) {
          // If so, we can safely return the national format.
          formattedNumber = nationalFormat;
          break;
        }
        // Metadata cannot be null here because getNddPrefixForRegion() (above) returns null if
        // there is no metadata for the region.
        PhoneMetadata metadata = getMetadataForRegion(regionCode);
        String nationalNumber = getNationalSignificantNumber(number);
        NumberFormat formatRule =
            chooseFormattingPatternForNumber(metadata.getNumberFormatList(), nationalNumber);
        // The format rule could still be null here if the national number was 0 and there was no
        // raw input (this should not be possible for numbers generated by the phonenumber library
        // as they would also not have a country calling code and we would have exited earlier).
        if (formatRule == null) {
          formattedNumber = nationalFormat;
          break;
        }
        // When the format we apply to this number doesn't contain national prefix, we can just
        // return the national format.
        // TODO: Refactor the code below with the code in
        // isNationalPrefixPresentIfRequired.
        String candidateNationalPrefixRule = formatRule.getNationalPrefixFormattingRule();
        // We assume that the first-group symbol will never be _before_ the national prefix.
        int indexOfFirstGroup = candidateNationalPrefixRule.indexOf("$1");
        if (indexOfFirstGroup <= 0) {
          formattedNumber = nationalFormat;
          break;
        }
        candidateNationalPrefixRule =
            candidateNationalPrefixRule.substring(0, indexOfFirstGroup);
        candidateNationalPrefixRule = normalizeDigitsOnly(candidateNationalPrefixRule);
        if (candidateNationalPrefixRule.length() == 0) {
          // National prefix not used when formatting this number.
          formattedNumber = nationalFormat;
          break;
        }
        // Otherwise, we need to remove the national prefix from our output.
        NumberFormat.Builder numFormatCopy =  NumberFormat.newBuilder();
        numFormatCopy.mergeFrom(formatRule);
        numFormatCopy.clearNationalPrefixFormattingRule();
        List<NumberFormat> numberFormats =  ArrayList<NumberFormat>(1);
        numberFormats.add(numFormatCopy.build());
        formattedNumber = formatByPattern(number, PhoneNumberFormat.NATIONAL, numberFormats);
        break;
    }
    String rawInput = number.getRawInput();
    // If no digit is inserted/removed/modified as a result of our formatting, we return the
    // formatted phone number; otherwise we return the raw input the user entered.
    if (formattedNumber != null && rawInput.length() > 0) {
      String normalizedFormattedNumber = normalizeDiallableCharsOnly(formattedNumber);
      String normalizedRawInput = normalizeDiallableCharsOnly(rawInput);
      if (!normalizedFormattedNumber.equals(normalizedRawInput)) {
        formattedNumber = rawInput;
      }
    }
    return formattedNumber;
  }

  bool _rawInputContainsNationalPrefix(String rawInput, String nationalPrefix,
      String regionCode) {
    String normalizedNationalNumber = normalizeDigitsOnly(rawInput);
    if (normalizedNationalNumber.startsWith(nationalPrefix)) {
      try {
        return isValidNumber(
            parse(normalizedNationalNumber.substring(nationalPrefix.length), regionCode));
      } catch ( e) {
        return false;
      }
    }
    return false;
  }

  bool _hasFormattingPatternForNumber(PhoneNumber number) {
    int countryCallingCode = number.countryCode;
    String phoneNumberRegion = getRegionCodeForCountryCode(countryCallingCode);
    PhoneMetadata? metadata =
        getMetadataForRegionOrCallingCode(countryCallingCode, phoneNumberRegion);
    if (metadata == null) {
      return false;
    }
    String nationalNumber = getNationalSignificantNumber(number);
    NumberFormat? formatRule =
        chooseFormattingPatternForNumber(metadata.getNumberFormatList(), nationalNumber);
    return formatRule != null;
  }

String formatOutOfCountryKeepingAlphaChars(PhoneNumber number,
                                                    String regionCallingFrom) {
    String rawInput = number.rawInput;
    // If there is no raw input, then we can't keep alpha characters because there aren't any.
    // In this case, we return formatOutOfCountryCallingNumber.
    if (rawInput.length == 0) {
      return formatOutOfCountryCallingNumber(number, regionCallingFrom);
    }
    int countryCode = number.countryCode;
    if (!_hasValidCountryCallingCode(countryCode)) {
      return rawInput;
    }
    // Strip any prefix such as country calling code, IDD, that was present. We do this by comparing
    // the number in raw_input with the parsed number.
    // To do this, first we normalize punctuation. We retain number grouping symbols such as " "
    // only.
    rawInput = _normalizeHelper(rawInput, _ALL_PLUS_NUMBER_GROUPING_SYMBOLS, true);
    // Now we trim everything before the first three digits in the parsed number. We choose three
    // because all valid alpha numbers have 3 digits at the start - if it does not, then we don't
    // trim anything at all. Similarly, if the national number was less than three digits, we don't
    // trim anything at all.
    String nationalNumber = getNationalSignificantNumber(number);
    if (nationalNumber.length > 3) {
      int firstNationalNumberDigit = rawInput.indexOf(nationalNumber.substring(0, 3));
      if (firstNationalNumberDigit != -1) {
        rawInput = rawInput.substring(firstNationalNumberDigit);
      }
    }
    PhoneMetadata? metadataForRegionCallingFrom = getMetadataForRegion(regionCallingFrom);
    if (countryCode == _NANPA_COUNTRY_CODE) {
      if (isNANPACountry(regionCallingFrom)) {
        return "$countryCode $rawInput";
      }
    } else if (metadataForRegionCallingFrom != null
        && countryCode == _getCountryCodeForValidRegion(regionCallingFrom)) {
      NumberFormat? formattingPattern =
          chooseFormattingPatternForNumber(metadataForRegionCallingFrom.numberFormat,
                                           nationalNumber);
      if (formattingPattern == null) {
        // If no pattern above is matched, we format the original input.
        return rawInput;
      }
      NumberFormat.Builder newFormat = NumberFormat.newBuilder();
      newFormat.mergeFrom(formattingPattern);
      // The first group is the first group of digits that the user wrote together.
      newFormat.setPattern("(\\d+)(.*)");
      // Here we just concatenate them back together after the national prefix has been fixed.
      newFormat.setFormat("\$1\$2");
      // Now we format using this pattern instead of the default pattern, but with the national
      // prefix prefixed if necessary.
      // This will not work in the cases where the pattern (and not the leading digits) decide
      // whether a national prefix needs to be used, since we have overridden the pattern to match
      // anything, but that is not the case in the metadata to date.
      return formatNsnUsingPattern(rawInput, newFormat.build(), PhoneNumberFormat.NATIONAL);
    }
    String internationalPrefixForFormatting = "";
    // If an unsupported region-calling-from is entered, or a country with multiple international
    // prefixes, the international format of the number is returned, unless there is a preferred
    // international prefix.
    if (metadataForRegionCallingFrom != null) {
      String internationalPrefix = metadataForRegionCallingFrom.getInternationalPrefix();
      internationalPrefixForFormatting =
          _SINGLE_INTERNATIONAL_PREFIX.matcher(internationalPrefix).matches()
          ? internationalPrefix
          : metadataForRegionCallingFrom.getPreferredInternationalPrefix();
    }
    StringBuilder formattedNumber =  StringBuilder(rawInput);
    String regionCode = getRegionCodeForCountryCode(countryCode);
    // Metadata cannot be null because the country calling code is valid.
    PhoneMetadata metadataForRegion = getMetadataForRegionOrCallingCode(countryCode, regionCode);
    _maybeAppendFormattedExtension(number, metadataForRegion,
                                  PhoneNumberFormat.INTERNATIONAL, formattedNumber);
    if (internationalPrefixForFormatting.length > 0) {
      formattedNumber.insert(0, " ").insert(0, countryCode).insert(0, " ")
          .insert(0, internationalPrefixForFormatting);
    } else {
      // Invalid region entered as country-calling-from (so no metadata was found for it) or the
      // region chosen has multiple international dialling prefixes.
      if (!_isValidRegionCode(regionCallingFrom)) {
        print(
                   "Trying to format number from invalid region "
                   + regionCallingFrom
                   + ". International formatting applied.");
      }
      _prefixNumberWithCountryCallingCode(countryCode,
                                         PhoneNumberFormat.INTERNATIONAL,
                                         formattedNumber);
    }
    return formattedNumber.toString();
  }

  String getNationalSignificantNumber(PhoneNumber number) {
    StringBuffer nationalNumber =   StringBuffer();
    // if (number.italianLeadingZero && number.numberOfLeadingZeros > 0) {
    //   final zeros = new char[number.getNumberOfLeadingZeros()];
    //   Arrays.fill(zeros, '0');
    //   nationalNumber.append(new String(zeros));
    // }
    nationalNumber.write(number.nationalNumber);
    return nationalNumber.toString();
  }

  void _prefixNumberWithCountryCallingCode(int countryCallingCode,
                                                  PhoneNumberFormat numberFormat,
                                                  StringBuffer formattedNumber) {
    switch (numberFormat) {
      case PhoneNumberFormat.E164:
        formattedNumber.insert(0, countryCallingCode).insert(0, PLUS_SIGN);
        return;
      case PhoneNumberFormat.INTERNATIONAL:
        formattedNumber.insert(0, " ").insert(0, countryCallingCode).insert(0, PLUS_SIGN);
        return;
      case PhoneNumberFormat.RFC3966:
        formattedNumber.insert(0, "-").insert(0, countryCallingCode).insert(0, PLUS_SIGN)
            .insert(0, _RFC3966_PREFIX);
        return;
      case PhoneNumberFormat.NATIONAL:
      default:
        return;
    }
  }

  String _formatNsn(String number, PhoneMetadata metadata, PhoneNumberFormat numberFormat, [String? carrierCode]) {
   if (carrierCode == null) {return _formatNsn(number, metadata, numberFormat, null);}
   else {
       List<NumberFormat> intlNumberFormats = metadata.getIntlNumberFormatList();
    // When the intlNumberFormats exists, we use that to format national number for the
    // INTERNATIONAL format instead of using the numberDesc.numberFormats.
    List<NumberFormat> availableFormats =
        (intlNumberFormats.length == 0 || numberFormat == PhoneNumberFormat.NATIONAL)
        ? metadata.getNumberFormatList()
        : metadata.getIntlNumberFormatList();
    NumberFormat? formattingPattern = chooseFormattingPatternForNumber(availableFormats, number);
    return (formattingPattern == null)
        ? number
        : formatNsnUsingPattern(number, formattingPattern, numberFormat, carrierCode);
   }
  }

   NumberFormat? chooseFormattingPatternForNumber(List<NumberFormat> availableFormats,
                                                String nationalNumber) {
    // for (NumberFormat numFormat : availableFormats) {
    //   int size = numFormat.getLeadingDigitsPatternCount();
    //   if (size == 0 || regexCache.getPatternForRegex(
    //           // We always use the last leading_digits_pattern, as it is the most detailed.
    //           numFormat.getLeadingDigitsPattern(size - 1)).matcher(nationalNumber).lookingAt()) {
    //     Matcher m = regexCache.getPatternForRegex(numFormat.getPattern()).matcher(nationalNumber);
    //     if (m.matches()) {
    //       return numFormat;
    //     }
    //   }
    // }
    return null;
  }

  String formatNsnUsingPattern(String nationalNumber,
                               NumberFormat formattingPattern,
                               PhoneNumberFormat numberFormat) {
    return _formatNsnUsingPattern(nationalNumber, formattingPattern, numberFormat, null);
  }

String _formatNsnUsingPattern(String nationalNumber,
                                       NumberFormat formattingPattern,
                                       PhoneNumberFormat numberFormat,
                                       String carrierCode) {
    String numberFormatRule = formattingPattern.getFormat();
    Matcher m =
        regexCache.getPatternForRegex(formattingPattern.getPattern()).matcher(nationalNumber);
    String formattedNationalNumber = "";
    if (numberFormat == PhoneNumberFormat.NATIONAL
        && carrierCode != null && carrierCode.length() > 0
        && formattingPattern.getDomesticCarrierCodeFormattingRule().length() > 0) {
      // Replace the $CC in the formatting rule with the desired carrier code.
      String carrierCodeFormattingRule = formattingPattern.getDomesticCarrierCodeFormattingRule();
      carrierCodeFormattingRule = carrierCodeFormattingRule.replace(CC_STRING, carrierCode);
      // Now replace the $FG in the formatting rule with the first group and the carrier code
      // combined in the appropriate way.
      numberFormatRule = FIRST_GROUP_PATTERN.matcher(numberFormatRule)
          .replaceFirst(carrierCodeFormattingRule);
      formattedNationalNumber = m.replaceAll(numberFormatRule);
    } else {
      // Use the national prefix formatting rule instead.
      String nationalPrefixFormattingRule = formattingPattern.getNationalPrefixFormattingRule();
      if (numberFormat == PhoneNumberFormat.NATIONAL
          && nationalPrefixFormattingRule != null
          && nationalPrefixFormattingRule.length() > 0) {
        Matcher firstGroupMatcher = FIRST_GROUP_PATTERN.matcher(numberFormatRule);
        formattedNationalNumber =
            m.replaceAll(firstGroupMatcher.replaceFirst(nationalPrefixFormattingRule));
      } else {
        formattedNationalNumber = m.replaceAll(numberFormatRule);
      }
    }
    if (numberFormat == PhoneNumberFormat.RFC3966) {
      // Strip any leading punctuation.
      Matcher matcher = SEPARATOR_PATTERN.matcher(formattedNationalNumber);
      if (matcher.lookingAt()) {
        formattedNationalNumber = matcher.replaceFirst("");
      }
      // Replace the rest with a dash between each number group.
      formattedNationalNumber = matcher.reset(formattedNationalNumber).replaceAll("-");
    }
    return formattedNationalNumber;
  }

 PhoneNumber getExampleNumber(String regionCode) {
    return getExampleNumberForType(regionCode, PhoneNumberType.FIXED_LINE);
  }

  PhoneNumber? getInvalidExampleNumber(String regionCode) {
    if (!isValidRegionCode(regionCode)) {
      logger.log(Level.WARNING, "Invalid or unknown region code provided: " + regionCode);
      return null;
    }
    // We start off with a valid fixed-line number since every country supports this. Alternatively
    // we could start with a different number type, since fixed-line numbers typically have a wide
    // breadth of valid number lengths and we may have to make it very short before we get an
    // invalid number.
    PhoneNumberDesc desc = getNumberDescByType(getMetadataForRegion(regionCode),
        PhoneNumberType.FIXED_LINE);
    if (!desc.hasExampleNumber()) {
      // This shouldn't happen; we have a test for this.
      return null;
    }
    String exampleNumber = desc.getExampleNumber();
    // Try and make the number invalid. We do this by changing the length. We try reducing the
    // length of the number, since currently no region has a number that is the same length as
    // MIN_LENGTH_FOR_NSN. This is probably quicker than making the number longer, which is another
    // alternative. We could also use the possible number pattern to extract the possible lengths of
    // the number to make this faster, but this method is only for unit-testing so simplicity is
    // preferred to performance.  We don't want to return a number that can't be parsed, so we check
    // the number is long enough. We try all possible lengths because phone number plans often have
    // overlapping prefixes so the number 123456 might be valid as a fixed-line number, and 12345 as
    // a mobile number. It would be faster to loop in a different order, but we prefer numbers that
    // look closer to real numbers (and it gives us a variety of different lengths for the resulting
    // phone numbers - otherwise they would all be MIN_LENGTH_FOR_NSN digits long.)
    for (int phoneNumberLength = exampleNumber.length() - 1;
         phoneNumberLength >= MIN_LENGTH_FOR_NSN;
         phoneNumberLength--) {
      String numberToTry = exampleNumber.substring(0, phoneNumberLength);
      try {
        PhoneNumber possiblyValidNumber = parse(numberToTry, regionCode);
        if (!isValidNumber(possiblyValidNumber)) {
          return possiblyValidNumber;
        }
      } catch (NumberParseException e) {
        // Shouldn't happen: we have already checked the length, we know example numbers have
        // only valid digits, and we know the region code is fine.
      }
    }
    // We have a test to check that this doesn't happen for any of our supported regions.
    return null;
  }

  PhoneNumber? getExampleNumberForType(String regionCode, PhoneNumberType type) {
    // Check the region code is valid.
    if (!isValidRegionCode(regionCode)) {
      logger.log(Level.WARNING, "Invalid or unknown region code provided: " + regionCode);
      return null;
    }
    PhoneNumberDesc desc = getNumberDescByType(getMetadataForRegion(regionCode), type);
    try {
      if (desc.hasExampleNumber()) {
        return parse(desc.getExampleNumber(), regionCode);
      }
    } catch (NumberParseException e) {
      logger.log(Level.SEVERE, e.toString());
    }
    return null;
  }

   PhoneNumber? getExampleNumberForType(PhoneNumberType type) {
    for (String regionCode : getSupportedRegions()) {
      PhoneNumber exampleNumber = getExampleNumberForType(regionCode, type);
      if (exampleNumber != null) {
        return exampleNumber;
      }
    }
    // If there wasn't an example number for a region, try the non-geographical entities.
    for (int countryCallingCode : getSupportedGlobalNetworkCallingCodes()) {
      PhoneNumberDesc desc = getNumberDescByType(
          getMetadataForNonGeographicalRegion(countryCallingCode), type);
      try {
        if (desc.hasExampleNumber()) {
          return parse("+" + countryCallingCode + desc.getExampleNumber(), UNKNOWN_REGION);
        }
      } catch (NumberParseException e) {
        logger.log(Level.SEVERE, e.toString());
      }
    }
    // There are no example numbers of this type for any country in the library.
    return null;
  }

  PhoneNumber? getExampleNumberForNonGeoEntity(int countryCallingCode) {
    PhoneMetadata metadata = getMetadataForNonGeographicalRegion(countryCallingCode);
    if (metadata != null) {
      // For geographical entities, fixed-line data is always present. However, for non-geographical
      // entities, this is not the case, so we have to go through different types to find the
      // example number. We don't check fixed-line or personal number since they aren't used by
      // non-geographical entities (if this changes, a unit-test will catch this.)
      for (PhoneNumberDesc desc : Arrays.asList(metadata.getMobile(), metadata.getTollFree(),
               metadata.getSharedCost(), metadata.getVoip(), metadata.getVoicemail(),
               metadata.getUan(), metadata.getPremiumRate())) {
        try {
          if (desc != null && desc.hasExampleNumber()) {
            return parse("+" + countryCallingCode + desc.getExampleNumber(), UNKNOWN_REGION);
          }
        } catch (NumberParseException e) {
          logger.log(Level.SEVERE, e.toString());
        }
      }
    } else {
      logger.log(Level.WARNING,
                 "Invalid or unknown country calling code provided: " + countryCallingCode);
    }
    return null;
  }


void _maybeAppendFormattedExtension(PhoneNumber number, PhoneMetadata metadata,
                                             PhoneNumberFormat numberFormat,
                                             StringBuilder formattedNumber) {
    if (number.hasExtension() && number.getExtension().length() > 0) {
      if (numberFormat == PhoneNumberFormat.RFC3966) {
        formattedNumber.append(RFC3966_EXTN_PREFIX).append(number.getExtension());
      } else {
        if (metadata.hasPreferredExtnPrefix()) {
          formattedNumber.append(metadata.getPreferredExtnPrefix()).append(number.getExtension());
        } else {
          formattedNumber.append(DEFAULT_EXTN_PREFIX).append(number.getExtension());
        }
      }
    }
  }


  PhoneNumberDesc getNumberDescByType(PhoneMetadata metadata, PhoneNumberType type) {
    switch (type) {
      case PhoneNumberType.PREMIUM_RATE:
        return metadata.getPremiumRate();
      case PhoneNumberType.TOLL_FREE:
        return metadata.getTollFree();
      case PhoneNumberType.MOBILE:
        return metadata.getMobile();
      case PhoneNumberType.FIXED_LINE:
      case PhoneNumberType.FIXED_LINE_OR_MOBILE:
        return metadata.getFixedLine();
      case PhoneNumberType.SHARED_COST:
        return metadata.getSharedCost();
      case PhoneNumberType.VOIP:
        return metadata.getVoip();
      case PhoneNumberType.PERSONAL_NUMBER:
        return metadata.getPersonalNumber();
      case PhoneNumberType.PAGER:
        return metadata.getPager();
      case PhoneNumberType.UAN:
        return metadata.getUan();
      case PhoneNumberType.VOICEMAIL:
        return metadata.getVoicemail();
      default:
        return metadata.getGeneralDesc();
    }
  }

  PhoneNumberType getNumberType(PhoneNumber number) {
    String regionCode = getRegionCodeForNumber(number);
    PhoneMetadata metadata = getMetadataForRegionOrCallingCode(number.getCountryCode(), regionCode);
    if (metadata == null) {
      return PhoneNumberType.UNKNOWN;
    }
    String nationalSignificantNumber = getNationalSignificantNumber(number);
    return getNumberTypeHelper(nationalSignificantNumber, metadata);
  }

  PhoneNumberType getNumberTypeHelper(String nationalNumber, PhoneMetadata metadata) {
    if (!isNumberMatchingDesc(nationalNumber, metadata.getGeneralDesc())) {
      return PhoneNumberType.UNKNOWN;
    }

    if (isNumberMatchingDesc(nationalNumber, metadata.getPremiumRate())) {
      return PhoneNumberType.PREMIUM_RATE;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getTollFree())) {
      return PhoneNumberType.TOLL_FREE;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getSharedCost())) {
      return PhoneNumberType.SHARED_COST;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getVoip())) {
      return PhoneNumberType.VOIP;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getPersonalNumber())) {
      return PhoneNumberType.PERSONAL_NUMBER;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getPager())) {
      return PhoneNumberType.PAGER;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getUan())) {
      return PhoneNumberType.UAN;
    }
    if (isNumberMatchingDesc(nationalNumber, metadata.getVoicemail())) {
      return PhoneNumberType.VOICEMAIL;
    }

    bool isFixedLine = isNumberMatchingDesc(nationalNumber, metadata.getFixedLine());
    if (isFixedLine) {
      if (metadata.getSameMobileAndFixedLinePattern()) {
        return PhoneNumberType.FIXED_LINE_OR_MOBILE;
      } else if (isNumberMatchingDesc(nationalNumber, metadata.getMobile())) {
        return PhoneNumberType.FIXED_LINE_OR_MOBILE;
      }
      return PhoneNumberType.FIXED_LINE;
    }
     
    if (!metadata.getSameMobileAndFixedLinePattern()
        && isNumberMatchingDesc(nationalNumber, metadata.getMobile())) {
      return PhoneNumberType.MOBILE;
    }
    return PhoneNumberType.UNKNOWN;
  }

  PhoneMetadata? getMetadataForRegion(String regionCode) {
    if (!isValidRegionCode(regionCode)) {
      return null;
    }
    return metadataSource.getMetadataForRegion(regionCode);
  }

  PhoneMetadata? getMetadataForNonGeographicalRegion(int countryCallingCode) {
    if (!countryCallingCodeToRegionCodeMap.containsKey(countryCallingCode)) {
      return null;
    }
    return metadataSource.getMetadataForNonGeographicalRegion(countryCallingCode);
  }

  bool isNumberMatchingDesc(String nationalNumber, PhoneNumberDesc numberDesc) {
    // Check if any possible number lengths are present; if so, we use them to avoid checking the
    // validation pattern if they don't match. If they are absent, this means they match the general
    // description, which we have already checked before checking a specific number type.
    int actualLength = nationalNumber.length;
    List<int> possibleLengths = numberDesc.getPossibleLengthList();
    if (possibleLengths.length > 0 && !possibleLengths.contains(actualLength)) {
      return false;
    }
    return matcherApi.matchNationalNumber(nationalNumber, numberDesc, false);
  }

  bool isValidNumber(PhoneNumber number) {
    String regionCode = getRegionCodeForNumber(number);
    return isValidNumberForRegion(number, regionCode);
  }

  bool isValidNumberForRegion(PhoneNumber number, String regionCode) {
    int countryCode = number.getCountryCode();
    PhoneMetadata metadata = getMetadataForRegionOrCallingCode(countryCode, regionCode);
    if ((metadata == null)
        || (!REGION_CODE_FOR_NON_GEO_ENTITY.equals(regionCode)
         && countryCode != _getCountryCodeForValidRegion(regionCode))) {
      // Either the region code was invalid, or the country calling code for this number does not
      // match that of the region code.
      return false;
    }
    String nationalSignificantNumber = getNationalSignificantNumber(number);
    return getNumberTypeHelper(nationalSignificantNumber, metadata) != PhoneNumberType.UNKNOWN;
  }

  String getRegionCodeForNumber(PhoneNumber number) {
    int countryCode = number.getCountryCode();
    List<String> regions = countryCallingCodeToRegionCodeMap.get(countryCode);
    if (regions == null) {
      logger.log(Level.INFO, "Missing/invalid country_code (" + countryCode + ")");
      return null;
    }
    if (regions.size() == 1) {
      return regions.get(0);
    } else {
      return _getRegionCodeForNumberFromRegionList(number, regions);
    }
  }

String? _getRegionCodeForNumberFromRegionList(PhoneNumber number,
                                                      List<String> regionCodes) {
    String nationalNumber = getNationalSignificantNumber(number);
    for (String regionCode : regionCodes) {
      // If leadingDigits is present, use this. Otherwise, do full validation.
      // Metadata cannot be null because the region codes come from the country calling code map.
      PhoneMetadata metadata = getMetadataForRegion(regionCode);
      if (metadata.hasLeadingDigits()) {
        if (regexCache.getPatternForRegex(metadata.getLeadingDigits())
                .matcher(nationalNumber).lookingAt()) {
          return regionCode;
        }
      } else if (getNumberTypeHelper(nationalNumber, metadata) != PhoneNumberType.UNKNOWN) {
        return regionCode;
      }
    }
    return null;
  }

String getRegionCodeForCountryCode(int countryCallingCode) {
    List<String> regionCodes = countryCallingCodeToRegionCodeMap.get(countryCallingCode);
    return regionCodes == null ? UNKNOWN_REGION : regionCodes.get(0);
  }

  List<String> getRegionCodesForCountryCode(int countryCallingCode) {
    List<String> regionCodes = countryCallingCodeToRegionCodeMap.get(countryCallingCode);
    return Collections.unmodifiableList(regionCodes == null ? new ArrayList<String>(0)
                                                            : regionCodes);
  }

int getCountryCodeForRegion(String regionCode) {
    if (!isValidRegionCode(regionCode)) {
      logger.log(Level.WARNING,
                 "Invalid or missing region code ("
                  + ((regionCode == null) ? "null" : regionCode)
                  + ") provided.");
      return 0;
    }
    return _getCountryCodeForValidRegion(regionCode);
  }

  int _getCountryCodeForValidRegion(String regionCode) {
    PhoneMetadata metadata = getMetadataForRegion(regionCode);
    if (metadata == null) {
      throw new IllegalArgumentException("Invalid region code: " + regionCode);
    }
    return metadata.getCountryCode();
  }

  String? getNddPrefixForRegion(String regionCode, boolean stripNonDigits) {
    PhoneMetadata metadata = getMetadataForRegion(regionCode);
    if (metadata == null) {
      logger.log(Level.WARNING,
                 "Invalid or missing region code ("
                  + ((regionCode == null) ? "null" : regionCode)
                  + ") provided.");
      return null;
    }
    String nationalPrefix = metadata.getNationalPrefix();
    // If no national prefix was found, we return null.
    if (nationalPrefix.length == 0) {
      return null;
    }
    if (stripNonDigits) {
      // Note: if any other non-numeric symbols are ever used in national prefixes, these would have
      // to be removed here as well.
      nationalPrefix = nationalPrefix.replace("~", "");
    }
    return nationalPrefix;
  }

  bool isNANPACountry(String regionCode) {
    return _nanpaRegions.contains(regionCode);
  }

 bool isAlphaNumber(String number) {
    if (!isViablePhoneNumber(number)) {
      // Number is too short, or doesn't match the basic phone number pattern.
      return false;
    }
    StringBuilder strippedNumber = new StringBuilder(number);
    maybeStripExtension(strippedNumber);
    return VALID_ALPHA_PHONE_PATTERN.matcher(strippedNumber).matches();
  }

  bool isPossibleNumber(PhoneNumber number) {
    ValidationResult result = isPossibleNumberWithReason(number);
    return result == ValidationResult.IS_POSSIBLE
        || result == ValidationResult.IS_POSSIBLE_LOCAL_ONLY;
  }

  bool isPossibleNumberForType(PhoneNumber number, PhoneNumberType type) {
    ValidationResult result = isPossibleNumberForTypeWithReason(number, type);
    return result == ValidationResult.IS_POSSIBLE
        || result == ValidationResult.IS_POSSIBLE_LOCAL_ONLY;
  }

}
