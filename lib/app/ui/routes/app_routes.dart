import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'package:maplex_challenge/app/ui/pages/detail_item/detail_item_page.dart';
import 'routes.dart';
import '../pages/home/home_page.dart';

/// WARNING: generated code don't modify directly
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomePage(),
    Routes.DETAIL_PAGE: (_) => const DetailItemPage(),
  };
}
    