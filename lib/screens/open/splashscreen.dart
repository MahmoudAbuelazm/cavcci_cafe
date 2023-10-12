import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cavcci_cafe/screens/open/openscreen.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 3500,
      splashIconSize: double.infinity,
      splash: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Image.asset(
                "images/Ellipse 6.png",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              DropShadow(
                opacity: 0.3,
                blurRadius: 0.8,
                offset: const Offset(6, 2),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'C',
                          style: GoogleFonts.inter(
                              fontSize: 55,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xff838523))),
                      TextSpan(
                          text: 'avcci',
                          style: GoogleFonts.inter(
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      nextScreen: const Openning(),
    );
  }
}
