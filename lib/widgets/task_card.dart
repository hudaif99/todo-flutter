import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final double? horizontalPadding;
  final double? verticalPadding;
  const CommonCard(
      {Key? key,
        required this.child,
        this.horizontalPadding = 15,
        this.verticalPadding = 18
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 2,
      color: Theme.of(context).colorScheme.tertiary,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding!,
            vertical: verticalPadding!
        ),
        child: child,
      ),
    );
  }
}

