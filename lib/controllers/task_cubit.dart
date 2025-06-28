import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  addTask(String title){
    final model = TaskModel(id: Uuid().v4(), title: title, isCompleted: false);
    emit(TaskUpdate(List.from(state.listTask)..add(model)));
  }

  removeTask(String id){
    //انشاء قائمه جديدة تحتوي على القائمة السابقة ما عدا الذي يساوي الايدي
    final List<TaskModel> newList = state.listTask.where((task)=> task.id != id).toList();
emit(TaskUpdate(newList));
  }

  toggleTask(String id){
    final List<TaskModel> newList = state.listTask.map((task) {
      return task.id == id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(TaskUpdate(newList));
  }

}
