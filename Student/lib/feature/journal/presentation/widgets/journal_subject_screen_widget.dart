import 'package:flutter/material.dart';
import 'package:studenda_mobile_student/feature/journal/presentation/widgets/journal_attendance_screen.dart';
import 'package:studenda_mobile_student/feature/schedule/domain/entities/subject_entity.dart';
import 'package:studenda_mobile_student/model/common/task.dart';
import 'package:studenda_mobile_student/resources/colors.dart';


class JournalSubjectScreenWidget extends StatelessWidget {
  final SubjectEntity subject;

  const JournalSubjectScreenWidget({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 241, 245),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_sharp),
          color: Colors.white,
          onPressed: () => {Navigator.of(context).pop()},
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          "Placeholder",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => {Navigator.of(context).pushNamed('/notification')},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _AttendanceButtonWidget(
                navigateTo: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          JournalAttendanceScreenWidget(subject: subject),
                    ),
                  );
                },
              ),
              const Column(
                // children: tasks
                //     .map((element) => _TaskItemWidget(task: element))
                //     .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskItemWidget extends StatelessWidget {
  final Task task;

  const _TaskItemWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 170, 141, 211),
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    task.name,
                    style: const TextStyle(
                      color: mainForegroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "${task.mark}",
                  style: const TextStyle(
                    color: mainForegroundColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AttendanceButtonWidget extends StatelessWidget {
  final Function() navigateTo;
  const _AttendanceButtonWidget({
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: navigateTo,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            mainButtonBackgroundColor,
          ),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),),),
      child: const Row(
        children: [
          Expanded(
            child: Text(
              "Посещаемость",
              style: TextStyle(
                color: mainButtonForegroundColor,
                fontSize: 20,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
