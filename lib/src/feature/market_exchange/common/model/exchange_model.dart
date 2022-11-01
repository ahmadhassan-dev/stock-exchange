import 'package:equatable/equatable.dart';

class ExchangeModel extends Equatable {
  final String? name;
  final String? acronym;
  final String? mic;
  final String? country;
  final String? countryCode;
  final String? city;
  final String? website;
  final Timezone? timezone;
  final Currency? currency;

  const ExchangeModel({this.name, this.acronym, this.mic, this.country, this.countryCode, this.city, this.website, this.timezone, this.currency});

  ExchangeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        acronym = json['acronym'] ?? "",
        mic = json['mic'] ?? "",
        country = json['country'] ?? "",
        countryCode = json['country_code'] ?? "",
        city = json['city'] ?? "",
        website = json['website'] ?? "",
        timezone = json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null,
        currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['acronym'] = acronym;
    data['mic'] = mic;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['city'] = city;
    data['website'] = website;
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [name, acronym, mic, country, countryCode, city, website, timezone, currency];
}

class Timezone extends Equatable {
  final String? timezone;
  final String? abbr;
  final String? abbrDst;

  const Timezone({this.timezone, this.abbr, this.abbrDst});

  Timezone.fromJson(Map<String, dynamic> json)
      : timezone = json['timezone'] ?? "",
        abbr = json['abbr'] ?? "",
        abbrDst = json['abbr_dst'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['timezone'] = timezone;
    data['abbr'] = abbr;
    data['abbr_dst'] = abbrDst;
    return data;
  }

  @override
  List<Object?> get props => [timezone, abbr, abbrDst];
}

class Currency {
  final String? code;
  final String? symbol;
  final String? name;

  Currency({this.code, this.symbol, this.name});

  Currency.fromJson(Map<String, dynamic> json)
      : code = json['code'] ?? "",
        symbol = json['symbol'] ?? "",
        name = json['name'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['symbol'] = symbol;
    data['name'] = name;
    return data;
  }
}
