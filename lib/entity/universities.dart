class AutoGenerate {
  AutoGenerate({
    required this.totalCount,
    required this.universities,
  });
  late final int totalCount;
  late final List<Universities> universities;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    universities = List.from(json['universities'])
        .map((e) => Universities.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['universities'] = universities.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Universities {
  Universities({
    required this.cityId,
    required this.uniName,
    required this.uniAdminContacts,
    this.uniPhotoLink,
    this.uniSite,
    this.uniCommittee,
    required this.uniId,
  });
  late final int cityId;
  late final String uniName;
  late final String uniAdminContacts;
  late final String? uniPhotoLink;
  late final String? uniSite;
  late final String? uniCommittee;
  late final int uniId;

  Universities.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    uniName = json['uni_name'];
    uniAdminContacts = json['uni_admin_contacts'];
    uniPhotoLink = null;
    uniSite = null;
    uniCommittee = null;
    uniId = json['uni_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city_id'] = cityId;
    _data['uni_name'] = uniName;
    _data['uni_admin_contacts'] = uniAdminContacts;
    _data['uni_photo_link'] = uniPhotoLink;
    _data['uni_site'] = uniSite;
    _data['uni_committee'] = uniCommittee;
    _data['uni_id'] = uniId;
    return _data;
  }
}
