// Copyright 2024 Simon Braillard
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_new_badger/flutter_new_badger.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('New badger plugin'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await FlutterNewBadger.setBadge(5);
                  developer.log('Badge set', name: 'FlutterNewBadger');
                },
                child: const Text('Set 5 badges'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await FlutterNewBadger.removeBadge();
                  developer.log('Badge removed', name: 'FlutterNewBadger');
                },
                child: const Text('Remove badge'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  int? count = await FlutterNewBadger.incrementBadgeCount();
                  developer.log('Badge count incremented: $count',
                      name: 'FlutterNewBadger');
                },
                child: const Text('Increment badge count'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  int? count = await FlutterNewBadger.decrementBadgeCount();
                  developer.log('Badge count decremented: $count',
                      name: 'FlutterNewBadger');
                },
                child: const Text('Decrement badge count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
