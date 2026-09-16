import 'package:flutter/material.dart';
import 'package:stage10/managers/manager_color.dart';
import 'package:stage10/managers/manager_font_family.dart';
import 'package:stage10/managers/manager_strings.dart';
// import 'package:stage10/azkar_screen.dart';
import 'package:stage10/screens/azkar_screen.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterApp();
}

class _CounterApp extends State<CounterApp> {
  int counter = 0;
  String? selectedTheker;
  Color selectdColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: ManagerColor.mainColor,
          title: Text(
            ManagerStrings.title,
            style: TextStyle(
              fontFamily: ManagerFontFamily.mainFont,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),

        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 150,
                color: ManagerColor.mainColor,
                child: Center(
                  child: Text(
                    "المسبحة",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ManagerFontFamily.mainFont,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  "الرئيسية",
                  style: TextStyle(fontFamily: ManagerFontFamily.mainFont),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(
                  "الأذكار",
                  style: TextStyle(fontFamily: ManagerFontFamily.mainFont),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AzkarScreen(
                        onThekerSelected: (theker) {
                          setState(() {
                            selectedTheker = theker;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.info_outline),
                tileColor: selectdColor,
                title: Text(
                  "عن التطبيق",
                  style: TextStyle(fontFamily: ManagerFontFamily.mainFont),
                ),
                onTap: () {
                  setState(() {
                    selectdColor = Colors.blue[300]!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (selectedTheker != null)
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: ManagerColor.mainColor.withValues(
                                alpha: 0.5,
                              ),
                              border: BoxBorder.fromLTRB(
                                right: BorderSide(
                                  color: ManagerColor.mainColor,
                                  width: 2,
                                ),
                                top: BorderSide(
                                  color: ManagerColor.mainColor,
                                  width: 2,
                                ),
                                bottom: BorderSide(
                                  color: ManagerColor.mainColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              selectedTheker!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: ManagerFontFamily.secondryFont,
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: ManagerColor.mainColor,
                            width: 2,
                          ),
                          color: ManagerColor.mainColor.withValues(alpha: 0.5),
                        ),
                        child: Text(
                          "$counter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: ManagerFontFamily.numbersFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                AspectRatio(
                  aspectRatio: 1,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    color: ManagerColor.mainColor.withValues(alpha: 0.5),

                    shape: CircleBorder(
                      side: BorderSide(
                        color: ManagerColor.mainColor,
                        width: 15,
                      ),
                    ),
                  ),
                ),

                MaterialButton(
                  minWidth: 150,
                  height: 30,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  color: ManagerColor.mainColor.withValues(alpha: 0.9),
                  onPressed: () {},
                  child: Text(
                    ManagerStrings.zreo,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ManagerFontFamily.mainFont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
