import 'dart:convert';
import 'dart:developer';
import 'package:flutter_meedu/meedu.dart';
import 'package:maplex_challenge/app/data/helpers/http_response.dart';
import 'package:maplex_challenge/app/domain/models/item_details.dart';
import 'package:maplex_challenge/app/domain/models/item_preview.dart';
import 'package:maplex_challenge/app/ui/global_utils/constants.dart';

class DetailItemController extends SimpleNotifier {
  DetailItemController(this.arguments) {
    searchDetailItem();
  }

  final ItemPreview arguments;

  late final ItemDetails _itemDetails;
  late String _imageUrl;
  String get imageUrl => _imageUrl;
  ItemDetails get itemDetails => _itemDetails;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void searchDetailItem() async {
    _isLoading = true;
    ItemPreview item = arguments;
    try {
      var response = await HttpsResponse.get(
        ur: Constants.urlItems,
        query: item.id.toString(),
      );
      if (response.body.isNotEmpty) {
        var data = json.decode(response.body);
        _itemDetails = ItemDetails.fromJson(data);
        _imageUrl = _itemDetails.pictures![0];
      }
    } catch (e) {
      log(e.toString());
    }
    _isLoading = false;
    notify();
  }

  void changeImage(String url) {
    _imageUrl = url;
    notify();
  }
}
