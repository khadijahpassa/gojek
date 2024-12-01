import 'package:flutter/material.dart';
import 'package:gojek/consts.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/money.png", width: 20),
                const SizedBox(width: 10),
                // Cash Text
                const Text(
                  "Cash",
                  style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_outlined, size: 20),

                const Spacer(),

                Container(
                  width: 100,
                  height: 36,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x2C1C1C1C),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Voucher",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: lightGrey,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.library_add_sharp,
                    color: black,
                    size: 23,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.only(top: defaultPadding),
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: blue,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Up to 10k in voucher if your pickup is delayed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    "Try",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColor,
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.date_range_rounded,
                    color: secondaryColor,
                    size: 45,
                  ),
                ),
                Container(
                  width: 250,
                  height: 67,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x1D1C1C1C),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/pay");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Order GoRide",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "You'll earn 4 XP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "12.000", // Price text
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
