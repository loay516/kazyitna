// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import, unused_element, deprecated_member_use, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_field, unnecessary_import, dead_code, prefer_final_fields, unnecessary_null_comparison, unused_local_variable, avoid_print, sort_child_properties_last, duplicate_import, depend_on_referenced_packages, annotate_overrides, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers, unnecessary_new, prefer_collection_literals, unnecessary_this


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaziytna/components/Home.dart';
import 'package:kaziytna/components/HomePage.dart';
import 'package:kaziytna/components/common/chat.dart';
import 'package:kaziytna/core/models/cart_model.dart';
import 'package:kaziytna/core/models/user_model.dart';
import 'package:kaziytna/core/repository/authenticationReporsitory/authenticationRepository.dart';
import 'package:kaziytna/features/mapScreen/screen/map_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';






// Define a class to represent a gasoline type

class GasolineType {
  final String name;
  final double price;
  final String imageUrl;

  GasolineType(
      {required this.name, required this.price, required this.imageUrl});
}

// Sample data for different gasoline types
List<GasolineType> gasolineTypes = [
  GasolineType(
      name: 'Regular', price: 1.20, imageUrl: 'assets/images/images (2).jpg'),

  GasolineType(
      name: 'Premium', price: 1.50, imageUrl: 'assets/images/images (4).jpg'),

  GasolineType(
      name: 'Gasoline 95',
      price: 2.20,
      imageUrl: 'assets/images/images (3).jpg'),

  GasolineType(
      name: 'Gasoline 80',
      price: 3.50,
      imageUrl: 'assets/images/images (1).jpg'),
  GasolineType(
      name: 'Gasoline 92',
      price: 1.20,
      imageUrl: 'assets/images/images (5).jpg'),

  GasolineType(
      name: 'Petrol', price: 1.50, imageUrl: 'assets/images/images.jpg'),
  GasolineType(
      name: 'Gas', price: 3.50, imageUrl: 'assets/images/images (1).jpg'),
  GasolineType(
      name: 'diesel', price: 1.30, imageUrl: 'assets/images/images (2).jpg'),

  GasolineType(
      name: 'Gasoline 91', price: 1.50, imageUrl: 'assets/images/images.jpg'),

  GasolineType(
      name: 'Gasoline 97', price: 1.50, imageUrl: 'assets/images/images.jpg'),
  GasolineType(
      name: 'Premium', price: 3.50, imageUrl: 'assets/images/images (1).jpg'),
  GasolineType(
      name: 'Regular', price: 1.20, imageUrl: 'assets/images/images (5).jpg'),

  // Add more gasoline types as needed
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        
        backgroundColor: Color.fromARGB(255, 46, 128, 48),
      ),
      body: ListView.builder(
        itemCount: gasolineTypes.length,
        itemBuilder: (context, index) {
          GasolineType gasolineType = gasolineTypes[index];
          return ListTile(
            leading: Image.asset(
              gasolineType.imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: Text(gasolineType.name),
            subtitle:
            Row(
              children: [
                Text('\$${gasolineType.price.toStringAsFixed(2)}',style: TextStyle(color: Colors.green),),
                Text('per liter')
              ],
            ),  
            trailing: ElevatedButton(
              onPressed: () {
                // Navigate to the purchase page passing the selected gasoline type
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PurchasePage(gasolineType: gasolineType),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text('Buy'),
            ),
          );
        },
      ),
    );
  }
}


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel currentUser;
  bool isLoading=false;
 @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return isLoading? Center(child: CircularProgressIndicator(color: Colors.green,)):new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color.fromARGB(255, 24, 107, 27),
              const Color.fromARGB(255, 24, 107, 27),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 15),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                                new AssetImage('assets/images/profile.png'),
                            radius: _height / 10,
                          ),
                          new SizedBox(
                            height: _height / 30,
                          ),
                          new Text(
                            currentUser.name,
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 2.5),
                    child: new Container(
                      color: Colors.white,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: new Offset(0.0, 2.0))
                              ]),
                          /*child: new Padding(
                            padding: new EdgeInsets.all(_width / 20),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild('Photos', 114),
                                  headerChild('Followers', 1205),
                                  headerChild('Following', 360),
                                ]),
                          ),*/
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 7),
                          child: new Column(
                            children: <Widget>[
                              infoChild(
                                  _width, Icons.email, currentUser.email),
                              infoChild(_width, Icons.call, currentUser.phoneNo),
                              infoChild(_width, Icons.password, currentUser.password),
                              /*new Padding(
                                padding: new EdgeInsets.only(top: _height / 30),
                                child: new Container(
                                  width: _width / 3,
                                  height: _height / 20,
                                  decoration: new BoxDecoration(
                                      color: const Color.fromARGB(255, 24, 107, 27),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(_height / 40)),
                                      boxShadow: [
                                        new BoxShadow(
                                            color: Colors.black87,
                                            blurRadius: 2.0,
                                            offset: new Offset(0.0, 1.0))
                                      ]),
                                  child: new Center(
                                    child: new Text('FOLLOW ME',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              )*/
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<String?> getStringFromSharedPreferences() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}
  getData()async{
    setState(() {
      isLoading=true;
    });
    String? email=await getStringFromSharedPreferences();
    AuthenticationRepository repo=AuthenticationRepository();
    currentUser=await repo.getUser(email!);
    setState(() {
      isLoading=false;
    });
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color.fromARGB(255, 24, 107, 27),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: const Color.fromARGB(255, 24, 107, 27),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
class PurchasePage extends StatefulWidget {
  final GasolineType gasolineType;

  PurchasePage({required this.gasolineType});

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  int quantity = 0;
  late UserModel currentUser;
  late CartModel cart;
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Purchase'),
        backgroundColor: Color.fromARGB(255, 46, 128, 48),
      ),
      body:isLoading? CircularProgressIndicator(color: Colors.green,):Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.gasolineType.imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                '${widget.gasolineType.name} Gasoline',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Price: \$${widget.gasolineType.price.toStringAsFixed(2)} per liter',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Type: "87%" ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity--;
                        }
                      });
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Quantity: $quantity',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quantity < 100) {
                          quantity++;
                        }
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add the selected product and quantity to the cart
                  if (quantity>0) {
                    Cart.addItem(widget.gasolineType, quantity);
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Item added to cart'),
                
              ));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Please select how many you want'),
                
              ));
                  }
                  
                  // Navigate to the payment methods page
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodsPage(),
                    ),
                  );*/
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<String?> getStringFromSharedPreferences() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}
  getData()async{
    setState(() {
      isLoading=true;
    });
    String? email=await getStringFromSharedPreferences();
    AuthenticationRepository repo=AuthenticationRepository();
    currentUser=await repo.getUser(email!);
    cart=CartModel(cartId: currentUser.email);
    setState(() {
      isLoading=false;
    });
  }
}

class Cart {
  // Define a static list to hold the items in the cart
  static List<CartItem> _items = [];

  // Add an item to the cart
  static void addItem(GasolineType gasolineType, int quantity) {
    _items.add(CartItem(gasolineType: gasolineType, quantity: quantity));
  }

  // Get the items in the cart
  static List<CartItem> get items => _items;
}

class CartItem {
  final GasolineType gasolineType;
  final int quantity;

  CartItem({required this.gasolineType, required this.quantity});
}

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)), // تحديد لون النص في الشريط
        ),
        backgroundColor: Color.fromARGB(255, 20, 95, 30), // تحديد لون الشريط
      ),
      body: ListView.builder(
        itemCount: Cart.items.length,
        itemBuilder: (context, index) {
          final item = Cart.items[index];
          return ListTile(
            title: Text(item.gasolineType.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('Total: \$${(item.gasolineType.price * item.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
  onPressed: () {
    // Clear the cart when cancel button is pressed
    Cart.items.clear();
    setState(() {
      
    });
    // After clearing, navigate back to the previous page or perform any other necessary action
    // Navigator.pop(context);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red, // تحديد لون الزر
  ),
  child: Text(
    'Cancel',
    style: TextStyle(color: Colors.white), // تحديد لون النص
  ),
),

      ElevatedButton(
  onPressed: () {
    // Navigate to the payment methods page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentMethodsPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 20, 95, 30), // تحديد لون الزر
  ),
  child: Text(
    'Proceed to Payment',
    style: TextStyle(color: Colors.white), // تحديد لون النص
  ),
),

    ],
  ),
),
   );
  }
}

class PaymentMethodsPage extends StatefulWidget {
  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Methods',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green, // Green app bar
        // Adding an image to the app bar
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/world-business-final-2.png', // Replace this with your image path
              height: 30, // Adjust the height as needed
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*Text(
              'Choose your payment method:',
              style: TextStyle(fontSize: 20.0),
            ),*/
            
            SizedBox(height: 10.0),
            // Adding a fixed size to the ElevatedButtons
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
              child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(vertical: 16.0),
  ),
  onPressed: requestLocationPermission,
  child: Text('Credit Card'),
),
            ),
            SizedBox(height: 10.0),
            // Adding a fixed size to the ElevatedButtons
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
              child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    padding: EdgeInsets.symmetric(vertical: 16.0),
  ),
  onPressed: requestLocationPermission,
  child: Text('Cash'),
),
            ),
            // You can add other payment methods here
          ],
        ),
      ),
    );
  }
  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );
    } else {
      print('Location permission denied');
    }
  }
}


class DriverProfile {
  final String name;
  final String imageUrl;
  final bool hasGreenDot;
  final bool hasRedDot;

  DriverProfile({
    required this.name,
    required this.imageUrl,
    this.hasGreenDot = false,
    this.hasRedDot = false,
  });
}

class DriverProfilesPage extends StatelessWidget {
  final List<DriverProfile> driverProfiles = [
    DriverProfile(name: 'Esraa Seroo', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Aya Zabin', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Rashed abu areda', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'loyi', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Ahmed', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Murad', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Wael', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Shadi Mohammed', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Khalid', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Ayham123', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Basel', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Samer', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Hothifa', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Abdullah', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
    DriverProfile(name: 'Saker', imageUrl: 'assets/images/mmmm.jpg', hasGreenDot: true),
    DriverProfile(name: 'Belal', imageUrl: 'assets/images/mmmm.jpg', hasRedDot: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Profiles'),
      ),
      body: ListView.builder(
        itemCount: driverProfiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(driverProfiles[index].imageUrl),
            ),
            title: Text(driverProfiles[index].name),
            onTap: () {
              // انتقل إلى صفحة الملف الشخصي عند النقر
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriverProfileDetailsPage(driverProfile: driverProfiles[index]),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (driverProfiles[index].hasGreenDot)
                  Icon(Icons.circle, color: Colors.green, size: 12),
                SizedBox(width: 5),
                if (driverProfiles[index].hasRedDot)
                  Icon(Icons.circle, color: Colors.red, size: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DriverProfileDetailsPage extends StatelessWidget {
  final DriverProfile driverProfile;

  const DriverProfileDetailsPage({Key? key, required this.driverProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Profile'),
      ),
      body: ListView.builder(
        itemCount: 1, // نحتاج فقط لعرض ملف شخصي واحد
        itemBuilder: (context, index) {
          // تحقق مما إذا كان لديه نقطة خضراء
          if (driverProfile.hasGreenDot) {
            return ListTile(
              title: Text(driverProfile.name),
              subtitle: Text('Submit your current location'),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(driverProfile.imageUrl),
              ),
            );
          } else {
            // إذا لم يكن لديه نقطة خضراء، فلا تقم بعرض شيء
            return SizedBox.shrink();
          }
        },
      ),
    );
  }

}

class CreditCardPayment extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;

  CreditCardPayment({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _processPayment(context);
      },
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card ending in ${cardNumber.substring(cardNumber.length >= 4 ? cardNumber.length - 4 : 0)}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Icon(Icons.credit_card, color: Colors.green),
              ],
            ),
            SizedBox(height: 10),
            Text('Card Holder: $cardHolderName', style: TextStyle(color: Colors.green)),
            SizedBox(height: 5),
            Text('Expiry Date: $expiryDate', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    // في هذا المثال، سنقوم بعرض رسالة تأكيد بسيطة
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation', style: TextStyle(color: Colors.green)),
          content: Text('Payment processed successfully with credit card ending in ${cardNumber.substring(cardNumber.length >= 4 ? cardNumber.length - 4 : 0)}', style: TextStyle(color: Colors.green)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }
}
