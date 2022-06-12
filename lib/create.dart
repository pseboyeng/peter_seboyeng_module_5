import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController appCategoryController = TextEditingController();
    TextEditingController appNameController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                helperText: 'Enter name of past MTN Biz Awards Winner'
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: appCategoryController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                helperText: 'Enter the App category'
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextField(
            controller: appNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                helperText: 'Enter Name of the App'))),
        ElevatedButton(onPressed: (){}, child: const Text('Add Winner'))
      ],
    );
  }
}
