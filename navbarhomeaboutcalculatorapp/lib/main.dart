import 'package:flutter/material.dart';
import 'package:navbarhomeaboutcalculatorapp/Provider/provider.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/contact.dart';
import 'package:provider/provider.dart';
import 'pages/about.dart';
import 'pages/calculator.dart';
import 'pages/settings.dart';
import 'package:navbarhomeaboutcalculatorapp/my_drawer_header.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/signin_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>UiProvider()..init(),
      child: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dark Theme',
            //By default theme setting, you can also set system
            // when your mobile theme is dark the app also become dark

            themeMode: notifier.isDark? ThemeMode.dark : ThemeMode.light,

            //Our custom theme applied
            darkTheme: notifier.isDark? notifier.darkTheme : notifier.lightTheme,
          
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 59, 94, 165)),
              useMaterial3: true,
            ),
            // home: const Settings(),
             home: MyHomePage(title: 'Home Page'),
            // home: const WelcomeScreen()
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      myIndex = index;
    });

    switch (index) {
      case 0:
        // Do nothing as it's the current page (Home)
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalculatorPage()),
        );
        break;
        case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactPage()),
        );
        break;
    }
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(Icons.home, "Home"),
          menuItem(Icons.account_circle, "About"),
          menuItem(Icons.calculate, "Calculator"),
          menuItem(Icons.phone, "Contact"),

          SizedBox(height: 300),
          menuItem(Icons.settings, "Setting"),
          menuItem(Icons.logout, "Logout"),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String title) {
    return Material(
      child: InkWell(
        onTap: () {
          _onMenuItemSelected(title);
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(icon, size: 20, color: Colors.black),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuItemSelected(String title) {
    switch (title) {
      case "Home":
        // Do something for Home
        break;

      case "About":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case "Calculator":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Calculator()),
        );
        break;
        case "contact":
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactPage()),
      );
      break;
      case "Setting":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Settings()),
        );
        break;

        case "Logout":
      // Navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 31, 47, 78),
        onTap: _onItemTapped,
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculator'),
          // BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'contact'), 
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}