import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';

class Categories extends StatefulWidget { //banyak perubahan
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  //untuk inisialisasi view pager
  List<String> categories = [
    "Apa aja",
    "GoFood",
    "GoPay",
    "GopayLater",
    "GoRide"
  ];

  int selectedIndex = 0; //variable untuk kasi tau

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 12),
      child: SizedBox(
        height: 50,
        child: ListView.builder( //untuk membangun dan menampung data yang mau di tampilkan di UI
          scrollDirection: Axis.horizontal, //untuk mengatur arah scrollnya
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index)
          ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) { //index itu tipe data angka
    return GestureDetector( //untuk mendeteksi gesture mau itu tangan atau ga pen
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
             decoration: BoxDecoration(
              color: selectedIndex == index? primaryColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: selectedIndex == index? Colors.transparent : Colors.grey,
                width: 1
              )
              ),
                child: Column(
                  children: [
                    const SizedBox(width: 9),
                    Text(
                      categories[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index? Colors.white : Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
            
            ],
          ),
        ),
      );
  }
}