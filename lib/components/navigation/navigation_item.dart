import 'package:florataba_mobile_app/blocs/navigator_bloc/navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final int index;

  const NavigationItem({Key? key, required this.icon, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorBloc _bloc = BlocProvider.of<NavigatorBloc>(context);
    return BlocBuilder<NavigatorBloc, NavigationState>(
      builder: (context, state) {
        Color currentColor = (state is CurrentNavigator)
            ? (state.currentIndex == index ? Colors.black : Colors.grey)
            : Colors.grey;
        Icon defaultIcon = Icon(icon, color: currentColor, size: 30);
        return InkWell(
            onTap: () => _bloc.add(UpdateNavigation(index)),
            child: (state is CurrentNavigator)
                ? ((state.currentIndex == index)
                    ? Column(
                        children: [
                          defaultIcon,
                          Icon(
                            Icons.circle,
                            color: currentColor,
                            size: 8.5,
                          )
                        ],
                      )
                    : defaultIcon)
                : defaultIcon);
      },
    );
  }
}
