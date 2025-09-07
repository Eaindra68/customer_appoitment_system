import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class KYCFaceCard extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final Widget? icon;
  final Uint8List? image;
  final Function(File, Uint8List) onPicked;
  final Function(BuildContext, Function(File, Uint8List)) showImagePicker;

  const KYCFaceCard({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.icon,
    required this.image,
    required this.onPicked,
    required this.showImagePicker,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showImagePicker(context, onPicked),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withValues(alpha: 0.03),
                ),
              ],
              border: BoxBorder.all(color: Colors.black),
              image: image == null
                  ? null
                  : DecorationImage(
                      image: MemoryImage(image!),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (image == null)
                  Positioned.fill(
                    child:
                        icon ??
                        Icon(
                          Icons.person_outline_rounded,
                          color: Colors.white,
                          size: min(height, width) * 0.8,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
