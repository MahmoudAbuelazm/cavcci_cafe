
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEB extends StatelessWidget {
  const CustomEB({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    
  });

  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width * 0.75, height * 0.06),
          maximumSize: Size(width * 0.75, height * 0.06),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ));
  }
}