class StressResponse {
  List<StressData>? data;
  Null? nextToken;

  StressResponse({this.data, this.nextToken});

  StressResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StressData>[];
      json['data'].forEach((v) {
        data!.add(new StressData.fromJson(v));
      });
    }
    nextToken = json['next_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['next_token'] = this.nextToken;
    return data;
  }
}

class StressData {
  String? id;
  String? day;
  int? stressHigh;
  int? recoveryHigh;
  String? daySummary;

  StressData(
      {this.id, this.day, this.stressHigh, this.recoveryHigh, this.daySummary});

  StressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    stressHigh = json['stress_high'];
    recoveryHigh = json['recovery_high'];
    daySummary = json['day_summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['stress_high'] = this.stressHigh;
    data['recovery_high'] = this.recoveryHigh;
    data['day_summary'] = this.daySummary;
    return data;
  }
}