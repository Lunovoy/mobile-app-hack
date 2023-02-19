import 'package:deep_shield_hack/api/api_client.dart';
import 'package:deep_shield_hack/entity/dormitories.dart';
import 'package:flutter/material.dart';

class DormListModel extends ChangeNotifier {
  final apiClient = ApiClient();
  final _dorms = <Dormitories>[];

  List<Dormitories> get dorms => List.unmodifiable(_dorms);

  Future<void> loadDorms() async {
    final dorms = await apiClient.getDorms();

    _dorms.addAll(dorms);
    notifyListeners();
  }
}
