import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'buttom_navigation_bar_class.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
        title: const Text("Seetings Page"),

      ),
    );
  }
}
