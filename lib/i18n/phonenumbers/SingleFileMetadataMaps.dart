import 'dart:collection';
import 'MetadataLoader.dart';
import 'PhoneNumberUtil.dart';
import 'generated/phonemetadata.pb.dart';

class SingleFileMetadataMaps {
  final Map<String, PhoneMetadata> _regionCodeToMetadata;
  final Map<int, PhoneMetadata> _countryCallingCodeToMetadata;

  SingleFileMetadataMaps._(
    this._regionCodeToMetadata,
    this._countryCallingCodeToMetadata,
  );

  static Future<SingleFileMetadataMaps?> load(String fileName, MetadataLoader metadataLoader) async {
    List<PhoneMetadata>? metadataList = await _getMetadataFromSingleFileName(fileName, metadataLoader);
    Map<String, PhoneMetadata> regionCodeToMetadata = HashMap<String, PhoneMetadata>();
    Map<int, PhoneMetadata> countryCallingCodeToMetadata = HashMap<int, PhoneMetadata>();

    if (metadataList == null) return null;

    for (PhoneMetadata metadata in metadataList) {
      String regionCode = metadata.id;
      if (PhoneNumberUtil.REGION_CODE_FOR_NON_GEO_ENTITY == regionCode) {
        countryCallingCodeToMetadata[metadata.countryCode] = metadata;
      } else {
        regionCodeToMetadata[regionCode] = metadata;
      }
    }
    return SingleFileMetadataMaps._(regionCodeToMetadata, countryCallingCodeToMetadata);
  }

  PhoneMetadata? regionCodeToMetadata(String regionCode) {
    return _regionCodeToMetadata[regionCode];
  }

  PhoneMetadata? countryCallingCodeToMetadata(int countryCallingCode) {
    return _countryCallingCodeToMetadata[countryCallingCode];
  }

  static Future<SingleFileMetadataMaps?> getSingleFileMetadataMaps(
      SingleFileMetadataMaps? ref, String fileName, MetadataLoader metadataLoader) async {
    SingleFileMetadataMaps? maps = ref;
    if (maps != null) return maps;
    maps = await load(fileName, metadataLoader);
    if (ref == maps) return ref;
    return null;
  }

  static Future<List<PhoneMetadata>?> _getMetadataFromSingleFileName(
      String fileName, MetadataLoader metadataLoader) async {
    final source = await metadataLoader.loadMetadata(fileName);
    final metadataCollection = loadMetadataAndCloseInput(source);
    final metadataList = metadataCollection?.metadata;
    return metadataList;
  }

  static PhoneMetadataCollection? loadMetadataAndCloseInput(List<int>? source) {
    if (source == null) return null;
    PhoneMetadataCollection metadataCollection = PhoneMetadataCollection.fromBuffer(source);
    return metadataCollection;
  }
}
