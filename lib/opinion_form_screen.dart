import 'package:flutter/material.dart';
import 'database_helper.dart';

class OpinionFormScreen extends StatefulWidget {
  @override
  _OpinionFormScreenState createState() => _OpinionFormScreenState();
}

class _OpinionFormScreenState extends State<OpinionFormScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitOpinion() {
    String comment = _controller.text.trim();
    if (comment.isNotEmpty) {
      DatabaseHelper().insertFeedback(0, comment).then((_) {
        Navigator.pushReplacementNamed(context, '/thankYou');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, escreva sua opinião!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deixe sua Opinião'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Sua Opinião',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOpinion,
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
