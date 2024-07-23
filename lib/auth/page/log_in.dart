import 'dart:ffi';
import 'package:bobir_akilkhanov/auth/data/auth.dart';
import 'package:bobir_akilkhanov/home/home.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _textPhoneNumberController = TextEditingController(); 
  final TextEditingController _textPasswordController = TextEditingController();

  String? error;
  final _formKey = GlobalKey<FormState>();
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset('assets/imgs/logo.png', width: MediaQuery.of(context).size.width / 2.9),
              ),

              const SizedBox(
                height: 20,
              ),
        
              const Text('Welcome to Bobir Akilkhanov'),

              const SizedBox(
                height: 30,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _textPhoneNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    TextField(
                      obscureText: _passwordVisible,
                      controller: _textPasswordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                                _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Forgot Password?'
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: TextButton(
                        onPressed: () async {
                          var data = await Auth().makeAuth(_textPhoneNumberController.text, _textPasswordController.text);
                          if (data.containsKey('access') && data.containsKey('refresh') && data['role'].contains('student')) {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                          } else {
                            setState(() {
                              error = data['phone_number'][0];
                              _formKey.currentState!.validate();
                            });
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ))
                        ),

                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,

                          ),
                        )),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}