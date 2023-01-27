import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class MyAnimated extends StatelessWidget {
  final Tween<double>? tween;
  final Widget Function(BuildContext context, double scales, Widget? child)?
      builder;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Duration? duration;
  const MyAnimated(
      {Key? key,
      this.tween,
      this.builder,
      this.alignment,
      this.child,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: tween ?? Tween<double>(begin: 0, end: 1),
        duration: duration ?? const Duration(milliseconds: 300),
        builder: builder ??
            (BuildContext context, double scales, Widget? child) {
              return Transform.scale(
                scale: scales,
                alignment: alignment ?? Alignment.bottomCenter,
                child: child,
              );
            },
        child: child);
  }
}
