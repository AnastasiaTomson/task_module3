import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task1/src/blocs/authentication/authentication_bloc.dart';
import 'package:task1/utils/custom_icons_icons.dart';

class AuthenticationView extends HookWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isPasswordVisible = useState(false);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Вход',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Color.fromRGBO(24, 30, 46, 1)
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if(state is Authenticated){
                  Navigator.pushNamed(context, '/home');
                  emailController.clear();
                  passwordController.clear();
                }
                if(state is ErrorAuthenticated){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    elevation: 0.0,
                    behavior: SnackBarBehavior.floating,
                    width: 200,
                    duration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    backgroundColor: Color.fromRGBO(
                        213, 33, 33, 0.5),
                    content: Text(
                      'Ошибка авторизации',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // Основой текст
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromRGBO(255, 255, 255, 1.0)),
                    ),
                  ));
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 4),
                      child: Text(
                        'Почта',
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Color.fromRGBO(162, 165, 171, 1),
                        controller: emailController,
                        style: TextStyle(
                          // Основой текст
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(24, 30, 46, 1)),
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(229, 235, 237, 1),
                          filled: true,
                          isCollapsed: true,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromRGBO(229, 235, 237, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromRGBO(229, 235, 237, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 4),
                      child: Text(
                        'Пароль',
                        style: TextStyle(
                          // Основой текст
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(24, 30, 46, 1)),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        cursorColor: Color.fromRGBO(162, 165, 171, 1),
                        controller: passwordController,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: !isPasswordVisible.value,
                        style: TextStyle(
                          // Основой текст
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(24, 30, 46, 1)),
                        decoration: InputDecoration(
                          fillColor: Color.fromRGBO(229, 235, 237, 1),
                          filled: true,
                          isCollapsed: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isPasswordVisible.value = !isPasswordVisible.value;
                            },
                            child: Icon(
                              isPasswordVisible.value
                                  ? CustomIcons.eyeon
                                  : CustomIcons.eyeoff,
                              color: Color.fromRGBO(162, 165, 171, 1),
                              size: 20,
                            ),
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromRGBO(229, 235, 237, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromRGBO(229, 235, 237, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 300,
                      child: MaterialButton(
                        height: 48,
                        color: Color.fromRGBO(23, 101, 203, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(Authenticate(emailController.text, passwordController.text));
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            // Основой текст жирный
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1.0)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Нет аккаунта?',
                            ),
                            TextButton(
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context).add(SocialAuthenticate());
                                },
                                child: Text(
                                  'Войти через вк',
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Color.fromRGBO(23, 101, 203, 1.0),
                                  ),
                                ))
                          ],
                        ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
