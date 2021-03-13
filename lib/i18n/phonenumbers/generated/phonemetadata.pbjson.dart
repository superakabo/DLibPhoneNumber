///
//  Generated code. Do not modify.
//  source: phonemetadata.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const NumberFormat$json = const {
  '1': 'NumberFormat',
  '2': const [
    const {'1': 'pattern', '3': 1, '4': 2, '5': 9, '10': 'pattern'},
    const {'1': 'format', '3': 2, '4': 2, '5': 9, '10': 'format'},
    const {'1': 'leading_digits_pattern', '3': 3, '4': 3, '5': 9, '10': 'leadingDigitsPattern'},
    const {'1': 'national_prefix_formatting_rule', '3': 4, '4': 1, '5': 9, '10': 'nationalPrefixFormattingRule'},
    const {'1': 'national_prefix_optional_when_formatting', '3': 6, '4': 1, '5': 8, '7': 'false', '10': 'nationalPrefixOptionalWhenFormatting'},
    const {'1': 'domestic_carrier_code_formatting_rule', '3': 5, '4': 1, '5': 9, '10': 'domesticCarrierCodeFormattingRule'},
  ],
};

const PhoneNumberDesc$json = const {
  '1': 'PhoneNumberDesc',
  '2': const [
    const {'1': 'national_number_pattern', '3': 2, '4': 1, '5': 9, '10': 'nationalNumberPattern'},
    const {'1': 'possible_length', '3': 9, '4': 3, '5': 5, '10': 'possibleLength'},
    const {'1': 'possible_length_local_only', '3': 10, '4': 3, '5': 5, '10': 'possibleLengthLocalOnly'},
    const {'1': 'example_number', '3': 6, '4': 1, '5': 9, '10': 'exampleNumber'},
  ],
};

const PhoneMetadata$json = const {
  '1': 'PhoneMetadata',
  '2': const [
    const {'1': 'general_desc', '3': 1, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'generalDesc'},
    const {'1': 'fixed_line', '3': 2, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'fixedLine'},
    const {'1': 'mobile', '3': 3, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'mobile'},
    const {'1': 'toll_free', '3': 4, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'tollFree'},
    const {'1': 'premium_rate', '3': 5, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'premiumRate'},
    const {'1': 'shared_cost', '3': 6, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'sharedCost'},
    const {'1': 'personal_number', '3': 7, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'personalNumber'},
    const {'1': 'voip', '3': 8, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'voip'},
    const {'1': 'pager', '3': 21, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'pager'},
    const {'1': 'uan', '3': 25, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'uan'},
    const {'1': 'emergency', '3': 27, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'emergency'},
    const {'1': 'voicemail', '3': 28, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'voicemail'},
    const {'1': 'short_code', '3': 29, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'shortCode'},
    const {'1': 'standard_rate', '3': 30, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'standardRate'},
    const {'1': 'carrier_specific', '3': 31, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'carrierSpecific'},
    const {'1': 'sms_services', '3': 33, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'smsServices'},
    const {'1': 'no_international_dialling', '3': 24, '4': 1, '5': 11, '6': '.i18n.phonenumbers.PhoneNumberDesc', '10': 'noInternationalDialling'},
    const {'1': 'id', '3': 9, '4': 2, '5': 9, '10': 'id'},
    const {'1': 'country_code', '3': 10, '4': 1, '5': 5, '10': 'countryCode'},
    const {'1': 'international_prefix', '3': 11, '4': 1, '5': 9, '10': 'internationalPrefix'},
    const {'1': 'preferred_international_prefix', '3': 17, '4': 1, '5': 9, '10': 'preferredInternationalPrefix'},
    const {'1': 'national_prefix', '3': 12, '4': 1, '5': 9, '10': 'nationalPrefix'},
    const {'1': 'preferred_extn_prefix', '3': 13, '4': 1, '5': 9, '10': 'preferredExtnPrefix'},
    const {'1': 'national_prefix_for_parsing', '3': 15, '4': 1, '5': 9, '10': 'nationalPrefixForParsing'},
    const {'1': 'national_prefix_transform_rule', '3': 16, '4': 1, '5': 9, '10': 'nationalPrefixTransformRule'},
    const {'1': 'same_mobile_and_fixed_line_pattern', '3': 18, '4': 1, '5': 8, '7': 'false', '10': 'sameMobileAndFixedLinePattern'},
    const {'1': 'number_format', '3': 19, '4': 3, '5': 11, '6': '.i18n.phonenumbers.NumberFormat', '10': 'numberFormat'},
    const {'1': 'intl_number_format', '3': 20, '4': 3, '5': 11, '6': '.i18n.phonenumbers.NumberFormat', '10': 'intlNumberFormat'},
    const {'1': 'main_country_for_code', '3': 22, '4': 1, '5': 8, '7': 'false', '10': 'mainCountryForCode'},
    const {'1': 'leading_digits', '3': 23, '4': 1, '5': 9, '10': 'leadingDigits'},
    const {'1': 'leading_zero_possible', '3': 26, '4': 1, '5': 8, '7': 'false', '10': 'leadingZeroPossible'},
    const {'1': 'mobile_number_portable_region', '3': 32, '4': 1, '5': 8, '7': 'false', '10': 'mobileNumberPortableRegion'},
  ],
};

const PhoneMetadataCollection$json = const {
  '1': 'PhoneMetadataCollection',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 3, '5': 11, '6': '.i18n.phonenumbers.PhoneMetadata', '10': 'metadata'},
  ],
};

