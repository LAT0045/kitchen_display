import 'package:flutter/material.dart';
import 'package:kitchen_display/cards/order_card.dart';
import 'package:kitchen_display/screen_type/screen_type.dart';
import 'package:kitchen_display/utils/colors.dart';

class MiniCard extends StatefulWidget {
  const MiniCard({super.key, required this.orderNumber});
  final int orderNumber;

  @override
  State<StatefulWidget> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
    final screenType = getFormFactor(context);
    return screenType == ScreenType.tablet
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Text(
                              "Table 1",
                              style: TextStyle(
                                  fontFamily: "Comfortaa",
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20, top: 5),
                          child: Text(
                            widget.orderNumber.toString(),
                            style: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 15),
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 5),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 30,
                                        width: 3,
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "01 : 15 : 00",
                                                  style: TextStyle(
                                                      fontFamily: "Comfortaa",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                    height: 13,
                                                    width: 15,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppColors.red,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            const Text(
                                              "Estimate: 40 : 00",
                                              style: TextStyle(
                                                  fontFamily: "Comfortaa",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ]))
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
