import 'package:flutter/material.dart';

import 'generated/phonenumber.pb.dart';

class PhoneNumberMatch {
  final int _start;
  final String _rawString;
  final PhoneNumber _number;

  PhoneNumberMatch(
    this._start,
    this._rawString,
    this._number,
  ) : assert(_start > -1, 'Start index must be >= 0');

  PhoneNumber get number => _number;

  int get start => _start;

  int get end => (_start + _rawString.length);

  String get rawString => _rawString;

  @override
  int get hashCode => hashValues(start, rawString, number);

  @override
  String toString() {
    return "PhoneNumberMatch [$start,$end)$rawString";
  }

  @override
  bool operator ==(Object obj) {
    if (this == obj) return true;

    if (!(obj is PhoneNumberMatch)) return false;

    PhoneNumberMatch other = obj;

    return ((rawString == other.rawString) && (start == other.start) && (number == other.number));
  }
}
