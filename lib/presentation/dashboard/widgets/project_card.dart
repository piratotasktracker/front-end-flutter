import 'package:flutter/material.dart';

import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter_svg/svg.dart';

import 'package:front_end_flutter_tracker/model/project_model.dart';
import 'package:front_end_flutter_tracker/sl.dart';
import 'package:front_end_flutter_tracker/styles/colors.dart';
import 'package:front_end_flutter_tracker/styles/typography.dart';

class ProjectCard extends StatelessWidget {

  final ProjectModel project;
  final bool isFirst;
  final bool isLast;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final settings = RestrictedPositions(
      maxCoverage: 0.7,
      minCoverage: 0.1,
      align: StackAlign.left,
    );
    return Padding(
      padding: EdgeInsets.only(
        left: isFirst ? 24 : 8,
        right: isLast ? 24 : 8
      ),
      child: SizedBox(
        width: 347,
        height: 168,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.83,
              color: DependencyInjectionManager.sl<IAppColorScheme>().mono0011,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: AppTypography.titleMedium(),
                ),
                Text(
                  project.description,
                  style: AppTypography.bodySmall(
                    color: DependencyInjectionManager.sl<IAppColorScheme>().mono005,
                  ),
                ),
                if(project.teamMembers.isNotEmpty)...[
                  const Spacer(),
                  SizedBox(
                    height: 36,
                    child: WidgetStack(
                      positions: settings,
                      buildInfoWidget: (surplus) {
                        return Center(
                            child: Text(
                          '+$surplus',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ));
                      },
                      stackedWidgets: project.teamMembers.map(
                        (item) => CircleAvatar(
                          backgroundColor: DependencyInjectionManager.sl<IAppColorScheme>().mono0012,
                          child: Image.network(
                            item.avatar ?? '',
                            fit: BoxFit.cover,
                            width: 36,
                            height: 36,
                            errorBuilder: (context, error, stackTrace) => SvgPicture.asset(
                              'assets/svg/user-fill.svg',
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

}