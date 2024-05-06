import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:kitchen_display/cards/order_card.dart';
import 'package:kitchen_display/mobx/time.dart';
import 'package:kitchen_display/screen_type/screen_type.dart';
import 'package:kitchen_display/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TimeStore timeStore = TimeStore();
  late String date;

  @override
  void initState() {
    super.initState();
    timeStore.startRealTimeUpdates();
    date = DateFormat('EEEE, dd/MM/yyyy').format(timeStore.currentTime);
  }

  @override
  Widget build(BuildContext context) {
    final screenType = getFormFactor(context);
    return Scaffold(
      body: screenType == ScreenType.tablet
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width * 0.97,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "ORDERS",
                                  style: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orangeColor),
                                ),
                              ),
                              Observer(
                                builder: (_) => Row(
                                  children: [
                                    TimeContainer(
                                      value: timeStore.currentTime.hour ~/ 10,
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.hour % 10,
                                    ),
                                    const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontFamily: "Comfortaa",
                                          color: AppColors.mediumOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.minute ~/ 10,
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.minute % 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        date,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontFamily: "Comfortaa",
                                            color: AppColors.mediumOrangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Notes: ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Comfortaa",
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 50,
                                            height: 5,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Elapsed time > 60 min",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 50,
                                            height: 5,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "60 min <= Elapsed time >= 30 min",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 50,
                                            height: 5,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Elapsed time < 30 min",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(children: [
                            Row(
                              children: [
                                for (int i = 0; i < 10; i++)
                                  OrderCard(
                                    screenType: screenType,
                                  ),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  width: MediaQuery.of(context).size.width * 0.97,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "ORDERS",
                                  style: TextStyle(
                                      fontFamily: "Comfortaa",
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.orangeColor),
                                ),
                              ),
                              Observer(
                                builder: (_) => Row(
                                  children: [
                                    TimeContainer(
                                      value: timeStore.currentTime.hour ~/ 10,
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.hour % 10,
                                    ),
                                    const Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontFamily: "Comfortaa",
                                          color: AppColors.mediumOrangeColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.minute ~/ 10,
                                    ),
                                    TimeContainer(
                                      value: timeStore.currentTime.minute % 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        date,
                                        style: const TextStyle(
                                            fontSize: 25.0,
                                            fontFamily: "Comfortaa",
                                            color: AppColors.mediumOrangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Notes: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Comfortaa",
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 60,
                                            height: 8,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Elapsed time > 60 min",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 60,
                                            height: 8,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "60 min <= Elapsed time >= 30 min",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 60,
                                            height: 8,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Elapsed time < 30 min",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: "Comfortaa",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(children: [
                            Row(
                              children: [
                                for (int i = 0; i < 10; i++)
                                  OrderCard(
                                    screenType: screenType,
                                  ),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  final int value;

  const TimeContainer({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.mediumOrangeColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          '$value',
          style: const TextStyle(
              fontSize: 22.0,
              fontFamily: "Comfortaa",
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
