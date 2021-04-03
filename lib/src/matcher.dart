/// Provides matchers method to detect the license
class Matcher {
  /// Stores the inline License text passed to the constructor
  String inlineLicense = '';

  Matcher({
    this.inlineLicense,
  });

  //TODO: make the match, checking the license have no further information
  /// Checks if license have copyright notice and nothing else
  String headerMatch() {
    if (RegExp('.*(c).*\.').hasMatch('inlineLicense')) {
      return 'none';
    }
  }

  /// Checks if the license have an exact match in the license list
  extactMatch() {}

  /// Using dice-coefficient checks the percentage of matching license
  diceMatch() {}
}
