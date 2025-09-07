import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:ace_customer_appoitment_system/core/widgets/custom_filled_button.dart';
import 'package:ace_customer_appoitment_system/core/widgets/custom_textfield.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/customer_info_page.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
        onPressed: () => context.pushWidget(CustomerInfoPage()),
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
                    onPressed: () {},
                    child: Text("Filter"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
