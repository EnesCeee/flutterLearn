import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/package/launch_mixin.dart';
import 'package:flutter_application_1/202/package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
            onPressed: (() {
              launchUrl(Uri(
                scheme: 'x',
                host: 'pub.dev',
                path: '/packages/url_launcher',
              ));
            })),
        body: const LoadingBar(
          size: null,
        ));
  }
}
