import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/screens/homepage.dart';


class AvailableClasses extends StatefulWidget {
  const AvailableClasses({Key? key}) : super(key: key);

  @override
  State<AvailableClasses> createState() => _AvailableClassesState();
}

class _AvailableClassesState extends State<AvailableClasses> {
  Map<String, dynamic> _getRoutine() {

    Map<String, dynamic> routine={};
    if(Get.arguments != null)
       routine =  Get.arguments;
      
      
    
    //if(routine!=null)
    return routine;
  }
  //Map<String, dynamic> finalRoutine = {};
  //final Map<String, dynamic> finalRoutine = _getRoutine();

  //print(routine.runtimeType)
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _routine = _getRoutine();
    print(_routine.keys);
    var classList = _routine.keys.toList();
    print(classList.runtimeType);
    for (var x in classList) {
      print(x);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(''),
      ),
      //body: Center(child: Text(_getRoutine().length.toString()+_getRoutine().runtimeType.toString())),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 0, 15),
              child: Text(
                'Available Classes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            for (int i = 0; i < _getRoutine().length; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Row(
                  children: [
                    Card(
                      color: Colors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(150)),
                      //elevation: 10,
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            (i+1).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white),
                          ))),
                    ),
                    Card(
                      elevation: 3,
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: (){
                          

                          var className = classList[i];
                          var classDetails = _routine[className];
                          print(classDetails.runtimeType);


                          print(_routine[className]);
                          
                             // ignore: prefer_const_constructors
                             Get.to(() =>  HomePage(),arguments: classDetails);
                             // ignore: prefer_const_constructors
                            // Get.offAll(()=>  HomePage());

                             //get.to

                          
                         

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            classList[i],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
