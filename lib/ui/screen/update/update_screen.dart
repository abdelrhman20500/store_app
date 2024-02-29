import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/ui/screen/services/update_product.dart';
import 'package:store_app/ui/widget/custom_button.dart';

import '../../widget/customtextfield.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key});

 static const String routeName = "UpdateScreen";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
 String? productName, desc, price, image;
 bool isLoading= false;
  @override
  Widget build(BuildContext context) {
    ProductModel product= ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          },
              icon: const Icon(Icons.arrow_back, color: Colors.black,)
          ),
          title: const Text("Update Product", style: TextStyle(
            color: Colors.black, fontSize: 22,
          ),),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120,),
                CustomTextField(
                  onChanged: (data)
                    {
                      productName=data;
                    },
                    hintText: "product name"),
                const SizedBox(height: 10,),
                CustomTextField(
                    onChanged: (data)
                    {
                      desc=data;
                    },
                    hintText: "description"),
                const SizedBox(height: 10,),
                CustomTextField(
                    onChanged: (data)
                    {
                      price= data;
                    },
                    inputType: TextInputType.number,
                    hintText: "price"),
                const SizedBox(height: 10,),
                CustomTextField(
                    onChanged: (data)
                    {
                      image=data;
                    },
                    hintText: "image"),
                const SizedBox(height: 50,),
               CustomButton(
                   onTap: () async{
                     isLoading= true;
                     setState(() {});
                     try {
                      await updateProduct(product);
                     } catch(e)
                     {
                       print(e.toString());
                     }
                     isLoading= false;
                     setState(() {});
                   },
                   text: "Update"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product)async {
    await UpdateProduct().updateProduct(
        title: productName== null ?product.title : productName!,
        price: price==null ?product.price.toString() : price!,
        description: desc==null ?product.description : desc!,
        image: image==null ?product.image : image!,
        category:product.category,
        id: product.id
    );
  }
}


