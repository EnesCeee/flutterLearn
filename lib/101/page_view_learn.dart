import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/icon_learn.dart';
import 'package:flutter_application_1/101/image_learn.dart';
import 'package:flutter_application_1/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    _currentPageIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_currentPageIndex.toString()),
          FloatingActionButton(
            onPressed: (() {
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }),
            child: const Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: (() {
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }),
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = const Duration(seconds: 1);
}

//ekranlarımızı sağ sol göstermemizi sağlayan yapı