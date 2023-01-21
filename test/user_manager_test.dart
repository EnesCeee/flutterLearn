import 'package:flutter_application_1/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp((() {}));
  test('User calculate', (() {
    final users = [
      GenericUser(name: 'vb', id: '11', money: 10),
      GenericUser(name: 'vb', id: '11', money: 10),
      GenericUser(name: 'vb', id: '11', money: 20),
    ];
    final userManagement=UserManagemet(admin: AdminUser(name: 'vadmin', id: '1', money: 15, role: 1));
    final result = userManagement.calculeteMoney(users);
    final response=userManagement.showNames<String>(users);

    expect(result, 40);
  }));
}
