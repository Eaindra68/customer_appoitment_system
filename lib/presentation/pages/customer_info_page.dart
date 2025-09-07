import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:ace_customer_appoitment_system/core/constants/my_images.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/colors_constant.dart';
import '../widgets/birthday_selector_card.dart';
import '../widgets/customer_take_image.dart';
import '../widgets/gender_selector_card.dart';

class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({super.key});

  @override
  State<CustomerInfoPage> createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _selectedDateOfBirth;
  String? _selectedGender;
  File? profileFile;
  Uint8List? _profileImg;

  Future<void> _pickImage(
    ImageSource source,
    Function(File, Uint8List) onPicked,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final Uint8List bytes = await pickedFile.readAsBytes();
      onPicked(file, bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Customer Information",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: KYCFaceCard(
                  width: 120,
                  height: 120,
                  url: MyImages.addPhotoPng,
                  image: _profileImg,
                  icon: Opacity(
                    opacity: 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Image.asset(MyImages.addPhotoPng),
                      ),
                    ),
                  ),
                  onPicked: (file, bytes) => setState(() {
                    profileFile = file;
                    _profileImg = bytes;
                  }),
                  showImagePicker: (context, onPicked) {
                    _pickImage(ImageSource.camera, onPicked);
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone",
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              GenderSelector(
                selectedGender: _selectedGender,
                onChanged: (value) {
                  _selectedGender = value;
                  if (mounted) setState(() {});
                },
                isDisabled: false,
              ),
              BirthDateSelectorCard(
                label: "Date of Birth",
                selectedDate: _selectedDateOfBirth,
                onDateChanged: (value) {
                  _selectedDateOfBirth = value;
                  if (mounted) setState(() {});
                },
              ),
              BirthDateSelectorCard(
                label: "Appointment Date",
                selectedDate: _selectedDateOfBirth,
                onDateChanged: (value) {
                  _selectedDateOfBirth = value;
                  if (mounted) setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
