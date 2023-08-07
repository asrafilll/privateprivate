import 'dart:convert';

import 'package:belajar_flutter/single_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsumeAPIPage extends StatefulWidget {
  const ConsumeAPIPage({super.key});

  @override
  State<ConsumeAPIPage> createState() => _ConsumeAPIPageState();
}

class _ConsumeAPIPageState extends State<ConsumeAPIPage> {
  Future<SingleUserModel> getSingleUser() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    var result = jsonDecode(response.body);
    return SingleUserModel.fromJson(result['data']);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getSingleUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data!;
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return ListTile(
                      leading: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(data.avatar!),
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        data.firstName!,
                      ),
                      subtitle: Text(
                        data.email!,
                      ),
                    );
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
