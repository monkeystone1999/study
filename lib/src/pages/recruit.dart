import 'package:flutter/material.dart';

class Recruit extends StatelessWidget {
  const Recruit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            toolbarHeight: 30,
            /** 높이 설정 **/
            pinned: true,
            /** 최상단에 고정하느냐 아니냐 **/
            snap: false,
            /** 몰?루 **/
            floating: false,
            /** 화면을 내리자마자 바로 AppBar가 커질거냐? **/
            expandedHeight: 200,
            /** 커졌을때는 어느정도 크기? **/

            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Login', style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),),
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text('SignUp',style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),),
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                      )),
                ]
            ),
            flexibleSpace: FlexibleSpaceBar(
                title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('Recruit', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      )
                    ]
                )),
          ),
          SliverGrid(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SizedBox(

              ),
            )]), gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,)),
        ],
      ),
    );
  }
}
