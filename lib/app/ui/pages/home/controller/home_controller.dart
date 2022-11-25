import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:maplex_challenge/app/data/helpers/http_response.dart';
import 'package:maplex_challenge/app/domain/models/item_preview.dart';
import 'package:maplex_challenge/app/ui/global_utils/constants.dart';
import 'package:maplex_challenge/app/ui/routes/routes.dart';

class HomeController extends SimpleNotifier {
  int _counter = 0;
  int get counter => _counter;
  String _value = '';
  String get value => _value;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isSearch = false;
  bool get isSearch => _isSearch;
  final List<ItemPreview> _list = [];
  List<ItemPreview> get list => _list;
  final List<ItemPreview> _repositoryList = [];
  List<ItemPreview> get repositoryLst => _repositoryList;
  List<ItemPreview> get repositoryList => _repositoryList;
  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController get textEditingController => _textEditingController;

  void increment() {
    _counter++;
    notify();
  }

  void setValue(String str) {
    _value = str;
    notify();
  }

  void clearTextEditingController() {
    _textEditingController.clear();
    _isLoading = false;
    _isSearch = false;
    notify();
  }

  void routeDetailItem(ItemPreview item) async {
    _repositoryList.add(item);
    router.pushNamed(Routes.DETAIL_PAGE, arguments: item);
  }

  void search() async {
    _list.clear();
    _isLoading = true;
    _isSearch = true;
    notify();
    try {
      var response = await HttpsResponse.get(
        ur: Constants.urlSearch,
        query: _textEditingController.text,
      );
      if (response.body.isNotEmpty) {
        var data = json.decode(response.body);
        _list.addAll(listItemPreviewFromJson(data)!.toList());
      }
    } catch (e) {
      log(e.toString());
    }
    _isLoading = false;
    notify();
  }
}
