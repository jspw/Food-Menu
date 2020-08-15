import 'package:flutter/material.dart';

class menuitemlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "";

    List choices = const [
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
      const Choice(
          itemname: 'Thai Soup       ---------------------              ',
          price: '300 Tk'),
    ];

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Image.network(
                'https://i.imgur.com/pM0RgNZ.gif',
                fit: BoxFit.fill,
              ),
              backgroundColor: Color(0xff991521),
            ),
            body: DecoratedBox(
                position: DecorationPosition.background,
                decoration: BoxDecoration(
                    color: Color(0xffFFF6E1),
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
  final String itemname;
  final String price;
  const Choice({this.itemname, this.price});
}

class ChoiceList {
  final List choicelist;
  const ChoiceList({this.choicelist});
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
        color: Color(0xffF4CA4A).withOpacity(0.0),
        child: Row(
          children: [
            new Container(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 2.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(choice.itemname,
                        style: TextStyle(
                            color: Colors.black.withOpacity(1.0),
                            fontWeight: FontWeight.bold)),
                    Text(choice.price,
                        style: TextStyle(
                            color: Colors.red.withOpacity(1.0),
                            fontWeight: FontWeight.bold)),
                  ])
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
