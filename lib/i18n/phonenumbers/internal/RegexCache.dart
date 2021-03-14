import 'package:quiver/cache.dart';

class RegexCache {
  late MapCache<String, RegExp> _cache;

  RegexCache(int size) {
    _cache = MapCache.lru(maximumSize: size);
  }

  Future<RegExp> getPatternForRegex(String regex) async {
    RegExp? regExp = await _cache.get(regex);
    if (regExp == null) {
      regExp = RegExp(regex);
      await _cache.set(regex, regExp);
    }
    return regExp;
  }

  Future<bool> containsRegex(String regex) async {
    final regExp = await _cache.get(regex);
    return (regExp != null);
  }
}
