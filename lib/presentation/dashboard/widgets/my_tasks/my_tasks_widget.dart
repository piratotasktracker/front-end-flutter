import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:front_end_flutter_tracker/bloc/my_tasks/my_tasks_cubit.dart';
import 'package:front_end_flutter_tracker/presentation/dashboard/widgets/my_tasks/my_tasks_table.dart';
import 'package:front_end_flutter_tracker/presentation/reusable_widgets.dart/error_widget.dart';

class MyTasksWidget extends StatelessWidget {
  const MyTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTasksCubit, IMyTasksState>(
      bloc: context.read<MyTasksCubit>()..getMyTasks(),
      builder: (context, state) {
        if (state is MyTasksLoadedState) {
          return SizedBox(
            height: state.myTasks.isNotEmpty ? (state.myTasks.length + 1) * 36 : 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: MyTasksTable(myTasks: state.myTasks)
            ),
          );
        } else if (state is MyTasksLoadingState) {
          return const SizedBox(
            height: 168,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is MyTasksErrorState) {
          return const ErrorTextWidget();
        } else {
          return const SizedBox(
            height: 168,
          );
        }
      },
    );
  }

  String formatDateString(String dateString) {
    DateTime date = DateTime.parse(dateString);
    final DateFormat dateFormatter = DateFormat('dd/MM/yyyy, HH:mm');
    return dateFormatter.format(date);
  }

  TableBorder get _tableBorder => const TableBorder(
    horizontalInside: BorderSide.none,
    left: BorderSide.none,
    right: BorderSide.none,
    top: BorderSide.none,
    bottom: BorderSide.none,
    verticalInside: BorderSide.none,
  );
}
