import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './providers/theme_provider.dart';
import './providers/weather_provider.dart';
import './helpers/theme_config.dart';
import './screens/main_screen.dart';

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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, appState, child) {
        return ScreenUtilInit(
          designSize: Size(640, 384),
          allowFontScaling: false,
          child: MaterialApp(
            title: 'Weather Kiosk',
            theme: ThemeConfig.lightTheme,
            // darkTheme: ThemeConfig.darkTheme,
            home: MainScreen(),
            // themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          ),
        );
      },
    );
  }
}
