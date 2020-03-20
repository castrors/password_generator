import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/colors.dart';
import 'package:password_generator/models/password_input_data.dart';
import 'package:password_generator/rounded_container.dart';
import 'package:toast/toast.dart';

import 'bloc/password_bloc.dart';

class PasswordGeneratorPage extends StatefulWidget {
  @override
  _PasswordGeneratorPageState createState() => _PasswordGeneratorPageState();
}

class _PasswordGeneratorPageState extends State<PasswordGeneratorPage> {
  var _length;
  var _includeUppercaseLetters;
  var _includeLowercaseLetters;
  var _includeNumbers;
  var _includeSymbols;

  @override
  void initState() {
    _length = 16;
    _includeUppercaseLetters = true;
    _includeLowercaseLetters = true;
    _includeNumbers = true;
    _includeSymbols = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                child: BlocBuilder<PasswordBloc, PasswordState>(
                  builder: (context, state) {
                    if (state is PasswordGenerated) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              state.password,
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
                                  text: state.password,
                                ),
                              );
                              Toast.show(
                                  'Password copied to the clipboard!', context);
                            },
                          )
                        ],
                      );
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'LENGTH: $_length',
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
                          setState(() {
                            _length = value.toInt();
                          });
                        },
                        value: _length.toDouble(),
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
                  value: _includeUppercaseLetters,
                  onChanged: (value) {
                    setState(() {
                      _includeUppercaseLetters = value;
                    });
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include lowercase letters'),
                  value: _includeLowercaseLetters,
                  onChanged: (value) {
                    setState(() {
                      _includeLowercaseLetters = value;
                    });
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include numbers'),
                  value: _includeNumbers,
                  onChanged: (value) {
                    setState(() {
                      _includeNumbers = value;
                    });
                  },
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  title: Text('Include symbols'),
                  value: _includeSymbols,
                  onChanged: (value) {
                    setState(() {
                      _includeSymbols = value;
                    });
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
                        BlocProvider.of<PasswordBloc>(context).add(
                          PerformGeneration(
                            input: PasswordInputData(
                              length: _length,
                              includeLowercaseLetters: _includeLowercaseLetters,
                              includeNumbers: _includeNumbers,
                              includeUppercaseLetters: _includeUppercaseLetters,
                              includeSymbols: _includeSymbols,
                            ),
                          ),
                        );
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
