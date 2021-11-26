import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/screens/widget/top_blue_white.dart';

import '../../const.dart';

class doctor_profEdit extends StatefulWidget {
  const doctor_profEdit({Key? key}) : super(key: key);

  @override
  _doctor_profEditState createState() => _doctor_profEditState();
}

class _doctor_profEditState extends State<doctor_profEdit> {
  final _formKey = GlobalKey<FormState>();
  int selected = 0;
  final firstnameeditcontroller = new TextEditingController();
  final lastnameeditcontroller = new TextEditingController();
  final specialityeditcontroller = new TextEditingController();
  final qualificatioditcontroller = new TextEditingController();
  final phoneeditcontroller = new TextEditingController();
  final practicehospitaleditcontroller = new TextEditingController();
  final avalableeditcontroller = new TextEditingController();
  final zoomeditcontroller = new TextEditingController();
  var currentPage = 0;
  var pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    //First Name
    final firstName = TextFormField(
      autofocus: false,
      controller: firstnameeditcontroller,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstnameeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    //Second Name
    final lstname = TextFormField(
      autofocus: false,
      controller: lastnameeditcontroller,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        lastnameeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
//speciality
    final speciality = TextFormField(
      autofocus: false,
      controller: specialityeditcontroller,
      keyboardType: TextInputType.multiline,
      onSaved: (value) {
        specialityeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Speciality",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
//qualification
    final qualification = TextFormField(
      autofocus: false,
      controller: qualificatioditcontroller,
      keyboardType: TextInputType.multiline,
      onSaved: (value) {
        qualificatioditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.auto_stories_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Qualification",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

//Practice Hospital
    final practHospital = TextFormField(
      autofocus: false,
      controller: practicehospitaleditcontroller,
      keyboardType: TextInputType.streetAddress,
      onSaved: (value) {
        practicehospitaleditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_balance_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Practice Hospital",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
//Save Button
    final saveButton = Material(
      child: ElevatedButton(
        child: const Center(
            child: Text(
          "Save",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        )),
        onPressed: () {
          setState(() {
            selected = 0;
          });
          if (_formKey.currentState!.validate()) {
            print('valid');
          } else {
            print('invalid');
          }
        },
      ),
    );
    //Phone
    final phnField = TextFormField(
      autofocus: false,
      controller: phoneeditcontroller,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        phoneeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
    //Availabe
    final availableOn = TextFormField(
      autofocus: false,
      controller: avalableeditcontroller,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        avalableeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.assignment_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Available On",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
//zoom
    final zoom = TextFormField(
      autofocus: false,
      controller: zoomeditcontroller,
      keyboardType: TextInputType.url,
      onSaved: (value) {
        zoomeditcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.video_camera_front_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Zoom Link",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );

    return TopBlueWhitePage(
      topWidget: CircleAvatar(
        backgroundColor: Colors.white,
        radius: screenW * .15,
        backgroundImage: NetworkImage(
            "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?size=338&ext=jpg"),
      ),
      bottomWidget: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Edit Profile",
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[400])),
                  SizedBox(height: 20),
                  firstName,
                  SizedBox(height: 20),
                  lstname,
                  SizedBox(height: 20),
                  speciality,
                  SizedBox(height: 20),
                  qualification,
                  SizedBox(height: 20),
                  practHospital,
                  SizedBox(height: 20),
                  availableOn,
                  SizedBox(height: 20),
                  zoom,
                  SizedBox(height: 20),
                  phnField,
                  SizedBox(height: 20),
                  saveButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
