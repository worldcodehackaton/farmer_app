import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/profile/domain/states/auth_state.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  Widget _buildUserInfo(String name, String email) => Container(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LineIcons.userCircle,
              size: 32,
            ),
            const SizedBox(width: 12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$name\n',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildDivider() => Divider(
        color: Colors.grey.withOpacity(.5),
      );

  Widget _buildTile(
    String title,
    VoidCallback callback,
  ) =>
      InkWell(
        onTap: callback,
        child: Container(
          padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
          child: Row(
            children: [
              Text(title),
              const SizedBox(width: 12),
              const Icon(
                Icons.chevron_right_outlined,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthState>().user;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildUserInfo(user.name, user.email),
          _buildDivider(),
          const SizedBox(height: 12),
          _buildTile('Мои заказы', () {}),
          _buildTile('Мои адреса', () {}),
        ],
      ),
    );
  }
}
