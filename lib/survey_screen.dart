import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'thank_you_screen.dart';

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int _rating = 5;
  final TextEditingController _commentController = TextEditingController();

  void _submitSurvey() {
    final comment = _commentController.text;

    // Salva a avaliação e o comentário no banco de dados
    DatabaseHelper().insertFeedback(_rating, comment).then((_) {
      // Navega para a tela de agradecimento
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ThankYouScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa de Satisfação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'De 0 a 10, qual a sua satisfação?',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _rating.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: '$_rating',
              onChanged: (value) {
                setState(() {
                  _rating = value.toInt();
                });
              },
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Comentário (opcional)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitSurvey,
              child: Text('Enviar Avaliação'),
            ),
          ],
        ),
      ),
    );
  }
}
