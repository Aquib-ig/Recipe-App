import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controllers/theme_controller.dart';
import 'package:recipe_app/widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeController>(context);
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 50, backgroundColor: Color(0xfff2680d)),
                SizedBox(height: 30),
                Text(
                  "Aquib Khan",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Text(
                  "khanaquibak011@gmail.com",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Color(0xfff2680d),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                ProfileTile(
                  prefixIcon: Icon(Icons.help_center),
                  text: "Help Center",
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
                Divider(),

                ProfileTile(
                  prefixIcon: Icon(Icons.star_border_rounded),
                  text: "Rate the App",
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
                Divider(),

                ProfileTile(
                  prefixIcon: Icon(Icons.visibility),
                  text: "Dark Mode",
                  suffixIcon: Switch(
                    value: isDark,
                    onChanged: (value) {
                      themeProvider.toggleTheme(value);
                    },
                  ),
                  onTap: () {},
                ),
                Divider(),

                ProfileTile(
                  prefixIcon: Icon(Icons.privacy_tip_outlined),
                  text: "Privacy Polacy",
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
                Divider(),

                ProfileTile(
                  prefixIcon: Icon(Icons.logout),
                  text: "Logout",
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
