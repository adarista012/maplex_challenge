

import 'package:flutter/material.dart';
import 'package:maplex_challenge/app/domain/models/item_preview.dart';
import 'package:maplex_challenge/app/ui/pages/home/controller/home_controller.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key,
    required this.list,
    required this.controller,
  }) : super(key: key);
  final List<ItemPreview> list;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: GridView.builder(
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (_, index) {
              return MaterialButton(
                  onPressed: () {
                    controller.routeDetailItem(
                      list[index],
                    );
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(16.0)),
                  splashColor: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                          list[index].thumbnailUrl.toString(),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(2.4),
                        child: Text(
                                '${list[index].price.toString()} \$ ',
                                overflow: TextOverflow.fade,
                              ),
                      ),
                      Text(
                          list[index].title.toString(),
                          overflow: TextOverflow.clip,
                          style: const TextStyle(fontSize: 11.0),
                        ),
                      
                      //  SizedBox.expand(child: Text(controller.list[index].title.toString(), overflow: TextOverflow.fade,),),
                    ],
                  ));
            }),
      ),
    );
  }
}
