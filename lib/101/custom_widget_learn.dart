import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});

  final String title = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomFootButton(
                  title: title,
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          CustomFootButton(
            title: title,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// bu işin sağdan ve soldan olma durumunu yani paddingini kesinlikle componentin yapmaması lazım
//içten padding sadece componentte olur bunu normal padding yapar
//custom component yaparken componentin dışaridaki konumunu daima bunu çağıran adam belirler.
//dıştan margindir ama çağırdığın yere göre normal paddingtir ismi.
class CustomFootButton extends StatelessWidget
    with _ColorsUtility, _PaddingUtility {
  CustomFootButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  //final VoidCallback onPressed;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor, shape: const StadiumBorder()),
      onPressed: (onPressed),
      child: Padding(
        padding: normalPadding,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: whiteColor)),
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}


//Custom component yapacağımız durumlarda en önemli noktalar
//1.si Sayfanın büyümesine bağlı olarak o componenti dışarı çıkaracaksınız
//2.si ui birden fazla yerde var mı ? ona göre padding i componentte vermiyeceğiz text hariç

//Core component demek bu customfoot butonunu her yerde kullanabiliyorum olmam lazım
//ha bu componentin pembesini istedi o zaman parametry call back metodu kullanacağız
//bunun herhangi bir şekilde etkilenmemsi lazım durumlardan vs...