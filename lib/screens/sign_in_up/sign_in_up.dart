import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacknsu3_sust_dynamo/const.dart';
import 'package:hacknsu3_sust_dynamo/screens/patient_home/dashboard.dart';
import 'package:lottie/lottie.dart';

class SignInUp extends StatefulWidget {
  const SignInUp({Key? key}) : super(key: key);

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {
  var currentPage = 0;
  var pageViewController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
// SvgPicture.asset("assets/images/background.svg"),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await pageViewController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutCubic,
                        );
                        setState(() {
                          currentPage = 0;
                        });
                      },
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: currentPage == 0
                                ? textColor.withOpacity(1.0)
                                : textColor.withOpacity(0.6)),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await pageViewController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutCubic);
                        setState(() {
                          currentPage = 1;
                        });
                      },
                      child: Text(
                        'Sign up',
                        style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            color: currentPage == 1
                                ? textColor.withOpacity(1.0)
                                : textColor.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  // height: screenH * .85,
                  child: PageView(
                    controller: pageViewController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SignIn(),
                      SignUp(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            //ToDo: navigate to patient sign up
          },
          child: Container(
              height: screenH * .40,
              width: screenH * .40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      // color: Color.fromRGBO(0, 119, 182, 0.6),
                      color: const Color(0xff0077B6).withOpacity(.3),
                      offset: const Offset(3, 3),
                      blurRadius: 6),
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: LottieBuilder.network(
                      "https://assets6.lottiefiles.com/packages/lf20_ErlWV1.json",
                      reverse: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Expanded(flex: 1, child: Text("Sign Up as Patient"))
                ],
              )),
        ),
        InkWell(
          onTap: () {
            // navigate to doctor sign up
          },
          child: Container(
              height: screenH * .40,
              width: screenH * .40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      // color: Color.fromRGBO(0, 119, 182, 0.6),
                      color: const Color(0xff0077B6).withOpacity(.3),
                      offset: const Offset(3, 3),
                      blurRadius: 6),
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LottieBuilder.network(
                    "https://assets5.lottiefiles.com/packages/lf20_be0l7A.json",
                    fit: BoxFit.cover,
                  ),
                  const Text("Sign Up as Doctor")
                ],
              )),
        ),
      ],
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  var textEditingControllerUsername = TextEditingController();
  var textEditingControllerPassword = TextEditingController();
  int selected = 0;
  void signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: textEditingControllerUsername.text,
                password: textEditingControllerPassword.text)
            .then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenH * .2,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: screenW * 0.8,
              // height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      // color: Color.fromRGBO(0, 119, 182, 0.6),
                      color: const Color(0xff0077B6).withOpacity(.3),
                      offset: selected == 1 ? Offset(3, 3) : Offset(0, 0),
                      blurRadius: selected == 1 ? 6 : 2),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  controller: textEditingControllerUsername,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: const Icon(
                      Icons.person,
                      color: textColor,
                    ),
                    hintText: 'Username',
                    hintStyle: GoogleFonts.roboto(
                      fontSize: 12.0,
                      letterSpacing: 1.5,
                      color: textColor,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter user name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenH * .05,
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: screenW * 0.8,
                // height: 40,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          // color: Color.fromRGBO(0, 119, 182, 0.4),
                          // color: const Color(0xff003757),
                          color: const Color(0xff0077B6).withOpacity(.3),
                          offset: selected == 2 ? Offset(3, 3) : Offset(0, 0),
                          blurRadius: selected == 2 ? 9 : 2)
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Center(
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          selected = 2;
                        });
                      },
                      controller: textEditingControllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.lock,
                          color: textColor,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 12.0,
                            letterSpacing: 1.5,
                            // height: 1.5,
                            color: textColor.withOpacity(1.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be 6 character';
                        }
                        return null;
                      },
                    ),
                  ),
                )),
            SizedBox(
              height: screenH * .05,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selected = 0;
                });
                signIn();
              },
              child: SizedBox(
                height: 40,
                width: screenW * 0.8,
                child: Center(child: Text('Sign in')),
              ),
            ),
            SizedBox(
              height: screenH * .1,
            ),
          ],
        ),
      ),
    );
  }
}
