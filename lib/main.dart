import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'screens/settings.dart';
import './providers/theme_provider.dart';
import './providers/weather_provider.dart';
import './providers/sensors_provider.dart';
import './providers/settings_provider.dart';
import 'providers/dt_provider.dart';
import './helpers/theme_config.dart';
import './screens/main_screen.dart';
import './screens/settings_first.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        ),
        ChangeNotifierProvider<WeatherProvider>(
          create: (ctx) => WeatherProvider(),
        ),
        ChangeNotifierProvider<SensorsProvider>(
          create: (ctx) => SensorsProvider(),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (ctx) => SettingProvider(),
        ),
        ChangeNotifierProvider<DTProvider>(
          create: (ctx) => DTProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<SettingProvider>(context, listen: false).fetchSettings(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<SettingProvider>(
                  builder: (cont, setting, _) {
                    return ScreenUtilInit(
                      designSize: Size(640, 384),
                      allowFontScaling: false,
                      child: MaterialApp(
                        title: 'Weather Kiosk',
                        theme: ThemeConfig.lightTheme,
                        home: setting.settings.length <= 5
                            ? SettingsFirst()
                            : MainScreen(),
                        routes: {
                          Settings.routeName: (ctx) => Settings(),
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
