import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../resources/colors.dart';

@immutable
class AppThemeData {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color accentNegative;
  final Color taskRing;
  final Color taskIcon;
  final Color settingsText;
  final Color settingsLabel;
  final Color settingsCta;
  final Color settingsListIconBackground;
  final Color settingsInactiveIconBackground;
  final Color inactiveThemePanelRing;
  final SystemUiOverlayStyle overlayStyle;

  const AppThemeData({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.accentNegative,
    required this.taskRing,
    required this.taskIcon,
    required this.settingsText,
    required this.settingsLabel,
    required this.settingsCta,
    required this.settingsListIconBackground,
    required this.settingsInactiveIconBackground,
    required this.inactiveThemePanelRing,
    required this.overlayStyle,
  });

  factory AppThemeData.defaultWithSwatch(List<Color> swatch) {
    return AppThemeData(
      primary: swatch.first,
      secondary: swatch[1],
      accent: AppColors.white,
      accentNegative: AppColors.black,
      taskRing: swatch[4],
      taskIcon: AppColors.white,
      settingsText: AppColors.white,
      settingsLabel: AppColors.white60,
      settingsCta: swatch[3],
      settingsListIconBackground: swatch[2],
      settingsInactiveIconBackground: swatch[2],
      inactiveThemePanelRing: AppColors.grey,
      overlayStyle: SystemUiOverlayStyle.light,
    );
  }
}

@immutable
class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({Key? key, required this.data, required Widget child})
      : super(child: child, key: key);

  static AppThemeData of(BuildContext context) {
    final _theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();

    if (_theme != null) return _theme.data;
    throw Exception('AppTheme not found');
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) => data != oldWidget.data;
}
