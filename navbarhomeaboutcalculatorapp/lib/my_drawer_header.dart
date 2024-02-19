import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  bool isSwitched = false;

  void switchPicture() {
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 31, 47, 78),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Set the color to white
              // Use a conditional expression to switch between two pictures
              image: DecorationImage(
                image: isSwitched
                    ? AssetImage('assets/p1.png') // Replace with your image path
                    : AssetImage('assets/p2.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("Profile", style: TextStyle(color: Colors.white, fontSize: 30)),
          Text("Kayiranga420@gmail.com", style: TextStyle(color: Colors.grey[200], fontSize: 14)),
          SizedBox(height: 10),
          GestureDetector(
            onTap: switchPicture,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.switch_account,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Switch Picture',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
