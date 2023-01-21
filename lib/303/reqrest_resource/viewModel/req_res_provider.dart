import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/product/global/resource_context.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqResProvider extends ChangeNotifier {
  final IReqresService reqresService;

  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
