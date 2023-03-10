// To parse this JSON data, do
//
//     final tvSeriesResponse = tvSeriesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:equatable/equatable.dart';

TvSeriesResponse tvSeriesResponseFromJson(String str) =>
    TvSeriesResponse.fromJson(json.decode(str));

String tvSeriesResponseToJson(TvSeriesResponse data) =>
    json.encode(data.toJson());

class TvSeriesResponse extends Equatable {
  TvSeriesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TvModel> results;
  final int totalPages;
  final int totalResults;

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        page: json["page"],
        results: List<TvModel>.from((json["results"] as List)
            .map((x) => TvModel.fromJson(x))
            .where((element) => element.posterPath != null)),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  List<Object?> get props => [results];
}
