import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
        title: Text("Info"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Impressum",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, "
                  "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna "
                  "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo "
                  "duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata "
                  "sanctus est Lorem ipsum dolor sit amet.",
            ),
            SizedBox(height: 20),
            Text(
              "Allgemeine Informationen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, "
                  "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna "
                  "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo "
                  "duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata "
                  "sanctus est Lorem ipsum dolor sit amet.",
            ),

          ],
        ),
      ),
    );
  }
}
