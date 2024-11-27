import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  _UpdateUserScreenState createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _paymentMethodController = TextEditingController();

  DateTime? _dob;
  DateTime? _dueDate;
  String _selectedPaymentPlan = 'Monthly';

  // Function to handle date picking
  Future<void> _selectDate(
      BuildContext context, DateTime? initialDate, ValueChanged<DateTime> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  // Function to update user information in Supabase
  Future<void> _updateUser() async {
    if (_formKey.currentState!.validate()) {
      final user = Supabase.instance.client.auth.currentUser;
      print(user); // Should show user details if logged in
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You must be logged in to update profile')),
        );
        return;
      }

      // Prepare the data to update
      final updates = {
        'name': _nameController.text.trim(),
        'mobile': _mobileController.text.trim(),
        'email': _emailController.text.trim(),
        'height': int.tryParse(_heightController.text.trim()),
        'payment_plan': _selectedPaymentPlan,
        'due_date': _dueDate?.toIso8601String(),
        'payment_method': _paymentMethodController.text.trim(),
      }..removeWhere((key, value) => value == null || value.toString().isEmpty);

      try {
        final response = await Supabase.instance.client
            .from('users')
            .update(updates)
            .eq('id', user.id);
            

        if (response.error != null) {
          throw Exception(response.error!.message);
        }

        // Success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User information updated successfully!')),
        );
      } catch (error) {
        print('Error updating user: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
                ),
                const SizedBox(height: 16),

                // DOB Picker
                GestureDetector(
                  onTap: () => _selectDate(context, _dob, (date) => setState(() => _dob = date)),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        hintText: _dob == null ? 'Select Date of Birth' : '${_dob!.toLocal()}'.split(' ')[0],
                      ),
                      validator: (value) => _dob == null ? 'Please select a date of birth' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Mobile Field
                TextFormField(
                  controller: _mobileController,
                  decoration: const InputDecoration(labelText: 'Mobile'),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty || value.length != 10
                      ? 'Enter a valid 10-digit mobile number'
                      : null,
                ),
                const SizedBox(height: 16),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? 'Enter a valid email'
                      : null,
                ),
                const SizedBox(height: 16),

                // Height Field
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(labelText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter height in cm' : null,
                ),
                const SizedBox(height: 16),

                // Payment Plan Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedPaymentPlan,
                  decoration: const InputDecoration(labelText: 'Payment Plan'),
                  items: ['Monthly', 'Annually'].map((String plan) {
                    return DropdownMenuItem<String>(
                      value: plan,
                      child: Text(plan),
                    );
                  }).toList(),
                  onChanged: (newValue) => setState(() => _selectedPaymentPlan = newValue!),
                ),
                const SizedBox(height: 16),

                // Due Date Picker
                GestureDetector(
                  onTap: () => _selectDate(context, _dueDate, (date) => setState(() => _dueDate = date)),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Due Date',
                        hintText: _dueDate == null ? 'Select Due Date' : '${_dueDate!.toLocal()}'.split(' ')[0],
                      ),
                      validator: (value) => _dueDate == null ? 'Please select a due date' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Payment Method Field
                TextFormField(
                  controller: _paymentMethodController,
                  decoration: const InputDecoration(labelText: 'Payment Method'),
                  validator: (value) => value!.isEmpty ? 'Enter a payment method' : null,
                ),
                const SizedBox(height: 32),

                // Save Button
                ElevatedButton(
                  onPressed: _updateUser,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
