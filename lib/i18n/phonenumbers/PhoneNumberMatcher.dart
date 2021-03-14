import 'PhoneNumberMatch.dart';
import 'PhoneNumberUtil.dart';
import 'enums.dart';
import 'internal/RegexCache.dart';

class PhoneNumberMatcher implements Iterator<PhoneNumberMatch> {
  static late final RegExp _PATTERN = RegExp(
    "(?:$leadClass$punctuation)$leadLimit$digitSequence(?:$punctuation$digitSequence)$blockLimit(?:${PhoneNumberUtil.EXTN_PATTERNS_FOR_MATCHING})?",
    unicode: true,
    caseSensitive: false,
  );

  static final RegExp _PUB_PAGES = RegExp("\\d{1,5}-+\\d{1,5}\\s{0,4}\\(\\d{1,4}");

  static final RegExp _SLASH_SEPARATED_DATES =
      RegExp("(?:(?:[0-3]?\\d/[01]?\\d)|(?:[01]?\\d/[0-3]?\\d))/(?:[12]\\d)?\\d{2}");

  static final RegExp _TIME_STAMPS = RegExp("[12]\\d{3}[-/]?[01]\\d[-/]?[0-3]\\d +[0-2]\\d\$");

  static final RegExp TIME_STAMPS_SUFFIX = RegExp(":[0-5]\\d");

  static late final RegExp _MATCHING_BRACKETS = RegExp(
      "(?:[$openingParens])?(?:$nonParens+[$closingParens])?$nonParens+(?:[$openingParens]$nonParens+[$closingParens])$bracketPairLimit$nonParens*");

  static List<Pattern> get _INNER_MATCHES {
    return [
      RegExp("/+(.*)"),
      RegExp("(\\([^(]*)"),
      RegExp("(?:\\p{Z}-|-\\p{Z})\\p{Z}*(.+)"),
      RegExp("[\u2012-\u2015\uFF0D]\\p{Z}*(.+)"),
      RegExp("\\.+\\p{Z}*([^.]+)"),
      RegExp("\\p{Z}+(\\P{Z}+)")
    ];
  }

  static late final RegExp _LEAD_CLASS = RegExp(leadClass);

  static String openingParens = "(\\[\uFF08\uFF3B";
  static String closingParens = ")\\]\uFF09\uFF3D";
  static String nonParens = "[^$openingParens$closingParens]";
  static String bracketPairLimit = _limit(0, 3);

  static String leadLimit = _limit(0, 2);

  static String punctuationLimit = _limit(0, 4);

  static int digitBlockLimit = PhoneNumberUtil.MAX_LENGTH_FOR_NSN + PhoneNumberUtil.MAX_LENGTH_COUNTRY_CODE;

  static String blockLimit = _limit(0, digitBlockLimit);

  static String punctuation = "[${PhoneNumberUtil.VALID_PUNCTUATION}]$punctuationLimit";

  static String digitSequence = "\\p{Nd}" + _limit(1, digitBlockLimit);

  static String leadClassChars = openingParens + PhoneNumberUtil.PLUS_CHARS;

  static String leadClass = "[$leadClassChars]";

  static String _limit(int lower, int upper) {
    if ((lower < 0) || (upper <= 0) || (upper < lower)) {
      throw Exception();
    }
    return "{$lower,$upper}";
  }

  final PhoneNumberUtil _phoneUtil;

  final String _text;

  final String _preferredRegion;

  late final Leniency _leniency;

  BigInt _maxTries;

  _State _state = _State.NOT_READY;

  PhoneNumberMatch? _lastMatch;

  int _searchIndex = 0;

  final RegexCache _regexCache = RegexCache(32);

  PhoneNumberMatcher(
    this._phoneUtil,
    this._text,
    this._preferredRegion,
    this._leniency,
    this._maxTries,
  ) : assert(_maxTries >= BigInt.zero);

  @override
  PhoneNumberMatch get current => throw UnimplementedError();

  @override
  bool moveNext() {
    throw UnimplementedError();
  }
}

enum _State {
  NOT_READY,
  READY,
  DONE,
}
