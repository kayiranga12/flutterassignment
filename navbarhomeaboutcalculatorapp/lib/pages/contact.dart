// import 'package:flutter/material.dart';
// import 'package:navbarhomeaboutcalculatorapp/main.dart';
// import 'package:navbarhomeaboutcalculatorapp/my_drawer_header.dart';
// import 'package:navbarhomeaboutcalculatorapp/pages/about.dart';
// // import 'package:navbarhomeaboutcalculatorapp/pages/login_page.dart';
// import 'package:navbarhomeaboutcalculatorapp/pages/settings.dart';
// import 'package:navbarhomeaboutcalculatorapp/pages/signin_screen.dart';
// import 'calculator.dart';

// class contactpage extends StatelessWidget {
//   const contactpage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter ',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 94, 165)),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'contact Page'), // Reverted back to MyHomePage
//     );
//   }
// }

// // Add any additional widgets or logic for the AboutPage as needed.

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int myIndex = 0;

//   void _onItemTapped(int index) {
//     // Handle navigation to different pages based on index
//     switch (index) {
//             case 0:
//         // Navigate to the Home page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyApp()),
//         );
//         break;
//       case 1:
//         // Navigate to the About page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AboutPage()),
//         );        break;

//       case 2:
//         // Navigate to the Calculator page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CalculatorPage()),
//         );
//         break;
//            case 3:
//         // Navigate to the Calculator page
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => contactpage()),
//         );
//         break;
//       // Add more cases for other bottom navigation items if needed
//     }
//   }

// Widget MyDrawerList() {
//   return Container(
//     padding: EdgeInsets.only(top: 15),
//     child: Column(
//       // list of menu items
//       children: [
//         menuItem(Icons.home, "Home"),
//         menuItem(Icons.account_circle, "About"),
//         menuItem(Icons.calculate, "Calculator"),
//          menuItem(Icons.contact_emergency, "Contact"),
//         SizedBox(height: 300),

//         menuItem(Icons.settings, "Setting"),
//         menuItem(Icons.logout, "Logout"),
//       ],
//     ),
//   );
// }

//   Widget menuItem(IconData icon, String title) {
//     return Material(
//       child: InkWell(
//         onTap: () {
//           // Add functionality for the menu item here
//           _onMenuItemSelected(title);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Icon(icon, size: 20, color: Colors.black),
//               ),
//               Expanded(
//                 child: Text(
//                   title,
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _onMenuItemSelected(String title) {
//     // Handle navigation or perform actions based on the selected menu item
//     switch (title) {
//             case "Home":
//         // No need to navigate to the Home page since it's already on the Home page
//         break;
//       case "About":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => AboutPage()),
//         );
//         break;

//       case "Calculator":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CalculatorPage()),
//         );
//         break;
//                case "Contact":
//     // No need to navigate to the Home page since it's already on the contact page
//         break;
//       // Add more cases for other menu items as needed
//             case "Setting":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => Settings()),
//         );
//         break;
   
//            case "Logout":
//       // Navigate to the login page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SignInScreen()),
//       );
//       break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Welcome to the contact Page on the App I created by Kayiranga Moise',
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color.fromARGB(255, 31, 47, 78),
//         onTap: _onItemTapped,
//         currentIndex: 0,
//         items: [  
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'About'),
//           BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculator'),
//            BottomNavigationBarItem(icon: Icon(Icons.contact_emergency_rounded), label: 'Contact'),
//         ],
//       ),
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

