import 'generated/phonemetadata.pb.dart';

abstract class MetadataSource {
  Future<PhoneMetadata?> getMetadataForRegion(String regionCode);
  Future<PhoneMetadata?> getMetadataForNonGeographicalRegion(int countryCallingCode);
}
