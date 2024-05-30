
import '../Utilis/app_preference.dart';

class ApiUrl {

  static const bool isProductionUrl = false;
  static const String appVersion = "3.3";
  static const int maxAuthRetry = 3;
  static String ringToken = "Bearer MCSU4G7RCK3WMVDK3FVIBLAVAX22J24G";

  static const String baseUrl = isProductionUrl
      ? "https://api.ouraring.com/v2/usercollection/"
      : "https://api.ouraring.com/v2/usercollection/";


  static String getSleepData = "daily_sleep?start_date=";
  static String getHeartRateData = "daily_sleep?start_date=";

}
