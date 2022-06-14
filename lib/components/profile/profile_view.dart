import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/blocs/order_bloc/order_bloc.dart';
import 'package:florataba_mobile_app/components/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/avatar_icon.dart';
import 'components/custom_btn.dart';
import 'components/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderBloc _orderBloc = BlocProvider.of<OrderBloc>(context);
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 35.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Florataba',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onTap: () => {Navigator.pop(context)},
                  )
                ],
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return (state is SuccessLogin)
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              const SizedBox(height: 34),
                              userAvatar(
                                  context, "assets/avatars/avatar_1.jpg"),
                              const SizedBox(height: 20),
                              userInfo(
                                  "${state.user?.surname} ${state.user?.firsName}",
                                  state.user!.email,
                                  state.user!.phoneNumber,
                                  "Start (+5%)"),
                              const SizedBox(height: 35),
                              InkWell(
                                onTap: () {
                                  _orderBloc.add(const LoadOrders());
                                  Navigator.of(context)
                                      .pushNamed("/order-list");
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "My Orders",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 25),
                              ProfileButton(
                                  "Logout",
                                  () => _loginBloc.add(const LogoutUserEvent()),
                                  Colors.red)
                            ],
                          ),
                        )
                      : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
