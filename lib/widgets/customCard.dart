import 'package:flutter/material.dart';
import 'package:store_app/models/productModel.dart';
import 'package:store_app/screens/addProduct.dart';
import 'package:store_app/screens/homeScreen.dart';
import 'package:store_app/screens/updateProduct.dart';
import 'package:store_app/sevieces/addProduct.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.productModel});

  ProductModel productModel;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late bool fav=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: widget.productModel);
      },
      onTap: (){
        setState(() {
          fav=!fav;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(5, 5))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${widget.productModel.price.toString()}",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        Icon(fav?
                          Icons.favorite :Icons.favorite_border,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 30,
              bottom: 100,
              child: Image.network(
                widget.productModel.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
