import 'package:ace_customer_appoitment_system/config/colors_constant.dart';
import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/about_us_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/appointment_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/contact_us_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/customer_info_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/customer_list_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/faq_page.dart';
import 'package:ace_customer_appoitment_system/presentation/pages/noti_page.dart';
import 'package:ace_customer_appoitment_system/presentation/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62),
        child: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          backgroundColor: ColorConst.primary,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.screenWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hey, Eaindra",
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Welcome back!!",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Eng",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                "Customer Appointment System",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCardWidget(
                  icon: Icons.schedule,
                  label: 'Appointment',
                  onTap: () => context.pushWidget(AppointmentPage()),
                ),
                HomeCardWidget(
                  icon: Icons.group,
                  label: 'Customer',
                  onTap: () => context.pushWidget(CustomerListPage()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                HomeCardWidget(
                  icon: Icons.info,
                  label: 'Aboou Us',
                  onTap: () => context.pushWidget(AboutUsPage()),
                ),
                HomeCardWidget(
                  icon: Icons.person,
                  label: 'Contact Us',
                  onTap: () => context.pushWidget(ContactUsPage()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCardWidget(
                  icon: Icons.question_answer,
                  label: 'FAQ',
                  onTap: () => context.pushWidget(FAQPage()),
                ),
                HomeCardWidget(
                  icon: Icons.notifications,
                  label: 'Notification',
                  onTap: () => context.pushWidget(NotiPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
