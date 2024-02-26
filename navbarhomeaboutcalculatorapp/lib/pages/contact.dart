import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    if (await Permission.contacts.request().isGranted) {
      // Get all contacts
      final Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    } else {
      // Handle the case when permission is denied
      print("Contacts permission denied");
    }
  }

  void _callContact(Contact contact) async {
    final phoneNumber = contact.phones?.first.value;

    if (phoneNumber != null && await canLaunch("tel:$phoneNumber")) {
      await launch("tel:$phoneNumber");
    } else {
      print("Could not launch phone call");
    }
  }

  void _sendMessageToContact(Contact contact) async {
    final phoneNumber = contact.phones?.first.value;

    if (phoneNumber != null) {
      final message = "Your SMS message here";
      final uri = Uri.encodeFull("sms:$phoneNumber?body=$message");

      try {
        await launch(uri);
      } catch (e) {
        print("Error launching messaging app: $e");
      }
    } else {
      print("Phone number not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Contact',
            style: TextStyle(
              // color: const Color.fromARGB(255, 33, 65, 243), // Set the title color to blue
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.png'), 
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            final contact = _contacts[index];
            return Card(
              color: Colors.white70,
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  contact.displayName ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  contact.phones?.isNotEmpty == true
                      ? contact.phones!.first.value!
                      : 'No phone number',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.phone, color: Colors.blue),
                      onPressed: () => _callContact(contact),
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: Colors.green),
                      onPressed: () => _sendMessageToContact(contact),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
