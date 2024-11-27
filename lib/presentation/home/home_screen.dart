import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end_flutter_tracker/bloc/bread_crumbs/bread_crumbs_cubit.dart';
import 'package:front_end_flutter_tracker/bloc/profile_cubit/profile_cubit.dart';
import 'package:front_end_flutter_tracker/presentation/home/widgets/home_app_bar.dart';
import 'package:front_end_flutter_tracker/presentation/home/widgets/home_side_pane.dart';
import 'package:front_end_flutter_tracker/sl.dart';

class HomeScreen extends StatelessWidget {

  final Widget child;

  const HomeScreen({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreadCrumbsCubit>(
          create: (context) => DependencyInjectionManager.sl<BreadCrumbsCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => DependencyInjectionManager.sl<ProfileCubit>()..getProfile(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return _HomePrimarySizeScreen(
            child: child,
          );
        }
      ),
    );
  }

}

class _HomePrimarySizeScreen extends StatelessWidget{

  final Widget child;

  const _HomePrimarySizeScreen({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 300;
    final double paneWidth = width - 724 >= 300 ? 300 : width - 724 >= 72 ? width - 724 : 72;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeSidePane(width: paneWidth),
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 724,
              maxWidth: width - paneWidth > 724 ? width - paneWidth : 724
            ),
            child: Scaffold(
              appBar: const HomeAppBar(),
              body: child,
            ),
          ),
        ),
      ],
    );
  }

}