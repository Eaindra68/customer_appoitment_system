import 'dart:typed_data';

import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:ace_customer_appoitment_system/core/widgets/custom_textfield.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/customer_info_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/colors_constant.dart';
import '../../config/ui_constant.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final TextEditingController _nameController = TextEditingController();
  late Box customersBox;
  List<dynamic> customers = [];

  @override
  void initState() {
    super.initState();
    customersBox = Hive.box('customersBox');
    _loadCustomers();
  }

  void _loadCustomers() {
    setState(() {
      customers = customersBox.values.toList();
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(callUri)) {
        await launchUrl(callUri);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Could not call $phoneNumber")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
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
          "Customer List",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.pushWidget(CustomerInfoPage());
          if (result == true) {
            _loadCustomers();
          }
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      controller: _nameController,
                      hintText: "Search name here",
                      suffixIcon: Icons.close,
                      prefixIcon: Icons.search,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorConst.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _loadCustomers,
                    child: Text("Filter"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: customers.isEmpty
                  ? Center(child: Text("No Customer found"))
                  : ListView.builder(
                      itemCount: customers.length,
                      itemBuilder: (context, index) {
                        final customer = customers[index];
                        final imageBytes = customer['image'] as Uint8List?;
                        final name = customer['name'] ?? 'Unknown';
                        final phone = customer['phone'] ?? 'No phone';
                        final address = customer['address'] ?? 'No Address';
                        final appointmentDate =
                            customer['appointmentDate'] != null
                            ? DateTime.parse(customer['appointmentDate'])
                            : null;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),

                          child: SizedBox(
                            width: context.screenWidth,
                            height: 85,
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8),
                                    image: imageBytes != null
                                        ? DecorationImage(
                                            image: MemoryImage(imageBytes),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: imageBytes == null
                                      ? Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name.toString(),
                                          style: context.textTheme.bodyLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: address.toString(),
                                                style: context
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "APPT:${appointmentDate != null ? UIConstants.dateFormat.format(appointmentDate) : 'Not set'} Result:",
                                              style: context
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_up_sharp,
                                              color: Colors.red,
                                            ),
                                            Spacer(),
                                            Text(
                                              phone.toString(),
                                              style: context
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      final phoneNumber =
                                          customer['phone']?.toString() ?? '';
                                      if (phoneNumber.isNotEmpty) {
                                        _makePhoneCall(phoneNumber);
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "No phone number available",
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
