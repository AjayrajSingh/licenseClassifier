import '../lib/utils/licenseListParser.dart';
import '../lib/utils/licenseParser.dart';
import 'dart:convert';

Future<void> main() async {
  LicenseListParser licenseListParser = LicenseListParser();
  await licenseListParser.fetchLicenseJsonList();
  LicenseParser licenseParser =
      LicenseParser(url: licenseListParser.licenseList[77]['url']);
  await licenseParser.fetchLicenseJsonList();
}
