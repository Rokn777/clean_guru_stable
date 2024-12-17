import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _selectedLanguage = 'English';

  final List<Map<String, String>> _languages = const [
    {'code': 'en', 'name': 'English', 'native': 'English'},
    {'code': 'ar', 'name': 'Arabic', 'native': 'العربية'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: const Text(
          'Language',
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          _selectedLanguage,
          style: const TextStyle(fontSize: 12),
        ),
        leading: Icon(
          Icons.language,
          color: Theme.of(context).colorScheme.primary,
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Select Language'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: _languages.map((language) {
                  return RadioListTile(
                    title: Text(language['name']!),
                    subtitle: Text(language['native']!),
                    value: language['name']!,
                    groupValue: _selectedLanguage,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _selectedLanguage = value;
                        });
                        Navigator.pop(context);
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}