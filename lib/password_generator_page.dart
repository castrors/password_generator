import 'package:flutter/material.dart';
import 'package:password_generator/colors.dart';
import 'package:password_generator/rounded_container.dart';

class PasswordGeneratorPage extends StatelessWidget {
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
                child: Text('cDSVKctQx71hCKnu',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'LENGTH: 16',
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
                        onChanged: (value) {},
                        value: 16,
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
                  onChanged: (value) {},
                  title: Text('Include uppercase letters'),
                  value: true,
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  onChanged: (value) {},
                  title: Text('Include lowercase letters'),
                  value: false,
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  onChanged: (value) {},
                  title: Text('Include numbers'),
                  value: true,
                ),
              ),
              RoundedContainer(
                child: SwitchListTile(
                  onChanged: (value) {},
                  title: Text('Include symbols'),
                  value: false,
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
                      onPressed: () {},
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
