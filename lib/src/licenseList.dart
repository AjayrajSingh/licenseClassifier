import 'dart:convert';
import 'package:http/http.dart' as http;

/// Fetches and stores SPDX license list
///
/// Uses Github API to fetch the directory tree spdx/license-list-XML/
class LicenseList {
  /// List<Map> of license
  ///
  /// Map of license contains path, mode, type, sha, size and url as [keys]
  List licenseList = [];

  /// Fetches the list of SPDX [license] list hosted on Github
  Future<String> _fetchResponse() async {
    final response = await http.get(Uri.https('api.github.com',
        'repos/spdx/license-list-XML/git/trees/86c04e48d7f53e3f5c7deb1d03f223308f40c503'));
    return response.body.toString();
  }

  /// Fetches json response and stores to [licenseList]
  Future<void> fetchLicenseList() async {
    licenseList = jsonDecode(await _fetchResponse())['tree'] as List;
  }
}
