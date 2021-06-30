import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb_fooddelivery/models/restaurantmodel.dart';
import 'package:flutterweb_fooddelivery/widgets/custom_text.dart';
import 'package:flutterweb_fooddelivery/widgets/laoding.dart';
import 'package:transparent_image/transparent_image.dart';
class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 2, right: 2, bottom: 4),
      child: Stack(

        children: [
          _backgroundImage(restaurant.image),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,

                          ),

                        ),

                      ],
                    ),
                  ),)
              ],

            ),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                      child: RichText(
                        text: TextSpan(
                            children: [TextSpan(
                                text: "${restaurant.name} \n",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                              TextSpan(
                                  text: "avg meal price: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                )
            ),
          )

        ],
      ),
    );
  }
   Widget _backgroundImage (String image){
    if (image.isEmpty || image == null){
      return Container(
        height: 210,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20.0)
        ),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 120,
                    child: Loading(),
                  ),
                ),

              ),
              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: restaurant.image,
                    imageCacheHeight: 300,
                    imageCacheWidth: 400,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
   }

}
