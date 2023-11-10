class Kohls {
  Payload? payload;
  int? count;
  int? limit;
  int? offset;

  Kohls({this.payload, this.count, this.limit, this.offset});

  Kohls.fromJson(Map<String, dynamic> json) {
    payload =
        json['payload'] != null ?  Payload.fromJson(json['payload']) : null;
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['count'] = count;
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}

class Payload {
  String? searchTerm;
  Map<String, dynamic>? autoCorrectedTerm;
  Map<String, dynamic>? legalDisclaimer;
  Map<String, dynamic>? links;
  List<Map<String, dynamic>>? relatedSearchTerms;
  LinkCartridge? linkCartridge;
  MetaInfo? metaInfo;
  Map<String, dynamic>? omnitureInfo;
  List<Map<String, dynamic>>? availableTerms;
  List<ActiveDimensions>? activeDimensions;
  List<Sorts>? sorts;
  List<Dimensions>? dimensions;
  List<Products>? products;
  Monetization? monetization;
  Map<String, dynamic>? monetizationRequest;
  String? h1tag;
  Map<String, dynamic>? searchResultMessage;
  Map<String, dynamic>? stores;
  Map<String, dynamic>? storeBreadcrumbURL;
  SpotLights? spotLights;
  TabInfo? tabInfo;
  String? pageSeoURL;
  String? pageURL;
  bool? resultsPersonalized;
  Map<String, dynamic>? propensityAvailable;
  String? relevancyAlgorithm;
  bool? encoded;
  List<Map<String, dynamic>>? selectedDimensions;
  Map<String, dynamic>? disclaimerType;
  bool? sephoraProducts;
  bool? suppressAds;

  Payload(
      {this.searchTerm,
      this.autoCorrectedTerm,
      this.legalDisclaimer,
      this.links,
      this.relatedSearchTerms,
      this.linkCartridge,
      this.metaInfo,
      this.omnitureInfo,
      this.availableTerms,
      this.activeDimensions,
      this.sorts,
      this.dimensions,
      this.products,
      this.monetization,
      this.monetizationRequest,
      this.h1tag,
      this.searchResultMessage,
      this.stores,
      this.storeBreadcrumbURL,
      this.spotLights,
      this.tabInfo,
      this.pageSeoURL,
      this.pageURL,
      this.resultsPersonalized,
      this.propensityAvailable,
      this.relevancyAlgorithm,
      this.encoded,
      this.selectedDimensions,
      this.disclaimerType,
      this.sephoraProducts,
      this.suppressAds,});

  Payload.fromJson(Map<String, dynamic> json) {
    searchTerm = json['searchTerm'];
    autoCorrectedTerm = json['autoCorrectedTerm'];
    legalDisclaimer = json['legalDisclaimer'];
    links = json['links'];
    if (json['relatedSearchTerms'] != null) {
      relatedSearchTerms = <Map<String, dynamic>>[];
      json['relatedSearchTerms'].forEach((v) {
        relatedSearchTerms!.add(v);
      });
    }
    linkCartridge = json['linkCartridge'] != null
        ?  LinkCartridge.fromJson(json['linkCartridge'])
        : null;
    metaInfo = json['metaInfo'] != null
        ?  MetaInfo.fromJson(json['metaInfo'])
        : null;
    omnitureInfo = json['omnitureInfo'];
    if (json['availableTerms'] != null) {
      availableTerms = <Map<String, dynamic>>[];
      json['availableTerms'].forEach((v) {
        availableTerms!.add(v);
      });
    }
    if (json['activeDimensions'] != null) {
      activeDimensions = <ActiveDimensions>[];
      json['activeDimensions'].forEach((v) {
        activeDimensions!.add( ActiveDimensions.fromJson(v));
      });
    }
    if (json['sorts'] != null) {
      sorts = <Sorts>[];
      json['sorts'].forEach((v) {
        sorts!.add( Sorts.fromJson(v));
      });
    }
    if (json['dimensions'] != null) {
      dimensions = <Dimensions>[];
      json['dimensions'].forEach((v) {
        dimensions!.add( Dimensions.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
    monetization = json['monetization'] != null
        ?  Monetization.fromJson(json['monetization'])
        : null;
    monetizationRequest = json['monetizationRequest'];
    h1tag = json['h1tag'];
    searchResultMessage = json['searchResultMessage'];
    stores = json['stores'];
    storeBreadcrumbURL = json['storeBreadcrumbURL'];
    spotLights = json['spotLights'] != null
        ?  SpotLights.fromJson(json['spotLights'])
        : null;
    tabInfo =
        json['tabInfo'] != null ?  TabInfo.fromJson(json['tabInfo']) : null;
    pageSeoURL = json['pageSeoURL'];
    pageURL = json['pageURL'];
    resultsPersonalized = json['resultsPersonalized'];
    propensityAvailable = json['propensityAvailable'];
    relevancyAlgorithm = json['relevancyAlgorithm'];
    encoded = json['encoded'];
    if (json['selectedDimensions'] != null) {
      selectedDimensions = <Map<String, dynamic>>[];
      json['selectedDimensions'].forEach((v) {
        selectedDimensions!.add(v);
      });
    }
    disclaimerType = json['disclaimerType'];
    sephoraProducts = json['sephoraProducts'];
    suppressAds = json['suppressAds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['searchTerm'] = searchTerm;
    data['autoCorrectedTerm'] = autoCorrectedTerm;
    data['legalDisclaimer'] = legalDisclaimer;
    data['links'] = links;
    if (relatedSearchTerms != null) {
      data['relatedSearchTerms'] =
          relatedSearchTerms!.map((v) => v).toList();
    }
    if (linkCartridge != null) {
      data['linkCartridge'] = linkCartridge!.toJson();
    }
    if (metaInfo != null) {
      data['metaInfo'] = metaInfo!.toJson();
    }
    data['omnitureInfo'] = omnitureInfo;
    if (availableTerms != null) {
      data['availableTerms'] =
          availableTerms!.map((v) => v).toList();
    }
    if (activeDimensions != null) {
      data['activeDimensions'] =
          activeDimensions!.map((v) => v.toJson()).toList();
    }
    if (sorts != null) {
      data['sorts'] = sorts!.map((v) => v.toJson()).toList();
    }
    if (dimensions != null) {
      data['dimensions'] = dimensions!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (monetization != null) {
      data['monetization'] = monetization!.toJson();
    }
    data['monetizationRequest'] = monetizationRequest;
    data['h1tag'] = h1tag;
    data['searchResultMessage'] = searchResultMessage;
    data['stores'] = stores;
    data['storeBreadcrumbURL'] = storeBreadcrumbURL;
    if (spotLights != null) {
      data['spotLights'] = spotLights!.toJson();
    }
    if (tabInfo != null) {
      data['tabInfo'] = tabInfo!.toJson();
    }
    data['pageSeoURL'] = pageSeoURL;
    data['pageURL'] = pageURL;
    data['resultsPersonalized'] = resultsPersonalized;
    data['propensityAvailable'] = propensityAvailable;
    data['relevancyAlgorithm'] = relevancyAlgorithm;
    data['encoded'] = encoded;
    if (selectedDimensions != null) {
      data['selectedDimensions'] =
          selectedDimensions!.map((v) => v).toList();
    }
    data['disclaimerType'] = disclaimerType;
    data['sephoraProducts'] = sephoraProducts;
    data['suppressAds'] = suppressAds;
    return data;
  }
}

class LinkCartridge {
  List<Map<String, dynamic>>? linkGroup;

  LinkCartridge({this.linkGroup});

  LinkCartridge.fromJson(Map<String, dynamic> json) {
    if (json['linkGroup'] != null) {
      linkGroup = <Map<String, dynamic>>[];
      json['linkGroup'].forEach((v) {
        linkGroup!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (linkGroup != null) {
      data['linkGroup'] = linkGroup!.map((v) => v).toList();
    }
    return data;
  }
}

class MetaInfo {
  String? metaTitle;
  String? metaDescription;
  Map<String, dynamic>? metaKeywords;
  String? seoNoIndex;
  Map<String, dynamic>? copyBlock;
  Map<String, dynamic>? seoLinks;

  MetaInfo(
      {this.metaTitle,
      this.metaDescription,
      this.metaKeywords,
      this.seoNoIndex,
      this.copyBlock,
      this.seoLinks});

  MetaInfo.fromJson(Map<String, dynamic> json) {
    metaTitle = json['metaTitle'];
    metaDescription = json['metaDescription'];
    metaKeywords = json['metaKeywords'];
    seoNoIndex = json['seoNoIndex'];
    copyBlock = json['copyBlock'];
    seoLinks = json['seoLinks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['metaTitle'] = metaTitle;
    data['metaDescription'] = metaDescription;
    data['metaKeywords'] = metaKeywords;
    data['seoNoIndex'] = seoNoIndex;
    data['copyBlock'] = copyBlock;
    data['seoLinks'] = seoLinks;
    return data;
  }
}

class ActiveDimensions {
  String? name;
  String? label;
  int? index;
  List<ActiveDimensionValues>? activeDimensionValues;

  ActiveDimensions(
      {this.name, this.label, this.index, this.activeDimensionValues});

  ActiveDimensions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    index = json['index'];
    if (json['activeDimensionValues'] != null) {
      activeDimensionValues = <ActiveDimensionValues>[];
      json['activeDimensionValues'].forEach((v) {
        activeDimensionValues!.add( ActiveDimensionValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['label'] = label;
    data['index'] = index;
    if (activeDimensionValues != null) {
      data['activeDimensionValues'] =
          activeDimensionValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveDimensionValues {
  String? name;
  int? index;
  int? productCount;
  String? seoURL;
  String? currentDimensionId;
  Map<String, dynamic>? currentAttributeId;
  String? iD;
  Map<String, dynamic>? breadcrumbType;

  ActiveDimensionValues(
      {this.name,
      this.index,
      this.productCount,
      this.seoURL,
      this.currentDimensionId,
      this.currentAttributeId,
      this.iD,
      this.breadcrumbType,});

  ActiveDimensionValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    index = json['index'];
    productCount = json['productCount'];
    seoURL = json['seoURL'];
    currentDimensionId = json['currentDimensionId'];
    currentAttributeId = json['currentAttributeId'];
    iD = json['ID'];
    breadcrumbType = json['breadcrumbType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['index'] = index;
    data['productCount'] = productCount;
    data['seoURL'] = seoURL;
    data['currentDimensionId'] = currentDimensionId;
    data['currentAttributeId'] = currentAttributeId;
    data['ID'] = iD;
    data['breadcrumbType'] = breadcrumbType;
    return data;
  }
}

class Sorts {
  String? name;
  bool? active;
  String? iD;

  Sorts({this.name, this.active, this.iD});

  Sorts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['active'] = active;
    data['ID'] = iD;
    return data;
  }
}

class Dimensions {
  String? name;
  String? label;
  int? index;
  List<DimensionValues>? dimensionValues;
  String? clearSEOURL;

  Dimensions(
      {this.name,
      this.label,
      this.index,
      this.dimensionValues,
      this.clearSEOURL});

  Dimensions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    index = json['index'];
    if (json['dimensionValues'] != null) {
      dimensionValues = <DimensionValues>[];
      json['dimensionValues'].forEach((v) {
        dimensionValues!.add( DimensionValues.fromJson(v));
      });
    }
    clearSEOURL = json['clearSEOURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['label'] = label;
    data['index'] = index;
    if (dimensionValues != null) {
      data['dimensionValues'] =
          dimensionValues!.map((v) => v.toJson()).toList();
    }
    data['clearSEOURL'] = clearSEOURL;
    return data;
  }
}

class DimensionValues {
  String? name;
  int? productCount;
  int? index;
  bool? active;
  bool? noFollow;
  String? seoURL;
  String? currentDimensionId;
  Map<String, dynamic>? currentAttributeId;
  String? iD;

  DimensionValues(
      {this.name,
      this.productCount,
      this.index,
      this.active,
      this.noFollow,
      this.seoURL,
      this.currentDimensionId,
      this.currentAttributeId,
      this.iD,});

  DimensionValues.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productCount = json['productCount'];
    index = json['index'];
    active = json['active'];
    noFollow = json['noFollow'];
    seoURL = json['seoURL'];
    currentDimensionId = json['currentDimensionId'];
    currentAttributeId = json['currentAttributeId'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = name;
    data['productCount'] = productCount;
    data['index'] = index;
    data['active'] = active;
    data['noFollow'] = noFollow;
    data['seoURL'] = seoURL;
    data['currentDimensionId'] = currentDimensionId;
    data['currentAttributeId'] = currentAttributeId;
    data['ID'] = iD;
    return data;
  }
}

class Products {
  String? webID;
  String? productTitle;
  Image? image;
  List<Prices>? prices;
  Rating? rating;
  List<SwatchImages>? swatchImages;
  List<String>? valueAddedIcons;
  ValueAddedBadges? valueAddedBadges;
  String? seoURL;
  String? variations;
  String? altImageUrl;
  String? prodType;
  List<String>? displayColor;
  List<String>? availableColr;
  bool? isAvailableforShip;
  bool? isAvailableforPickUp;
  bool? boosted;
  bool? ypEligible;
  Map<String, dynamic>? sponsoredData;
  bool? sephoraProduct;
  YourPriceInfo? yourPriceInfo;
  bool? couponEligible;
  bool? isVGC;

  Products(
      {this.webID,
      this.productTitle,
      this.image,
      this.prices,
      this.rating,
      this.swatchImages,
      this.valueAddedIcons,
      this.valueAddedBadges,
      this.seoURL,
      this.variations,
      this.altImageUrl,
      this.prodType,
      this.displayColor,
      this.availableColr,
      this.isAvailableforShip,
      this.isAvailableforPickUp,
      this.boosted,
      this.ypEligible,
      this.sponsoredData,
      this.sephoraProduct,
      this.yourPriceInfo,
      this.couponEligible,
      this.isVGC,});

  Products.fromJson(Map<String, dynamic> json) {
    webID = json['webID'];
    productTitle = json['productTitle'];
    image = json['image'] != null ?  Image.fromJson(json['image']) : null;
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add( Prices.fromJson(v));
      });
    }
    rating =
        json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
    if (json['swatchImages'] != null) {
      swatchImages = <SwatchImages>[];
      json['swatchImages'].forEach((v) {
        swatchImages!.add( SwatchImages.fromJson(v));
      });
    }
    valueAddedIcons = json['valueAddedIcons'].cast<String>();
    valueAddedBadges = json['valueAddedBadges'] != null
        ?  ValueAddedBadges.fromJson(json['valueAddedBadges'])
        : null;
    seoURL = json['seoURL'];
    variations = json['variations'];
    altImageUrl = json['altImageUrl'];
    prodType = json['prodType'];
    displayColor = json['displayColor'].cast<String>();
    availableColr = json['availableColr'].cast<String>();
    isAvailableforShip = json['isAvailableforShip'];
    isAvailableforPickUp = json['isAvailableforPickUp'];
    boosted = json['boosted'];
    ypEligible = json['ypEligible'];
    sponsoredData = json['sponsoredData'];
    sephoraProduct = json['sephoraProduct'];
    yourPriceInfo = json['yourPriceInfo'] != null
        ?  YourPriceInfo.fromJson(json['yourPriceInfo'])
        : null;
    couponEligible = json['couponEligible'];
    isVGC = json['isVGC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['webID'] = webID;
    data['productTitle'] = productTitle;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    if (swatchImages != null) {
      data['swatchImages'] = swatchImages!.map((v) => v.toJson()).toList();
    }
    data['valueAddedIcons'] = valueAddedIcons;
    if (valueAddedBadges != null) {
      data['valueAddedBadges'] = valueAddedBadges!.toJson();
    }
    data['seoURL'] = seoURL;
    data['variations'] = variations;
    data['altImageUrl'] = altImageUrl;
    data['prodType'] = prodType;
    data['displayColor'] = displayColor;
    data['availableColr'] = availableColr;
    data['isAvailableforShip'] = isAvailableforShip;
    data['isAvailableforPickUp'] = isAvailableforPickUp;
    data['boosted'] = boosted;
    data['ypEligible'] = ypEligible;
    data['sponsoredData'] = sponsoredData;
    data['sephoraProduct'] = sephoraProduct;
    if (yourPriceInfo != null) {
      data['yourPriceInfo'] = yourPriceInfo!.toJson();
    }
    data['couponEligible'] = couponEligible;
    data['isVGC'] = isVGC;
    return data;
  }
}

class Image {
  String? url;
  String? height;
  String? width;

  Image({this.url, this.height, this.width});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = url;
    data['height'] = height;
    data['width'] = width;
    return data;
  }
}

class Prices {
  RegularPrice? regularPrice;
  RegularPrice? salePrice;
  String? displayBegDateTime;
  String? displayEndDateTime;
  String? purchaseBegDateTime;
  String? purchaseEndDateTime;
  bool? isCurrentPrice;
  String? regularPriceType;
  Map<String, dynamic>? promotion;
  String? statusCode;
  String? priceCode;
  String? salePriceStatus;
  bool? isSuppressed;
  Map<String, dynamic>? salePriceType;
  bool? isPriceInstore;
  String? suppressedPricingText;
  Promotions? promotions;

  Prices(
      {this.regularPrice,
      this.salePrice,
      this.displayBegDateTime,
      this.displayEndDateTime,
      this.purchaseBegDateTime,
      this.purchaseEndDateTime,
      this.isCurrentPrice,
      this.regularPriceType,
      this.promotion,
      this.statusCode,
      this.priceCode,
      this.salePriceStatus,
      this.isSuppressed,
      this.salePriceType,
      this.isPriceInstore,
      this.suppressedPricingText,
      this.promotions,});

  Prices.fromJson(Map<String, dynamic> json) {
    regularPrice = json['regularPrice'] != null
        ?  RegularPrice.fromJson(json['regularPrice'])
        : null;
    salePrice = json['salePrice'] != null
        ?  RegularPrice.fromJson(json['salePrice'])
        : null;
    displayBegDateTime = json['displayBegDateTime'];
    displayEndDateTime = json['displayEndDateTime'];
    purchaseBegDateTime = json['purchaseBegDateTime'];
    purchaseEndDateTime = json['purchaseEndDateTime'];
    isCurrentPrice = json['isCurrentPrice'];
    regularPriceType = json['regularPriceType'];
    promotion = json['promotion'];
    statusCode = json['statusCode'];
    priceCode = json['priceCode'];
    salePriceStatus = json['salePriceStatus'];
    isSuppressed = json['isSuppressed'];
    salePriceType = json['salePriceType'];
    isPriceInstore = json['isPriceInstore'];
    suppressedPricingText = json['suppressedPricingText'];
    promotions = json['promotions'] != null
        ?  Promotions.fromJson(json['promotions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (regularPrice != null) {
      data['regularPrice'] = regularPrice!.toJson();
    }
    if (salePrice != null) {
      data['salePrice'] = salePrice!.toJson();
    }
    data['displayBegDateTime'] = displayBegDateTime;
    data['displayEndDateTime'] = displayEndDateTime;
    data['purchaseBegDateTime'] = purchaseBegDateTime;
    data['purchaseEndDateTime'] = purchaseEndDateTime;
    data['isCurrentPrice'] = isCurrentPrice;
    data['regularPriceType'] = regularPriceType;
    data['promotion'] = promotion;
    data['statusCode'] = statusCode;
    data['priceCode'] = priceCode;
    data['salePriceStatus'] = salePriceStatus;
    data['isSuppressed'] = isSuppressed;
    data['salePriceType'] = salePriceType;
    data['isPriceInstore'] = isPriceInstore;
    data['suppressedPricingText'] = suppressedPricingText;
    if (promotions != null) {
      data['promotions'] = promotions!.toJson();
    }
    return data;
  }
}

class RegularPrice {
  double? minPrice;
  double? maxPrice;

  RegularPrice({this.minPrice, this.maxPrice});

  RegularPrice.fromJson(Map<String, dynamic> json) {
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['minPrice'] = minPrice;
    data['maxPrice'] = maxPrice;
    return data;
  }
}

class Promotions {
  List<Map<String, dynamic>>? tieredPrice;
  List<Map<String, dynamic>>? group;
  List<Map<String, dynamic>>? bogo;

  Promotions({this.tieredPrice, this.group, this.bogo});

  Promotions.fromJson(Map<String, dynamic> json) {
    if (json['tieredPrice'] != null) {
      tieredPrice = <Map<String, dynamic>>[];
      json['tieredPrice'].forEach((v) {
        tieredPrice!.add( v);
      });
    }
    if (json['group'] != null) {
      group = <Map<String, dynamic>>[];
      json['group'].forEach((v) {
        group!.add(v);
      });
    }
    if (json['bogo'] != null) {
      bogo = <Map<String, dynamic>>[];
      json['bogo'].forEach((v) {
        bogo!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (tieredPrice != null) {
      data['tieredPrice'] = tieredPrice!.map((v) => v).toList();
    }
    if (group != null) {
      data['group'] = group!.map((v) => v).toList();
    }
    if (bogo != null) {
      data['bogo'] = bogo!.map((v) => v).toList();
    }
    return data;
  }
}

class Rating {
  double? avgRating;
  int? count;

  Rating({this.avgRating, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    avgRating = json['avgRating'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['avgRating'] = avgRating;
    data['count'] = count;
    return data;
  }
}

class SwatchImages {
  String? color;
  String? uRL;

  SwatchImages({this.color, this.uRL});

  SwatchImages.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['color'] = color;
    data['URL'] = uRL;
    return data;
  }
}

class ValueAddedBadges {
  List<String>? realTime;
  List<Map<String, dynamic>>? pricing;
  List<Map<String, dynamic>>? other;

  ValueAddedBadges({this.realTime, this.pricing, this.other});

  ValueAddedBadges.fromJson(Map<String, dynamic> json) {
    realTime = json['realTime'].cast<String>();
    if (json['pricing'] != null) {
      pricing = <Map<String, dynamic>>[];
      json['pricing'].forEach((v) {
        pricing!.add(v);
      });
    }
    if (json['other'] != null) {
      other = <Map<String, dynamic>>[];
      json['other'].forEach((v) {
        other!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['realTime'] = realTime;
    if (pricing != null) {
      data['pricing'] = pricing!.map((v) => v).toList();
    }
    if (other != null) {
      data['other'] = other!.map((v) => v).toList();
    }
    return data;
  }
}

class YourPriceInfo {
  RegularPrice? yourPrice;
  List<Offers>? offers;
  String? ypEligibilityVal;

  YourPriceInfo({this.yourPrice, this.offers, this.ypEligibilityVal});

  YourPriceInfo.fromJson(Map<String, dynamic> json) {
    yourPrice = json['yourPrice'] != null
        ?  RegularPrice.fromJson(json['yourPrice'])
        : null;
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add( Offers.fromJson(v));
      });
    }
    ypEligibilityVal = json['ypEligibilityVal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (yourPrice != null) {
      data['yourPrice'] = yourPrice!.toJson();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    data['ypEligibilityVal'] = ypEligibilityVal;
    return data;
  }
}

class Offers {
  String? offerId;
  String? offerCode;
  String? disProrated;

  Offers({this.offerId, this.offerCode, this.disProrated});

  Offers.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    offerCode = json['offerCode'];
    disProrated = json['disProrated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['offerId'] = offerId;
    data['offerCode'] = offerCode;
    data['disProrated'] = disProrated;
    return data;
  }
}

class Monetization {
  Map<String, dynamic>? brand;
  AgeAppropriate? ageAppropriate;
  Map<String, dynamic>? occasion;
  Map<String, dynamic>? gender;
  Map<String, dynamic>? sportsLeague;
  Map<String, dynamic>? sportsTeam;
  Map<String, dynamic>? ageAppropriateRange;
  Map<String, dynamic>? childAgeRange;
  Map<String, dynamic>? sizeRange;
  Map<String, dynamic>? fit;
  Map<String, dynamic>? legOpening;
  Map<String, dynamic>? trend;
  Map<String, dynamic>? feature;
  Map<String, dynamic>? activity;
  Map<String, dynamic>? bodyType;
  Map<String, dynamic>? roastsFlavors;
  Map<String, dynamic>? personaCategory;
  Map<String, dynamic>? personaTheme;
  Map<String, dynamic>? personaSubject;
  Map<String, dynamic>? personaGroupCode;
  AgeAppropriate? adUnit;
  Map<String, dynamic>? silhouette;

  Monetization(
      {this.brand,
      this.ageAppropriate,
      this.occasion,
      this.gender,
      this.sportsLeague,
      this.sportsTeam,
      this.ageAppropriateRange,
      this.childAgeRange,
      this.sizeRange,
      this.fit,
      this.legOpening,
      this.trend,
      this.feature,
      this.activity,
      this.bodyType,
      this.roastsFlavors,
      this.personaCategory,
      this.personaTheme,
      this.personaSubject,
      this.personaGroupCode,
      this.adUnit,
      this.silhouette,});

  Monetization.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    ageAppropriate = json['ageAppropriate'] != null
        ?  AgeAppropriate.fromJson(json['ageAppropriate'])
        : null;
    occasion = json['occasion'];
    gender = json['gender'];
    sportsLeague = json['sportsLeague'];
    sportsTeam = json['sportsTeam'];
    ageAppropriateRange = json['ageAppropriateRange'];
    childAgeRange = json['childAgeRange'];
    sizeRange = json['sizeRange'];
    fit = json['fit'];
    legOpening = json['legOpening'];
    trend = json['trend'];
    feature = json['feature'];
    activity = json['activity'];
    bodyType = json['bodyType'];
    roastsFlavors = json['roastsFlavors'];
    personaCategory = json['personaCategory'];
    personaTheme = json['personaTheme'];
    personaSubject = json['personaSubject'];
    personaGroupCode = json['personaGroupCode'];
    adUnit = json['adUnit'] != null
        ?  AgeAppropriate.fromJson(json['adUnit'])
        : null;
    silhouette = json['silhouette'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['brand'] = brand;
    if (ageAppropriate != null) {
      data['ageAppropriate'] = ageAppropriate!.toJson();
    }
    data['occasion'] = occasion;
    data['gender'] = gender;
    data['sportsLeague'] = sportsLeague;
    data['sportsTeam'] = sportsTeam;
    data['ageAppropriateRange'] = ageAppropriateRange;
    data['childAgeRange'] = childAgeRange;
    data['sizeRange'] = sizeRange;
    data['fit'] = fit;
    data['legOpening'] = legOpening;
    data['trend'] = trend;
    data['feature'] = feature;
    data['activity'] = activity;
    data['bodyType'] = bodyType;
    data['roastsFlavors'] = roastsFlavors;
    data['personaCategory'] = personaCategory;
    data['personaTheme'] = personaTheme;
    data['personaSubject'] = personaSubject;
    data['personaGroupCode'] = personaGroupCode;
    if (adUnit != null) {
      data['adUnit'] = adUnit!.toJson();
    }
    data['silhouette'] = silhouette;
    return data;
  }
}

class AgeAppropriate {
  String? value;

  AgeAppropriate({this.value});

  AgeAppropriate.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['value'] = value;
    return data;
  }
}

class SpotLights {
  List<Map<String, dynamic>>? bannerContents;

  SpotLights({this.bannerContents});

  SpotLights.fromJson(Map<String, dynamic> json) {
    if (json['bannerContents'] != null) {
      bannerContents = <Map<String, dynamic>>[];
      json['bannerContents'].forEach((v) {
        bannerContents!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (bannerContents != null) {
      data['bannerContents'] =
          bannerContents!.map((v) => v).toList();
    }
    return data;
  }
}

class TabInfo {
  List<AllProducts>? allProducts;

  TabInfo({this.allProducts});

  TabInfo.fromJson(Map<String, dynamic> json) {
    if (json['allProducts'] != null) {
      allProducts = <AllProducts>[];
      json['allProducts'].forEach((v) {
        allProducts!.add( AllProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (allProducts != null) {
      data['allProducts'] = allProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllProducts {
  int? count;
  bool? isSelected;
  String? tabName;
  String? url;

  AllProducts({this.count, this.isSelected, this.tabName, this.url});

  AllProducts.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    isSelected = json['isSelected'];
    tabName = json['tabName'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['count'] = count;
    data['isSelected'] = isSelected;
    data['tabName'] = tabName;
    data['url'] = url;
    return data;
  }
}
