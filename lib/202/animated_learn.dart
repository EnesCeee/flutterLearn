import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  // Text(
  //       'data',
  //       style: context.textThem().subtitle1,
  //     ),

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _placeHolderWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          controller.animateTo(_isVisible ? 1 : 0);
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _DurationItems.durationLow, opacity: _isOpacity ? 1 : 0, child: const Text('data')),
            trailing: IconButton(
                onPressed: (() {
                  _changeOpacity();
                }),
                icon: const Icon(Icons.precision_manufacturing_rounded)),
          ),
          AnimatedDefaultTextStyle(
              style: (_isVisible ? context.textThem().headline1 : context.textThem().subtitle1) ?? const TextStyle(),
              duration: _DurationItems.durationLow,
              child: const Text('data2')),
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: _isVisible ? kZero : MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.height * 0.2,
            color: Colors.red,
          ),
          Expanded(
              child: Stack(
            children: const [AnimatedPositioned(duration: _DurationItems.durationLow, child: Text('data3'))],
          )),
          Expanded(child: AnimatedList(itemBuilder: ((context, index, animation) {
            return const Text('data');
          })))
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(color: Colors.black),
      secondChild: const SizedBox.shrink(),
      crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
    );
  }
}

extension BuilContextExtension on BuildContext {
  TextTheme textThem() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}



//ekranın %20 alabiliyorsun containerın animatedcontainer için mediaquery ile