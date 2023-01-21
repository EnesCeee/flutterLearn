import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/mixin/navigator_mixin.dart';
import '../../product/navigator/navigator_manager.dart';
import '../../product/navigator/navigator_routes.dart';


class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          child: const Icon(Icons.abc_rounded),
          onPressed: ()  {
           router.pushToPage(NavigateRoutes.detail, arguments: "vb10");
            // NavigatorManager.instance.pushToPage(NavigateRoutes.detail, arguments: "vb10");
            // Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "abc");
          }),
      appBar: AppBar(title: Text(toString())),
    );
  }
}