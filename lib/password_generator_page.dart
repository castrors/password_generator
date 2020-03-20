import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/colors.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/rounded_container.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class PasswordGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var passwordModel = Provider.of<PasswordModel>(context);
    passwordModel.generate();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Generate password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'GENERATED PASSWORD',
                style: TextStyle(color: hintColor),
              ),
              SizedBox(
                height: 8,
              ),
              RoundedContainer(
                height: 72,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        passwordModel.generatedPassword,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: passwordModel.generatedPassword,
                          ),
                        );
                        Toast.show('Password copied to the clipboard!', context);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'LENGTH: ${passwordModel.length}',
                style: TextStyle(color: hintColor),
              ),
              SizedBox(
                height: 8,
              ),
              RoundedContainer(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        '4',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        onChanged: (value) {
                          passwordModel.length = value.toInt();
                        },
                        value: passwordModel.length.toDouble(),
                        max: 32,
                        min: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        '32',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'SETTINGS',
                style: TextStyle(color: hintColor),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include uppercase letters'),
                  value: passwordModel.includeUppercaseLetters,
                  onChanged: (value) {
                    passwordModel.includeUppercaseLetters = value;
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include lowercase letters'),
                  value: passwordModel.includeLowercaseLetters,
                  onChanged: (value) {
                    passwordModel.includeLowercaseLetters = value;
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include numbers'),
                  value: passwordModel.includeNumbers,
                  onChanged: (value) {
                    passwordModel.includeNumbers = value;
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include symbols'),
                  value: passwordModel.includeSymbols,
                  onChanged: (value) {
                    passwordModel.includeSymbols = value;
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text('GENERATE PASSWORD'),
                      onPressed: () {
                        passwordModel.generate();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
