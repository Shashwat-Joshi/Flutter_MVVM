import 'dart:io';
import 'package:city_care/models/incident.dart';
import 'package:city_care/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class WebService {
  Future<void> saveIncident(Incident incident) async {
    late File file;
    late String fileName;

    if (incident.imageURL != null) {
      file = File(incident.imageURL!);
      fileName = basename(file.path.replaceAll(" ", ""));
    } else {
      throw Exception("Image not selected");
    }

    FormData formData = FormData.fromMap({
      "title": incident.title,
      "description": incident.description,
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    await Dio().post(
      Constant.saveIncidentUrl,
      data: formData,
      options: Options(
        contentType: "application/x-www-form-urlencoded",
      ),
    );
  }

  Future<List<Incident>> getAllIncidents() async {
    final response = await Dio().get(Constant.getAllIncidentsUrl);

    if (response.statusCode == 200) {
      // Successful API call
      final Iterable json = response.data;
      return json.map((incident) => Incident.fromJSON(incident)).toList();
    } else {
      // API call failed
      throw Exception("Incidents not found");
    }
  }
}
