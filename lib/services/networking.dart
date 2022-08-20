import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  final String url;
  Networkhelper({this.url = ''});
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata = jsonDecode(data);
      return decodedata;
    } else
      print(response.statusCode);
  }
}
