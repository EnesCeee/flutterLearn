import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const RandomImage(),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  onTap: (() {}),
                  subtitle: const Text('How do you use your card'),
                  leading: const Icon(Icons.money),
                  trailing: Container(
                    color: Colors.red,
                    width: 20,
                    child: const SizedBox(
                        width: 20, child: Icon(Icons.chevron_right)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//Çok kullanılan bir yapı