class ProductModel {
  ProductModel({
    this.id,
    this.title,
    this.currencyType,
    this.oldPrice,
    this.currentPrice,
    this.shortDesc,
    this.sku,
    this.vendor,
    this.inStock,
    this.longDesc,
    this.addInfo,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.locale,
    this.category,
    this.bestSelling,
    this.outOfStock,
    this.hot,
    this.onSell,
    this.bestSellingProducts,
    this.newArrivalProducts,
    this.newArrival,
    this.reviews,
    this.frontImg,
    this.detailsImg,
    this.orders,
    this.localizations,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    currencyType = json['currencyType'];
    oldPrice = json['oldPrice']?.toDouble();
    currentPrice = json['currentPrice']?.toDouble();
    shortDesc = json['shortDesc'];
    sku = json['sku'];
    vendor = json['vendor'];
    inStock = json['inStock'];
    longDesc = json['LongDesc'];
    addInfo = json['addInfo'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    slug = json['slug'];
    locale = json['locale'];
    // category =
    //     json['category'] != null ? Category.fromJson(json['category']) : null;
    bestSelling = json['bestSelling'];
    outOfStock = json['outOfStock'];
    hot = json['hot'];
    onSell = json['onSell'];
    bestSellingProducts = json['bestSellingProducts'];
    newArrivalProducts = json['newArrivalProducts'];
    newArrival = json['newArrival'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    // frontImg =
    //     json['frontImg'] != null ? FrontImg.fromJson(json['frontImg']) : null;
    if (json['detailsImg'] != null) {
      detailsImg = [];
      json['detailsImg'].forEach((v) {
        detailsImg?.add(DetailsImg.fromJson(v));
      });
    }
    // if (json['orders'] != null) {
    //   orders = [];
    //   json['orders'].forEach((v) {
    //     orders?.add(dynamic.fromJson(v));
    //   });
    // }
    // if (json['localizations'] != null) {
    //   localizations = [];
    //   json['localizations'].forEach((v) {
    //     localizations?.add(dynamic.fromJson(v));
    //   });
    // }
  }
  int? id;
  String? title;
  String? currencyType;
  double? oldPrice;
  double? currentPrice;
  String? shortDesc;
  String? sku;
  String? vendor;
  bool? inStock;
  String? longDesc;
  String? addInfo;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? locale;
  Category? category;
  bool? bestSelling;
  bool? outOfStock;
  bool? hot;
  bool? onSell;
  bool? bestSellingProducts;
  bool? newArrivalProducts;
  bool? newArrival;
  List<Reviews>? reviews;
  FrontImg? frontImg;
  List<DetailsImg>? detailsImg;
  List<dynamic>? orders;
  List<dynamic>? localizations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['currencyType'] = currencyType;
    map['oldPrice'] = oldPrice;
    map['currentPrice'] = currentPrice;
    map['shortDesc'] = shortDesc;
    map['sku'] = sku;
    map['vendor'] = vendor;
    map['inStock'] = inStock;
    map['LongDesc'] = longDesc;
    map['addInfo'] = addInfo;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['slug'] = slug;
    map['locale'] = locale;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['bestSelling'] = bestSelling;
    map['outOfStock'] = outOfStock;
    map['hot'] = hot;
    map['onSell'] = onSell;
    map['bestSellingProducts'] = bestSellingProducts;
    map['newArrivalProducts'] = newArrivalProducts;
    map['newArrival'] = newArrival;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (frontImg != null) {
      map['frontImg'] = frontImg?.toJson();
    }
    if (detailsImg != null) {
      map['detailsImg'] = detailsImg?.map((v) => v.toJson()).toList();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    if (localizations != null) {
      map['localizations'] = localizations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DetailsImg {
  DetailsImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  DetailsImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size']?.toDouble();
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size;
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

// class ProviderMetadata {
//   ProviderMetadata({
//     this.publicId,
//     this.resourceType,
//   });

//   ProviderMetadata.fromJson(dynamic json) {
//     publicId = json['public_id'];
//     resourceType = json['resource_type'];
//   }
//   String? publicId;
//   String? resourceType;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['public_id'] = publicId;
//     map['resource_type'] = resourceType;
//     return map;
//   }
// }

class Formats {
  Formats({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  Formats.fromJson(dynamic json) {
    large = json['large'] != null ? Large.fromJson(json['large']) : null;
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
  }
  Large? large;
  Small? small;
  Medium? medium;
  Thumbnail? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (large != null) {
      map['large'] = large?.toJson();
    }
    if (small != null) {
      map['small'] = small?.toJson();
    }
    if (medium != null) {
      map['medium'] = medium?.toJson();
    }
    if (thumbnail != null) {
      map['thumbnail'] = thumbnail?.toJson();
    }
    return map;
  }
}

class Thumbnail {
  Thumbnail({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Thumbnail.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size']?.toDouble();
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class Medium {
  Medium({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Medium.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size']?.toDouble();
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class Small {
  Small({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Small.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size']?.toDouble();
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class Large {
  Large({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    // this.providerMetadata,
  });

  Large.fromJson(dynamic json) {
    ext = json['ext'];
    url = json['url'];
    hash = json['hash'];
    mime = json['mime'];
    name = json['name'];
    path = json['path'];
    size = json['size']?.toDouble();
    width = json['width'];
    height = json['height'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
  }
  String? ext;
  String? url;
  String? hash;
  String? mime;
  String? name;
  dynamic path;
  double? size;
  int? width;
  int? height;
  // ProviderMetadata? providerMetadata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ext'] = ext;
    map['url'] = url;
    map['hash'] = hash;
    map['mime'] = mime;
    map['name'] = name;
    map['path'] = path;
    map['size'] = size;
    map['width'] = width;
    map['height'] = height;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    return map;
  }
}

class FrontImg {
  FrontImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  FrontImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size']?.toDouble();
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size?.toDouble();
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Reviews {
  Reviews({
    this.id,
    this.ratings,
    this.name,
    this.feedback,
    this.authorImg,
  });

  Reviews.fromJson(dynamic json) {
    id = json['id'];
    ratings = json['ratings'];
    name = json['name'];
    feedback = json['feedback'];
    authorImg = json['authorImg'] != null
        ? AuthorImg.fromJson(json['authorImg'])
        : null;
  }
  int? id;
  int? ratings;
  String? name;
  String? feedback;
  AuthorImg? authorImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ratings'] = ratings;
    map['name'] = name;
    map['feedback'] = feedback;
    if (authorImg != null) {
      map['authorImg'] = authorImg?.toJson();
    }
    return map;
  }
}

class AuthorImg {
  AuthorImg({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    // this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  AuthorImg.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats =
        json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size']?.toDouble();
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    // providerMetadata = json['provider_metadata'] != null
    //     ? ProviderMetadata.fromJson(json['providerMetadata'])
    //     : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  // ProviderMetadata? providerMetadata;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['alternativeText'] = alternativeText;
    map['caption'] = caption;
    map['width'] = width;
    map['height'] = height;
    if (formats != null) {
      map['formats'] = formats?.toJson();
    }
    map['hash'] = hash;
    map['ext'] = ext;
    map['mime'] = mime;
    map['size'] = size;
    map['url'] = url;
    map['previewUrl'] = previewUrl;
    map['provider'] = provider;
    // if (providerMetadata != null) {
    //   map['provider_metadata'] = providerMetadata?.toJson();
    // }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.locale,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    locale = json['locale'];
  }
  int? id;
  String? name;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? locale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['locale'] = locale;
    return map;
  }
}
