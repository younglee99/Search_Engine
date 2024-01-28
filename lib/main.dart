import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'List/Relatedword_list.dart';
import 'WebScreen/screen.dart';

//────────────────────────────────────OpenAi────────────────────────────────────
const apikey = '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';
const apiurl = 'https://api.openai.com/v1/completions';

//────────────────────────────────────전역변수────────────────────────────────────
int num = -1;

// 유사어 리스트
List<Map<String, dynamic>> relatedWords = [];

// 원하는 collection 주소에 새로운 document를 Map의 형태로 추가
final firestoreAddress = FirebaseFirestore.instance.collection('RelatedWords');

//────────────────────────────────────함수────────────────────────────────────
Future<void> generateText(String prompt) async {
  final lowerPrompt = prompt.toLowerCase();
  final cacheIndex = relatedWords.indexWhere((d) => d['name'] == lowerPrompt);

  // 동일한 검색어가 있으면 리턴
  if (cacheIndex != -1) {
    num = cacheIndex;
    return;
  }

  // 검색어가 기존 DB에 없을 경우, 1)ChatGPT에게 물어봐서 2)DB에 저장
  print('★☆★☆★☆ 새로운 검색어 발견! DB에 유사어 저장 ★☆★☆★☆');
  // 1)
  final response = await http.post(
    Uri.parse(apiurl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apikey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': 'Please let me know the list of 5 items related to $prompt only (no explanation required) (Format 1.2.3.4.5)',
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );
  final synonymsList = jsonDecode(utf8.decode(response.bodyBytes))['choices'][0]['text'].toString().split('\n');
  final synonyms = synonymsList.sublist(2, 7).map((s) => s.split('. ')[1].toLowerCase()).toList();
  print(synonyms);

  // 2)
  relatedWords.add({
    'name': lowerPrompt,
    'tag1': synonyms[0],
    'tag2': synonyms[1],
    'tag3': synonyms[2],
    'tag4': synonyms[3],
    'tag5': synonyms[4],
  });

  // 주입식 테그값 넣어버리기
  num = relatedWords.length - 1;
  int ber = 1;
  for (int i = 0; i < num; i++) {
    if (relatedWords[i]['tag1'] == prompt ||
        relatedWords[i]['tag2'] == prompt ||
        relatedWords[i]['tag3'] == prompt ||
        relatedWords[i]['tag4'] == prompt ||
        relatedWords[i]['tag5'] == prompt) {
      // ignore: unnecessary_brace_in_string_interps
      relatedWords[num]['tag${ber}'] = relatedWords[i]['name'];
      ber++;
    }
  }
  // print(relatedWords);

  // Firebase에 저장
  try{
    words messageModel = words(
      name: prompt.toLowerCase(),
      tag1: relatedWords[num]['tag1'],
      tag2: relatedWords[num]['tag2'],
      tag3: relatedWords[num]['tag3'],
      tag4: relatedWords[num]['tag4'],
      tag5: relatedWords[num]['tag5'],
    );
    firestoreAddress.add(messageModel.toMap());
  }catch(ex){
    log('error)',error: ex.toString(),stackTrace: StackTrace.current);
  }
}

// Firebase에서 유사어 가져오기
Future<void> createAllDB() async {
  QuerySnapshot querySnapshot = await firestoreAddress.get();
  querySnapshot.docs.forEach((doc) {
    Map<String, dynamic> document = doc.data() as Map<String, dynamic>;
    relatedWords.add(document);
  });
}

//────────────────────────────────────main────────────────────────────────────
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // 앱을 시작하면 Firebase에 저장하였던 유사어를 가져옴
  createAllDB().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Search Engine',
      home: WebPage(),
    );
  }
}