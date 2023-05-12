import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:production/src/pages/presentation/CustomCard.dart';

import './presentation/CustomCarousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.popUntil(context, (context) => context.isFirst);
      } else if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/search');
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/mypage');
      }
    });
  }

  int _selectedIndex = 0;
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        elevation: 50,
        title: TextButton(
            onPressed: () {
              Navigator.popUntil(context, (context) => context.isFirst);
            },
            child: Text('carFull')),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text('SignUp'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
        child: Column(
          children: [
            CustomCard(
                child: Text('recruit'),
                size: {'width': 100, 'height': 100},
                onTap: () {
                  Navigator.pushNamed(context, '/recruit');
                }),
            CustomCard(
                child: Text('two'),
                size: {'width': 100, 'height': 100},
                onTap: () {
                  Navigator.pushNamed(context, '/two');
                }),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}

class HomeBottomNav extends StatelessWidget {
  HomeBottomNav(
      {Key? key, required this.onItemTapped, required this.selectedIndex})
      : super(key: key);
  final void Function(int) onItemTapped;
  final selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
        BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page_outlined), label: '찾기'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: '내정보'),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      // selectedItemColor: Theme.of(context).colorScheme.primary,
    );
  }
}


//child: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               // backgroundColor: Theme.of(context).colorScheme.primary,
//               toolbarHeight: 30,
//               /** 높이 설정 **/
//               pinned: true,
//               /** 최상단에 고정하느냐 아니냐 **/
//               snap: false,
//               /** 몰?루 **/
//               floating: false,
//               /** 화면을 내리자마자 바로 AppBar가 커질거냐? **/
//               expandedHeight: 200,
//               /** 커졌을때는 어느정도 크기? **/
//
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/login');
//                       },
//                       child: Text('Login', style: TextStyle(
//                         // color: Theme.of(context).colorScheme.onPrimary,
//                       ),),
//                       style: ButtonStyle(
//                         foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.white),
//                       )),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/signup');
//                       },
//                       child: Text('SignUp',style: TextStyle(
//                         // color: Theme.of(context).colorScheme.onPrimary,
//                       ),),
//                       style: ButtonStyle(
//                         foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.white),
//                       )),
//                 ]
//               ),
//               flexibleSpace: FlexibleSpaceBar(
//                   title: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
//                     child: Text('Carfull', style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),),
//                   )
//                 ]
//               )),
//             ),
//             SliverGrid(delegate: SliverChildListDelegate([
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   height: 400,
//                   child: TextButton(
//                     style: ButtonStyle(
//                       /**Theme 로 안되네**/
//                       backgroundColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.2)),
//                     ),
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/recruit');
//                       },
//                       child: Text('Recruit')),
//                 ),
//               ),
//             ]), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//               )),
//           ],
//         ),
