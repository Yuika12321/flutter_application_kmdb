import 'package:http/http.dart' as http;

class MovieApi {
  final api_key = 'RD040P0D0847CY6XIOPT';

  search(String keyword) async {
    String site =
        'http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=$api_key&query=$keyword&detail=Y';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('error');
    }
  }
}
