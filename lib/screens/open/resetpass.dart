import 'package:cavcci_cafe/widgets/elevatedbuttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resetpass extends StatelessWidget {
  static const routeName = '/resetpass';
  const Resetpass({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Reset Password",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.12,
            ),
            Row(
              children: [
                Text(
                  "Reset Password?",
                  style: GoogleFonts.inter(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                "Enter the email address associated with your account.",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.39),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Text(
              "Your E-mail",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.055,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Center(
              child: CustomEB(
                width: width,
                height: height,
                text: "Reset Password",
              ),
            )
          ],
        ),
      ),
    );
  }
}
