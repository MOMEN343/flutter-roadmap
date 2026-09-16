import 'package:flutter/material.dart';
import 'package:stage10/managers/manager_color.dart';
import 'package:stage10/managers/manager_font_family.dart';
import 'package:stage10/screens/counter_app.dart';

class AzkarScreen extends StatefulWidget {
  final Function(String?) onThekerSelected;

  const AzkarScreen({super.key, required this.onThekerSelected});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<String> azkar = [
    "بدون  ذكر معين",
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "أستغفر الله",
  ];
  void addZekr() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              "إضافة ذكر",
              style: TextStyle(fontFamily: ManagerFontFamily.mainFont),
            ),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "اكتب الذكر"),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("إلغاء"),
              ),
              TextButton(
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      azkar.add(controller.text.trim());
                    });

                    Navigator.pop(context);
                  }
                },
                child: const Text("إضافة"),
              ),
            ],
          ),
        );
      },
    );
  }

  void deleteZekr(int index) {
    setState(() {
      azkar.removeAt(index);
    });
  }

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
            "الأذكــــــــــــــار",
            style: TextStyle(
              color: Colors.white,
              fontFamily: ManagerFontFamily.mainFont,
            ),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ManagerColor.mainColor,
          onPressed: addZekr,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: azkar.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: ManagerColor.mainColor.withValues(alpha: 0.5),
                border: Border.all(color: ManagerColor.mainColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                onTap: () {
                  if (index == 0) {
                    widget.onThekerSelected(null);
                    Navigator.of(context).pop();
                  } else {
                    widget.onThekerSelected(azkar[index]);
                    Navigator.of(context).pop();
                  }
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: index == 0 ? 0 : 5,
                ),
                title: Text(
                  azkar[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: ManagerFontFamily.secondryFont,
                    fontSize: 22,
                  ),
                ),

                trailing: IconButton(
                  onPressed: () {
                    deleteZekr(index);
                  },
                  icon: index != 0
                      ? Icon(Icons.delete_outline, color: Colors.white)
                      : Icon(null),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
