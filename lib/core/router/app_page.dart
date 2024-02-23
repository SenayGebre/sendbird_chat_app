enum AppPage {
  // Splash can be configured to be the initial page
  splash,
  chat,
  error,
}

extension AppPageEnumExtension on AppPage {
  String get toPath {
    return _enumToPath(name);
  }

  String get toName {
    return _enumToName(name);
  }
}

String _enumToPath(String input) {
  return '/${input.replaceAllMapped(RegExp(r'([A-Z])'), (match) => '_${match.group(0)!.toLowerCase()}').substring(0)}';
}

String _enumToName(String input) {
  return input
      .replaceAllMapped(
          RegExp(r'([A-Z])'), (match) => '_${match.group(0)!.toLowerCase()}')
      .toUpperCase();
}
