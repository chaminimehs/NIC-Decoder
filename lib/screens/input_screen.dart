import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class InputScreen extends StatelessWidget {
  final NICController controller = Get.put(NICController());
  final TextEditingController nicController = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NIC Decoder"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // NIC Input Field
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: nicController,
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  decoration: InputDecoration(
                    labelText: "Enter NIC Number",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.perm_identity, color: Colors.blueAccent),
                    counterText: "", // Hide character count
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Decode Button with Loader
            Obx(() => ElevatedButton.icon(
                  onPressed: () {
                    if (nicController.text.isEmpty) {
                      Get.snackbar("Error", "Please enter a valid NIC number",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white);
                      return;
                    }
                    controller.decodeNIC(nicController.text.trim());
                  },
                  icon: controller.isLoading.value
                      ? SizedBox(
                          width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : Icon(Icons.search),
                  label: Text("Decode"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
