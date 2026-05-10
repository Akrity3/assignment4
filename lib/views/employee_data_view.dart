import 'package:flutter/material.dart';
import 'package:assignment4/model/employee_model.dart';
import 'package:assignment4/utils/text_fields.dart';

class EmployeeDataView extends StatefulWidget {
  const EmployeeDataView({super.key});

  @override
  State<EmployeeDataView> createState() => _EmployeeDataViewState();
}

class _EmployeeDataViewState extends State<EmployeeDataView> {
  final _formKey = GlobalKey<FormState>();
  final _empIdController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;

  final List<EmployeeModel> _lstEmployees = []; // listview

  //Gender dropdown list
  final List<DropdownMenuItem<String>> _genders = const [
    DropdownMenuItem(value: "Male", child: Text("Male")),
    DropdownMenuItem(value: "Female", child: Text("Female")),
    DropdownMenuItem(value: "Other", child: Text("Other")),
  ];

  //department dropdown list
  final List<DropdownMenuItem<String>> _departments = const [
    DropdownMenuItem(value: "IT", child: Text("IT")),
    DropdownMenuItem(value: "HR", child: Text("HR")),
    DropdownMenuItem(value: "Finance", child: Text("Finance")),
    DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
  ];

  @override
  void dispose() {
    _empIdController.dispose();
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _empIdController.clear();
    _fullNameController.clear();
    _usernameController.clear();
    _passwordController.clear();
    setState(() {
      _selectedGender = null;
      _selectedDepartment = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee'),
        backgroundColor: const Color(0xFFBBDEFB),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              CustomTextField(  // Employee ID
                controller: _empIdController,
                labelText: 'Employee ID',
                hintText: 'Enter employee ID',
                prefixIcon: Icons.numbers,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter employee ID';}
                  if (int.tryParse(value) == null) {
                    return 'Employee ID must be a number';
                   }
                  return null;
                }, ),
              const SizedBox(height: 20),

              CustomTextField( // Full Name
                controller: _fullNameController,
                labelText: 'Full Name',
                hintText: 'Enter full name',
                prefixIcon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomDropdown( // Gender
                labelText: 'Gender',
                prefixIcon: Icons.wc,
                value: _selectedGender,
                items: _genders,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  }); },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select gender';
                  }
                  return null;
                },
               ),
              const SizedBox(height: 20),
              // Department 
              CustomDropdown(
                labelText: 'Department',
                prefixIcon: Icons.business,
                value: _selectedDepartment,
                items: _departments,
                onChanged: (value) {
                  setState(() {
                    _selectedDepartment = value;
                  });
                 },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select department';
                  }
                  return null;
                },),
              const SizedBox(height: 20),

              // Username
              CustomTextField(
                controller: _usernameController,
                labelText: 'Username',
                hintText: 'Enter username',
                prefixIcon: Icons.account_circle,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password 
              CustomPasswordField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Add & Clear buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Add employee to list
                          EmployeeModel employee = EmployeeModel(
                            empId: _empIdController.text,
                            fullName: _fullNameController.text,
                            gender: _selectedGender!,
                            department: _selectedDepartment!,
                            username: _usernameController.text,
                            password: _passwordController.text,
                          );

                          setState(() {
                            _lstEmployees.add(employee);
                          });

                          _clearForm();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add Employee'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xFF90CAF9),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _clearForm();
                        _formKey.currentState!.reset();
                      },
                      icon: const Icon(Icons.clear),
                      label: const Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color(0xFFCE93D8),
                        foregroundColor: Colors.white,),
                    ),
                   ),
                ],),
              const SizedBox(height: 40),

              // Employee List
              if (_lstEmployees.isNotEmpty) ...{
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _lstEmployees.length,
                  itemBuilder: (context, index) {
                    final employee = _lstEmployees[index];
                    return Card(
                      color: const Color(0xFFEDE7F6),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFB39DDB),
                          child: Text(
                            employee.fullName[0].toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(employee.fullName),
                        subtitle: Text(
                          'ID: ${employee.empId} | ${employee.department}',
                        ),
                        trailing: Wrap(
                          spacing: 12,
                          children: [
                            // Edit button
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  _empIdController.text = employee.empId;
                                  _fullNameController.text = employee.fullName;
                                  _usernameController.text = employee.username;
                                  _passwordController.text = employee.password;
                                  _selectedGender = employee.gender;
                                  _selectedDepartment = employee.department;
                                  _lstEmployees.removeAt(index);
                                });
                                 },
                             ),

                            // Delete button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _lstEmployees.removeAt(index);
                                });
                              },
                            ),
                          ], ),
                      ), );
                  },
                ), }
                else ...{
                  Text(
                    'No Employees Added',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                },
              ],
            ),
            ),
      ),
    );}
}