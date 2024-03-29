  import 'package:flutter/material.dart';
  import 'package:navbarhomeaboutcalculatorapp/main.dart';
  import 'package:navbarhomeaboutcalculatorapp/my_drawer_header.dart';
  import 'package:navbarhomeaboutcalculatorapp/pages/about.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/contact.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/settings.dart';
import 'package:navbarhomeaboutcalculatorapp/pages/signin_screen.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}


  class _CalculatorState extends State<Calculator> {
    dynamic text = '0';
    double numOne = 0;
    double numTwo = 0;
    dynamic result = '';
    dynamic finalResult = '';
    dynamic opr = '';
    dynamic preOpr = '';

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        // list of menu items
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
            // Add functionality for the menu item here
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
      // Handle navigation or perform actions based on the selected menu item
      switch (title) {
        case "Home":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
          break;
        case "About":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
          break;
      
        case "Calculator":

          break;
           case "Contact":
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactPage()),
          );
          break;
        // Add more cases for other menu items as needed
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
      return WillPopScope(
        onWillPop: () async {
          // Handle back button press
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
          return false; // Return false to prevent default back button behavior
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Standard Calculator'),
            backgroundColor: Color.fromARGB(255, 59, 94, 165),
            // Replace the back button with a drawer
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          // Add a drawer to the Scaffold
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                MyHeaderDrawer(),
                  MyDrawerList(),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            text,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          Text(
                            opr,
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.grey, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcbutton('AC', Colors.grey, Colors.black),
                    calcbutton('+/-', Colors.grey, Colors.black),
                    calcbutton('%', Colors.grey, Colors.black),
                    calcbutton('/', Color.fromARGB(255, 31, 47, 78), const Color.fromARGB(255, 1, 1, 1)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcbutton('7', Colors.grey[850]!, const Color.fromARGB(255, 14, 13, 13)),
                    calcbutton('8', Colors.grey[850]!, const Color.fromARGB(255, 8, 8, 8)),
                    calcbutton('9', Colors.grey[850]!, const Color.fromARGB(255, 5, 5, 5)),
                    calcbutton('x', Color.fromARGB(255, 31, 47, 78), const Color.fromARGB(255, 5, 5, 5)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcbutton('4', Colors.grey[850]!, const Color.fromARGB(255, 5, 5, 5)),
                    calcbutton('5', Colors.grey[850]!, const Color.fromARGB(255, 5, 5, 5)),
                    calcbutton('6', Colors.grey[850]!, const Color.fromARGB(255, 5, 5, 5)),
                    calcbutton('-', const Color.fromARGB(255, 31, 47, 78), const Color.fromARGB(255, 4, 4, 4)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    calcbutton('1', Colors.grey[850]!, const Color.fromARGB(255, 7, 7, 7)),
                    calcbutton('2', Colors.grey[850]!, const Color.fromARGB(255, 9, 9, 9)),
                    calcbutton('3', Colors.grey[850]!, const Color.fromARGB(255, 4, 4, 4)),
                    calcbutton('+', const Color.fromARGB(255, 31, 47, 78), const Color.fromARGB(255, 4, 4, 4)),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        calculation('0');
                      },
                      style: TextButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                        backgroundColor: Colors.grey[850],
                      ),
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 35, color: const Color.fromARGB(255, 1, 1, 1)),
                      ),
                    ),
                    calcbutton('.', Colors.grey[850]!, const Color.fromARGB(255, 9, 9, 9)),
                    calcbutton('=', Colors.grey[700]!, const Color.fromARGB(255, 18, 18, 18)),
                  ],
                ),
                SizedBox(height: 20,), // Add space between calculator and BottomNavigationBar
                // Bottom navigation bar
                BottomNavigationBar(
                  backgroundColor: Colors.grey[700],
                  selectedItemColor: Colors.white, // Set the color for the selected item (icons and text)
                  unselectedItemColor: Colors.white, // Set the color for unselected items (icons and text)
                  onTap: _onItemTapped,
                  currentIndex: 2, // Set the current index to 2 for Calculator
                  items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculator'),
            // BottomNavigationBarItem(icon: Icon(Icons.contact_emergency_rounded), label: 'Contact'),

                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
      return Container(
        child: ElevatedButton(
          onPressed: () {
            calculation(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(
              fontSize: 35,
              color: txtcolor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            // primary: btncolor,
            padding: EdgeInsets.all(20),
          ),
        ),
      );
    }

    void calculation(btnText) {
      if (btnText == 'AC') {
        text = '0';
        numOne = 0;
        numTwo = 0;
        result = '';
        finalResult = '0';
        opr = '';
        preOpr = '';
      } else if (opr == '=' && btnText == '=') {
        if (preOpr == '+') {
          finalResult = add();
        } else if (preOpr == '-') {
          finalResult = sub();
        } else if (preOpr == 'x') {
          finalResult = mul();
        } else if (preOpr == '/') {
          finalResult = div();
        }

        opr = '';
        numTwo = 0;
      } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
        if (numOne == 0) {
          numOne = double.parse(result);
        } else {
          numTwo = double.parse(result);
        }

        if (opr == '+') {
          finalResult = add();
        } else if (opr == '-') {
          finalResult = sub();
        } else if (opr == 'x') {
          finalResult = mul();
        } else if (opr == '/') {
          finalResult = div();
        }
        preOpr = opr;
        opr = btnText;
        result = '';
      } else if (btnText == '%') {
        result = numOne / 100;
        finalResult = doesContainDecimal(result);
      } else if (btnText == '.') {
        if (!result.toString().contains('.')) {
          result = result.toString() + '.';
        }
        finalResult = result;
      } else if (btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1) : result = '-' + result.toString();
        finalResult = result;
      } else {
        result = result + btnText;
        finalResult = result;
      }

      setState(() {
        text = finalResult;
      });
    }

    String add() {
      result = (numOne + numTwo).toString();
      numOne = double.parse(result);
      return doesContainDecimal(result);
    }

    String sub() {
      result = (numOne - numTwo).toString();
      numOne = double.parse(result);
      return doesContainDecimal(result);
    }

    String mul() {
      result = (numOne * numTwo).toString();
      numOne = double.parse(result);
      return doesContainDecimal(result);
    }

    String div() {
      result = (numOne / numTwo).toString();
      numOne = double.parse(result);
      return doesContainDecimal(result);
    }

    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) return result = splitDecimal[0].toString();
      }
      return result;
    }

    void _onItemTapped(int index) {
      // Handle navigation to different pages based on index
      switch (index) {
                case 0:
          // Navigate to the Home page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
          break;
        case 1:
          // Navigate to the About page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
          break;

        case 2:
          // No need to navigate to the Calculator page as it's already the current page
          break;
          // case 3:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ContactPage()),
          // );
          // break;
        // Add more cases for other bottom navigation items if needed
      }
    }
  }
