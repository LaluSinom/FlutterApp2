import 'package:fluttercrud/models/requests/all_request_Event_model.dart';
import 'package:fluttercrud/models/response/another_response_model.dart';
import 'package:fluttercrud/models/response/get_event_response_model.dart';
import 'package:http/http.dart' as http;

class EventRemoteDatasource {
  Future<GetEventResponseModel> getEvent() async {
    final url = Uri.parse("http://localhost/be-mobile/event/getEvent.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GetEventResponseModel.fromRawJson(response.body);
    } else {
      throw Exception("Failed to load Event. Status code: ${response.statusCode}");
    }
  }

  Future<AnotherResponseModel> addEvent(AllRequestEventModel model) async {
    final url = Uri.parse("http://localhost/be-mobile/event/createEvent.php");
    final response = await http.post(url,
      body: model.toRawJson(),
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return AnotherResponseModel.fromRawJson(response.body);
    } else {
      throw Exception("Failed to add Event. Status code: ${response.statusCode}");
    }
  }

  Future<AnotherResponseModel> updateEvent(AllRequestEventModel model) async {
    final url = Uri.parse("http://localhost/be-mobile/event/updateEvent.php");
    final response = await http.post(url,
      body: model.toRawJson(), 
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return AnotherResponseModel.fromRawJson(response.body);
    } else {
      throw Exception("Failed to update Event. Status code: ${response.statusCode}");
    }
  }

  Future<AnotherResponseModel> deleteEvent(AllRequestEventModel model) async {
    final url = Uri.parse("http://localhost/be-mobile/event/deleteEvent.php");
    final response = await http.post(url,
      body: model.toRawJson(), 
      headers: {'Content-Type': 'application/json'}
    );

    if (response.statusCode == 200) {
      return AnotherResponseModel.fromRawJson(response.body);
    } else {
      throw Exception("Failed to delete Event. Status code: ${response.statusCode}");
    }
  }
}
