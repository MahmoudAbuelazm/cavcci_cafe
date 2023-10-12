import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cat extends StatefulWidget {
  final String id;
  final String title;
  final String imgUrl;

  const Cat({
    required this.id,
    required this.title,
    required this.imgUrl,
    super.key,
  });

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
       setState(() {
         isTapped = !isTapped;
       });
      },
      child: Container(
        height: height * 0.05,
        width: width * 0.26,
        decoration: BoxDecoration(
          color: isTapped? Colors.black:Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.imgUrl),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                color: isTapped? Colors.white :Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
