import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/pages/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: GoogleFonts.openSansTextTheme(theme.textTheme).copyWith(
          titleLarge: GoogleFonts.openSans(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
        cardTheme: CardTheme(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
          //UPDATE THESE SETTINGS FOR IOS
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
        ),
        listTileTheme: ListTileThemeData(
            shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        )),
        chipTheme: ChipThemeData(
            shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
        fontFamily: GoogleFonts.openSans().fontFamily,
        searchBarTheme: const SearchBarThemeData(elevation: WidgetStatePropertyAll(0.3)),
      ),
      home: const HomePage(),
    );
  }
}
