import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: ColorConst.primary,
        leading: InkWell(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "About Us",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Text(
            "About Us",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "AcePlus Solutions started up in July 2012 as a subsidiary company of ACE Data Systems, one of the leading software houses in Myanmar. Major focus area of AcePlus is the software developments on the mobile and internet platform. AcePlus offers website & web application development services for various business organizations to extend their delivery channel of their products and services. Our vision is to deliver software products for the customers beyond their expectations. AcePlus develops website and software products for both local and international markets.",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          Text(
            "Our Mission",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "- Build Talent through Talent Programs",
                  style: context.textTheme.labelSmall,
                ),
                TextSpan(
                  text: "- Recruit Experts and Freshers through Universities",
                  style: context.textTheme.labelSmall,
                ),
                TextSpan(
                  text:
                      "- Offer one stop solutions in collaboration with partner companies",
                  style: context.textTheme.labelSmall,
                ),
                TextSpan(
                  text: "Provide Offshore, Nearshore, Onsite IT supports",
                  style: context.textTheme.labelSmall,
                ),
                TextSpan(
                  text:
                      "- Deliver IT services on Mobile (iOS & Android), Web Applications",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
          Text(
            "Our Vision",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "Deliver beyond expectation on software services, system solutions, and professional supports.",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
