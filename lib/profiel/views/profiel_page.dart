import 'package:flutter/material.dart';
import 'package:hackaton2025_6/package.dart';

class ProfielPage extends StatelessWidget {
  const ProfielPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person, size: 40),
                    ),
                    Text(
                      tempUser.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      tempUser.email,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      tempUser.phoneNumber,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${tempUser.location.latitude}° N, ${tempUser.location.longitude}° W",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
