import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int price;

  const FavItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.23,
      width: width * 0.30,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        shadowColor: Colors.black,
        color: const Color(0xffD9D9D9),
        elevation: 10,
        child: Stack(children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(imgUrl),
                        radius: 37,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      "$price \$",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  /*Row(
                    children: [
          
                      const Spacer(),
          
                    ],
                  ),*/
                ],
              ),
              // SizedBox(
              //   width: width * 0.1,
              // ),
            ],
          ),
          Positioned(
            right: width * 0.005,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Color.fromRGBO(205, 27, 27, 1),
                ),
                SizedBox(
                  height: height * 0.12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
