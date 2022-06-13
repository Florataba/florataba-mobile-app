import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);

  final List _titles = ['Defiant Kyiv residents arrange tulips display', 'China welcomes cherry blossom season with dazzling firework display', '5,000 blooms on display at Kew Gardens orchid festival', 'Canal boat gives away free flowers to mark start of tulip season'];

  final List _times = [
    '12:34 12 Oct 2022',
    '02:34 12 Oct 2021',
    '05:34 13 Oct 2023',
    '00:00 12 Oct 2022',
  ];

  final List _news = [
    'Residents of the Ukrainian capital of Kyiv came out to a central square in the sunshine on Friday to arrange some 1.5 million tulips in the shape of the countrys ',
    'This stunning spectacle of sakura trees in bringing thousands of tourists to the Chinese city of Wuhan.',
    'More than 5,000 flagrant flowers will be on display at the Royal Botanic Gardens Kew this weekend, as the Orchid 2022 festival gets underway.',
    'Britains Royal Botanic Gardens at Kew has just unveiled its annual orchid festival, turning a sliver of southwest London into a riot of tropical colour.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Florataba',
                    style: TextStyle(color: Colors.black)),
              ])),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'News',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: _titles.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        MyNotification(_titles[index], _news[index], _times[index]),
                        const SizedBox(height: 8),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNotification extends StatelessWidget {
  final String title;
  final String news;
  final String time;

  const MyNotification(this.title, this.news, this.time) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.fromBorderSide(BorderSide(
          color: Color.fromRGBO(200, 200, 200, 1),
        )),
      ),
      width: 320,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 15.7,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                news,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(188, 188, 188, 1),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
