import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'a');
  @override
  void initState() {
    super.initState();

    final user1 = PostModel1()
      ..userId = 1
      ..body = 'vb';
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.body = 'a';

    final user3 = PostModel3(1, 2, 'a', 'b');
    // user3.body = 'a';

    //localde mantıklı
    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'b');
    // user4.body = 'a';

    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    // user. private olduğundan içini göremeyiz veli hocanın çok sevidğinden
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: 'a', body: 'b');
    final user7 = PostModel7();

    //Sevis kullanıyorsan en mantıklı yöntem
    final user8 = PostModel8(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            user9 = user9.copyWith(title: 'vb');
            user9.updateBody('a');
          });
        },
      ),
      appBar: AppBar(
        title: Text(user9.title ?? 'Not have any data'),
      ),
    );
  }
}
