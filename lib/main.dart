import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebrate',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  double fontSize = 20;
  Color _selectedColor = Colors.black;
  bool edit = false;
  final Map<String, Color> colorMap = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
    'Purple': Colors.purple,
    'Black': Colors.black,
    'White': Colors.white,
    // Add more colors as needed
  };
  final List<double> fontSizeList = [
    12, 16, 20, 24, 28, 32, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60
  ];
  double _selectedFontSize = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                style: TextStyle(
                  color: _selectedColor,
                  fontSize: _selectedFontSize,
                ),
                controller: _textController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Text Is Empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme
                      .of(context)
                      .colorScheme
                      .background,
                  border: InputBorder.none,
                  hintText: "Enter your text here", // Remove underline
                ),
                onTap: () {
                  showItems();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showItems() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(16),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(bottom: 16), // Adjust the margin as needed
                child: DropdownButton<Color>(
                  underline: Container(),
                  elevation: 0,
                  value: _selectedColor,
                  onChanged: (Color? newValue) {
                    setState(() {
                      _selectedColor = newValue!;
                    });
                    Navigator.pop(context); // Close the dialog after selecting a color
                  },
                  items: colorMap.keys.map<DropdownMenuItem<Color>>(
                        (String key) {
                      return DropdownMenuItem<Color>(
                        value: colorMap[key],
                        child: Text(key),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<double>(
                  elevation: 0,
                  underline: Container(),
                  value: _selectedFontSize,
                  onChanged: (double? newValue) {
                    setState(() {
                      _selectedFontSize = newValue!;
                    });
                    Navigator.pop(context); // Close the dialog after selecting a font size
                  },
                  items: fontSizeList.map<DropdownMenuItem<double>>(
                        (double fontSize) {
                      return DropdownMenuItem<double>(
                        value: fontSize,
                        child: Text(fontSize.toString()),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );

        },
      );
  }
}
