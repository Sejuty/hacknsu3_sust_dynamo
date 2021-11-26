import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/screens/widget/top_blue_white.dart';

import '../../const.dart';

class patient_profEdit extends StatefulWidget {
  const patient_profEdit({Key? key}) : super(key: key);

  @override
  _patient_profEditState createState() => _patient_profEditState();
}

class _patient_profEditState extends State<patient_profEdit> {
  final _formKey = GlobalKey<FormState>();
  int selected = 0;
  final firstnameeditcontroller = new TextEditingController();
  final lastnameeditcontroller = new TextEditingController();
  final phoneeditcontroller = new TextEditingController();
  final gendereditcontroller = new TextEditingController();
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
//signup Button
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
    //Gender
    final gender = TextFormField(
      autofocus: false,
      controller: gendereditcontroller,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        gendereditcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.male_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Gender",
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
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpNgcfq4rLfyt_su6kmQiT9dtHUZCEatjzPg&usqp=CAU"),
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
                  gender,
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
