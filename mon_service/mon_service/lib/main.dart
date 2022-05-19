import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_service/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:mon_service/screens/splashScreen/splash_screen.dart';
import 'package:mon_service/theme/theme.dart';
import 'package:provider/provider.dart';

import 'responsiveBloc/size_config.dart';

void main() {
  // runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return ChangeNotifierProvider(
          create: (context) => stateSettingProvider(),
          child: MaterialApp(
            theme: ThemeData(
                backgroundColor: Colors.grey.shade300,
                primaryColor: theme.mainColor,
                accentColor: theme.mainColor,
                colorScheme: ColorScheme.light().copyWith(
                    onPrimary: Colors.white,
                    onBackground: Colors.grey.shade600,
                    primary: theme.mainColor,
                    background: Colors.grey.shade600)),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ),
        );
      });
    });
  }
}
