import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/authentication/screens/profile/profile_screen.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  // Function to get the current date in the format "30 December 2023"
  String getCurrentDate() {
    DateTime currentDate = DateTime.now();
    return DateFormat('dd MMMM yyyy').format(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.to(const ProfileScreen()),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tUserProfile, style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<List<UserModel>>(
            future: controller.getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(LineAwesomeIcons.user_1),
                            title: Text(
                                "Name : ${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: tDefaultSize - 20,
                          ),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
