import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:maplex_challenge/app/ui/global_utils/edge_insets/theme_edge_insets.dart';
import 'package:maplex_challenge/app/ui/pages/detail_item/controller/detail_item_controller.dart';
import 'package:maplex_challenge/app/ui/pages/detail_item/controller/detail_item_provider.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final controller = ref.watch(detailItemProvider);
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.arguments.title.toString()),
          ),
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageWidget(controller: controller),
                    CarrouselWidget(controller: controller),
                    DetailsWidget(controller: controller),
                  ],
                ),
        );
      },
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final DetailItemController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Precio: ${controller.arguments.price} \$',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            'Unidades Disponibles: ${controller.itemDetails.availableQuantity.toString()}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColor),
          ),
          Text(
            'Condición: ${controller.itemDetails.condition.toString()}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

class CarrouselWidget extends StatelessWidget {
  const CarrouselWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailItemController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 128,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Theme.of(context).primaryColor),
          top: BorderSide(color: Theme.of(context).primaryColor),
        )),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.itemDetails.pictures!.length,
            itemBuilder: (_, index) {
              return MaterialButton(
                onPressed: () {
                  controller
                      .changeImage(controller.itemDetails.pictures![index]);
                },
                child: Image.network(controller.itemDetails.pictures![index]),
              );
            }));
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailItemController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Image.network(
        controller.imageUrl,
      ),
    );
  }
}
