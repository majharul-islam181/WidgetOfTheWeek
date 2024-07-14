// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  String name = '';

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString("Name") ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preference'),
        elevation: 20,
      ),
      body: Center(
        child: Column(
          children: [
            Text(name.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();

          // sp.setInt('age', 22);
          // sp.setDouble('kg', 70.0);
          // sp.setString('Name', 'Majharul Islam');
          // sp.setBool('isLogin', false);

          sp.remove('Name');
          // sp.setString('Name', "Updated Name 2");

          name = sp.getString('Name') ?? 'No Name';

          setState(() {});
          // print(sp.getString('Name'));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
