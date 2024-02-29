import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/ui/screen/update/update_screen.dart';
class CustomCard extends StatelessWidget {
   CustomCard({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateScreen.routeName,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [ BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(10, 10)
                )]
            ),
            child:   Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0, 6),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text( r"$" "${product.price.toString()}",
                          style: const TextStyle(color: Colors.black, fontSize: 14),),
                        const Icon(Icons.favorite, color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: -30,
              height: 90,
              width: 90,
            child: Image.network(product.image),
          ),
        ],
      ),
    );
  }
}
