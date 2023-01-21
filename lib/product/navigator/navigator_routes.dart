import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';

import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_view.dart';


class NavigatorRoutes {
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}