import 'package:flutter/material.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_application_1/303/navigator/navigate_home_view.dart';
import 'package:flutter_application_1/product/navigator/navigator_routes.dart';

import '../../303/lottie_learn.dart';

mixin NavigatorCustom on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }

    final _routes = routeSettings.name == NavigatorRoutes.paragfh
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.detail:
        final _id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(
              id: _id is String ? _id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context) {
        return child;
      },
    );
  }
}
