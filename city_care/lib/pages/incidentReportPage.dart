import 'package:flutter/material.dart';

class IncidentReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report an incident"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Enter title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                textInputAction: TextInputAction.done,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: "Enter Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
