
import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';


class DraggableScreen extends StatelessWidget {
  const DraggableScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return const Stack(
        children: [
          // Draggable sheet atau panel yang dapat digeser
          Align(
            alignment: Alignment.bottomCenter, //untuk di tempatkan di bawah tengah layar
            child: MyDraggableSheet( //untuk membuat panel yang dapat digeser
              child: Column( //vertikal
                children: [
                  BottomSheetDummyUI(),
                  Divider(indent: 30, endIndent: 30),
                  BottomSheetDummyUI(), 
                  Divider(indent: 30, endIndent: 30),
                  BottomSheetDummyUI(),
                ],
              ),
            ),
          ),
        ],
      );
  
  }
}

class BottomSheetDummyUI extends StatelessWidget { //yang berguna untuk menampilkan ui
  const BottomSheetDummyUI({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(left: defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              // Ikon di sebelah kiri
              Image.asset("assets/images/Group.png", width: 40,),
              const SizedBox(width: 20),
              // Kolom untuk teks di sebelah ikon
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GoRide',  // Ganti dengan teks sesuai kebutuhan
                    style: TextStyle(
                    color: Color(0xFF2F2828),
                    fontSize: 20,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                       '7-10 mins • ',
                        style: TextStyle(
                        color: Color(0xFF646262),
                        fontSize: 16,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        ),
                      ),
                       Icon(Icons.person, color: Colors.grey,)
                    ],
                  ),
                ],
              ),
              // Teks harga di pojok kanan
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rp 200,000',  // Harga
                      style: TextStyle(
                      color: Color(0xFF2F2828),
                      fontSize: 17,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Padding di bawah
        ],
      ));
  }
}

class MyDraggableSheet extends StatefulWidget { //logika yang akan di jalankan ketika widget ini dijalankan
  final Widget child;
  const MyDraggableSheet({super.key, required this.child});

  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final sheet = GlobalKey(); // kunci ini buat tahu posisi atau ukuran dari widget itu dan  kunci untuk mengontrol bagian bawah layar
  final controller = DraggableScrollableController(); //biar kita bisa gerakin widgetnya naik, turun, atau berhenti di tempat tertentu.

  @override
  void initState() {
    super.initState(); //Supaya widget tetap bekerja sesuai aturan Flutter
    //controller objek yang mengendalikan pergerakan dari DraggableScrollableSheet.

    controller.addListener(onChanged); //onChanged (Ini nama fungsi yang akan dipanggil 
                                      //setiap kali ada perubahan. Jadi, misalnya saat Bottom Sheet 
                                      //digeser naik atau turun, fungsi ini akan berjalan.)
  }

  void onChanged() {
    final currentSize = controller.size; //ukuran terkini yg sdg di gerakkan sesuai dg posisi sheet yg sdg di gerakkan
    if (currentSize <= 0.05) collapse(); //jika ukuran lebih kecil dr 5% maka collapse akan di jalankan
                                        //collapse akan menyusut dan menghilang  
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first); //ukuran terkecil yang diatur sebelumnya untuk sheet.

  void anchor() => animateSheet(getSheet.snapSizes!.last); //mengubah ke ukuran snapSize terakhir yang lbh besar

  void expand() => animateSheet(getSheet.maxChildSize); //sheet akan sepenuhnya terbuka

  void hide() => animateSheet(getSheet.minChildSize); //menghilang atau mengecil ke ukuran minimum (minChildSize)

  void animateSheet(double size) { //fungsi yg bertanggung jawaba atas animasi sheet
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 30),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() { // menjaga agar aplikasi tetap ringan dan efisien dalam penggunaan memori.
   //dispose kelas induk state untuk melakukan pembersihan umum
    super.dispose();
    controller.dispose(); //membersihkan objek
  }

  DraggableScrollableSheet get getSheet => (sheet.currentWidget as DraggableScrollableSheet); //getter untuk mendapatkan widget  DraggableScrollableSheet dari GlobalKey yang bernama sheet.

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: sheet, //kunci ini untuk mengidentifikasi widget sheet
        initialChildSize: 0.4, //ukuran yg akan pertama kali muncul di awal
        maxChildSize: 0.67, //ukuran maksiumum sheet yg bisa berkembang smpai 67%
        minChildSize: 0,  //Ukuran minimum sheet (0 layar, yg artinya bisa disembunyikan). jika di drag ke bwh dia akan hilang
        expand: true, //Membuat sheet dapat mengembang 
        snap: true, //akan berhenti di ukuran tertentu
        snapSizes: [ //Ukuran "snap", yaitu ukuran-ukuran tertentu saat sheet dilepas.
          300 / constraints.maxHeight, //300 dibagi dengan tinggi layar
          0.4, //ukuran 2
        ],
        controller: controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 9,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                topButtonIndicator(),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SliverToBoxAdapter topButtonIndicator() {
    return SliverToBoxAdapter(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Wrap(children: <Widget>[
                  Container(
                      width: 100,
                      margin: const EdgeInsets.only(top: 14, bottom: 29),
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      )),
                ])),
          ]),
    );
  }
}