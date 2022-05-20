import 'package:consuni_mobile/app/core/ui/app_ui.dart';
import 'package:consuni_mobile/app/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  const ItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://violinhalanches.files.wordpress.com/2016/04/violinha-lanches-araras-x-churrasco.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'X-salada',
                      style: AppUI.textbold,
                    ),
                    Text(r'R$ 100,00'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
