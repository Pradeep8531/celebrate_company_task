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
  String _selectedFontStyle = 'Normal';
  String _Edittext = "Press to Edit";
  Offset _position = Offset(0, 0);



  final Map<String, Color> colorMap = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
    'Purple': Colors.purple,
    'Black': Colors.black,
    'White': Colors.white,
    'Orange': Colors.orange,
    'Pink': Colors.pink,
    'Cyan': Colors.cyan,
    'Brown': Colors.brown,
    'Grey': Colors.grey,
  };

  final List<double> fontSizeList = [
    12, 16, 20, 24, 28, 32, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60,
    62, 64, 66, 68, 70,
  ];

  final List<String> fontStyleList = [
    'Normal',
    'Italic',
    'Bold',
    'Bold Italic',
    'Underline',
    'Strikethrough',
    'Normal Bold',
    'Normal Italic',
    'Bold Underline',
    'Italic Strikethrough',
  ];


  double _selectedFontSize = 12;

  @override
  void initState() {
    super.initState();

    // Center the initial position on the screen
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final RenderBox renderBox =
      context.findRenderObject() as RenderBox;
      final screenSize = renderBox.size;

      setState(() {
        _position = Offset(
          (screenSize.width - _selectedFontSize) / 2,
          (screenSize.height - _selectedFontSize) / 2,
        );
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: _position.dx,
            top: _position.dy,
            child: Draggable(
              feedback: Container(
                child: Text(
                  _Edittext,
                  style: TextStyle(
                    color: _selectedColor,
                    fontSize: _selectedFontSize,
                    fontStyle: _selectedFontStyle == 'Italic'
                        ? FontStyle.italic
                        : FontStyle.normal,
                    fontWeight: _selectedFontStyle == 'Bold'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    decoration: _selectedFontStyle == 'Underline'
                        ? TextDecoration.underline
                        : _selectedFontStyle == 'Strikethrough'
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  showItems();
                },
                child: Text(_Edittext,
                  style: TextStyle(
                    color: _selectedColor,
                    fontSize: _selectedFontSize,
                    fontStyle: _selectedFontStyle == 'Italic'
                        ? FontStyle.italic
                        : FontStyle.normal,
                    fontWeight: _selectedFontStyle == 'Bold'
                        ? FontWeight.bold
                        : FontWeight.normal,
                    decoration: _selectedFontStyle == 'Underline'
                        ? TextDecoration.underline
                        : _selectedFontStyle == 'Strikethrough'
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
              onDraggableCanceled: (_, offset) {
                setState(() {
                  _position = offset;
                });
              },
            ),
          ),
        ],
      ),
    );
  }




  void showItems() {
    SimpleDialog dialog;

    dialog = SimpleDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(16),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(bottom: 16),
          child: DropdownButton<Color>(
            underline: Container(),
            elevation: 0,
            value: _selectedColor,
            onChanged: (Color? newValue) {
              setState(() {
                _selectedColor = newValue!;
              });

            },
            items: colorMap.keys.map<DropdownMenuItem<Color>>(
                  (String key) {
                return DropdownMenuItem<Color>(
                  value: colorMap[key],
                  child: Center(child: Text(key)),
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
          margin: EdgeInsets.only(bottom: 16),
          child: DropdownButton<double>(
            elevation: 0,
            underline: Container(),
            value: _selectedFontSize,
            onChanged: (double? newValue) {
              setState(() {
                _selectedFontSize = newValue!;
              });

            },
            items: fontSizeList.map<DropdownMenuItem<double>>(
                  (double fontSize) {
                return DropdownMenuItem<double>(
                  value: fontSize,
                  child: Center(child: Text(fontSize.toString())),
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
          child: DropdownButton<String>(
            elevation: 0,
            underline: Container(),
            value: _selectedFontStyle,
            onChanged: (String? newValue) {
              setState(() {
                _selectedFontStyle = newValue!;
              });

            },
            items: fontStyleList.map<DropdownMenuItem<String>>(
                  (String fontStyle) {
                return DropdownMenuItem<String>(
                  value: fontStyle,
                  child: Center(child: Text(fontStyle)),
                );
              },
            ).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              style: TextStyle(
                color: _selectedColor,
                fontSize: _selectedFontSize,
                fontStyle: _selectedFontStyle == 'Italic'
                    ? FontStyle.italic
                    : FontStyle.normal,
                fontWeight: _selectedFontStyle == 'Bold'
                    ? FontWeight.bold
                    : FontWeight.normal,
                decoration: _selectedFontStyle == 'Underline'
                    ? TextDecoration.underline
                    : _selectedFontStyle == 'Strikethrough'
                    ? TextDecoration.lineThrough
                    : null,
              ),
              controller: _textController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text Is Empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: InputBorder.none,
                hintText: "Enter your text here",
              ),
              onChanged: (text) {
                setState(() {
                  _Edittext = text;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

}
