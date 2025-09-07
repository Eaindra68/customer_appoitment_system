import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExts on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get size => MediaQuery.of(this).size;
  double get screenWidth => size.width;
  double get screenHeight => size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  Future<T?> pushWidget<T>(Widget screen, {Object? extra}) async {
    return await Navigator.of(
      this,
    ).push(CupertinoPageRoute(builder: (context) => screen));
  }

  Future<T?> replaceWidget<T>(Widget screen, {Object? extra}) async {
    return await Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  Future<T?> pushAndRemoveAll<T>(Widget screen) async {
    if (!mounted) return null;
    return await Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  void pop<T extends Object?>([T? result]) {
    if (Navigator.canPop(this)) {
      Navigator.pop<T>(this, result);
    }
  }

  BoxDecoration get decoration => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
