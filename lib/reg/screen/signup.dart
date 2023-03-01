import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:registeration_task/consts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

const double width = 400.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;
bool isphone = false;

class _SignupState extends State<Signup> {
  double xAlign = loginAlign;
  Color loginColor = selectedColor;
  Color signInColor = normalColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Consts.fillColor,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      constraints:
                          const BoxConstraints(maxHeight: 100, maxWidth: 100),
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Create new account',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(165, 158, 236, 1)),
            ),

            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please fill the form to continue!',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(126, 126, 126, 1)),
            ),
            const SizedBox(
              height: 70,
            ),
            // t
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(243, 241, 254, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment: Alignment(xAlign, 0),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      width: width * 0.5,
                      height: height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(218, 183, 222, 1),
                              Color.fromRGBO(170, 160, 232, 1),
                            ],
                            stops: [
                              0.0,
                              1.0
                            ],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                            tileMode: TileMode.repeated),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = loginAlign;
                        loginColor = selectedColor;
                        signInColor = normalColor;
                        isphone = false;
                      });
                    },
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: Container(
                        width: width * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'By Email',
                          style: TextStyle(
                            color: loginColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        xAlign = signInAlign;
                        signInColor = selectedColor;
                        loginColor = normalColor;
                        isphone = true;
                      });
                    },
                    child: Align(
                      alignment: const Alignment(1, 0),
                      child: Container(
                        width: width * 0.5,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          'By Phone number',
                          style: TextStyle(
                            color: signInColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'User name',
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(86, 86, 86, 1)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromRGBO(243, 241, 254, 1),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color.fromRGBO(153, 150, 241, 1),
                    ),
                    labelText: "User name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Colors.grey), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Text(
              isphone ? 'Phone No.' : 'Email/User name',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromRGBO(86, 86, 86, 1)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: isphone
                  ? TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: const Color.fromRGBO(243, 241, 254, 1),
                          prefixIcon: const Icon(
                            Icons.phone_iphone,
                            color: Color.fromRGBO(153, 150, 241, 1),
                          ),
                          labelText: "963953658032",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.grey), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          )))
                  : TextField(
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: const Color.fromRGBO(243, 241, 254, 1),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color.fromRGBO(153, 150, 241, 1),
                          ),
                          labelText: "E-mail",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.grey), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'password',
              style:
                  TextStyle(fontSize: 20, color: Color.fromRGBO(86, 86, 86, 1)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: const Color.fromRGBO(243, 241, 254, 1),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromRGBO(153, 150, 241, 1),
                    ),
                    labelText: "********",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Colors.grey), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(229, 209, 231, 1),
                      Color.fromRGBO(153, 150, 241, 1),
                    ],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
