import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: height * 0.05,
          ),
          TextField(
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
          SizedBox(
            height: height * 0.05,
          ),
          Card(
            shadowColor: Colors.black,
            
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffD9D9D9),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        child: Image.asset(
                          'images/Rectangle 2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite_border,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Mahmoud',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Text("\$",
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
                ],
              ),
            ),
          )
        ]),
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
