import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoonflix/models/webtoon_detail_model.dart';
import 'package:webtoonflix/models/webtoon_model.dart';

class ApiService {
  static const String today = "today";
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson2(webtoon);
        // print(toon.title);
        // print(webtoon);
        final instance = WebtoonModel.fromJson2(webtoon);
        webtoonInstances.add(instance);
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }
}
