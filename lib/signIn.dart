import 'package:flutter/material.dart';
import 'package:laundryapp_2/home.dart';
import 'package:laundryapp_2/models/authentication.dart';
import 'package:laundryapp_2/signUp.dart';
import 'package:toast/toast.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';

class SignIn extends StatefulWidget {
  static const id = 'sign_in';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  double screenHeight;
  Auth auth = Auth();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formState,
          child: ListView(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: Text("Laundry App",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),

              TextFormField(
                cursorColor: Colors.cyan,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: emailFocus,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, emailFocus, passwordFocus);
                },
                validator: (value) {
                  if (Validator.email(value))
                    return 'Please input a valid email.';
                  return null;
                },
                onChanged: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    )


                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                focusNode: passwordFocus,
                validator: (value) => value.length < 6
                    ? 'Password should be at least 6 characters'
                    : null,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password',
                    icon: Icon(Icons.account_balance_wallet),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    )),
                obscureText: true,
                onFieldSubmitted: (term) {
                  onSubmit();
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0,0,100.0,0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.blueAccent,
                  textColor: Colors.deepOrange,
                  padding: EdgeInsets.all(12.0),
                  onPressed: () {
                    onSubmit();
                  },
                  child: Text('Log In',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User   '),
                  GestureDetector(
                    onTap: () { print("signupcalled");
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                    ;                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    final formState = _formState.currentState;
    if (formState.validate()) {
      formState.save();
      bool res = await auth.signIn(_email, _password);
      if (res) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        // TODO: copy home
      } else { print("wrong pass");
      Toast.show("Invalid Credentials", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }
    }
  }
}