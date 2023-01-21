import 'package:flutter/material.dart';

class ListViewLearnBuilder extends StatefulWidget {
  const ListViewLearnBuilder({super.key});

  @override
  State<ListViewLearnBuilder> createState() => _ListViewLearnBuilderState();
}

class _ListViewLearnBuilderState extends State<ListViewLearnBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
          );
        },
        itemBuilder: ((context, index) {
          print('$index');
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network('https://picsum.photos/200/300')),
                Text('$index'),
              ],
            ),
          );
        }),
        itemCount: 15,
      ),
    );
  }
}


//sized boxla yaparsak ekranda ne kadar varsa görünen o kadar çağırır
//height verip expanded yapmamız lazım