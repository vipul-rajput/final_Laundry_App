import 'package:flutter/material.dart';
import 'package:laundryapp_2/home.dart';
import 'package:laundryapp_2/models/authentication.dart';
import 'package:laundryapp_2/signIn.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  static const id = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;

  Auth auth = Auth();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordConfirmFocus = FocusNode();

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
//        decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("images/back.jpg"), fit: BoxFit.cover)
//        ),
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formState,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: emailFocus,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(context, emailFocus, passwordFocus);
                },
                validator: (value) =>
                value.isEmpty ? 'Email cannot be blank' : null,
                onChanged: (input) => _email = input,
                decoration: InputDecoration(labelText: 'Email',
                    icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                focusNode: passwordFocus,
                textInputAction: TextInputAction.next,
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
                //         obscureText: true,
                onFieldSubmitted: (term) {
                  _fieldFocusChange(
                      context, passwordFocus, passwordConfirmFocus);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                focusNode: passwordConfirmFocus,
                validator: (value) {
                  print(_password);
                  print(value);
                  return value != _password ? 'Passwords do not match' : null;
                },
                //     onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Confirm Password',
                    icon: Icon(Icons.confirmation_number),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    )
                ),
                obscureText: true,
                onFieldSubmitted: (term) {
                  onSubmit();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100.0,0,100.0,0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.blueAccent,
                  textColor: Colors.deepOrange,
                  padding: EdgeInsets.all(8.0),
//                color: Colors.white,
                  onPressed: () {
                    onSubmit();
                  },
                  child: Text('Sign up',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already User  '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                    },
                    child: Text(
                      'Sign in',
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
    formState.save();
    if (formState.validate()) {
      bool res = await auth.signUp(_email, _password);
      if (res) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else { print("invalid");
      Toast.show("Something went wrong please try again later", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }
    }
  }
}