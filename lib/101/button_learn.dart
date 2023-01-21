import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.green;
                  } else {
                    return Colors.white;
                  }
                },
              ),
            ),
            onPressed: () {},
            child: Text(
              'save',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ElevatedButton(onPressed: (() {}), child: const Text('a')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
          FloatingActionButton(
            onPressed: (
                //Servise istek at
                //Sayfanin rengini düzenle
                ) {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
              onPressed: (() {}),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.red, shape: const CircleBorder()),
              child: const Text('b')),
          InkWell(
            onTap: () {},
            child: const Text('bb'),
          ),
          OutlinedButton.icon(
              onPressed: (() {}),
              icon: Icon(Icons.abc),
              label: const Text('data')),
          Container(
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
            onPressed: (() {}),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Place Bid',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

//Borders:
//CircleBorder(),RoundedRectangleBorder()