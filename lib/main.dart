import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:spga/txt_box.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(124, 0, 92, 131),
  ),

  // textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final c4s1 = TextEditingController();
  final c4s2 = TextEditingController();
  final c3s1 = TextEditingController();
  final c3s2 = TextEditingController();
  final c3s3 = TextEditingController();
  final c1s1 = TextEditingController();
  final c1s2 = TextEditingController();
  final c1s3 = TextEditingController();
  String spga = '0';

  String data(a1, a2, b1, b2, b3, c1, c2, c3) {
    final ta1 = a1.text == '' ? 0 : toGrade(a1.text);
    final ta2 = a2.text == '' ? 0 : toGrade(a2.text);
    final tb1 = b1.text == '' ? 0 : toGrade(b1.text);
    final tb2 = b2.text == '' ? 0 : toGrade(b2.text);
    final tb3 = b3.text == '' ? 0 : toGrade(b3.text);
    final tc1 = c1.text == '' ? 0 : toGrade(c1.text);
    final tc2 = c2.text == '' ? 0 : toGrade(c2.text);
    final tc3 = c3.text == '' ? 0 : toGrade(c3.text);

    int ans4 = (ta1 + ta2);
    int ans3 = (tb1 + tb2 + tb3);
    int ans1 = (tc1 + tc2 + tc3);
    double ta = ((ans4 * 4) + (ans3 * 3) + (ans1 * 1)) / 20;
    return ta.toString();
  }

  int toGrade(a) {
    a = int.parse(a);
    if (a >= 90)
      return 10;
    else if (a >= 80)
      return 9;
    else if (a >= 70)
      return 8;
    else if (a >= 60)
      return 7;
    else if (a >= 50)
      return 6;
    else if (a >= 45)
      return 5;
    else if (a >= 40)
      return 4;
    else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    void onChange(a) {
      if (int.parse(a) < 10) {
        SnackBar(content: Text('Enter valid marks'));
      }
      setState(() {
        spga = data(c4s1, c4s2, c3s1, c3s2, c3s3, c1s1, c1s2, c1s3);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff004881),
          primaryContainer: Color(0xffd0e4ff),
          secondary: Color(0xffac3306),
          secondaryContainer: Color(0xffffdbcf),
          tertiary: Color(0xff006875),
          tertiaryContainer: Color(0xff95f0ff),
          appBarColor: Color(0xffffdbcf),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff9fc9ff),
          primaryContainer: Color(0xff00325b),
          secondary: Color(0xffffb59d),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xff86d2e1),
          tertiaryContainer: Color(0xff004e59),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SPGA calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: 'american typewriter',
              )),
        ),
        body: SingleChildScrollView(
          controller: ScrollController(keepScrollOffset: false),
          child: GestureDetector(
            onVerticalDragDown: (details) {
              FocusScope.of(context).unfocus();
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.1),
                ),
                width: 400,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextBox(ctrl: c4s1, onChange: onChange, s: 1, c: 4),
                    TextBox(ctrl: c4s2, onChange: onChange, s: 2, c: 4),
                    TextBox(ctrl: c3s1, onChange: onChange, s: 1, c: 3),
                    TextBox(ctrl: c3s2, onChange: onChange, s: 2, c: 3),
                    TextBox(ctrl: c3s3, onChange: onChange, s: 3, c: 3),
                    TextBox(ctrl: c1s1, onChange: onChange, s: 1, c: 1),
                    TextBox(ctrl: c1s2, onChange: onChange, s: 2, c: 1),
                    TextBox(ctrl: c1s3, onChange: onChange, s: 3, c: 1),
                    const SizedBox(height: 10),
                    Text(
                      'SGPA : $spga ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontFamily: 'american typewriter',
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
