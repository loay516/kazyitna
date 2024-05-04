import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Position currentPosition;
  bool isLoading=true;
  @override
  void initState() {
    getCurrentLocation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading? Center(child: CircularProgressIndicator(color: Colors.green,)):SafeArea(child: Column(
        children: [
          Expanded(child: WebViewWidget(controller: getWebController())),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Change the color here
              ),
                child: Text('Confirm Order',style: TextStyle(color: Colors.white),),
                onPressed: (){
                  
                },
              ),
            ),
          )
        ],
      )),
    );
  }
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentPosition = position;
        isLoading=false;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  WebViewController getWebController() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // Example debug print, adjust logging as needed
            print('Navigating to: ${request.url}');
            if (request.url.startsWith("https://www.google.com")) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      // Dynamic URL based on latitude and longitude
      ..loadRequest(Uri.parse(generateDynamicGoogleMapsUrl(
          currentPosition!.latitude,
          currentPosition!.longitude,
          926))); // Example coordinates, replace with dynamic values as needed
  }

  String generateDynamicGoogleMapsUrl(
      double latitude, double longitude, int zoom) {
    // Base URL for Google Maps, focusing on the latitude and longitude
    String baseUrl = "https://www.google.com/maps/place/";

    // Convert latitude and longitude to a string format suitable for URL
    // This will effectively "place" a marker by centering the map on these coordinates
    String latLong = "${latitude},${longitude}";

    // Construct the URL with the latitude and longitude as a 'place'
    // and additional parameters for zoom level and map details
    // The 'z' parameter controls the zoom level
    String fullUrl =
        "$baseUrl$latLong/@$latLong,$zoom" + "m/data=!3m1!1e3?entry=ttu";

    return fullUrl;
  }
}
