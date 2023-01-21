import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/constant/lottie_items.dart';
import 'package:flutter_application_1/product/global/theme_notifer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../product/constant/duration_items.dart';
import '../product/navigator/navigator_routes.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                controller.animateTo(isLight ? 0.5 : 1);
                //controller.animateTo(0.5);
                isLight = !isLight;
                context.read<ThemeNotifer>().changeTheme();
              },
              child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller))
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    Key? key,
  }) : super(key: key);
  final _loadingLottie = 'https://assets1.lottiefiles.com/datafiles/Hc0DflKIkYg1j3u/data.json';

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
