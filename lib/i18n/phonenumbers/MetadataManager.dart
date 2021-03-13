import 'dart:collection';
import 'package:dlibphonenumber/i18n/phonenumbers/SingleFileMetadataMaps.dart';

import 'AlternateFormatsCountryCodeSet.dart';
import 'MetadataLoader.dart';
import 'ShortNumbersRegionCodeSet.dart';
import 'generated/phonemetadata.pb.dart';
import 'package:flutter/services.dart' show rootBundle;

class MetadataManager {
  static const String MULTI_FILE_PHONE_NUMBER_METADATA_FILE_PREFIX =
      "/com/google/i18n/phonenumbers/data/PhoneNumberMetadataProto";
  static const String SINGLE_FILE_PHONE_NUMBER_METADATA_FILE_NAME =
      "/com/google/i18n/phonenumbers/data/SingleFilePhoneNumberMetadataProto";
  static const String _ALTERNATE_FORMATS_FILE_PREFIX =
      "/com/google/i18n/phonenumbers/data/PhoneNumberAlternateFormatsProto";
  static const String _SHORT_NUMBER_METADATA_FILE_PREFIX =
      "/com/google/i18n/phonenumbers/data/ShortNumberMetadataProto";

  static const MetadataLoader DEFAULT_METADATA_LOADER = MetadataLoaderImpl();

  static final HashMap<int, PhoneMetadata> _alternateFormatsMap = HashMap<int, PhoneMetadata>();
  static final HashMap<String, PhoneMetadata> _shortNumberMetadataMap = HashMap<String, PhoneMetadata>();
  static final Set<int> _alternateFormatsCountryCodes = AlternateFormatsCountryCodeSet.getCountryCodeSet();
  static final Set<String> _shortNumberMetadataRegionCodes = ShortNumbersRegionCodeSet.getRegionCodeSet();

  static Future<PhoneMetadata?> getAlternateFormatsForCountry(int countryCallingCode) async {
    if (!_alternateFormatsCountryCodes.contains(countryCallingCode)) {
      return null;
    }
    return getMetadataFromMultiFilePrefix(
        countryCallingCode, _alternateFormatsMap, _ALTERNATE_FORMATS_FILE_PREFIX, DEFAULT_METADATA_LOADER);
  }

  static Future<PhoneMetadata?> getShortNumberMetadataForRegion(String regionCode) async {
    if (!_shortNumberMetadataRegionCodes.contains(regionCode)) {
      return null;
    }
    return getMetadataFromMultiFilePrefix(
        regionCode, _shortNumberMetadataMap, _SHORT_NUMBER_METADATA_FILE_PREFIX, DEFAULT_METADATA_LOADER);
  }

  static Set<String> getSupportedShortNumberRegions() {
    return UnmodifiableSetView(_shortNumberMetadataRegionCodes);
  }

  static Future<PhoneMetadata> getMetadataFromMultiFilePrefix<T>(
    T key,
    HashMap<T, PhoneMetadata>? map,
    String filePrefix,
    MetadataLoader metadataLoader,
  ) async {
    PhoneMetadata? metadata = map?[key];
    if (metadata != null) return metadata;
    String fileName = filePrefix + "_$key";
    List<PhoneMetadata> metadataList = await _getMetadataFromSingleFileName(fileName, metadataLoader);
    if (metadataList.length > 1) {
      print("more than one metadata in file $fileName");
    }
    metadata = metadataList[0];
    PhoneMetadata? oldValue = map?.putIfAbsent(key, () => metadata!);
    return (oldValue != null) ? oldValue : metadata;
  }

  static Future<List<PhoneMetadata>> _getMetadataFromSingleFileName(
      String fileName, MetadataLoader metadataLoader) async {
    List<int>? source = await metadataLoader.loadMetadata(fileName);
    if (source == null) throw Exception("missing metadata: $fileName");

    PhoneMetadataCollection? metadataCollection = SingleFileMetadataMaps.loadMetadataAndCloseInput(source);
    List<PhoneMetadata> metadataList = metadataCollection?.metadata ?? [];
    if (metadataList.isEmpty) throw Exception("empty metadata: " + fileName);
    return metadataList;
  }
}

class MetadataLoaderImpl implements MetadataLoader {
  const MetadataLoaderImpl();

  @override
  Future<List<int>>? loadMetadata(String metadataFileName) async {
    try {
      final byteData = await rootBundle.load(metadataFileName);
      return byteData.buffer.asUint8List();
    } catch (e) {
      throw Exception('missing metadata: $metadataFileName) -> $e');
    }
  }
}
