import 'package:collection/collection.dart';
import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_application_1/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(
    () {},
  );
  test(
    'List best of',
    () {
      List<GenericUser> users = const [
        GenericUser(name: 'vb1', id: '11', money: 10),
        GenericUser(name: 'vb2', id: '11', money: 10),
        GenericUser(name: 'vb3', id: '11', money: 20),
      ];
      List<HighCard> highCards = users.map(
        (e) {
          return HighCard(items: e.name.split('').toList());
        },
      ).toList();
      try {
        final response = users.singleWhere(
          (element) => element.findUserName('x'),
          orElse: () {
            return const GenericUser(name: 'name', id: 'id', money: 0);
          },
        );
        prints(response);
      } catch (e) {
        prints(e);
      }
      print('${users.where((element) => element.money > 5)}');
      users.lastWhere((element) => element.id == 5);

      users.take(5);
      users.remove(
        const GenericUser(name: 'vb1', id: '11', money: 10),
      ); //şimdi silebiliriz Equatable yaptıktan sonra id aynı ise siler
      users.removeAt(2);
      users.indexOf(
        const GenericUser(name: 'vb1', id: '11', money: 10),
      );

      final result = users.indexWhere((element) => element.id == '11');
      if (result >= 0) {
        users[result] = const GenericUser(name: '', id: 'b', money: 15);
      }

      users.expand((element) => [const GenericUser(name: 'a', id: '1', money: 15)]);

      // users.map((e) => e.money).where((element) => element > 5);
    },
  );
  test(
    'List best of with collection',
    () {
      List<GenericUser> users = const [
        GenericUser(name: 'vb1', id: '11', money: 10),
        GenericUser(name: 'vb2', id: '11', money: 10),
        GenericUser(name: 'vb3', id: '11', money: 20),
      ];

      final response = users.singleWhereOrNull(
        (element) => element.findUserName('x'),
      );

      users.lastWhereOrNull((element) => element.id == 5);

      users.lastOrNull;
      users.forEachIndexed(
        (index, element) {},
      );

      users.sample(3);
      print(
        users.first == const GenericUser(name: 'vb1', id: '11', money: 10),
      );
      print(users.contains(
        const GenericUser(name: 'vb1', id: '11', money: 10),
      ));
      users.any(
        (element) => element.money > 5,
      );

      prints(response);
    },
  );
}






// diyorsun ki ben final olan bir item a nasıl data ekleyebiliyorum ?
//listelerin içindeki datalar referans tutar add remove yapabilirsin ama komple 
//listeyi değiştiremezsin

//senin elinde user var ama bu highcard istiyor o zaman map kullanacağız

//userslarımın içinde sadece vb yazanları almasını istiyorum
// o zaman singleWhere kullanalım ama bu eşitlik durumunu buraya yazmamak lazım
//yine modeleme yazacaksın generic user a yazaksın findUserName

//şimdi bizim listemizde bir çok vb(sonradan vbleri değiştirdik) var hangisi döndürmesini gerektiğini 
//bilemedi o yüzden bu tarz liste işlemlerinde %100 try catch içinde kullanılmalı

//remove da direk datayı silemezsiniz

//users.Ornull yazanlar işimizi kolaylaştıracak metodlardır.//kullan direk last deme
//lastOrNulları kullan