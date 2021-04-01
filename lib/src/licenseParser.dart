import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

/// Fetches and parses the SPDX license file
class LicenseParser {
  /// Github api query [url]
  String url;

  /// Content of fetched license file
  String content;

  LicenseParser({
    this.url,
  });

  /// Fetches the content from the [url]
  ///
  /// Returns the content body as string
  Future<String> fetchResponse() async {
    final response =
        await http.get(Uri.https('api.github.com', '$url'.substring(23)));
    return response.body.toString();
  }

  /// Parses the license content and extracts data of "content" tag
  ///
  /// Fetched content is Base64 encoded and hence decoded using decodeContent method
  Future<void> fetchLicense() async {
    decodeContent(
      content: jsonDecode(await fetchResponse())['content'].toString(),
    );
  }

  /// Decodes the Base64 encoded string
  void decodeContent({String content}) {
    this.content = utf8.decode(
      base64.decode(
        content.replaceAll('\n', ''),
      ),
    );
  }

  //TODO: Convert and return license text to inline string
  String toString() {
    return '';
  }

  /// Parses the XML license file
  ///
  /// Prints the license content on console
  ///
  /// XML content first converts into JSON and then printed
  ///
  // TODO: Construct parse tree for extracting license content from JSON
  void printLicense({String xmlContent}) async {
    /// Instance of Xml2Json Class
    final myTransformer = Xml2Json();

    /// Parses the XML content
    myTransformer.parse(xmlContent);

    /// Converts the XML content to JSON in Google Data (GData) format
    var json = myTransformer.toGData();

    /// List of elements under 'SPDXLicenseCollection' tag
    var elementList = jsonDecode(json)['SPDXLicenseCollection'];

    // This implementation is temprary and just to meet GSoC proposal sample
    print(
      'License Id: ' + elementList['license']['licenseId'],
    );
    print(
      'License Name: ' + elementList['license']['name'],
    );
    print(
      'CrossRef: ' + elementList['license']['crossRefs']['crossRef']['\$t'],
    );

    print('\n' +
        elementList['license']['text']['copyrightText']['p']['\$t'].toString());
    print('\n\t' +
        elementList['license']['text']['p'][0]['\$t']
            .toString()
            .replaceAll("\\n", "\n"));
    print('\n\t' +
        elementList['license']['text']['p'][1]['\$t']
            .toString()
            .replaceAll("\\n", "\n"));
  }
}
