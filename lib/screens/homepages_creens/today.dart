import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

int? navIndex = 0;
var seletedDay = 'sat';
List? day = [];

class Today extends StatefulWidget {
  var classDetails;
  Today(this.classDetails, {Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState(classDetails);
}

class _TodayState extends State<Today> {
  var classDetails;
  _TodayState(this.classDetails);

  @override
  Widget build(BuildContext context) {
    setState(() {
      day = classDetails[seletedDay];
    });
    //day=classDetails[seletedDay];
    print(classDetails);

    //var dayColor=Colors.black26;

    Color dayColor(var day) {
      if (day == seletedDay) {
        return Colors.black26;
      } else {
        return Colors.black12;
      }
    }

    //return _today(classDetails);

    return LayoutBuilder(
      builder: (context, constraint) {
        print(classDetails.runtimeType);
        var dayList = classDetails.keys.toList();

        List? days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed'];

        //String ?  x = 'fuck';
        return Row(
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      height: 60,
                      width: 90,
                      color: Colors.black,
                      child: const Center(
                          child: Text('Day',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: Container(
                      height: 3,
                      width: 90,
                      color: Colors.black,
                    )),
                //for(int i=0;i<5;i++)
                for (var i in dayList)
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            day = classDetails[i];
                            seletedDay = i;

                            // pressedText = "change Text"
                          });

                          //print(i);
                          // day=classDetails[i];
                          // print(day!.length);
                          // print(day![0]);
                        },
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                          height: 60,
                          width: 60,
                          //color: Colors.black12,
                          decoration: BoxDecoration(
                              color: dayColor(i),
                              //border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(60)
                              // borderRadius: BorderRadius.only())
                              ),
                          child: Center(
                            child: Text(
                              i,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ))
              ],
            ),
            Expanded(
                child: Container(
              // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < day!.length; i++) _classCard(i, day![i])
                  ],
                ),
              ),
            )),
          ],
        );
      },
    );
  }
}

Widget _classCard(int i, var cls) {
  print(cls);
  return Card(
    color: routine_theme(1, 850),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Padding(
      padding: const EdgeInsets.all(0),
      // padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
            inkWellBorderRadius: BorderRadius.circular(15),
            iconColor: routine_theme(0, 900),
            iconPlacement: ExpandablePanelIconPlacement.right),
        //hasSize:
        header: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20,),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 10, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  //maxRadius: 20,
                  //minRadius: 10,
                  backgroundColor: routine_theme(0, 900),

                  //radius: 0,
                  child: Text((i + 1).toString()),
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //isLab(false),
                    Text(cls['Class Time']),
                    Divider(
                      thickness: 1,
                      color: routine_theme(0, 900),
                    ),
                    Chip(
                      label: Text(
                        cls['Class Name'],
                        style: TextStyle(
                            color: routine_theme(0, 900),
                            fontWeight: FontWeight.bold),
                      ),
                      elevation: 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Teacher: ' + cls['Teacher Name'],
                      style: TextStyle(
                        color: routine_theme(0, 900),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Room No: ' + cls['Room No'],
                      style: TextStyle(
                        color: routine_theme(0, 900),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    isLab(cls['Class Lenght']),
                  ],
                )),
          ],
        ),

        collapsed: const SizedBox(
          height: 0,
        ),

        expanded: Container(
          height: 100,
          color: Colors.greenAccent,
        ),
      ),
    ),
  );
}

Widget isLab(var classLenght) {
  if (classLenght == 3) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          color: routine_theme(0, 900),
        ),
        Chip(
          label: Text(
            'Lab',
            style: TextStyle(
                color: routine_theme(0, 900), fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
      ],
    );
  } else {
    return const SizedBox(
      height: 10,
    );
  }
}

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
