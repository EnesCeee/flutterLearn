import 'package:flutter/material.dart';

import '../101/icon_learn.dart';
import '../101/image_learn.dart';
import 'feed_view.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({super.key});

  @override
  State<TabAdvanceLearn> createState() => _TabAdvanceLearnState();
}

class _TabAdvanceLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(notchMargin: _notchedValue, color: Colors.grey, child: _myTabView()),
        appBar: AppBar(),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: '${e.name}',
                ))
            .toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [
      const FeedView(),
      IconLearnView(),
      const ImageLearn(),
      IconLearnView(),
    ]);
  }
}

enum _MyTabViews {
  home,
  settings,
  favorite,
  profile,
}

extension _MyTabViewExtension on _MyTabViews {}
