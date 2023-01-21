import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/app_bar.dart';
import 'package:flutter_application_1/demos/note_demos_view.dart';
import 'package:flutter_application_1/product/constant/project_items.dart';
import 'package:flutter_application_1/product/global/theme_notifer.dart';
import 'package:flutter_application_1/product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';
import '101/button_learn.dart';
import '303/lottie_learn.dart';
import '404/bloc/features/login/view/login_view.dart';
import 'product/init/product_init.dart';
import 'product/navigator/navigator_manager.dart';

Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();
  runApp(
    EasyLocalization(
        supportedLocales: productInit.localizationInit.supportedLocales,
        path: productInit.localizationInit.localizationPath, // <-- change the path of the translation files
        child: MultiProvider(
          providers: productInit.providers,
          builder: (context, child) => const MyApp(),
        )),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  //İyi programlamada buradaki theme da yapılması iyi bir programlama
  //burada card theme verirsek bütün carlarımız böyle olur.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectItems.projectName,
      theme: context.watch<ThemeNotifer>().currentTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // ThemeData().copyWith(

      //   tabBarTheme: const TabBarTheme(
      //     labelColor: Colors.white,
      //     unselectedLabelColor: Colors.red,
      //     indicatorSize: TabBarIndicatorSize.label
      //   ),
      //   bottomAppBarTheme: const BottomAppBarTheme(
      //     shape: CircularNotchedRectangle(),
      //   ),

      //   progressIndicatorTheme: const ProgressIndicatorThemeData(
      //     color: Colors.black,
      //   ),
      //   listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      //   errorColor: ColorsItems().amber,
      //   appBarTheme: const AppBarTheme(
      //     centerTitle: true,
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //     backgroundColor: Colors.grey,
      //     elevation: 0,
      //   ),
      //   cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      //   scaffoldBackgroundColor: Colors.grey
      // ),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const LottieLearn();
          },
        );
      },
      //routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: NoteDemos(),
    );
  }
}

//home verirseniz diğerleri gg olur

//auto route
