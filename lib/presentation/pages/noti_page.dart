import 'package:ace_customer_appoitment_system/core/extensions/context_exts.dart';
import 'package:flutter/material.dart';

import '../../config/colors_constant.dart';

class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

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
          "Notifications",
          style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorConst.primary,
                      radius: 24,
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Appointment",
                            style: context.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Your appointment has been successfully registered. ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            " The system will be updated soon.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 1, thickness: 0.5, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
