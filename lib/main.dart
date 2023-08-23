import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'view/home_screen/home_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noteapp/core/helper/db/db_helper.dart';
import 'package:noteapp/core/constant/theme_color.dart';
import 'package:noteapp/core/services/themes_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDb();
  // NotificationService().initNotification();
  // tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.ligth,
          themeMode: ThemeServices().theme,
          darkTheme: Themes.dark,
          title: 'Note App',
          home: HomeScreen(),
        );
      },
    );
  }
}
