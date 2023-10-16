// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/items.dart';
import '../../widgets/fav_item.dart';

class FavouriteTab extends StatelessWidget {
  final List<Items> favourites;
  const FavouriteTab(this.favourites, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: const Color(0xff00000000).withOpacity(0.1),
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.32),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.39),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          favourites.isEmpty
              ? Center(
                  child: Text(
                    "You have no favorites yet - Start adding some (⁠◍⁠•⁠ᴗ⁠•⁠◍⁠)⁠❤",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: .8,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (ctx, index) {
                        return FavItem(
                          id: favourites[index].id,
                          imgUrl: favourites[index].imgUrl,
                          title: favourites[index].title,
                          price: favourites[index].price,
                        );
                      },
                      itemCount: favourites.length,
                    ),
                  ),
                )

          // ListView.builder(
          //   itemBuilder: (ctx, index) {
          //     return FavItem(
          //       id: favourites[index].id,
          //       imgUrl: favourites[index].imgUrl,
          //       title: favourites[index].title,
          //       price: favourites[index].price,
          //     );
          //   },
          //   itemCount: favourites.length,
          // ),
        ],
      ),

      /*Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return HotelItem(
                        imgUrl: favourites[index].imgUrl,
                        title: favourites[index].title,
                        price: favourites[index].price,
                    );
                  },
                  itemCount: favourites.length,
                ),
              ),
            ),
          ],
        ),*/
    );
  }
}
