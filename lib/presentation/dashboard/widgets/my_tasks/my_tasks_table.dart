import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:front_end_flutter_tracker/presentation/dashboard/widgets/my_tasks/task_data_cell.dart';

import 'package:intl/intl.dart';

import 'package:front_end_flutter_tracker/model/task_model.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';

class MyTasksTable extends StatelessWidget {

  final List<TaskModel> myTasks;

  const MyTasksTable({
    required this.myTasks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
          space: 0,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
      ), 
      child: DataTable(
        dividerThickness: 0,
        border: _tableBorder,
        dataTextStyle: AppTypography.bodyMedium(),
        columnSpacing: 0,
        dataRowMinHeight: 36,
        dataRowMaxHeight: 36,
        headingRowHeight: 36,
        columns: [
          DataColumn(
            label: SizedBox(
              width: 440,
              child: Text(
                AppLocalizations.of(context)!.task,
                style: AppTypography.titleSmall(
                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001.withOpacity(0.4),
                ),
              ),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 178,
              child: Text(
                AppLocalizations.of(context)!.project_id,
                style: AppTypography.titleSmall(
                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001.withOpacity(0.4),
                ),
              ),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 150,
              child: Text(
                AppLocalizations.of(context)!.assignee,
                style: AppTypography.titleSmall(
                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001.withOpacity(0.4),
                ),
              ),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 150,
              child: Text(
                AppLocalizations.of(context)!.created_at,
                style: AppTypography.titleSmall(
                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001.withOpacity(0.4),
                ),
              ),
            ),
          ),
          DataColumn(
            label: SizedBox(
              width: 150,
              child: Text(
                AppLocalizations.of(context)!.created_by,
                style: AppTypography.titleSmall(
                  color: DependencyInjectionManager.sl<IAppColorScheme>().mono001.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
        rows: myTasks.map(
          (task) => DataRow(cells: [
            DataCell(
              TaskDataCell(
                data: task.name,
                width: 440,
              ),
            ),
            DataCell(
              TaskDataCell(
                data: task.projectId,
                width: 178,
              ),
            ),
            DataCell(
              TaskDataCell(
                data: task.assignee != null ? task.assignee!.fullName : '',
                width: 150,
              ),
            ),
            DataCell(
              TaskDataCell(
                data: task.createdBy != null ? task.createdBy!.fullName : '',
                width: 150,
              ),
            ),
            DataCell(
              TaskDataCell(
                data: formatDateString(task.createdAt),
                width: 150,
              ),
            ),
          ]),
        ).toList(),
      ),
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