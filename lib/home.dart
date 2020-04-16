import 'package:flutter/material.dart';
import 'takert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            takertLine(),
          ],
        ),
      ),
      floatingActionButton: lowerRightButton(),
    );
  }

  // 標準的なアプリバー
  Widget basicAppBar() {
    return AppBar(
      leading: Icon(Icons.account_circle,
        size: 40.0,
      ),
      title: Text('Takatter',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 200, 150),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: (){},
        ),
      ],
    );
  }

  // タカートライン(タカートを表示するタイムライン)
  Widget takertLine() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: takerts.length,
        itemBuilder: (BuildContext context, int index) {
          final takert = takerts[index];

          return Card(
            child: ListTile(
              leading: Icon(Icons.account_circle,
                color: Colors.green,
                size: 40.0,
              ),
              title: Text(takert, style: TextStyle(
                fontSize: 20.0,
              )),
            )
          );
        },
      )
    );
  }

  // タカートを管理するリスト
  List<String> takerts = ["タカッター始めてみた！って僕一人！？"];

  // 右下のボタン
  Widget lowerRightButton() {
    return FloatingActionButton(
      onPressed: () {
        lowerRightButtonEvent(context);
      },
      tooltip: 'タカートするボタンです。',
      child: Icon(Icons.airplanemode_active,
        size: 30.0,
      ),
    );
  }

  // 右下のボタンを押したときの処理
  Future lowerRightButtonEvent(context) async {
    String takertText = await Navigator.push(context, MaterialPageRoute(builder: (context) => TakertPage()));
    if (takertText != null && takertText != "") {
      print('反映するタカート内容: $takertText');
      takerts.add(takertText);
    } else {
      print('タカートされませんでした…');
    }
  }
}
