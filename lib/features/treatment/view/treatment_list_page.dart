import 'package:flutter/material.dart';
import 'medicine_card.dart';
import '../models/models.dart';

class TreatmentListPage extends StatelessWidget {
  const TreatmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Hardcoded data
    final List<Medicine> medicines = [
      Medicine(medicineId: 0, name: 'Medicine 1', type: MedicineType.pill),
      Medicine(medicineId: 0, name: 'Medicine 2', type: MedicineType.syrup),
      Medicine(medicineId: 0, name: 'Medicine 3', type: MedicineType.injection),
      Medicine(medicineId: 0, name: 'Medicine 4', type: MedicineType.capsule),
      Medicine(medicineId: 0, name: 'Medicine 5', type: MedicineType.syrup),
      Medicine(medicineId: 0, name: 'Medicine 7', type: MedicineType.capsule),
      Medicine(medicineId: 0, name: 'Medicine 8', type: MedicineType.syrup),
      Medicine(medicineId: 0, name: 'Medicine 9', type: MedicineType.pill),
      Medicine(medicineId: 0, name: 'Medicine 10', type: MedicineType.pill),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatment List'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) =>
              MedicineCard(medicine: medicines[index]),
          itemCount: medicines.length),
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButton: _floatingActionButton,
    );
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
      ],
    );
  }

  Widget get _floatingActionButton {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "addTreatmentPage");
          },
          child: Icon(Icons.add),
        );
      },
    );
  }
}
