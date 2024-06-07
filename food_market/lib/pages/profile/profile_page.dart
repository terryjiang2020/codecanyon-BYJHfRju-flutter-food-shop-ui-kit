import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_market/helpers/colors.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);

    return SingleChildScrollView(
      key: const PageStorageKey('profile_page'),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: themeProv.isDarkTheme! ? ColorDark.card : Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Const.margin),
                    child: IconButton(
                      icon: const Icon(Feather.settings),
                      color:
                          themeProv.isDarkTheme! ? Colors.white : Colors.black,
                      onPressed: () {
                        Get.toNamed<dynamic>(Routes.settings);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: CachedNetworkImageProvider(
                    Const.mockProfileImage,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 15),
                Text('Jessica Veranda', style: theme.textTheme.headlineLarge),
                const SizedBox(height: 5),
                Text('Jakarta Pusat', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 50),
                buildProfileItem(
                  context,
                  title: AppLocalizations.of(context)!.email_address,
                  trailing: 'jscvrnd19@gmail.com',
                ),
                const SizedBox(height: 5),
                Divider(
                  thickness: 2,
                  color: theme.colorScheme.background,
                ),
                const SizedBox(height: 5),
                buildProfileItem(
                  context,
                  title: AppLocalizations.of(context)!.phone_number,
                  trailing: '+6281345071707',
                ),
                const SizedBox(height: 5),
                Divider(
                  thickness: 2,
                  color: theme.colorScheme.background,
                ),
                const SizedBox(height: 5),
                buildProfileItem(
                  context,
                  title: AppLocalizations.of(context)!.address,
                  trailing: 'Jl. S. Parman',
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: themeProv.isDarkTheme! ? ColorDark.card : Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 5),
                buildSettingApp(
                  context,
                  icon: Feather.moon,
                  title: AppLocalizations.of(context)!.dark_mode,
                  trailing: Switch(
                    value: themeProv.isDarkTheme!,
                    activeColor: theme.primaryColor,
                    onChanged: (val) {
                      themeProv.changeTheme();
                    },
                  ),
                ),
                const SizedBox(height: 15),
                buildSettingApp(
                  context,
                  icon: Feather.globe,
                  title: AppLocalizations.of(context)!.change_language,
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.toNamed<dynamic>(Routes.changeLanguage);
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(Const.margin),
            child: MyRaisedButton(
              label: AppLocalizations.of(context)!.log_out,
              onTap: () {
                showDialog<dynamic>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: themeProv.isDarkTheme!
                          ? ColorDark.card
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Text(
                        AppLocalizations.of(context)!.are_you_sure,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall,
                      ),
                      content: Text(
                        AppLocalizations.of(context)!
                            .if_you_select_log_out_it_will_return_to_the_login_screen,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed<dynamic>(Routes.signin);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.yes,
                            style: theme.textTheme.headlineSmall!
                                .copyWith(color: theme.primaryColor),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.back<dynamic>(),
                          child: Text(
                            AppLocalizations.of(context)!.no,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildProfileItem(
    BuildContext context, {
    required String title,
    required String trailing,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(title, style: theme.textTheme.bodyMedium),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(trailing, style: theme.textTheme.titleLarge),
          ),
        ],
      ),
    );
  }

  InkWell buildSettingApp(
    BuildContext context, {
    required String title,
    IconData? icon,
    Widget? trailing,
    void Function()? onTap,
  }) {
    final themeProv = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Row(
          children: [
            Icon(
              icon,
              color: themeProv.isDarkTheme! ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 15),
            Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
            trailing!,
          ],
        ),
      ),
    );
  }
}
