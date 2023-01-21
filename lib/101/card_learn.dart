import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(children: [
        const Card(
          margin: ProjectMargins.cardMargin,
          elevation: 100,
          color: Colors.white,
          child: SizedBox(
            height: 100,
            width: 300,
            child: Text("Ali"),
          ),
        ),
        Card(
          color: Theme.of(context).colorScheme.error,
          margin: ProjectMargins.cardMargin,
          elevation: 100,
          child: const SizedBox(
            height: 100,
            width: 300,
            child: Text("Ali"),
          ),
        ),
        _CustomCard(
          child: const SizedBox(
            height: 100,
            width: 300,
            child: Text("Ali"),
          ),
        )
      ]),
    );
  }
}

//Bu custom card ise sadece kart içermeli
//Ali ve sized box burada veremeyiz.

class _CustomCard extends StatelessWidget {
  _CustomCard({super.key, required this.child});
  final Widget child;
  final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      elevation: 100,
      color: Colors.white,
      child: child,
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}

//Borders
//StadiumBorder(),CircleBorder(),RoundedRecatangleBorder()

//margin paddingin dıştan verilmiş halidir