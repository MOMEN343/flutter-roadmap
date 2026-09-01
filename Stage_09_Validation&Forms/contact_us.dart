// import 'package:flutter/material.dart';
// import 'package:stage07/managers/text_form_field_style.dart';
// import 'package:stage07/screens/login_screen.dart';
// 
// class ContactUs extends StatefulWidget {
//   const ContactUs({super.key});
// 
//   @override
//   State<ContactUs> createState() => _ContactUs();
// }
// 
// class _ContactUs extends State<ContactUs> {
//   bool checkBoxStatus = true;
//   bool obscurePassword = true;
//   GlobalKey<FormState> formkey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xFFF4F2F0),
//         body: SafeArea(
//           child: Container(
//             padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     child: Center(
//                       child: Column(
//                         spacing: 0,
//                         children: [
//                           Container(
//                             width: 170,
//                             height: 120,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage("Images/logo.jpg"),
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           ),
// 
//                           Column(
//                             children: [
//                               Text(
//                                 "Contact US",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
// 
//                               Text(
//                                 "Enter the fields below to contact us",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color.fromARGB(255, 142, 141, 140),
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
// 
//                   Container(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       spacing: 0,
//                       children: [
//                         //TextFeilds
//                         Form(
//                           key: formkey,
//                           child: Column(
//                             spacing: 10,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Name",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13,
//                                     ),
//                                   ),
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return "Can't be Empty";
//                                       } else if (value.length > 30) {
//                                         return "Name is too long";
//                                       }
// 
//                                       return null;
//                                     },
//                                     decoration: TextFormFieldStyle
//                                         .inputDecoration
//                                         .copyWith(hintText: "Enter Your Name"),
//                                   ),
//                                 ],
//                               ),
// 
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Email",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13,
//                                     ),
//                                   ),
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return "Can't be empty";
//                                       } else if (!value.contains("@") ||
//                                           !value.contains(".com")) {
//                                         return "Enter a valid Email";
//                                       }
// 
//                                       return null;
//                                     },
//                                     decoration:
//                                         TextFormFieldStyle.inputDecoration,
//                                   ),
//                                 ],
//                               ),
// 
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Message",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 150,
//                                     child: TextFormField(
//                                       maxLines: 5,
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return "Can't be Empty";
//                                         } else if (value.length > 400) {
//                                           return "Message can't exceed 400 characters";
//                                         }
// 
//                                         return null;
//                                       },
//                                       decoration: TextFormFieldStyle
//                                           .inputDecoration
//                                           .copyWith(
//                                             hintText: "Enter Your message",
//                                           ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
// 
//                         //Remember me and forget pass
//                         Container(
//                           margin: EdgeInsets.only(top: 20),
//                           width: double.infinity,
//                           height: 45,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: WidgetStateProperty.resolveWith((
//                                 states,
//                               ) {
//                                 if (states.contains(WidgetState.pressed) ||
//                                     states.contains(WidgetState.hovered)) {
//                                   return Color.fromARGB(255, 156, 155, 153);
//                                 }
//                                 return Color(0xFFFB5414);
//                               }),
//                             ),
// 
//                             onPressed: () {
//                               if (formkey.currentState!.validate()) {
//                                 Navigator.of(context).pushReplacement(
//                                   MaterialPageRoute(
//                                     builder: (context) => LoginScreen(),
//                                   ),
//                                 );
//                               }
//                             },
//                             child: Text(
//                               "Send",
//                               style: TextStyle(
//                                 fontWeight: FontWeight(500),
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
