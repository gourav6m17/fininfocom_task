import 'dart:developer';

import 'package:fininfocom_task/models/user_profile_model.dart';
import 'package:fininfocom_task/network/services.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'components/profile_details.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserProfileModel> userDetails;

  @override
  void initState() {
    super.initState();
    userDetails = Services.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: FutureBuilder<UserProfileModel>(
              future: userDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        ProfilePic(
                            text:
                                '${snapshot.data?.results?.first.picture?.medium}'),
                        const SizedBox(height: 10),
                        ProfileMenu(
                          text:
                              '   Name : ${snapshot.data?.results?.first.name?.first} ${snapshot.data?.results?.first.name?.last}',
                          iconData: Icons.man,
                          press: () => {},
                        ),
                        ProfileMenu(
                          text:
                              '   Location : ${snapshot.data?.results?.first.location?.city} '
                              '${snapshot.data?.results?.first.location?.state} '
                              '${snapshot.data?.results?.first.location?.country} '
                              '${snapshot.data?.results?.first.location?.postcode} ',
                          iconData: Icons.location_on_sharp,
                          press: () => {},
                        ),
                        ProfileMenu(
                          text:
                              '   Email : ${snapshot.data?.results?.first.email} ',
                          iconData: Icons.email,
                          press: () => {},
                        ),
                        ProfileMenu(
                          text:
                              '   DOB : ${snapshot.data?.results?.first.dob?.date?.substring(0, snapshot.data?.results?.first.dob?.date?.indexOf('T'))} ',
                          iconData: Icons.calendar_month,
                          press: () => {},
                        ),
                        ProfileMenu(
                          text:
                              '   Register date : ${snapshot.data?.results?.first.registered?.date?.substring(0, snapshot.data?.results?.first.registered?.date?.indexOf('T'))} ',
                          iconData: Icons.calendar_month,
                          press: () => {},
                        ),
                      ],
                    ),
                  );
                  // return Text(snapshot.data!.status);
                } else if (snapshot.hasError) {
                  log('${snapshot.error}');
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
