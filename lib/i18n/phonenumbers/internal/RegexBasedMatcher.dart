import 'package:dlibphonenumber/i18n/phonenumbers/generated/phonemetadata.pb.dart';

import 'MatcherApi.dart';
import 'RegexCache.dart';

class RegexBasedMatcher implements MatcherApi {
  final RegexCache _regexCache = RegexCache(100);

  factory RegexBasedMatcher() {
    return RegexBasedMatcher();
  }

  @override
  Future<bool> matchNationalNumber(String number, PhoneNumberDesc numberDesc, bool allowPrefixMatch) async {
    String nationalNumberPattern = numberDesc.nationalNumberPattern;
    if (nationalNumberPattern.length == 0) return false;
    return _match(number, await _regexCache.getPatternForRegex(nationalNumberPattern), allowPrefixMatch);
  }

  static bool _match(String number, RegExp pattern, bool allowPrefixMatch) {
    if (pattern.matchAsPrefix(number) == null) return false;
    return pattern.hasMatch(number) ? true : allowPrefixMatch;
  }
}
