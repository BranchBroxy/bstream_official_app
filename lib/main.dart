import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "settings_page.dart";
import "helper_functions.dart";
import 'buttom_navigation_bar_class.dart';

//import 'package:google_fonts/google_fonts.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: "/Settings",
      builder: (context, state) => const Settings(),
    ),
  ],
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //final Color maincolor = const Color(0x2f5327);
  //final Color maincolor = hexToARGB("#ff0033");
  final Color maincolor_1 = const Color.fromARGB(255, 113, 148, 255);
  final Color maincolor_2 = const Color.fromARGB(255, 35, 95, 153);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: buildMaterialColor(maincolor_2),
      ),
      //home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'B-Stream',
          style: TextStyle(fontFamily: "DancingScript"),
          //style: GoogleFonts.getFont('Lato'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Official B-Stream Landing App'),
            ElevatedButton(
              onPressed: () => context.push("/Settings"),
              child: const Text("Go to Settings"),
            ),
            Text('Official B-Stream Landing App'),
            ElevatedButton(
              onPressed: () => context.push("/Settings"),
              child: const Text("Go to Settings"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: custom_bottom_naiv_bar(),
    );
  }
}
