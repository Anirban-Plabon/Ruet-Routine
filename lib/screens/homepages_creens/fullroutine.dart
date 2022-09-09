import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullRoutine extends StatefulWidget {
  var classDetails;
  FullRoutine(this.classDetails, {Key? key}) : super(key: key);
  @override
  State<FullRoutine> createState() => _FullRoutineState(classDetails);
}

class _FullRoutineState extends State<FullRoutine> {
  var classDetails;
  _FullRoutineState(this.classDetails);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 70,
                      minWidth: 40,
                    ),
                    child: const Card(
                      child: Center(child: Text('Day')),
                    ),
                  ),
                  _day('SAT'),
                  _day('SUN'),
                  _day('MON'),
                  _day('TUE'),
                  _day('WED'),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // _headerBox(70, 70, Text('Day')),

                          _headerBox(70, 120, '1st', '8.00 AM - 8.50 AM'),
                          _headerBox(70, 120, '2nd', '8.50 AM - 9.40 AM'),
                          _headerBox(70, 120, '3rd', '9.40 AM - 10.30 AM'),
                          _headerBox(70, 120, '4th', '10.50 AM - 11.40 AM'),
                          _headerBox(70, 120, '5th', '11.40 AM - 12.30 AM'),
                          _headerBox(70, 120, '6th', '12.30 AM - 1.20 AM'),
                          _headerBox(70, 120, '7th', '2.30 AM - 3.20 AM'),
                          _headerBox(70, 120, '8th', '3.20 AM - 4.10 AM'),
                          _headerBox(70, 120, '9th', '4.10 AM - 5.00 AM'),
                        ],
                      ),
                      classRow(classDetails['sat']),
                      classRow(classDetails['sun']),
                      classRow(classDetails['mon']),
                      classRow(classDetails['tue']),
                      classRow(classDetails['wed']),

                      // Row(
                      //   children: [
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(
                      //         minHeight: 120,
                      //         minWidth: 120,
                      //       ),
                      //       child: _classCard('CSE 3203', 'NS/FP', '101'),
                      //     ),
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(
                      //         minHeight: 120,
                      //         minWidth: 120,
                      //       ),
                      //       child: Card(),
                      //     ),
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(
                      //         minHeight: 120,
                      //         minWidth: 120,
                      //       ),
                      //       child: Card(),
                      //     ),
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(
                      //         minHeight: 120,
                      //         minWidth: 360,
                      //       ),
                      //       child: Card(),
                      //     ),
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(
                      //         minHeight: 120,
                      //         minWidth: 360,
                      //       ),
                      //       child: Card(),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _day(String? day) {
    String? tempDay = (day![0] + '\n' + day[1] + '\n' + day[2]);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 120,
        minWidth: 40,
      ),
      child: Card(
        child: Center(child: Text(tempDay)),
      ),
    );
  }

  Widget _headerBox(
      double? height, double? width, String? content, String? time) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height!,
        minWidth: width!,
      ),
      child: Card(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                content!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Text(
              time!,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        )),
      ),
    );
  }

  Widget classRow(List dayClasses) {
    print(dayClasses);
    List<Widget> classList = [];
    List classTimes = [
      '8.00 am',
      '8.50 am',
      '9.40 am',
      '10.50 am',
      '11.40 am',
      '12.30 pm',
      '2.30 pm',
      '3.20 pm',
      '4.10 pm'
    ];
    int i = 0;
    int j = 0;
    Widget _constrainBox = ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 120,
        minWidth: 120,
      ),
      //child: Card(),
    );
    while (i < 9 && j < dayClasses.length) {
      if (dayClasses[j]['Class Time'] == classTimes[i]) {
        int? length = 0;
        print(dayClasses[j]['Class Length']);
        //if(dayClasses[j]['Class Length'] != null)
        length = dayClasses[j]['Class Lenght'];
        classList.add(classBox(dayClasses[j]['Class Name'],
            dayClasses[j]['Teacher Name'], dayClasses[j]['Room No'], length!));
        i += length;
        j++;
      } else {
        classList.add(_constrainBox);
        i += 1;
      }
    }
    for (int i = 0; i < dayClasses.length; i++) {
      //if(dayClasses[i]['Class Lenght'])
    }
    return Row(
      children: classList,
    );
  }

  Widget classBox(var className, var teacherName, var roomNo, int classLength) {
    print(classLength);
    print(classLength.runtimeType);
    classLength = classLength * 120;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 120,
        minWidth: classLength.toDouble(),
      ),
      child: Card(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                className,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //const Spacer(flex:2),
            Text(teacherName),
            Text(roomNo),
          ],
        ),
      )),
    );
  }

  Widget _classCard(var className, var teacherName, var roomNo) {
    return Card(
        child: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              className,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //const Spacer(flex:2),
          Text(teacherName),
          Text(roomNo),
        ],
      ),
    ));
  }
}
