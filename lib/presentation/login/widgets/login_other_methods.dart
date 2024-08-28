import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOtherMethods extends StatelessWidget {
  const LoginOtherMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildDivider(),
            Text(
              "Or continue with",
              style: TextStyle(color: Colors.grey[600]),
            ),
            _buildDivider(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton('assets/ic_google_logo.svg', "Google"),
            const SizedBox(width: 20),
            _buildIconButton('assets/ic_apple_logo.svg', "Apple"),
          ],
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              text: "Not a member? ",
              style: TextStyle(color: Colors.grey[600]),
              children: [
                TextSpan(
                  text: "Register now",
                  style: TextStyle(
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Expanded _buildDivider() {
  return Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: const Divider()));
}

Widget _buildIconButton(String assetName, String label) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          //Icon(iconData, color: Colors.black, size: 32),
          radius: 28,
          child: SvgPicture.asset(assetName, width: 32, height: 32),
          //Image(image: AssetImage(assetData), width: 32),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    ),
  );
}
