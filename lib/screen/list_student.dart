import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_new/db/functions/db_functions.dart';
import 'package:hive_new/db/model/data_model.dart';

class ListStudentWideget extends StatelessWidget {
  const ListStudentWideget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> StudentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = StudentList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                onPressed: () {

                  if(data.id != null){
                    deleteStudent(data.id!);
                  }else{
                   print('stdent id is null . unable to delete') ;
                  }

                  
                },
                icon: Icon(Icons.delete_rounded,color: Colors.red,),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: StudentList.length,
        );
      },
    );
  }
}
