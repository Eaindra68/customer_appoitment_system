import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

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
          "Frequently Asked Questions",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: How can I book an appointment?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "A: Tap the Appointment button and fill in the required information.\n",
            ),

            Text(
              "Q: What are your office hours?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("A: Monday - Friday, 9:00 AM to 5:00 PM\n"),

            Text(
              "Q: Can I cancel or reschedule my appointment?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "A: Yes, you can cancel or reschedule from the Appointment page.\n",
            ),

            Text(
              "Q: Do you send notifications for upcoming appointments?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "A: Yes, you will receive notifications before your scheduled time.",
            ),
          ],
        ),
      ),
    );
  }
}
