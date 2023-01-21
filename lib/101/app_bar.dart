import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({super.key});

  final String _title = 'Welcome Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.menu),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
//action lar bizim appbardaki sağ kısmı kullanmamızı sağlar
//transparant durumunda arkada siyah kalırsa elevation 0 yap
//ortak olanları themedan ortaklaştırdık 