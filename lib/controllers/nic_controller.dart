import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var weekday = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var isOldFormat = false.obs;
  var isLoading = false.obs; // ✅ Added isLoading

  void decodeNIC(String nic) {
    try {
      isLoading.value = true; // ✅ Start loading state

      Future.delayed(Duration(seconds: 2), () { // Simulate processing delay
        int year;
        int dayOfYear;
        int serialNumber;
        bool isOld = nic.length == 10;

        if (isOld) {
          year = int.parse(nic.substring(0, 2)) + 1900;
          dayOfYear = int.parse(nic.substring(2, 5));
          serialNumber = int.parse(nic.substring(5, 9));
        } else if (nic.length == 12) {
          year = int.parse(nic.substring(0, 4));
          dayOfYear = int.parse(nic.substring(4, 7));
          serialNumber = int.parse(nic.substring(7, 12));
        } else {
          throw Exception("Invalid NIC format");
        }

        isOldFormat.value = isOld;

        // Determine gender
        if (dayOfYear > 500) {
          dayOfYear -= 500;
          gender.value = "Female";
        } else {
          gender.value = "Male";
        }

        // Get birth date
        DateTime dob = DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
        birthYear.value = year.toString();
        birthDate.value = DateFormat('yyyy-MM-dd').format(dob);
        weekday.value = DateFormat('EEEE').format(dob);

        // Calculate age
        int currentYear = DateTime.now().year;
        age.value = (currentYear - year).toString();

        isLoading.value = false; // ✅ Stop loading state

        // Navigate to result screen
        Get.toNamed('/result');
      });
    } catch (e) {
      isLoading.value = false; // ✅ Stop loading if error occurs
      Get.snackbar("Error", "Invalid NIC number");
    }
  }
}
