import 'package:equatable/equatable.dart';
import 'package:front_end_flutter_tracker/util/bread_crumbs/bread_crumb_model.dart';

class BreadCrumbsState extends Equatable{

  final List<BreadCrumbModel> breadCrumbs;

  final List<BreadCrumbModel> previousBreadCrumbs;

  const BreadCrumbsState({
    required this.breadCrumbs,
    required this.previousBreadCrumbs,
  });

  BreadCrumbsState copyWith({
    List<BreadCrumbModel>? breadCrumbs,
    List<BreadCrumbModel>? previousBreadCrumbs
  }){
    return BreadCrumbsState(
      breadCrumbs: breadCrumbs ?? this.breadCrumbs, 
      previousBreadCrumbs: previousBreadCrumbs ?? this.previousBreadCrumbs,
    );
  }
  
  @override
  List<Object?> get props => [
    breadCrumbs,
    previousBreadCrumbs,
  ];

}