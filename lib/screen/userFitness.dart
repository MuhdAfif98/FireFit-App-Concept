import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firefit_app/constant.dart';
import 'package:firefit_app/screen/userProgress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:iconsax/iconsax.dart';

class UserFitness extends StatefulWidget {
  const UserFitness({Key? key}) : super(key: key);

  @override
  State<UserFitness> createState() => _UserFitnessState();
}

class _UserFitnessState extends State<UserFitness> {
  DateTime _selectedValue = DateTime.now();
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Hello",
            style: gFontStyle(14, Colors.black),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "Amara",
            style: gFontStyle(16, mainColor),
          ),
          const SizedBox(
            height: 15,
          ),
          DatePicker(
            DateTime.now(),
            dateTextStyle: gFontStyle(28, Colors.black),
            monthTextStyle: const TextStyle(fontSize: 0),
            initialSelectedDate: DateTime.now(),
            selectionColor: mainColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/bubble.png",
                      color: Colors.white.withOpacity(0.5),
                      scale: 1,
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Image.asset(
                      "assets/run.png",
                      scale: 2.5,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    "Today you run",
                    style: gFontStyle(16, Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "for",
                    style: gFontStyle(16, Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "5.31 km",
                    style: gFontStyle(30, mainColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProgress()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: gradientOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 50),
                        child: Text(
                          "Details",
                          style: gFontStyle(14, Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: gradientMainHorizontal,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [shadowList()]),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Iconsax.pet5,
                            color: Colors.white,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "3680",
                                style: gFontStyle(30, Colors.white),
                              ),
                              Text(
                                "steps",
                                style: gFontStyle(11, greyText),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: greyText,
                        height: 15,
                        thickness: 0.25,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.heart5,
                            color: Colors.white,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("98", style: gFontStyle(30, Colors.white)),
                              Text(
                                "bpm",
                                style: gFontStyle(11, greyText),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: greyText,
                        height: 15,
                        thickness: 0.25,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.flash_15,
                            color: Colors.white,
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "460",
                                style: gFontStyle(30, Colors.white),
                              ),
                              Text(
                                "calories",
                                style: gFontStyle(11, greyText),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Live tracking",
                        style: gFontStyle(11, greyText),
                      ),
                      Image.asset(
                        "assets/live_tracking.png",
                        alignment: Alignment.center,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.transparent,
        dotIndicatorColor: Colors.transparent,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Iconsax.home),
            selectedColor: mainColor2,
            unselectedColor: mainColor2,
          ),

          /// Person
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: mainColor2,
            unselectedColor: mainColor2,
          ),

          /// Time
          DotNavigationBarItem(
            icon: const Icon(Icons.timer_sharp),
            selectedColor: mainColor2,
            unselectedColor: mainColor2,
          ),

          /// Bell
          DotNavigationBarItem(
            icon: const Icon(Icons.ring_volume),
            selectedColor: mainColor2,
            unselectedColor: mainColor2,
          ),

          //  Setting
          DotNavigationBarItem(
            icon: const Icon(Icons.settings),
            selectedColor: mainColor2,
            unselectedColor: mainColor2,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, person, time, bell, setting }
