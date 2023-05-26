import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/profile/presentation/register_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: greenColor,
          title: const Text('Регистрация'),
        ),
        body: const RegistrationWidget(),
      );
}
