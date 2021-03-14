import 'PhoneNumberMatcher.dart';
import 'PhoneNumberUtil.dart';
import 'generated/phonenumber.pb.dart';

enum Leniency {
  POSSIBLE,
  VALID,
  STRICT_GROUPING,
  EXACT_GROUPING,
}

enum PhoneNumberFormat {
  E164,
  INTERNATIONAL,
  NATIONAL,
  RFC3966,
}

enum PhoneNumberType {
  FIXED_LINE,
  MOBILE,
  FIXED_LINE_OR_MOBILE,
  TOLL_FREE,
  PREMIUM_RATE,
  SHARED_COST,
  VOIP,
  PERSONAL_NUMBER,
  PAGER,
  UAN,
  VOICEMAIL,
  UNKNOWN
}

enum MatchType {
  NOT_A_NUMBER,
  NO_MATCH,
  SHORT_NSN_MATCH,
  NSN_MATCH,
  EXACT_MATCH,
}

enum ValidationResult {
  IS_POSSIBLE,
  IS_POSSIBLE_LOCAL_ONLY,
  INVALID_COUNTRY_CODE,
  TOO_SHORT,
  INVALID_LENGTH,
  TOO_LONG,
}

extension LeniencyExtension on Leniency {
  bool verify(PhoneNumber number, String candidate, PhoneNumberUtil util, PhoneNumberMatcher matcher) {
    switch (this) {
      case Leniency.POSSIBLE:
        return util.isPossibleNumber(number);

      case Leniency.VALID:
        if (!util.isValidNumber(number) || !PhoneNumberMatcher.containsOnlyValidXChars(number, candidate, util)) {
          return false;
        }
        return PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util);

      case Leniency.STRICT_GROUPING:
        if (!util.isValidNumber(number) ||
            !PhoneNumberMatcher.containsOnlyValidXChars(number, candidateString, util) ||
            PhoneNumberMatcher.containsMoreThanOneSlashInNationalNumber(number, candidateString) ||
            !PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util)) {
          return false;
        }
        return matcher.checkNumberGroupingIsValid(
            number, candidate, util, new PhoneNumberMatcher.NumberGroupingChecker() {
              @Override
              public boolean checkGroups(PhoneNumberUtil util, PhoneNumber number,
                                         StringBuilder normalizedCandidate,
                                         String[] expectedNumberGroups) {
                return PhoneNumberMatcher.allNumberGroupsRemainGrouped(
                    util, number, normalizedCandidate, expectedNumberGroups);
              }
            });
      case Leniency.EXACT_GROUPING:
        if (!util.isValidNumber(number)
            || !PhoneNumberMatcher.containsOnlyValidXChars(number, candidateString, util)
            || PhoneNumberMatcher.containsMoreThanOneSlashInNationalNumber(number, candidateString)
            || !PhoneNumberMatcher.isNationalPrefixPresentIfRequired(number, util)) {
          return false;
        }
         return matcher.checkNumberGroupingIsValid(
            number, candidate, util, new PhoneNumberMatcher.NumberGroupingChecker() {
              @Override
              public boolean checkGroups(PhoneNumberUtil util, PhoneNumber number,
                                         StringBuilder normalizedCandidate,
                                         String[] expectedNumberGroups) {
                return PhoneNumberMatcher.allNumberGroupsAreExactlyPresent(
                    util, number, normalizedCandidate, expectedNumberGroups);
              }
            });

      default:
        return false;
    }
  }
}
