import 'dart:ffi';

import 'package:cavcci_cafe/models/sizeitems.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/dummy_data.dart';
import '../../models/items.dart';
import '../../widgets/cats.dart';
import '../../widgets/products_item.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  final List<Items> availableItems;
  final Function toggleFavourite;
  final Function isItemsFavourite;
  const Home(this.availableItems, this.toggleFavourite, this.isItemsFavourite,
      {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _getCurrentPosition();
    // TODO: implement initState
    super.initState();
  }

  /* String? categoryTitle;
  List<Items>? categoryHotels;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArg =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title']!;
    categoryHotels = widget.availableItems.where((item) {
      return item.category.contains(categoryId);
    }).toList();
  }*/

  bool selected = false;
  String? _currentAddress;
  Position? _currentPosition;
  String? _userCountry;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      localeIdentifier: "en_US",
    ).then((List<Placemark> placemarks) {
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _currentAddress =
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}, ${place.country}';
          _userCountry = place.country; // Get the user's country
        });
      } else {
        setState(() {
          _currentAddress = "Address not found";
        });
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '${_currentAddress ?? ""}',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.call, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Categories',
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.14,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                children: dummyCategories.map((catData) {
                  return Cat(
                    id: catData.id,
                    title: catData.title,
                    imgUrl: catData.imgUrl,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 25,
                ),
                children: dummyItems.map((itemData) {
                  return Stack(children: [
                    ProductsItem(
                      id: itemData.id,
                      title: itemData.title,
                      imgUrl: itemData.imgUrl,
                      price: itemData.price,
                    ),
                    Positioned(
                      top: 15.0,
                      right: 30.0,
                      child: IconButton(
                          color: Colors.white,
                          icon: widget.isItemsFavourite(itemData.id)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 25,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  size: 25,
                                ),
                          onPressed: () {
                            //isLiked = !isLiked;
                            setState(() {
                              widget.toggleFavourite(itemData.id);
                            });

                            //print(_favouriteHotel);
                          }),
                    ),
                  ]);
                }).toList(),
              ),
            ),
            //SizedBox(height: height * 0.03)
          ],
        ),
      ),
    );
  }
}
