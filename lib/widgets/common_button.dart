import 'package:flutter/material.dart';

import '../utils/font_constants.dart';

class CommonButton extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  const CommonButton({
    Key? key,
    required this.child,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            textStyle: FontConstants.primary15,
            backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
            foregroundColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
        ),
        child: child
    );
  }
}
