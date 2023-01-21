import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({super.key, this.userName});
  final String name = 'Enes';
  final String? userName;

  final ProjectKeys keys = ProjectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(("Welcome? $name ${name.length}" * 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    wordSpacing: 2,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            //En iyi kullanımımız
            Text(("What are you doing? $name ${name.length}" * 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ProjectColors.welcomeColor) //Flutter typography,
                ),
            Text(userName ?? ""),
            Text(keys.welcome),
          ],
        ),
      ),
    );
  }
}
//Theme.of kullan Flutter typography
//Bu bi yöntem ama yukarıdaki yöntem çok daha iyi
class ProjectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      letterSpacing: 2,
      fontStyle: FontStyle.italic,
      color: Colors.red,
      decoration: TextDecoration.underline,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}

class ProjectColors {
  static Color welcomeColor = Colors.blue;
}

class ProjectKeys {
  final String welcome = "Merhaba";
}
