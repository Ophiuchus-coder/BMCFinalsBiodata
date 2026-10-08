import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Personal Information
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController civilStatusController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  // Contact Information
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Educational Background
  final TextEditingController courseController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController educationController = TextEditingController();

  // Family Information
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();

  // Emergency Contact
  final TextEditingController emergencyNameController = TextEditingController();
  final TextEditingController emergencyNumberController =
      TextEditingController();
  final TextEditingController emergencyRelationshipController =
      TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveData() async {
    if (nameController.text.trim().isEmpty ||
        birthDateController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        sexController.text.trim().isEmpty ||
        civilStatusController.text.trim().isEmpty ||
        nationalityController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        courseController.text.trim().isEmpty ||
        sectionController.text.trim().isEmpty ||
        schoolController.text.trim().isEmpty ||
        educationController.text.trim().isEmpty ||
        fatherNameController.text.trim().isEmpty ||
        motherNameController.text.trim().isEmpty ||
        emergencyNameController.text.trim().isEmpty ||
        emergencyNumberController.text.trim().isEmpty ||
        emergencyRelationshipController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    await firestore.collection('students').add({
      // Personal Information
      'name': nameController.text.trim(),
      'birthDate': birthDateController.text.trim(),
      'age': ageController.text.trim(),
      'sex': sexController.text.trim(),
      'civilStatus': civilStatusController.text.trim(),
      'nationality': nationalityController.text.trim(),

      // Contact Information
      'address': addressController.text.trim(),
      'phone': phoneController.text.trim(),
      'email': emailController.text.trim(),

      // Educational Background
      'course': courseController.text.trim(),
      'section': sectionController.text.trim(),
      'school': schoolController.text.trim(),
      'educationalAttainment': educationController.text.trim(),

      // Family Information
      'fatherName': fatherNameController.text.trim(),
      'motherName': motherNameController.text.trim(),

      // Emergency Contact
      'emergencyName': emergencyNameController.text.trim(),
      'emergencyNumber': emergencyNumberController.text.trim(),
      'emergencyRelationship': emergencyRelationshipController.text.trim(),

      'createdAt': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Biodata saved successfully')));

    // Clear Personal Information
    nameController.clear();
    birthDateController.clear();
    ageController.clear();
    sexController.clear();
    civilStatusController.clear();
    nationalityController.clear();

    // Clear Contact Information
    addressController.clear();
    phoneController.clear();
    emailController.clear();

    // Clear Educational Background
    courseController.clear();
    sectionController.clear();
    schoolController.clear();
    educationController.clear();

    // Clear Family Information
    fatherNameController.clear();
    motherNameController.clear();

    // Clear Emergency Contact
    emergencyNameController.clear();
    emergencyNumberController.clear();
    emergencyRelationshipController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    ageController.dispose();
    sexController.dispose();
    civilStatusController.dispose();
    nationalityController.dispose();

    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();

    courseController.dispose();
    sectionController.dispose();
    schoolController.dispose();
    educationController.dispose();

    fatherNameController.dispose();
    motherNameController.dispose();

    emergencyNameController.dispose();
    emergencyNumberController.dispose();
    emergencyRelationshipController.dispose();

    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biodata Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // PERSONAL INFORMATION
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            buildTextField(controller: nameController, label: 'Full Name'),

            const SizedBox(height: 12),

            buildTextField(
              controller: birthDateController,
              label: 'Date of Birth',
            ),

            const SizedBox(height: 12),

            buildTextField(controller: ageController, label: 'Age'),

            const SizedBox(height: 12),

            buildTextField(controller: sexController, label: 'Sex'),

            const SizedBox(height: 12),

            buildTextField(
              controller: civilStatusController,
              label: 'Civil Status',
            ),

            const SizedBox(height: 12),

            buildTextField(
              controller: nationalityController,
              label: 'Nationality',
            ),

            const SizedBox(height: 24),

            // CONTACT INFORMATION
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            buildTextField(controller: addressController, label: 'Address'),

            const SizedBox(height: 12),

            buildTextField(controller: phoneController, label: 'Phone Number'),

            const SizedBox(height: 12),

            buildTextField(controller: emailController, label: 'Email'),

            const SizedBox(height: 24),

            // EDUCATIONAL BACKGROUND
            const Text(
              'Educational Background',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            buildTextField(controller: courseController, label: 'Course'),

            const SizedBox(height: 12),

            buildTextField(controller: sectionController, label: 'Section'),

            const SizedBox(height: 12),

            buildTextField(controller: schoolController, label: 'School'),

            const SizedBox(height: 12),

            buildTextField(
              controller: educationController,
              label: 'Educational Attainment',
            ),

            const SizedBox(height: 24),

            // FAMILY INFORMATION
            const Text(
              'Family Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            buildTextField(
              controller: fatherNameController,
              label: "Father's Name",
            ),

            const SizedBox(height: 12),

            buildTextField(
              controller: motherNameController,
              label: "Mother's Name",
            ),

            const SizedBox(height: 24),

            // EMERGENCY CONTACT
            const Text(
              'Emergency Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            buildTextField(
              controller: emergencyNameController,
              label: 'Emergency Contact Name',
            ),

            const SizedBox(height: 12),

            buildTextField(
              controller: emergencyNumberController,
              label: 'Emergency Contact Number',
            ),

            const SizedBox(height: 12),

            buildTextField(
              controller: emergencyRelationshipController,
              label: 'Relationship',
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
