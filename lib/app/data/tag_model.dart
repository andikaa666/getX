class Tag {
  bool? success;
  String? message;
  List<DataTag>? dataTag;

  Tag({this.success, this.message, this.dataTag});

  Tag.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['dataTag'] != null) {
      dataTag = <DataTag>[];
      json['dataTag'].forEach((v) {
        dataTag!.add(new DataTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataTag = new Map<String, dynamic>();
    dataTag['success'] = this.success;
    dataTag['message'] = this.message;
    if (this.dataTag != null) {
      dataTag['dataTag'] = this.dataTag!.map((v) => v.toJson()).toList();
    }
    return dataTag;
  }
}

class DataTag {
  int? id;
  String? namaTag;
  String? slug;
  String? createdAt;
  String? updatedAt;

  DataTag({this.id, this.namaTag, this.slug, this.createdAt, this.updatedAt});

  DataTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTag = json['nama_tag'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataTag = new Map<String, dynamic>();
    dataTag['id'] = this.id;
    dataTag['nama_tag'] = this.namaTag;
    dataTag['slug'] = this.slug;
    dataTag['created_at'] = this.createdAt;
    dataTag['updated_at'] = this.updatedAt;
    return dataTag;
  }
}
