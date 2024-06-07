enum LanguageCodes {
  system,
  vietnamese,
  english;

  String get name {
    switch (this) {
      case LanguageCodes.system:
        return 'System';
      case LanguageCodes.vietnamese:
        return 'Vietnamese';
      case LanguageCodes.english:
        return 'English';
    }
  }

  String? get code {
    switch (this) {
      case LanguageCodes.system:
        return null;
      case LanguageCodes.vietnamese:
        return 'vi';
      case LanguageCodes.english:
        return 'en';
    }
  }

  static LanguageCodes fromCode(String? code) {
    switch (code) {
      case 'vi':
        return LanguageCodes.vietnamese;
      case 'en':
        return LanguageCodes.english;
      default:
        return LanguageCodes.system;
    }
  }
}
