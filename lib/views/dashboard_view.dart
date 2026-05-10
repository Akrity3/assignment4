import 'package:flutter/material.dart';
import 'package:assignment4/views/employee_data_view.dart'; // was missing - caused Employee to not work
import 'package:assignment4/views/grid_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 4'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Employee Card
            Card(
              child: ListTile(
                leading: const Icon(Icons.badge, color: Colors.blue),
                title: const Text('Employee'),
                subtitle: const Text('Manage employee records'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmployeeDataView(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // GridView Card
            Card(
              child: ListTile(
                leading: const Icon(Icons.grid_view, color: Colors.green),
                title: const Text('GridView'),
                subtitle: const Text('View employees in grid'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GridViewScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );}
}