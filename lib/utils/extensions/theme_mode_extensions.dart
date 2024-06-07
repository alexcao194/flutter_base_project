import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

extension ThemeModeExtensions on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return S.current.system;
      case ThemeMode.light:
        return S.current.light_mode;
      case ThemeMode.dark:
        return S.current.dark_mode;
    }
  }

  int get value {
    switch (this) {
      case ThemeMode.system:
        return 0;
      case ThemeMode.light:
        return 1;
      case ThemeMode.dark:
        return 2;
    }
  }
}
