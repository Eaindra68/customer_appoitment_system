import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:ace_customer_appoitment_system/presentation/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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
          "Contact Us",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: HomeCardWidget(
              icon: Icons.group,
              label: 'Our Address',
              onTap: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              HomeCardWidget(icon: Icons.info, label: 'Aboou Us', onTap: () {}),
              HomeCardWidget(
                icon: Icons.person,
                label: 'Contact Us',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
