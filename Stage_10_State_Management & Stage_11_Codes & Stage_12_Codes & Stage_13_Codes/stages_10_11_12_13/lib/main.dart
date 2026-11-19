// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stage10/managers/manager_font_family.dart';
// import 'package:stage10/screens/stage11/Home.dart';
// import 'package:stage10/screens/stage11/Login.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   SharedPreferences pref = await SharedPreferences.getInstance();
//
//   bool loggedin = pref.getBool("loggedin") ?? false;
//
//   String? username = pref.getString("username");
//
//   bool isDark = pref.getBool("isDark") ?? false;
//
//   runApp(MyApp(loggedin: loggedin, username: username, isDark: isDark));
// }
//
// class MyApp extends StatefulWidget {
//   final bool loggedin;
//   final bool isDark;
//   final String? username;
//
//   const MyApp({
//     super.key,
//     required this.loggedin,
//     required this.username,
//     required this.isDark,
//   });
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late bool isDark;
//
//   @override
//   void initState() {
//     super.initState();
//     isDark = widget.isDark;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: ManagerFontFamily.mainFont,
//         brightness: Brightness.light,
//       ),
//       darkTheme: ThemeData(
//         fontFamily: ManagerFontFamily.mainFont,
//         brightness: Brightness.dark,
//       ),
//       themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
//       home: widget.loggedin
//           ? Home(
//               username: widget.username!,
//               onThemeChanged: changeTheme,
//               isDark: isDark,
//             )
//           : Login(onThemeChanged: changeTheme, isDark: isDark),
//     );
//   }
//
//   void changeTheme() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//
//     setState(() {
//       isDark = !isDark;
//     });
//
//     await pref.setBool("isDark", isDark);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Login%20State/provider/auth_provider.dart';
import 'package:stage10/stages/stage13/Login%20State/screens/home_screen.dart';
import 'package:stage10/stages/stage13/Products%20State/screens/products_screen.dart';
import 'package:stage10/stages/stage13/cart%20State/screens/cart_screen.dart';

import 'package:stage10/stages/stage13/counter/screens/counter_screen.dart';

import 'stages/stage13/Login State/screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    return MaterialApp(home: CartScreen());

    // return MaterialApp(home: isLoggedIn? HomeScreen() : LoginScreen());
  }
}
