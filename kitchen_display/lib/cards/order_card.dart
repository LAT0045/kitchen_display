import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kitchen_display/utils/colors.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  State<OrderCard> createState() => _OrderCardtState();
}

class _OrderCardtState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.nude,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.mediumOrangeColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Text(
                          "Table 1",
                          style: TextStyle(
                              fontFamily: "Comfortaa",
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "#0001",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Order time: 11 : 55",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                height: 13,
                                width: 15,
                                decoration: const BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15),
                              child: Row(
                                children: [
                                  Container(
                                      height: 20,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        color: AppColors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "01 : 15 : 00",
                                        style: TextStyle(
                                            fontFamily: "Comfortaa",
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      "Estimate: 40 : 00",
                                      style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < 6; i++) const OrderItem()
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1,
                                        color: AppColors.mediumOrangeColor),
                                    backgroundColor: Colors.white),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Spike",
                                    style: TextStyle(
                                        fontFamily: "Comfortaa",
                                        fontSize: 16,
                                        color: AppColors.mediumOrangeColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 1,
                                          color: AppColors.mediumOrangeColor),
                                      backgroundColor:
                                          AppColors.mediumOrangeColor),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "Push",
                                      style: TextStyle(
                                          fontFamily: "Comfortaa",
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Tenders with 2 dips",
                    style: TextStyle(
                        fontFamily: "Comfortaa",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "x1",
                  style: TextStyle(
                      fontFamily: "Comfortaa",
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            for (int i = 0; i < 2; i++)
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "-- Ketchup",
                  style: TextStyle(
                    fontFamily: "Comfortaa",
                    fontSize: 14,
                  ),
                ),
              )
          ],
        ));
  }
}
