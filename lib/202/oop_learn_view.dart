import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/oop_learn.dart';

class OOPLearnView extends StatefulWidget {
  const OOPLearnView({super.key});

  @override
  State<OOPLearnView> createState() => _OOPLearnViewState();
}

class _OOPLearnViewState extends State<OOPLearnView> {
  FileDownload? download;

  @override
  void initState() {
    super.initState();
    download = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          download?.downloadItem(null);
        },
      ),
    );
  }
}
