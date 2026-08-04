import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCard();
}

class _UserCard extends State<UserCard> {
  int followersCount = 500;
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EEF5),
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      //   title: Text("User Card"),
      // ),
      body: Center(
        child: Container(
          width: 270,
          height: 350,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsetsGeometry.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("Images/card_pic.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Momen Kraizem",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Mobile App Developer Turning ideas into interactive experiences with Flutter",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 102, 102, 102),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: Color.fromARGB(255, 169, 168, 168),
                                    size: 24,
                                  ),
                                  Text(
                                    followersCount.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.assignment_turned_in_outlined,
                                    color: Color.fromARGB(255, 169, 168, 168),
                                    size: 24,
                                  ),
                                  Text(
                                    "133",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  fixedSize: Size(90, 20),
                                  backgroundColor: isFollowing
                                      ? Color(0xFF47C34F)
                                      : Color(0xFFEFEFEF),
                                  foregroundColor: isFollowing
                                      ? Colors.white
                                      : Colors.black,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  isFollowing
                                      ? followersCount--
                                      : followersCount++;
                                  setState(() {
                                    isFollowing = !isFollowing;
                                  });
                                },
                                child: Text(
                                  isFollowing ? "Unfollow" : "Follow",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
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
