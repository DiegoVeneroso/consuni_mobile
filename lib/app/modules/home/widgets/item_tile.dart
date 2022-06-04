import 'package:awesome_icons/awesome_icons.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:consuni_mobile/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  HomeController controller = HomeController(itemRepositoryImpl: Get.find());

  ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4.0,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.favorite_outline),
              ),
              SizedBox(
                height: 150.0,
                child: Ink.image(
                  image: controller.decodeImage(item.image).image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.red,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: const EdgeInsets.all(0.0),
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(FontAwesomeIcons.frown),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1'),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(FontAwesomeIcons.smile),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1'),
                      ],
                    ),
                    TextButton(
                      child: const Text('Ver mais...'),
                      onPressed: () {
                        Get.toNamed('/itemdetail', arguments: item);
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
