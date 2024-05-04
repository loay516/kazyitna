// ignore_for_file: sort_child_properties_last, file_names, use_key_in_widget_constructors, prefer_const_constructors, unused_label, unused_import

import 'package:flutter/material.dart';
import 'package:kaziytna/components/Home.dart';
import 'package:kaziytna/components/common/chat.dart';
import 'package:kaziytna/components/home_screen.dart';


class HomeUpScreen extends StatefulWidget {
  @override
  State<HomeUpScreen> createState() => _HomeUpScreenState();
}

class _HomeUpScreenState extends State<HomeUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gasoline Prices in Jordan'),
        backgroundColor: Color.fromARGB(255, 46, 128, 48),
      ),
      // bottomNavigationBar: bottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              /*Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, top: 30),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),*/
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: const Text(
                  "Kazity",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              listMenu(),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Gas stations in Jordan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              destinations(),
              promo(),
              destinations(),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Container promo() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: SizedBox(
                width: 300,
                child: ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 20, 95, 30),
                    child: Icon(
                      Icons.percent,
                    ),
                  ),
                  title: const Text(
                    "25% off on first booking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text("use coupon code 'TRAVELOKASI'"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container destinations() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Card(
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: DecoratedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 90, bottom: 10),
                            child: Text(
                              "Amman",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: const Icon(
                                    Icons.place,
                                    color: Color.fromARGB(255, 240, 5, 5),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 100),
                                  child: const Text(
                                    "jordan",
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Text(
                                    "4.7",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      position: DecorationPosition.background,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/jjj.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container listMenu() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: const Column(
              children: [
               
              ],
            ),
          ),
        ],
      ),
    );
  }

  // BottomNavigationBar bottomNavigation() {
  // return BottomNavigationBar(
  //   type: BottomNavigationBarType.fixed, // تحديد نوع الشريط ليكون بحجم ثابت
  //   selectedItemColor: Color.fromARGB(255, 24, 107, 27), // لون العنصر المحدد
  //   unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
  //   items: const <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.home,
  //       ),
  //       label: "Home",
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.fire_extinguisher_outlined,
  //       ),
  //       label: "Fire",
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.shopping_cart,
  //       ),
  //       label: "Cart",
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.person,
  //       ),
  //       label: "Profile",
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(
  //         Icons.message,
  //       ),
  //       label: "Message",
  //     ),
  //   ],
  

  //       onTap: (int index) {
  //         if (index == 3) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => ProfilePage()),
  //           );
  //           } else if (index == 4) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => ChatPage()),
  //           );
          
  //         } else if (index == 1) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => HomeScreen()),
  //           );
  //         } else if (index == 0) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => HomeUpScreen()),
  //           );
  //            } else if (index == 2) {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => CartPage()),
  //           );
  //         }
          
  //       });

  // }
}
