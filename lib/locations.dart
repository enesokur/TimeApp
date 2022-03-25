import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Locations {
  String url;
  String cityName;
  String currentTime;

  Locations(
      {required this.url,
      required this.cityName,
      this.currentTime = "default"});

  Future<void> calculateTime() async {
    var response =
        await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    if (response.statusCode == 200) {
      Map jsonData = jsonDecode(response.body);
      String rawOffset = jsonData["utc_offset"];
      int offset = int.parse(rawOffset.substring(0, 3));
      DateTime rawdatetime = DateTime.parse(jsonData["datetime"]);
      DateTime datetime = rawdatetime.add(Duration(hours: offset));
      currentTime = DateFormat.Hm().format(datetime);
    }
  }
}
