import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/ui/screen/services/get_all_products.dart';
import 'package:store_app/ui/widget/stack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("New Trend", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.shopping_cart, color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 55),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsServices().getAllProduct(),
          builder: (context, snapshot){
           if(snapshot.hasData){
             List<ProductModel> products = snapshot.data!;
             return GridView.builder(
               itemCount: products.length,
               /// make top padding and clipBehavior to allow picture show from top in screen.
                 clipBehavior: Clip.none,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 1.3,
                   crossAxisSpacing: 12,
                   mainAxisSpacing: 65,
                 ),
                 itemBuilder: (context,index){
                   return CustomCard(product: products[index],);
                 });
           }else {
             return const Center(child: CircularProgressIndicator());}
          },
        )
      ),
    );
  }
}
