import 'package:flutter/material.dart';
import 'package:stage07/managers/text_form_field_style.dart';
import 'package:stage07/screens/home_screen.dart';
import 'package:stage07/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool checkBoxStatus = true;
  bool obscurePassword = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF4F2F0),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Logo & Welcome texts
                  Center(
                    child: Column(
                      spacing: 0,
                      children: [
                        Container(
                          width: 170,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("Images/logo.jpg"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Text(
                              "Welcome to Pippino Pizza",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),

                            Text(
                              "Peppino Pizza handcrafted, and always delicious",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 142, 141, 140),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Form
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 0,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            spacing: 10,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),

                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Can't be empty";
                                      } else if (!value.contains("@") ||
                                          !value.contains(".com")) {
                                        return "Enter a valid Email";
                                      }
                                    },
                                    decoration:
                                        TextFormFieldStyle.inputDecoration,
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextFormField(
                                    obscureText: obscurePassword,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Can't be Empty";
                                      } else if (value.length < 6) {
                                        return "Password long can't be less than 6";
                                      }
                                    },
                                    decoration: TextFormFieldStyle
                                        .inputDecoration
                                        .copyWith(
                                          hintText: "Enter your Password",
                                          suffixIconColor: Color.fromARGB(
                                            255,
                                            182,
                                            180,
                                            179,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                obscurePassword =
                                                    !obscurePassword;
                                              });
                                            },
                                            icon: Icon(
                                              obscurePassword
                                                  ? Icons
                                                        .visibility_off_outlined
                                                  : Icons.visibility_outlined,
                                            ),
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        //Remember me and forget pass
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: checkBoxStatus,
                                    onChanged: (value) {
                                      setState(() {
                                        checkBoxStatus = value!;
                                      });
                                    },
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Color(0xFFFB5414),
                                    side: BorderSide(color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Remember me",
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          146,
                                          144,
                                          144,
                                        ),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerRight,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Color(0xFFFB5414),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.pressed) ||
                                    states.contains(WidgetState.hovered)) {
                                  return Color.fromARGB(255, 156, 155, 153);
                                }
                                return Color(0xFFFB5414);
                              }),
                            ),

                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight(500),
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Color.fromARGB(255, 156, 155, 153),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "Or continue with",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 155, 153),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Color.fromARGB(255, 156, 155, 153),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),

                            child: Column(
                              spacing: 0,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,

                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.flutter_dash),
                                      color: const Color.fromARGB(
                                        255,
                                        0,
                                        97,
                                        176,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.apple),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.facebook),
                                      color: Color(0xFF414F9E),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: EdgeInsetsGeometry.only(top: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            156,
                                            155,
                                            153,
                                          ),

                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,

                                          alignment: Alignment.centerRight,
                                        ),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Sign in",
                                            style: TextStyle(
                                              color: Color(0xFFFB5414),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
