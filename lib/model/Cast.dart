import 'package:dmi_practica13_200070/common/Util.dart';
import 'package:dmi_practica13_200070/common/MediaProvider.dart';
import 'package:dmi_practica13_200070/model/Media.dart';

class Cast{
  int id;
  String name;
  String profilePath;

  factory Cast(Map jsonMap, MediaType mediaType) {
    try {
      return Cast.deserialize(jsonMap, mediaType);
    } catch (ex) {
      throw ex;
    }
  }
  Cast.deserialize(Map jsonMap, MediaType mediaType):
    id = jsonMap["cast_id"].toInt(),
    name = jsonMap["cast_id"],
    profilePath = jsonMap["profile_path"];

} 