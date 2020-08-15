import 'package:flutter/material.dart';

class restlistview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "";

    List choices = const [
      const Choice(
          title: 'Artisan Coffee',
          Address: 'Kumarpara,Sylhet',
          imglink: 'https://i.imgur.com/9TUi7ts.png'),
      const Choice(
          title: 'Cafe Aarko',
          Address: 'Barutkhana,Sylhet',
          imglink: 'https://i.imgur.com/JEfDpIZ.png?1'),
      const Choice(
          title: 'Cafe La vista',
          Address: 'Zindabazar,Sylhet',
          imglink: 'https://i.imgur.com/u4Lvc4k.png'),
      const Choice(
          title: 'Coffee Club',
          Address: 'Kumarpara,Sylhet',
          imglink: 'https://i.imgur.com/gVoh8xO.png'),
      const Choice(
          title: 'Peepers',
          Address: 'Zindabazar,Sylhet',
          imglink: 'https://i.imgur.com/AJ6xR88.png'),
      const Choice(
          title: 'The Swad Restaurant',
          Address: 'Zindabazar,Sylhet',
          imglink: 'https://i.imgur.com/AS6sDPr.png'),
    ];

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Image.network(
                'https://i.imgur.com/OoUnOPB.gif',
                fit: BoxFit.cover,
              ),
              backgroundColor: Color(0xffB01C2A),
            ),
            body: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                    color: Color(0xffFAAF40),
                    image: DecorationImage(image: NetworkImage(''))),
                child: new ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10.0),
                    children: List.generate(choices.length, (index) {
                      return Center(
                        child: ChoiceCard(
                            choice: choices[index], item: choices[index]),
                      );
                    })))));
  }
}

class Choice {
  final String title;
  final String Address;
  final String imglink;
  const Choice({this.title, this.Address, this.imglink});
}

class BodyHeader {}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;

  final VoidCallback onTap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        elevation: 0.0,
        color: Color(0xffB01C2A).withOpacity(0.2),
        child: Row(
          children: [
            new Container(
                color: Colors.transparent,
                height: 100,
                width: 100,
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 0.0, right: 8.0),
                child: Image.network(choice.imglink)),
            new Container(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 8.0, left: 2.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(choice.title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffB01C2A),
                          fontWeight: FontWeight.bold)),
                  Text(choice.Address,
                      style: TextStyle(
                          color: Colors.black.withOpacity(1.0),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
