import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'core/resources/colors.dart';
import 'core/resources/svgs.dart';
import 'core/size_config.dart';
import 'core/theme/theme.dart';
import 'screens/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) await Wakelock.enable();
  await AppSvgs.preloadSVGs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          SizeConfig.instance.initialize(constraints, orientation);
          return MaterialApp(
            title: 'Habit Tracker',
            home: AppTheme(
              data: AppThemeData.defaultWithSwatch(AppColors.red),
              child: const HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
