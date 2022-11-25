
import 'package:flutter/material.dart';
import 'package:maplex_challenge/app/ui/pages/home/controller/home_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.textEditingController,
    required this.controller,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.only(
          bottom: 32, top: 8.0, left: 8.0, right: 8.0),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                controller.setValue(value);
              },
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              controller.clearTextEditingController();
              controller.list.clear();
            },
            icon: Icon(
              textEditingController.text.isNotEmpty
                  ? Icons.close_outlined
                  : Icons.search,
              color: Colors.grey,
            ),
          ),
          textEditingController.text.isNotEmpty
              ? MaterialButton(
                  onPressed: () {
                    controller.search();
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
