class AutoGenerate {
  AutoGenerate({
    required this.totalCount,
    required this.dormitories,
  });
  late final int totalCount;
  late final List<Dormitories> dormitories;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    dormitories = List.from(json['dormitories'])
        .map((e) => Dormitories.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['dormitories'] = dormitories.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Dormitories {
  Dormitories({
    required this.universityId,
    required this.mealPlanId,
    this.ruleId,
    required this.dorName,
    required this.dorStreetName,
    required this.dorStreetHouseNumber,
    required this.dorLat,
    required this.dorLng,
    required this.dorVisitMinMaxDays,
    required this.dorPhotosLinks,
    required this.dorDocumentsLinks,
    required this.dorId,
  });
  late final int universityId;
  late final int mealPlanId;
  late final Null ruleId;
  late final String dorName;
  late final String dorStreetName;
  late final String dorStreetHouseNumber;
  late final double? dorLat;
  late final double? dorLng;
  late final List<int> dorVisitMinMaxDays;
  late final List<String> dorPhotosLinks;
  late final List<String> dorDocumentsLinks;
  late final int dorId;

  Dormitories.fromJson(Map<String, dynamic> json) {
    universityId = json['university_id'];
    mealPlanId = json['meal_plan_id'];
    ruleId = null;
    dorName = json['dor_name'];
    dorStreetName = json['dor_street_name'];
    dorStreetHouseNumber = json['dor_street_house_number'];
    dorLat = json['dor_lat'];
    dorLng = json['dor_lng'];
    dorVisitMinMaxDays =
        List.castFrom<dynamic, int>(json['dor_visit_min_max_days']);
    dorPhotosLinks = List.castFrom<dynamic, String>(json['dor_photos_links']);
    dorDocumentsLinks =
        List.castFrom<dynamic, String>(json['dor_documents_links']);
    dorId = json['dor_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['university_id'] = universityId;
    _data['meal_plan_id'] = mealPlanId;
    _data['rule_id'] = ruleId;
    _data['dor_name'] = dorName;
    _data['dor_street_name'] = dorStreetName;
    _data['dor_street_house_number'] = dorStreetHouseNumber;
    _data['dor_lat'] = dorLat;
    _data['dor_lng'] = dorLng;
    _data['dor_visit_min_max_days'] = dorVisitMinMaxDays;
    _data['dor_photos_links'] = dorPhotosLinks;
    _data['dor_documents_links'] = dorDocumentsLinks;
    _data['dor_id'] = dorId;
    return _data;
  }
}
