import 'package:cavcci_cafe/screens/open/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Openning extends StatelessWidget {
  const Openning({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: height * 0.12),
            Image.asset("images/Ellipse 5.png"),
            SizedBox(height: height * 0.18),
            Text("Welcome",
                style: GoogleFonts.inter(
                  fontSize: 43,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                )),
            SizedBox(height: height * 0.13),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * 0.47, height * 0.07),
                  maximumSize: Size(width * 0.47, height * 0.07),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(Loginscreen.routeName);
                },
                child: Center(
                  child: Text(
                    "GET STARTED",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
