///
//  Generated code. Do not modify.
//  source: phonenumber.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const PhoneNumber$json = const {
  '1': 'PhoneNumber',
  '2': const [
    const {'1': 'country_code', '3': 1, '4': 2, '5': 5, '10': 'countryCode'},
    const {'1': 'national_number', '3': 2, '4': 2, '5': 4, '10': 'nationalNumber'},
    const {'1': 'extension', '3': 3, '4': 1, '5': 9, '10': 'extension'},
    const {'1': 'italian_leading_zero', '3': 4, '4': 1, '5': 8, '10': 'italianLeadingZero'},
    const {'1': 'number_of_leading_zeros', '3': 8, '4': 1, '5': 5, '7': '1', '10': 'numberOfLeadingZeros'},
    const {'1': 'raw_input', '3': 5, '4': 1, '5': 9, '10': 'rawInput'},
    const {'1': 'country_code_source', '3': 6, '4': 1, '5': 14, '6': '.i18n.phonenumbers.PhoneNumber.CountryCodeSource', '10': 'countryCodeSource'},
    const {'1': 'preferred_domestic_carrier_code', '3': 7, '4': 1, '5': 9, '10': 'preferredDomesticCarrierCode'},
  ],
  '4': const [PhoneNumber_CountryCodeSource$json],
};

const PhoneNumber_CountryCodeSource$json = const {
  '1': 'CountryCodeSource',
  '2': const [
    const {'1': 'UNSPECIFIED', '2': 0},
    const {'1': 'FROM_NUMBER_WITH_PLUS_SIGN', '2': 1},
    const {'1': 'FROM_NUMBER_WITH_IDD', '2': 5},
    const {'1': 'FROM_NUMBER_WITHOUT_PLUS_SIGN', '2': 10},
    const {'1': 'FROM_DEFAULT_COUNTRY', '2': 20},
  ],
};

