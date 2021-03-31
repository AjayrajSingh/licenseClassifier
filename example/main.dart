import 'package:licenseClassifier/classifier.dart';
import 'dart:convert';

// Below given implementation is temprary, LicenseList and LicenseParser
// classes will only be exposed to the Matcher class
/// Entrypoint to dart package
Future<void> main() async {
  LicenseList licenseListFetcher = LicenseList();
  await licenseListFetcher.fetchLicenseList();

  /// Passing url of first fetched license file to licenseParser
  ///
  // Parse Tree isn't done yet, only first license can be printed in this list as of now
  LicenseParser licenseParser =
      LicenseParser(url: licenseListFetcher.licenseList[0]['url']);
  await licenseParser.fetchLicense();

  licenseParser.printLicense(xmlContent: licenseParser.content);
}
