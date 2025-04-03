import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var threatsDetected = 12.obs;
  var appPermissionScore = 60.obs;
  var networkAlertScore = 70.obs;

  void updateThreats(int value) {
    threatsDetected.value = value;
  }

  void updateAppPermissionScore(int value) {
    appPermissionScore.value = value;
  }

  void updateNetworkAlertScore(int value) {
    networkAlertScore.value = value;
  }

  String _formatTimestamp(int id) {
    final now = DateTime.now();
    final monthName = DateFormat('MMMM').format(now);
    return "$monthName ${now.day}, ${now.year}";
  }
}
