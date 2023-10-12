import 'category.dart';
import 'items.dart';

List<Categories> dummyCategories = [
  Categories(id: "c1", title: "Coffee", imgUrl: 'images/Coffee.png'),
  Categories(id: "c2", title: "Desserts", imgUrl: 'images/Desserts.png'),
  Categories(id: "c3", title: "Alcohol", imgUrl: 'images/Alcohol.png'),
  Categories(id: "c4", title: "Alcohol Free", imgUrl: 'images/Alcohol Free.png'),
  Categories(id: "c5", title: "Breakfast", imgUrl: 'images/BreakFast.png'),
];

List<Items> dummyItems = [
  Items(id: "s1", title: "Cappuccino", imgUrl: "images/Cappuccino.png", price: 2, category: ["c1"]),
  Items(id: "s2", title: "Hot chocolate", imgUrl: "images/Hot_chocolate.png", price: 4, category: ["c1"]),
  Items(id: "s3", title: "Espresso", imgUrl: "images/Espresso.png", price: 8, category: ["c1"]),
  Items(id: "s4", title: "Latte", imgUrl: "images/Latte.png", price: 11, category: ["c1"]),
];