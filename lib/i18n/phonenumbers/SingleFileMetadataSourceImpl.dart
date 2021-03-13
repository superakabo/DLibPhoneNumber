import 'package:dlibphonenumber/i18n/phonenumbers/generated/phonemetadata.pb.dart';
import 'MetadataLoader.dart';
import 'MetadataManager.dart';
import 'MetadataSource.dart';
import 'SingleFileMetadataMaps.dart';

class SingleFileMetadataSourceImpl implements MetadataSource {
  late final String _phoneNumberMetadataFileName;
  late final MetadataLoader _metadataLoader;
  late final SingleFileMetadataMaps _phoneNumberMetadataRef;

  SingleFileMetadataSourceImpl(
    this._phoneNumberMetadataFileName,
    this._metadataLoader,
  );

  factory SingleFileMetadataSourceImpl.fromMetadataLoader(MetadataLoader metadataLoader) {
    return SingleFileMetadataSourceImpl(MetadataManager.SINGLE_FILE_PHONE_NUMBER_METADATA_FILE_NAME, metadataLoader);
  }

  @override
  Future<PhoneMetadata?> getMetadataForNonGeographicalRegion(int countryCallingCode) async {
    final data = await SingleFileMetadataMaps.getSingleFileMetadataMaps(
        _phoneNumberMetadataRef, _phoneNumberMetadataFileName, _metadataLoader);
    data?.countryCallingCodeToMetadata(countryCallingCode);
  }

  @override
  Future<PhoneMetadata?> getMetadataForRegion(String regionCode) async {
    final data = await SingleFileMetadataMaps.getSingleFileMetadataMaps(
        _phoneNumberMetadataRef, _phoneNumberMetadataFileName, _metadataLoader);
    data?.regionCodeToMetadata(regionCode);
  }
}
