import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: ((context) {
                return const _ImageZoomDialog();
              }));
          inspect(response);
        },
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Version update!"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Update')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'))
      ],
    );
  }
}

//alttaki yöntem daha verimli

class Keys {
  static const versionUpdate = 'Version update';
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Update')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'))
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({
    Key? key,
  }) : super(key: key);
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
          child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: 400,
        ),
      )),
    );
  }
}


//android apk yı firebase app publisihinle atabilirsin