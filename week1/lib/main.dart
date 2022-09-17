// import 'dart:html';

import 'package:flutter/material.dart';
// import 'src/people.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Team shuffler app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () => setState(() {
                _people.shuffle();
                teams[0] = Team(_people.sublist(0, 6), 0);
                teams[1] = Team(_people.sublist(6, 12), 1);
                teams[2] = Team(_people.sublist(12, 18), 2);
                teams[3] = Team(_people.sublist(18, 24), 3);
                print("shuffled");
              }),
              child: Text('Shuffle'),
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return WideLayout();
              } else {
                return NarrowLayout();
              }
            }),
          ],
        ));
  }
}

class TeamDetail extends StatefulWidget {
  var teamId;
  TeamDetail(teamId);
  @override
  _TeamDetailState createState() => _TeamDetailState(teamId);
}

class _TeamDetailState extends State<TeamDetail> {
  var teamId = 0;
  _TeamDetailState(this.teamId);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Team #" + teamId.toString()),
          for (var person in teams[teamId].people)
            ListTile(title: Text(person)),
        ],
      ),
    );
  }
}

class TeamList extends StatelessWidget {
  final void Function(Team) onTeamTap;

  const TeamList({required this.onTeamTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var team in teams)
          ListTile(
            title: Text("Team #" + team.id.toString()),
            onTap: () => onTeamTap(team.id),
          ),
      ],
    );
  }
}

class WideLayout extends StatefulWidget {
  @override
  _WideLayoutState createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  // var _person = new Person('');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 4; i++) Expanded(child: TeamDetail(i), flex: 1),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TeamList(
        onTeamTap: (teamId) => Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(),
                    body: TeamDetail(teamId),
                  )),
        ),
      ),
    );
  }
}

class Team {
  List<String> people;
  var id;

  Team(this.people, id);
}

List<Team> teams = [Team([], 0), Team([], 1), Team([], 2), Team([], 3)];

final List<String> _people = [
  "Liam",
  "Noah",
  "Oliver",
  "Elijah",
  "James",
  "William",
  "Benjamin",
  "Lucas",
  "Henry",
  "Theodore",
  "Jack",
  "Levi",
  "Alexander",
  "Jackson",
  "Mateo",
  "Daniel",
  "Michael",
  "Mason",
  "Sebastian",
  "Ethan",
  "Logan",
  "Owen",
  "Samuel",
  "Jacob"
];
