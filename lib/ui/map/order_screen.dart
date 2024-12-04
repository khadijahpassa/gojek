
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gojek/consts.dart';
import 'package:gojek/state-management/theme_provider.dart';
import 'package:gojek/ui/map/bottom_nav_bar.dart';
import 'package:gojek/ui/map/draggable_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          //di setting agar petanya menjadi background
          FlutterMap(
            options: MapOptions(
              //LatLng digunakan untuk mengatur titik pusat awal peta ketika pertama kali dimuat
              //Latitude (garis lintang): utara-selatan
              //longitude (garis bujur): timur-barat
              center: const LatLng(-6.486597, 107.044091),
              zoom: 15.0, // tingkat pembesaran awal zoom peta. Semakin besar 
                          // semakin dekat tampilan peta.
              ),
              children: [
                //digunakan untuk mengambil dan menampilkan peta
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', //diambil dari streetMap
                  subdomains: const ['a', 'b', 'c'], //properti subdomain digunakan untuk mempercepat loading
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const LatLng(-6.486597, 107.044091), 
                      width: 45.0,
                      height: 45.0,
                      builder: (context) => SvgPicture.asset(
                        'assets/icons/destination.svg',
                      ),
                      )
                  ],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: const LatLng(-6.485108, 107.047101), 
                      width: 45.0,
                      height: 45.0,
                      builder: (context) => SvgPicture.asset(
                        'assets/icons/pickup.svg',
                      ),
                      )
                  ],
                )
              ],
            ),
            Positioned(
              top: 50,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkTheme ? black : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5)
                    )
                  ]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/pickup_icon.svg',
                          width: 22
                        ),

                        // SvgPicture.asset('assets/icons/pickup_icon.svg', color : themeProvider.isDarkTheme ? lightBlue : primaryColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Mall Living World Cibubur',
                              hintStyle: TextStyle(color: themeProvider.isDarkTheme ? white : darkGrey),
                              border: InputBorder.none
                            ),
                          )
                          )
                      ],
                    ),
                   const Divider(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      SvgPicture.asset('assets/icons/destination_icon.svg', width: 22),
                      const SizedBox(width: 8),
                       Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'SMK IDN Boarding School',
                              hintStyle: TextStyle(color: themeProvider.isDarkTheme ? white : darkGrey),
                              border: InputBorder.none
                            ),
                          )
                          ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              const DraggableScreen(),
              const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavBar(),
                )
        ],
      ),
    );
  }
}