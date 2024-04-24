import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/l10n/l10n.dart';
import 'package:food_market/providers/locale_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  Locale? _selectedLocale = L10n.all.first;

  @override
  void initState() {
    super.initState();
    switch (Platform.localeName) {
      case 'id_ID':
        _selectedLocale = L10n.all[1];
      default:
        _selectedLocale = L10n.all.first;
    }
  }

  String language(String val) {
    switch (val) {
      case 'id':
        return 'Indonesian';
      default:
        return 'English';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localeProv = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: theme.primaryColor,
          onPressed: () => Get.back<dynamic>(),
        ),
        title: Text(
          AppLocalizations.of(context)!.change_language,
          style: theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: L10n.all.map((locale) {
                    return RadioListTile(
                      value: locale,
                      contentPadding: EdgeInsets.zero,
                      activeColor: theme.primaryColor,
                      title: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              language(locale.languageCode),
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      groupValue: _selectedLocale,
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedLocale = locale;
                          localeProv.setLocale(locale);
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
