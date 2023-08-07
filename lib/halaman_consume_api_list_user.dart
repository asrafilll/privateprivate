import 'dart:convert';

import 'package:belajar_flutter/single_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumeAPIListUser extends StatefulWidget {
  const ConsumeAPIListUser({super.key});

  @override
  State<ConsumeAPIListUser> createState() => _ConsumeAPIListUserState();
}

class _ConsumeAPIListUserState extends State<ConsumeAPIListUser> {
  Future<List<SingleUserModel>> getSingleUser() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    final jsonResponse = json.decode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    final userList =
        data.map((json) => SingleUserModel.fromJson(json)).toList();
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSingleUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            // DATAA
            var data = snapshot.data!;
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data[index].avatar!),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        data[index].firstName!,
                      ),
                      subtitle: Text(
                        data[index].email!,
                      ),
                    );
                  });
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}
