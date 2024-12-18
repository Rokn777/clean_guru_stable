import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_guru_stable/core/theme/colors.dart';
import 'package:clean_guru_stable/core/theme/typography.dart';
import 'package:clean_guru_stable/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:clean_guru_stable/features/cleaner/presentation/screens/cleaner_screen.dart';
import 'package:clean_guru_stable/features/settings/presentation/screens/settings_screen.dart';
import 'package:clean_guru_stable/providers/device_provider.dart';
import 'package:clean_guru_stable/providers/cleaning_provider.dart';
import 'package:clean_guru_stable/providers/settings_provider.dart';

void main() async {
  // Make sure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize settings provider first
  final settingsProvider = SettingsProvider();
  await settingsProvider.initializeSettings();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceProvider()),
        ChangeNotifierProvider(create: (_) => CleaningProvider()),
        ChangeNotifierProvider.value(value: settingsProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<SettingsProvider>().isDarkMode;

    return MaterialApp(
      title: 'Clean Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: isDarkMode ? AppColors.darkColorScheme : AppColors.lightColorScheme,
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: AppTypography.displayLarge,
          displayMedium: AppTypography.displayMedium,
          displaySmall: AppTypography.displaySmall,
          headlineLarge: AppTypography.headlineLarge,
          headlineMedium: AppTypography.headlineMedium,
          headlineSmall: AppTypography.headlineSmall,
          titleLarge: AppTypography.titleLarge,
          titleMedium: AppTypography.titleMedium,
          titleSmall: AppTypography.titleSmall,
          bodyLarge: AppTypography.bodyLarge,
          bodyMedium: AppTypography.bodyMedium,
          bodySmall: AppTypography.bodySmall,
          labelLarge: AppTypography.labelLarge,
          labelMedium: AppTypography.labelMedium,
          labelSmall: AppTypography.labelSmall,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    DashboardScreen(),
    CleanerScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.cleaning_services_outlined),
            selectedIcon: Icon(Icons.cleaning_services),
            label: 'Cleaner',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}