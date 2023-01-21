import 'package:equatable/equatable.dart';

class UserManagemet<T extends AdminUser> {
  final T admin;
  UserManagemet({
    required this.admin,
  });

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculeteMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    return sum;
  }

  Iterable<R>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => e.name).cast<R>();
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'vb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;
  const GenericUser({
    required this.name,
    required this.id,
    required this.money,
  });

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class AdminUser extends GenericUser {
  final int role;
  const AdminUser({required super.name, required super.id, required super.money, required this.role});
}




//forlardan uzak dur high order function kullanmaya özen göster