import 'dart:io';
import 'package:camera/camera.dart';
import 'package:city_care/pages/takePicturePage.dart';
import 'package:city_care/view_models/reportIncidentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatefulWidget {
  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
}

class _IncidentReportPageState extends State<IncidentReportPage> {
  late ReportIncidentViewModel _reportIncidentViewModel;

  @override
  void initState() {
    super.initState();
    _reportIncidentViewModel =
        Provider.of<ReportIncidentViewModel>(context, listen: false);
  }

  void _showPhotoAlbum() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _reportIncidentViewModel.imagePath = image == null ? null : image.path;
    });
  }

  void _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePicturePage(camera: camera),
      ),
    );
    setState(() {
      _reportIncidentViewModel.imagePath = result;
    });
  }

  void _showPhotoSelectionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 115,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                _showCamera();
              },
              leading: Icon(Icons.photo_camera),
              title: Text("Take a picture"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                _showPhotoAlbum();
              },
              leading: Icon(Icons.photo),
              title: Text("Select from photo library"),
            ),
          ],
        ),
      ),
    );
  }

  void _saveIncident(BuildContext context) async {
    await _reportIncidentViewModel.saveIncident();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ReportIncidentViewModel>(context);
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
              child: vm.imagePath == null
                  ? Image.asset("images/houston.jpg")
                  : Image.file(
                      File(vm.imagePath.toString()),
                    ),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                _showPhotoSelectionOptions(context);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                "Take picture",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) => vm.title = val,
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
                onChanged: (val) => vm.description = val,
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
                onPressed: () {
                  _saveIncident(context);
                },
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
