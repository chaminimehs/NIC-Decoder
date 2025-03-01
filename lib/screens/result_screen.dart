import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController controller = Get.find<NICController>();

  ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NIC Details"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card for NIC Format
            _buildDetailCard(
              icon: Icons.perm_identity,
              title: "Format",
              value: controller.isOldFormat.value ? 'Old (9-digit)' : 'New (12-digit)',
            ),

            _buildDetailCard(
              icon: Icons.cake,
              title: "Birth Year",
              value: controller.birthYear.value.toString(),
            ),

            _buildDetailCard(
              icon: Icons.calendar_today,
              title: "Date of Birth",
              value: controller.birthDate.value,
            ),

            _buildDetailCard(
              icon: Icons.access_time,
              title: "Weekday",
              value: controller.weekday.value,
            ),

            _buildDetailCard(
              icon: Icons.timeline,
              title: "Age",
              value: controller.age.value.toString(),
            ),

            _buildDetailCard(
              icon: Icons.wc,
              title: "Gender",
              value: controller.gender.value,
            ),

            SizedBox(height: 30),

            // Back Button
            ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({required IconData icon, required String title, required String value}) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(fontSize: 16)),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
