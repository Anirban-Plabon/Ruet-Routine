import 'dart:collection';
import 'dart:io';
import 'dart:convert';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:routine/screens/availableclasses.dart';
import 'package:routine/screens/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homepages_creens/today.dart';

class AddRoutine extends StatefulWidget {
  const AddRoutine({Key? key}) : super(key: key);

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  Map<String, dynamic> finalRoutine = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              child: const Icon(
                CommunityMaterialIcons.text_box_plus_outline,
                color: Colors.black26,

                //CommunityMaterialIcons.folder_plus,
                //CommunityMaterialIcons.file_plus,
                size: 105,
              ),
              onTap: () async {
                print('running');
                pickFile();
              },
            ),
            const Chip(
              label: Text(
                'Add Routine',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            )
          ])),
    );
  }

  PlatformFile? pickedFile;

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    uploadFile();
    var _path;
    PlatformFile file;
    //var file;
    if (result != null) {
      file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      _path = file.name;
      _path = _path.toString();
      print(_path);
    } else {
      // User canceled the picker
    }
    sendData(_path);

    //return _path;
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  var url = Uri.parse(
      "http://127.0.0.1:5000/user"); //"http://10.0.2.2:5000/user"); //http://192.168.0.107:5000/go
  void sendData(String? _path) async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        final response =
            await http.post(url, body: json.encode({'excel': _path}));

        getData();
      } catch (er) {
        print(er);
      }
    });
  }

  void getData() async {
    print(url);
    final response = await http.get(url);
    print(response.body);

    //converting the fetched data from json to key value pair that can be displayed on the screen
    var decoded;
    try {
      decoded = json.decode(response.body) as Map<String, dynamic>;
    } catch (er) {
      print(er);
    }
    print(decoded);

    var _routine = decoded['finalPath'];

    print(_routine.runtimeType);

    finalRoutine = _routine;
    print(finalRoutine);
    Get.offAll(() => const AvailableClasses(), arguments: finalRoutine);
    //Get.to(const Today());
  }

  Future get_firebase_data() async {
    CollectionReference _user = FirebaseFirestore.instance.collection('user');
    var x = _user.get();
    var y = x.runtimeType;
    print(y);
  }
}
