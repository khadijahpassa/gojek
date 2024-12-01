
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gojek/ui/map/bottom_nav_bar.dart';
import 'package:gojek/ui/map/draggable_screen.dart';
import 'package:latlong2/latlong.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      width: 80.0,
                      height: 80.0,
                      builder: (context) => const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                      )
                  ],
                )
              ],
            ),
            Positioned(
              top: 20,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5)
                    )
                  ]
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_circle_up, color: Colors.green,),
                        SizedBox(width: 8,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Mall Living World Cibubur',
                              border: InputBorder.none
                            ),
                          )
                          )
                      ],
                    ),
                   Divider(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Icon(Icons.circle, color: Colors.orange),
                      SizedBox(width: 8,),
                       Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'SMK IDN Boarding School',
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