part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable{
  final List<TaskModel> listTask;

  TaskState(this.listTask);

  @override
  // TODO: implement props
  List<Object?> get props => [listTask];
}

final class TaskInitial extends TaskState {
  TaskInitial(): super([]);



}

final class TaskUpdate extends TaskState{
 TaskUpdate(super.listTask);

}
