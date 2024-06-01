import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:oura_detect/routes/app_pages.dart';
import 'package:oura_detect/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Provider/MenuProvider.dart';
import 'UI/HomeScreen.dart';
import 'Utilis/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MenuProvider>(
      create: (_) => MenuProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GetMaterialApp(
            builder: (BuildContext context, Widget? child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
              return MediaQuery(
                data: mediaQueryData.copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
            title: 'AutoRevog',
            initialRoute: AppRoutes.root.toName,
            getPages: AppPages.list,
            theme: ThemeData.light().copyWith(
              // Set the white theme
              primaryColor: AppTheme.primaryColor,
              scaffoldBackgroundColor: AppTheme.primaryColor,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppTheme.primaryColor,),
                ),
              ),
              textTheme: GoogleFonts.montserratTextTheme(
                  Theme.of(context).textTheme.apply(
                        bodyColor: AppTheme.primaryColor,
                        displayColor: AppTheme.primaryColor,
                      )),
            ));
      },
    );
  }
}
