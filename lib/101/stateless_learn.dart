import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  const StatelessLearn({super.key});
  
  final String text2 = "enes1";

  //her widget in build methodu vardır burada yazdığımız return komutuyla ekranlarınız geliştiriz
  //stls widget datayı verir datayı alır sadece gösterir
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TitleTextWidget(
            text: text2,
          ),
          _emptyBox(),
          const TitleTextWidget(
            text: "enes2",
          ),
          _emptyBox(),
          const TitleTextWidget(
            text: "enes3",
          ),
          _emptyBox(),
          const TitleTextWidget(
            text: "enes4",
          ),
          _emptyBox(),
          const TitleTextWidget(
            text: "enes5",
          ),
          const _CustomContainer(),
          _emptyBox()
        ],
      ),
    );
  }

  SizedBox _emptyBox() => const SizedBox(
        height: 10,
      );
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
    );
  }
}

//flutter best practice inde şunu söyler böyle bir component setin
// varsa sen gel bu compenent setini ayrı bir widget yap

//Bir stateless component kullanıyorsam 3 duruma bakmalıyım
//1-Ben complexity arttığında böyle parçalamalıyım
//2- parametre alabiliyor olmalıyım
//3-sayfalarımda bunu private olarak entegre etmeliyim

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
