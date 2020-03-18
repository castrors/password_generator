import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _fieldColors = Color(0xFF0b1740);

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Color(0xFF357ced),
          primaryColor: Color(0xFF357ced),
          scaffoldBackgroundColor: Color(0xFF060f2d),
          fontFamily: GoogleFonts.nunito().fontFamily),
      home: PasswordGeneratorPage(),
    );
  }
}

class PasswordGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Generate password',
            ),
            Text(
              'Generated password',
            ),
            Text(
              'cDSVKctQx71hCKnu',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'LENGTH: 16',
            ),
            Slider(
              onChanged: (value) {},
              value: 16,
              max: 32,
              min: 4,
            ),
            Text('SETTINGS'),
            SwitchListTile(
              onChanged: (value) {},
              title: Text('Include uppercase letters'),
              value: true,
            ),
            SwitchListTile(
              onChanged: (value) {},
              title: Text('Include lowercase letters'),
              value: true,
            ),
            SwitchListTile(
              onChanged: (value) {},
              title: Text('Include numbers'),
              value: true,
            ),
            SwitchListTile(
              onChanged: (value) {},
              title: Text('Include symbols'),
              value: true,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 32.0),
                  child: SizedBox(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text('GENERATE PASSWORD'),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
