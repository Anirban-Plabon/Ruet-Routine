
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/screens/homepages_creens/exam_schedules.dart';
import 'package:routine/screens/homepages_creens/fullroutine.dart';
import 'package:routine/screens/homepages_creens/menus.dart';
import 'homepages_creens/today.dart';


class HomePage extends StatefulWidget {

  // var classDetails = Get.arguments;
  // HomePage(this.classDetails);

  //const HomePage(classDetails,{ Key? key }) : super(key: key);
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
     
  @override
  Widget build(BuildContext context) {

   var classDetails = Get.arguments;  

    return  DefaultTabController(
      //initialIndex: ,
      length: 4,
      child: Scaffold(
          backgroundColor: routine_theme(1, 0),
          appBar: AppBar(
            
            //leadingWidth: 0,
            titleSpacing: 0,
           // flexibleSpace: true,
            //toolbarOpacity: .5,
            //elevation: 0,
            title: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  //Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right:20,left: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 80,
                          //size: MediaQuery.of(context).size.height * .1,
                        ),
                        const Spacer(),
                        // SizedBox(height: 30,),
                        SizedBox(
                          height: 80,
                          // color: Colors.red,
                          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              // Spacer(),
              Chip(
                label: Text('CSE 17 B'),
              ),
            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Container(
                  // alignment: Alignment.bottomCenter,
                   height: 10,
                   color:Colors.transparent
                 ),
                 
                  // Text('\n   CSE 17 B\n'),
                  // Divider(
                  //   color: Colors.white,
                  //   indent: 0,
                  // ),
                ],
              ),
           // toolbarHeight: 50+kToolbarHeight,
            toolbarHeight: MediaQuery.of(context).size.width * .25,
            backgroundColor: routine_theme(0, 900),
            // toolbarHeight: 90,
            bottom: TabBar(
              
                onTap: (index) {
                  print('fuck');
                  print(index);
                },
                isScrollable: false,
                // physics: NeverScrollableScrollPhysics(),
                //indicatorWeight: 10,

                // indicatorColor: routine_theme(1, 0),
                indicatorSize: TabBarIndicatorSize.tab,
                // indicatorColor: Colors.white,
                // indicatorPadding: EdgeInsets.,

                //controller: ,
                //indicatorPadding: const EdgeInsets.all(20),
                indicator: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                // controller: ,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      CommunityMaterialIcons.table,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      CommunityMaterialIcons.table_large,
                      size: 21,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(CommunityMaterialIcons.calendar_multiselect),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(CommunityMaterialIcons.bell),
                  ),*/
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(CommunityMaterialIcons.menu),
                  ),
                ]),
          ),
          body: TabBarView(
            // controller: ,
            //physics: NeverScrollableScrollPhysics(),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Today(classDetails),
              FullRoutine(classDetails),
              ExamSchedules(),
              Menus()
              // _notificatios(),
              //_notificatios(),
              //_menus(),
            ],
          )),
    );
  }
}

// ignore: non_constant_identifier_names
Color? routine_theme(int themeNo, int colorNo) {
    // String color
    switch (themeNo) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.white;
      case 2:
        return Colors.grey[colorNo];
      //break;

      default:
        return Colors.indigo;
    }
  }