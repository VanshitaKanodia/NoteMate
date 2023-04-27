import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_mate/screens/collection_screen.dart';

bool loginSelected = true;
bool showPassword = false;
bool showConfirmPassword = false;

final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.grey],
                )
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          border: Border.all(color: Colors.transparent),
                          image: const DecorationImage(image: AssetImage("assets/images/img.png"),
                          fit: BoxFit.fitWidth,
                          ),
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      emailField(),
                      passwordField(),
                      !loginSelected ? const SizedBox() : forgotPassword(),
                      loginSelected ? const SizedBox() :
                      confirmPasswordField(),
                      !loginSelected
                          ? const SizedBox(
                        height: 40,
                      )
                          : const SizedBox(),
                      const button(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children: [
                              !loginSelected ? Expanded(child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      loginSelected = true;
                                    });
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ))
                                  : Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: const Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),),
                              ),
                              loginSelected ?
                              Expanded(child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      loginSelected = false;
                                    });
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),),
                              ))
                                  : Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        gradient: const LinearGradient(colors: [
                                          Colors.purple,
                                          Colors.orange
                                        ])),
                                    child: const Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Padding passwordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60).copyWith(top: 12),
        child: TextField(
          controller: _passwordController,
          obscureText: showPassword ? false : true,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(minWidth: 24),
              suffixIconConstraints: const BoxConstraints(minWidth: 24),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              hintText: 'Enter password',
              hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60, width: .4)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: .4))),
        ));
  }

  Padding confirmPasswordField() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60).copyWith(top: 12),
        child: TextField(
          obscureText: showConfirmPassword ? false : true,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(minWidth: 24),
              suffixIconConstraints: const BoxConstraints(minWidth: 24),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                  child: Icon(
                    showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white70,
                    size: 20,
                  ),
                ),
              ),
              hintText: 'Confirm password',
              hintStyle: const TextStyle(color: Colors.white60, fontSize: 14),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white60, width: .4)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: .4))),
        ));
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
          Navigator.pushNamed(context, '/collection_screen');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 60).copyWith(bottom: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3, 3),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Colors.black12.withOpacity(.08))
            ],
            borderRadius: BorderRadius.circular(50)
                .copyWith(topRight: const Radius.circular(0)),
            gradient: const LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ])
        ),
        child: Text(
          loginSelected ? 'Sign In' : 'Register',
          style: const TextStyle(
              color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

Widget emailField() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        controller: _emailController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        decoration: const InputDecoration(
            prefixIconConstraints: BoxConstraints(minWidth: 24),
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.email,
                color: Colors.white,
                size: 20,
              ),
            ),
            hintText: 'Enter email',
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: .4)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: .4))),
      ));
}

Widget forgotPassword() {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 58, bottom: 30),
      child: InkWell(
        onTap: () {
          // navigate to other screen
        },
        child: const Text(
          'Forgot password?',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}