import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:  TextField(
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
        body: null,
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
