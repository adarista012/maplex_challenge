import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:maplex_challenge/app/domain/models/item_preview.dart';
import 'package:maplex_challenge/app/ui/pages/detail_item/controller/detail_item_controller.dart';

final detailItemProvider = SimpleProvider(
  (_) => DetailItemController(
    router.arguments as ItemPreview
  ),
  );
