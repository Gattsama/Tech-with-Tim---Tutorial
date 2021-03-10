import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final Function(String textData) callBack;

  TextInput({@required this.callBack});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        labelText: 'Type a message',
        suffixIcon: IconButton(
            splashColor: Colors.purple,
            splashRadius: 30,
            tooltip: 'Post Message',
            icon: Icon(Icons.send),
            onPressed: () {
              FocusScope.of(context).unfocus();
              widget.callBack(_controller.text);
              _controller.clear();
            }),
      ),
    );
  }
}
