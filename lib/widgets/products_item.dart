import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int price;

  const ProductsItem({
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
    return Container(
      width: width * 0.4,
      //height: height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black.withOpacity(0.32),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imgUrl,
              width: width * 0.3,
              height: height * 0.125,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(title,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  children: [
                    buildContainer(width, height, "S"),
                    buildContainer(width, height, "M"),
                    buildContainer(width, height, "L"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text("$price \$",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                const Spacer(),
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
        ],
      ),
    );
  }

  Padding buildContainer(double width, double height, String S) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: width * 0.1,
        height: height * 0.022,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            S,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
