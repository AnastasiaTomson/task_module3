import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:task1/src/blocs/authentication/authentication_bloc.dart';
import 'package:task1/utils/custom_icons_icons.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if(state is UnAuthenticated){
              Navigator.pop(context, '/home');
            }
          },
          builder: (context, state){
            if(state is Authenticated){
              return Center(
                child: Container(
                  width: 300,
                  height: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(229, 235, 237, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: state.user.avatar != '' ? NetworkImage(state.user.avatar!) : AssetImage('asset/images/default_avatar.png') as ImageProvider,
                            radius: 50,
                          ),

                          SizedBox(height: 12),
                          Text(
                            '${state.user.lastName} ${state.user.firstName}',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Color.fromRGBO(24, 30, 46, 1)
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  CustomIcons.email,
                                  size: 16,
                                  color: Color.fromRGBO(114, 114, 114, 1.0)
                              ),
                              SizedBox(width: 8),
                              Text(
                                state.user.email,
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color.fromRGBO(114, 114, 114, 1.0)
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          if(state.user.phone != '')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    Icons.phone_outlined,
                                    size: 16,
                                    color: Color.fromRGBO(114, 114, 114, 1.0)
                                ),
                                SizedBox(width: 8),
                                Text(
                                  state.user.phone!,
                                  style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color.fromRGBO(114, 114, 114, 1.0)
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<AuthenticationBloc>(context).add(Logout());
                        },
                        child: Text(
                          'Выйти',
                          style: TextStyle(
                            // Основой текст жирный
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color.fromRGBO(23, 101, 203, 1.0),
                          ),
                        )
                      )
                    ],
                  ),
                ),
              );
            }return Column();
          },
        ),
      ),
    );
  }
}
