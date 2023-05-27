import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:flutter_farmer_app/profile/domain/states/auth_state.dart';
import 'package:flutter_farmer_app/profile/presentation/widgets/login_widget.dart';
import 'package:flutter_farmer_app/profile/presentation/widgets/profile_widget.dart';
import 'package:flutter_farmer_app/profile/presentation/widgets/register_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: greenColor,
              title: Text(context.read<AuthState>().user != null ? 'Профиль' : 'Авторизация'),
              bottom: context.read<AuthState>().user != null
                  ? null
                  : TabBar(
                      indicatorColor: Colors.black.withOpacity(0.7),
                      tabs: const [
                        Tab(
                          text: 'Вход',
                        ),
                        Tab(
                          text: 'Регистрация',
                        ),
                      ],
                    ),
            ),
            body: context.read<AuthState>().user != null
                ? const ProfileWidget()
                : const TabBarView(
                    children: [
                      LoginWidget(),
                      RegistrationWidget(),
                    ],
                  ),
            // const RegistrationWidget(),
          ),
        ),
      );
}
