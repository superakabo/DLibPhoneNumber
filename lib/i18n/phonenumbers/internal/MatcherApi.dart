import 'package:dlibphonenumber/i18n/phonenumbers/generated/phonemetadata.pb.dart';

abstract class MatcherApi {
  Future<bool> matchNationalNumber(
    String number,
    PhoneNumberDesc numberDesc,
    bool allowPrefixMatch,
  );
}
