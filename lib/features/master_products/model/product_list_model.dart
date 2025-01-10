import 'package:bloc_api/features/master_products/model/media_model.dart';

class ProductListModel {
  Data? data;
  bool? status;
  int? code;
  String? message;

  ProductListModel({this.data, this.status, this.code, this.message});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  List<MasterProductItemModel>? data;
  Meta? meta;
  Links? links;

  Data({this.data, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MasterProductItemModel>[];
      json['data'].forEach((v) {
        data!.add(MasterProductItemModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}

class MasterProductItemModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Media>? media;
  List<VendorMasterProduct>? vendorMasterProduct;

  MasterProductItemModel(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media,
      this.vendorMasterProduct});

  MasterProductItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    if (json['vendor_master_product'] != null) {
      vendorMasterProduct = <VendorMasterProduct>[];
      json['vendor_master_product'].forEach((v) {
        vendorMasterProduct!.add(VendorMasterProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (vendorMasterProduct != null) {
      data['vendor_master_product'] =
          vendorMasterProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VendorMasterProduct {
  int? id;
  int? masterProductId;
  int? vendorBusinessId;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  VendorMasterProduct(
      {this.id,
      this.masterProductId,
      this.vendorBusinessId,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  VendorMasterProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masterProductId = json['master_product_id'];
    vendorBusinessId = json['vendor_business_id'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['master_product_id'] = masterProductId;
    data['vendor_business_id'] = vendorBusinessId;
    data['is_deleted'] = isDeleted;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? current;
  String? next;
  String? last;

  Links({
    this.current,
    this.next,
    this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        current: json["current"],
        next: json["next"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "next": next,
        "last": last,
      };
}

class Meta {
  int? itemsPerPage;
  int? totalItems;
  int? currentPage;
  int? totalPages;
  List<List<String>>? sortBy;

  Meta({
    this.itemsPerPage,
    this.totalItems,
    this.currentPage,
    this.totalPages,
    this.sortBy,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        itemsPerPage: json["itemsPerPage"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        sortBy: json["sortBy"] == null
            ? []
            : List<List<String>>.from(
                json["sortBy"]!.map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "itemsPerPage": itemsPerPage,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "sortBy": sortBy == null
            ? []
            : List<dynamic>.from(
                sortBy!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class AddMasterProductModel {
  VendorMasterProduct? data;
  bool? status;
  int? code;
  String? message;

  AddMasterProductModel({this.data, this.status, this.code, this.message});

  AddMasterProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? VendorMasterProduct.fromJson(json['data'])
        : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
