import 'package:flutter/material.dart';
import 'package:newpp/contactA.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController contactControler = TextEditingController();

  List<ContactA> contacts = List.empty(growable: true);

  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        titleSpacing: 10.0,
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameControler,
              decoration: const InputDecoration(
                  hintText: 'your number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: contactControler,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: 'Dial Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameControler.text.trim();
                      String contact = contactControler.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameControler.text = '';
                          contactControler.text = '';
                          contacts.add(ContactA(name: name, contact: contact));
                        });
                      }
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String name = nameControler.text.trim();
                      String contact = contactControler.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameControler.text = '';
                          contactControler.text = '';
                          contacts[selectedindex].name = name;
                          contacts[selectedindex].contact = contact;
                          selectedindex = -1;
                        });
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            contacts.isEmpty
                ? Text(
                    'no contacts are avilable',
                    style: TextStyle(fontSize: 25, color: Colors.grey[800]),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor:
                index % 2 == 0 ? Colors.grey[800] : Colors.blueAccent,
            foregroundColor: Colors.white,
            child: Text(
              contacts[index].name[0],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              contacts[index].contact,
            ),
          ],
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            children: [
              InkWell(
                onTap: (() {
                  nameControler.text = contacts[index].name;
                  contactControler.text = contacts[index].contact;
                  setState(() {
                    selectedindex = index;
                  });
                }),
                child: const Icon(
                  Icons.edit,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: (() {
                    setState(() {
                      contacts.removeAt(index);
                    });
                  }),
                  child: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
