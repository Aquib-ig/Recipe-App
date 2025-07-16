import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final Widget prefixIcon;
  final String text;
  final Widget suffixIcon;
  final void Function()? onTap;

  const ProfileTile({
    super.key,
    required this.prefixIcon,
    required this.text,
    required this.suffixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white10,
                child: prefixIcon,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(text)),
              suffixIcon,
            ],
          ),
        ),
      ),
    );
  }
}
