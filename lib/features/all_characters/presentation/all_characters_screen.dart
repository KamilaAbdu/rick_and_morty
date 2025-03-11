import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty/core/theme/localization_provider.dart';

@RoutePage()
class AllCharactersScreen extends StatelessWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationProvider = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(L10ns.of(context).rickAndMorty)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              L10ns.of(context).rickAndMorty,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),

          _buildLanguageButton(
            context,
            '🇬🇧 English',
            const Locale('en'),
            localizationProvider,
          ),
          _buildLanguageButton(
            context,
            '🇰🇬 Кыргызча',
            const Locale('ky'),
            localizationProvider,
          ),
          _buildLanguageButton(
            context,
            '🇷🇺 Русский',
            const Locale('ru'),
            localizationProvider,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context,
    String title,
    Locale locale,
    LocalizationProvider provider,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          provider.changeLocale(locale);
        },
        child: Text(title),
      ),
    );
  }
}
