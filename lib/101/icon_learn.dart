import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({super.key});

  final IconSizes iconSize = IconSizes();
  final IconColors iconColor = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              //ui outlinelarını kullanmaya özen gösterelim.
              Icons.message_outlined,
              color: Theme.of(context).backgroundColor,
              size: iconSize.iconSmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              //ui outlinelarını kullanmaya özen gösterelim.
              Icons.message_outlined,
              color: iconColor.yellow,
              size: iconSize.iconSmall,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              //ui outlinelarını kullanmaya özen gösterelim.
              Icons.message_outlined,
              color: iconColor.kashmirBlue,
              size: iconSize.iconSmall,
            ),
          ),
        ],
      ),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
}

class IconColors {
  final Color kashmirBlue = const Color(0xff466395);
  final Color yellow = Colors.yellow;
}
