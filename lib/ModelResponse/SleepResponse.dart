class SleepResponse {
  List<Data>? data;
  String? nextToken;

  SleepResponse({this.data, this.nextToken});

  SleepResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  Contributors? contributors;
  String? day;
  int? score;
  String? timestamp;

  Data({this.id, this.contributors, this.day, this.score, this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contributors = json['contributors'] != null
        ? new Contributors.fromJson(json['contributors'])
        : null;
    day = json['day'];
    score = json['score'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.contributors != null) {
      data['contributors'] = this.contributors!.toJson();
    }
    data['day'] = this.day;
    data['score'] = this.score;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Contributors {
  int? deepSleep;
  int? efficiency;
  int? latency;
  int? remSleep;
  int? restfulness;
  int? timing;
  int? totalSleep;

  Contributors(
      {this.deepSleep,
        this.efficiency,
        this.latency,
        this.remSleep,
        this.restfulness,
        this.timing,
        this.totalSleep});

  Contributors.fromJson(Map<String, dynamic> json) {
    deepSleep = json['deep_sleep'] ?? 0;
    efficiency = json['efficiency'] ?? 0;
    latency = json['latency'] ?? 0;
    remSleep = json['rem_sleep'] ?? 0;
    restfulness = json['restfulness']?? 0;
    timing = json['timing'] ?? 0;
    totalSleep = json['total_sleep'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deep_sleep'] = this.deepSleep;
    data['efficiency'] = this.efficiency;
    data['latency'] = this.latency;
    data['rem_sleep'] = this.remSleep;
    data['restfulness'] = this.restfulness;
    data['timing'] = this.timing;
    data['total_sleep'] = this.totalSleep;
    return data;
  }
}

