import 'package:flutter/cupertino.dart';
import 'package:infinity/models/task/task_model.dart';

import '../../data/remote/firebase_helper.dart';
import '../../views/committees/model/committee_model.dart';

class TasksProvider extends ChangeNotifier {
  List<TaskModel> committeeTasks = [];



  Future<List<TaskModel>> fetchCommitteeTasks(CommitteeModel committee) async {
    for (var id in committee.tasksIds) {
      print("239042038432    -> " + id);
      TaskModel? taskModel;
      try {
        await FirebaseHelper()
            .getItem('tasks', id)
            .then((value) {
          print("239042038432    ->" + value.toString());
          taskModel = TaskModel.fromJson(json: value);
        });
      } catch (error) {
        print(error);
      }
      committeeTasks.add(taskModel!);
    }
    print('239042038432    ->${committeeTasks.length}');
    notifyListeners();
    return committeeTasks;
  }
}