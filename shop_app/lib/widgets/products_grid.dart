import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final isFav;

  ProductsGrid(this.isFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final product = isFav ? productsData.favouritesItems: productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:  product[index],
        child: ProductItem(
          /*product[index].id,
          product[index].title,
          product[index].imageUrl,*/
        ),
      ),
      itemCount: product.length,
    );
  }
}
