import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class TeamData {
  final String name;
  final String logo;
  int score;

  TeamData({required this.name, required this.logo, this.score = 0});
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<TeamData> teams;

  @override
  void initState() {
    super.initState();
    teams = [
      TeamData(name: 'San Pedro', logo: 'lib/imgs/sanpedro.png'),
      TeamData(name: 'Xelaju', logo: 'lib/imgs/xelaju.png'),
    ];
  }

  void resetScores() {
    setState(() {
      teams[0].score = 0;
      teams[1].score = 0;
    });
  }

  String getWinnerMessage() {
    if (teams[0].score == teams[1].score) {
      return 'Empate';
    } else if (teams[0].score > teams[1].score) {
      return 'Va ganando ${teams[0].name}';
    } else {
      return 'Va ganando ${teams[1].name}';
    }
  }

  Color getTeamColor(int index) {
    if (teams[0].score == teams[1].score) {
      return Colors.grey;
    } else if (teams[0].score > teams[1].score && index == 0) {
      return Colors.green;
    } else if (teams[1].score > teams[0].score && index == 1) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
            child: Text('Liga nacional'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getWinnerMessage(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < teams.length; i++)
                  TeamWidget(
                    team: teams[i],
                    color: getTeamColor(i),
                    onAdd: () => setState(() => teams[i].score++),
                    onSubtract: () {
                      if (teams[i].score > 0) {
                        setState(() => teams[i].score--);
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: resetScores,
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    required this.team,
    required this.color,
    required this.onAdd,
    required this.onSubtract,
    super.key,
  });

  final TeamData team;
  final Color color;
  final VoidCallback onAdd;
  final VoidCallback onSubtract;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 3),
            ),
            child: Image.asset(team.logo, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            team.name,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            team.score.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: onSubtract,
                child: const Text('−1'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onAdd,
                child: const Text('+1'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
