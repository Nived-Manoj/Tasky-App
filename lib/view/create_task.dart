import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainproject_tasky/model/task.dart';
import 'package:mainproject_tasky/utils/color_constant.dart';
import 'package:mainproject_tasky/view/home_screen.dart';

class CreateTask extends StatefulWidget {
  final Function(Task) onTaskAdded;

  CreateTask({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final List<String> _categories = ['Work', 'Project', 'Freelance', 'Other'];
  String? _selectedCategory;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  List<String> _members = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        // backgroundColor: ColorConstant.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryDropdown(),
            const SizedBox(height: 16),
            _buildTextField(_nameController, "Project Name"),
            const SizedBox(height: 16),
            _buildTextField(_descriptionController, "Description", maxLines: 3),
            const SizedBox(height: 16),
            _buildDatePicker("Start Date", _startDate,
                (date) => setState(() => _startDate = date)),
            const SizedBox(height: 16),
            _buildDatePicker("End Date", _endDate,
                (date) => setState(() => _endDate = date)),
            const SizedBox(height: 16),
            _buildMembersList(),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //backgroundColor: ColorConstant.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _saveTask,
              child: Text("Save",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorConstant.white,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('Project category'),
          value: _selectedCategory,
          onChanged: (newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
          items: _categories.map((category) {
            return DropdownMenuItem(
              child: Text(category),
              value: category,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildDatePicker(
      String label, DateTime? selectedDate, Function(DateTime) onDateSelected) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          onDateSelected(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(selectedDate)
              : 'Select a date',
        ),
      ),
    );
  }

  Widget _buildMembersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Members",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            ..._members.map((member) => Chip(
                  label: Text(member),
                  onDeleted: () => setState(() => _members.remove(member)),
                )),
            ActionChip(
              label: Text("Add Member"),
              onPressed: _addMember,
            ),
          ],
        ),
      ],
    );
  }

  void _addMember() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Member"),
        content: TextField(
          decoration: InputDecoration(hintText: "Enter member name"),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Add"),
            onPressed: () => Navigator.of(context).pop(context),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _members.add(result);
      });
    }
  }

  void _saveTask() {
    if (_selectedCategory == null ||
        _nameController.text.isEmpty ||
        _startDate == null ||
        _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }

    final newTask = Task(
      category: _selectedCategory!,
      name: _nameController.text,
      description: _descriptionController.text,
      startDate: _startDate!,
      endDate: _endDate!,
      members: _members,
    );

    widget.onTaskAdded(newTask);

    // Clear controllers and reset state
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategory = null;
      _startDate = null;
      _endDate = null;
      _members.clear();
    });

    // Navigate back to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}
