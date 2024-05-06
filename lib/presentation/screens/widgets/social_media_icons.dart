import 'package:flutter/material.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaLinks(
            socialMediaIcon: AssetImage('assets/images/facebook.jpg')),
        SizedBox(width: 50),
        SocialMediaLinks(
            socialMediaIcon: AssetImage('assets/images/google.jpg')),
      ],
    );
  }
}

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    super.key,
    required this.socialMediaIcon,
  });
  final ImageProvider socialMediaIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
          image: DecorationImage(image: socialMediaIcon),
        ),
      ),
    );
  }
}
