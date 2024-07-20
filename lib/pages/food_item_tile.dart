import 'package:flutter/material.dart';
import 'package:food/models/foodmodel.dart';

class MakeItem extends StatelessWidget {
    final Foods food;
  final void Function()? onTap ;
  const MakeItem({
    super.key,
   required this.food , 
   required this.onTap
   });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 1.5,
        child: GestureDetector(
          onTap:onTap ,
          child: Container(
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(food.imagePath),
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, stops: [
                    .2,
                    .9
                  ], colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3),
                  ])),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       
                      children: [
                        Text(
                           '\$${food.price}' ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          food.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
     ));
  }
}
