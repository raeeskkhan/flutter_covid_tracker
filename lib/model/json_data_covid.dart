class CovidWorldWide {
  Latest latest;

  CovidWorldWide({this.latest});

  factory CovidWorldWide.fromJson(Map<String, dynamic> parsedJson) {
    //print(Latest.fromJson(parsedJson['latest']));
    return CovidWorldWide(
      latest: Latest.fromJson(parsedJson['latest']),
    );
  }
}

class Latest {
  int confirmed;
  int deaths;
  int recovered;

  Latest({this.confirmed, this.deaths, this.recovered});

  factory Latest.fromJson(Map<String, dynamic> json) {
    return Latest(
      confirmed: json['confirmed'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}
