import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:maplex_challenge/app/domain/models/item_preview.dart';
import 'package:maplex_challenge/app/ui/pages/home/controller/home_controller.dart';
import 'package:maplex_challenge/app/ui/pages/home/widgets/grid_widget.dart';
import 'package:maplex_challenge/app/ui/pages/home/widgets/search_widget.dart';

final homeProvider = SimpleProvider(
  (ref) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maplex finder'),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final controller = ref.watch(homeProvider);
          final textEditingController = controller.textEditingController;
          List<ItemPreview> list =
              controller.isSearch ? controller.list : controller.repositoryList;
          return Column(
            children: [
              Expanded(
                child: controller.isLoading
                    ? const Center(child: CircularProgressIndicator(),)
                    : GridWidget(list: list, controller: controller,),
              ),
              SearchWidget(
                textEditingController: textEditingController,
                controller: controller,
              ),
            ],
          );
        },
      ),
    );
  }
}
