import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_us_card.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ContactUsCard(
              icon: Icons.location_pin,
              label: 'Our Address',
              sublabel:
                  "Building (19), 4th floor, MICT Park, Hlaing Township Yangon",
              onTap: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ContactUsCard(
                  icon: Icons.email,
                  label: 'Email Us',
                  sublabel: "admin@aceplussolutions.com",
                  onTap: () {},
                ),
              ),
              Expanded(
                child: ContactUsCard(
                  icon: Icons.phone,
                  label: 'Call Us',
                  sublabel: "09 777005818",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
