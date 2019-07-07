import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:imovaluer/pagers/main.dart';


class LoginPage extends StatefulWidget {

  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email;
  String _password;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();


  void _submit() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      _performLogin();
    }
  }


   _performLogin() {

    final snackbar = SnackBar(
        content: Text('Email: $_email, successfully Login'),
    );
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: _email, password: _password)
        .then((FirebaseUser user) {
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e){
      print(e);
    });
    scaffoldKey.currentState.showSnackBar(snackbar);
  }


  @override
  void initState() {
    super.initState();
    getUser().then((user){
      if(user != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EntryPoint()),
        );
      }
    });
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),

          child: Form(
           key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                height: 150,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://www.imovalue.com/wp-content/uploads/2018/02/logo-home1.png"))
                ),
              ),

              TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:OutlineInputBorder(borderRadius:BorderRadius.circular(32.09)),
                  ),
                  validator: validateEmail,
                  onSaved: (val) =>
                      _email = val,
                  ),

              SizedBox(height: 15.0),
              TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(32.09)),
                ),
                validator: (val) => val.length < 6 ? 'Invalid Password' : null,
                onSaved: (val) =>
                _password = val,
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child : RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: _submit,
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text('Login',style:TextStyle(color: Colors.white)),
                ),
              ),
              //Text('Do not have an account?'),

              /*Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child : RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text('SignIn',style:TextStyle(color: Colors.white)),
                ),
              ),
               */
              //Loading
            ],
          ),
          ),
        ),
      ),
    );
  }
}


