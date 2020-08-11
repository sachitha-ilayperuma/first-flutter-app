

import 'package:first_flutter_app/app/home/jobs/edit_job_page.dart';
import 'package:first_flutter_app/app/home/jobs/empty_content.dart';
import 'package:first_flutter_app/app/home/jobs/job_list_tile.dart';
import 'package:first_flutter_app/app/home/jobs/list_item_builder.dart';
import 'package:first_flutter_app/app/home/models/job.dart';
import 'package:first_flutter_app/app/interfaces/auth_base.dart';
import 'package:first_flutter_app/app/interfaces/database.dart';
import 'package:first_flutter_app/common_widgets/platform_alert_dialogue.dart';
import 'package:first_flutter_app/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRqequestSignout = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure you want to Logout ? ',
      cancelActiontext: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRqequestSignout == true) {
      _signOut(context);
    }
  }
 Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    } on PlatformException catch(e){
      PlatformExceptionAlertDialog(
        title: 'Delete Failed',
        exception: e,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditJobPage.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemBuilder<Job>(
          snapshot:snapshot ,
          itemBuilder: (context,job)=>Dismissible(
            key: Key('job-${job.id}'),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction)=> _delete(context,job),
            child: JobListTile(
              job: job,
              onTap: () => EditJobPage.show(context, job: job),
        ),
          ));
      },

    );
  }


}


//if (snapshot.hasData) {
//final jobs = snapshot.data;
//if(jobs.isNotEmpty) {
//final children = jobs.map((job) =>
//JobListTile(
//job: job,
//onTap: () => EditJobPage.show(context, job: job),
//)).toList();
//return ListView(
//children: children,
//);
//}
//return EmptyContent();
//}
//if(snapshot.hasError){
//return Center(child: Text('Some Error Occured'),);
//}
//return Center(child: CircularProgressIndicator(),);