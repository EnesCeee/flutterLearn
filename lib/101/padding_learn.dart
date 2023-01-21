import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});

  //Bir mobil uyggulamada en önemli nokta paddinglerdir
  //Sizedbox vermek doğru değildir
  //padding vermek o componentin sağdan soldan aşşağı üstten eşit
  //bir şekilde hizalanmasıdır.

  //padding kullanırken eğer her component sağdan 10 paddinglenmişsse
  //kesinlikle ana widget vermemiz lazım.

  //diyelim ki ali için özel bir padding olacak o zamanda paddge instest
  //override edilmiş + var

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.black,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              height: 100,
            ),
          ),
          Padding(
            //kullanmam gerek şekil
            padding: ProjectPadding.pagePaddingRightOnly +
                ProjectPadding.pagePaddingVertical,
            child: const Text('Ali'),
          ),
        ]),
      ),
    );
  }
}

//bir düzgün tasarımda paddingler değişmez.
//kullanmam gerek şekil
class ProjectPadding {
  static const pagePaddingVertical = EdgeInsets.symmetric(vertical: 10);

  static const pagePaddingRightOnly = EdgeInsets.only(right: 20);
}
