import 'package:flutter/material.dart';

class RecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recovery Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Введите ваш email для восстановления пароля:'),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Добавьте логику для отправки запроса на восстановление пароля
              },
              child: Text('Отправить запрос'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Возвращаемся на предыдущую страницу
              },
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
