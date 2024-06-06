class OuraApiResponse {
  int? deepSleep;
  int? efficiency;
  int? latency;
  int? remSleep;
  int? restfulness;
  int? timing;
  int? totalSleep;
  String? id;
  String? day;
  int? stressHigh;
  int? recoveryHigh;
  String? daySummary;

  OuraApiResponse(
      {this.deepSleep,
        this.efficiency,
        this.latency,
        this.remSleep,
        this.restfulness,
        this.timing,this.id, this.day, this.stressHigh, this.recoveryHigh, this.daySummary,
        this.totalSleep});

  OuraApiResponse.fromJson(Map<String, dynamic> json) {
    deepSleep = json['deep_sleep'] ?? 0;
    efficiency = json['efficiency'] ?? 0;
    latency = json['latency'] ?? 0;
    remSleep = json['rem_sleep'] ?? 0;
    restfulness = json['restfulness']?? 0;
    timing = json['timing'] ?? 0;
    totalSleep = json['total_sleep'] ?? 0;
    id = json['id'] ?? 0;
    day = json['day'] ?? "";
    stressHigh = json['stress_high'] ?? 0;
    recoveryHigh = json['recovery_high'] ?? 0;
    daySummary = json['day_summary'] ?? "";
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
    data['id'] = this.id;
    data['day'] = this.day;
    data['stress_high'] = this.stressHigh;
    data['recovery_high'] = this.recoveryHigh;
    data['day_summary'] = this.daySummary;
    return data;
  }
}
