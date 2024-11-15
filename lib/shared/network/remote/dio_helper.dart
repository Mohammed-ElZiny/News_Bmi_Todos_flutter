import 'package:bmi/shared/components/consts.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}



var response = {
"meta":{"found":6200,"returned":3,"limit":3,"page":1},
"data":[
  {"uuid":"c4677b38-30e8-467c-8411-dfb2442e69cf",
  "title":"Egypt, Eritrea pledge support for Somalia’s unity, Sudan’s stability",
  "description":"During their meeting, both sides agreed on the importance of intensifying efforts and continuing consultations to achieve stability in Sudan and support its nat...",
  "keywords":"",
  "snippet":"During their meeting, both sides agreed on the importance of intensifying efforts and continuing consultations to achieve stability in Sudan and support its nat...",
  "url":"https://www.dailynewsegypt.com/2024/09/14/egypt-eritrea-pledge-support-for-somalias-unity-sudans-stability/",
  "image_url":"https://d1b3667xvzs6rz.cloudfront.net/2024/09/WhatsApp-Image-2024-09-14-at-16.57.38.jpeg",
  "language":"en",
  "published_at":"2024-09-14T16:02:57.000000Z",
  "source":"dailynewsegypt.com",
  "categories":["general"],
  "relevance_score":null,
  "locale":"eg"},
  {"uuid":"49d94279-b8e0-4f67-9653-c134354834f1","title":"At least 9 killed in Israeli attack on school in Al-Nuseirat Camp","description":"The Israeli occupation forces committed Wednesday a new massacre in Al-Nuseirat Camp in the central Gaza Strip, killing at least nine civilians. The bombing tar...","keywords":"","snippet":"The Israeli occupation forces committed Wednesday a new massacre in Al-Nuseirat Camp in the central Gaza Strip, killing at least nine civilians. The bombing tar...","url":"https://www.dailynewsegypt.com/2024/09/11/at-least-9-killed-in-israeli-attack-on-school-in-al-nuseirat-camp/","image_url":"https://d1b3667xvzs6rz.cloudfront.net/2024/09/WhatsApp-Image-2024-09-11-at-11.05.06-PM.jpeg","language":"en","published_at":"2024-09-11T20:31:22.000000Z","source":"dailynewsegypt.com","categories":["general"],"relevance_score":null,"locale":"eg"},{"uuid":"8798653d-d48b-46a2-add8-97382d581703","title":"Al-Mashat, Kouchouk review efforts to resolve financial entanglements between NIB, Egypt Post","description":"Egypt’s Minister of Planning, Economic Development, and International Cooperation, Rania Al-Mashat, and Minister of Finance, Ahmed Kouchouk, met at the Minist...","keywords":"","snippet":"Egypt’s Minister of Planning, Economic Development, and International Cooperation, Rania Al-Mashat, and Minister of Finance, Ahmed Kouchouk, met at the Minist...","url":"https://www.dailynewsegypt.com/2024/09/11/al-mashat-kouchouk-review-efforts-to-resolve-financial-entanglements-between-nib-egypt-post/","image_url":"https://d1b3667xvzs6rz.cloudfront.net/2024/09/resizecom_WhatsApp-Image-2024-09-11-at-12.01.28-1-1080x720.jpeg",
  "language":"en",
  "published_at":"2024-09-11T20:26:42.000000Z",
  "source":"dailynewsegypt.com",
  "categories":["general"],
  "relevance_score":null,
  "locale":"eg"}]};



