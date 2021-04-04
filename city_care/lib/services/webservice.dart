import 'package:city_care/models/incident.dart';
import 'package:city_care/utils/constants.dart';
import 'package:dio/dio.dart';

class WebService {
  Future<void> saveIncident(Incident incident) async {
    await Dio().post(
      Constant.saveIncidentUrl,
      data: {
        "title": incident.title,
        "description": incident.description,
      },
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
