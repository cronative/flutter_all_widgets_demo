import 'package:demo/constants/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: InputDemo()));
}

class InputDemo extends StatefulWidget {
  InputDemo({Key key}) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  bool _showPassword = true;
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController cnoController = new TextEditingController();
  TextEditingController weburlController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool privacyPolicy = false;
  String genderController = "Male";
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Input Demo'),
              centerTitle: true,
              backgroundColor: Colors.red[400],
            ),
            body: Form(
                key: _form,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Column(children: <Widget>[
                          TextFormField(
                            validator: nameValidation('First Name'),
                            autofocus: true,
                            controller: firstNameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                hintText: 'Enter First Name'),
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: emailValidation('Email'),
                              autofocus: true,
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  border: OutlineInputBorder(),
                                  labelText: 'E-mail',
                                  hintText: 'Enter E-mail'),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.next),
                          SizedBox(height: 15),
                          Row(children: <Widget>[
                            Expanded(
                                flex: 10, // 100%
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      border: Border.all(color: Colors.grey)),
                                  child: DropdownButton<String>(
                                    underline: Container(),
                                    isExpanded: true,
                                    value: genderController,
                                    style: TextStyle(color: Colors.black),
                                    items: <String>[
                                      'Male',
                                      'Female',
                                      'Other',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "Select Gender",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        genderController = value;
                                      });
                                    },
                                  ),
                                ))
                          ]),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: mobileValidation('Contact Number'),
                            autofocus: true,
                            controller: cnoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(),
                                labelText: 'Contact Number',
                                hintText: 'Enter Contact Number'),
                            maxLength: 10,
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: onlyRequireValidation('Web URL'),
                            autofocus: true,
                            controller: weburlController,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(),
                                labelText: 'Web Site',
                                hintText: 'Enter Web URL'),
                            keyboardType: TextInputType.url,
                            obscureText: false,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: onlyRequireValidation('Address'),
                              autofocus: true,
                              controller: addressController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  border: OutlineInputBorder(),
                                  labelText: 'Address',
                                  hintText: 'Enter Address'),
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 5,
                              obscureText: false,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.newline),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: passwordValidation('Password'),
                              autofocus: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                    size: 22,
                                  ),
                                ),
                              ),
                              obscureText: _showPassword,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              textInputAction: TextInputAction.send),
                          SizedBox(height: 15),
                          Row(children: <Widget>[
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.red,
                              value: privacyPolicy,
                              onChanged: (bool value) {
                                setState(() {
                                  privacyPolicy = value;
                                });
                              },
                            ),
                            Text(
                              'Privacy Policy ',
                              style: TextStyle(fontSize: 17.0),
                            )
                          ]),
                          ElevatedButton(
                            onPressed: () {
                              final isValid = _form.currentState.validate();
                              if (!isValid) {
                                return false;
                              }

                              if (!privacyPolicy) {
                                showToast("Check Privacy Policy", 'LENGTH_LONG',
                                    'TOP', Colors.black, Colors.white, 16.0);
                                return false;
                              }
                              print(privacyPolicy);
                              print(firstNameController.text);
                              print(emailController.text);
                              print(cnoController.text);
                              print(weburlController.text);
                              print(addressController.text);
                              print(passwordController.text);
                            },
                            child: new Text('Submit'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red[400]),
                          )
                        ])))))));
  }
}
