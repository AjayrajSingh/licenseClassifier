import 'package:classifier/classifier.dart';
import 'dart:convert';

/// Entrypoint to dart package
Future<void> main() async {
  LicenseListParser licenseListParser = LicenseListParser();
  await licenseListParser.fetchLicenseJsonList();

  /// Passing url of first fetched license file to licenseParser
  LicenseParser licenseParser =
      LicenseParser(url: licenseListParser.licenseList[0]['url']);
  await licenseParser.fetchLicenseJsonList();
}
