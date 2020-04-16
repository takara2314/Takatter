import 'package:flutter/material.dart';

class TakertPage extends StatefulWidget {
  @override
  _TakertPageState createState() => _TakertPageState();
}

class _TakertPageState extends State<TakertPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            takertTextBox(),
            takertButton(),
          ],
        ),
      ),
    );
  }

  // 標準的なアプリバー
  Widget basicAppBar() {
    return AppBar(
      title: Text('タカートする',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 200, 150),
      centerTitle: true,
    );
  }

  // タカートするテキストを入れる場所
  Widget takertTextBox() {
    return TextField(
      controller: textController,
      style: takertTextStyle(),
      decoration: InputDecoration(
        // ガイドテキスト
        hintText: 'いまタカってる？',
        hintStyle: takertTextStyle(),
        // 非選択時の外枠の装飾
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 200, 0), width: 2.0),
          borderRadius: BorderRadius.circular(100.0),
        ),
        // 選択時の外枠の装飾
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  // タカートテキストのスタイル
  TextStyle takertTextStyle() {
    return TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  // タカートボタン
  Widget takertButton() {
    return Align(
      // 右寄せにする
      alignment: Alignment.centerRight,
      child: RaisedButton(
        child: Text('タカート', style: takertTextStyle()),
        color: Colors.white,
        shape: takertButtonBorder(),
        onPressed: takertEvent,
      )
    );
  }

  // タカートボタンの外枠
  Border takertButtonBorder() {
    return Border(
      top: BorderSide(
        color: Colors.red,
        width: 4.0,
      ),
      left: BorderSide(
        color: Colors.blue,
        width: 4.0,
      ),
      right: BorderSide(
        color: Colors.yellow,
        width: 4.0,
      ),
      bottom: BorderSide(
        color: Colors.green,
        width: 4.0,
      ),
    );
  }

  // タカートボタンが押された時の処理
  void takertEvent() {
    String takertText = textController.text;
    print('タカートボタンが押されました！');
    print(takertText);
    // テキストフィールドの文章を削除
    textController.clear();
    // 前のページに戻る
    Navigator.pop(context, takertText);
  }

  final textController = TextEditingController();
}