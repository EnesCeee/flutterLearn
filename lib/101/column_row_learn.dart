import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('a1'),
                  Text('a2'),
                  Text('a3'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ProjectSizedBoxSize.height,
            child: Column(children: const [
              Expanded(
                child: Text('data'),
              ),
              Expanded(
                child: Text('data'),
              ),
              Expanded(
                child: Text('data'),
              ),
              Spacer(),
              Expanded(
                child: Text('data'),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class ProjectSizedBoxSize {
  static double height = 200;
}

//row column da ana özelliğini kullanmak istyitosan
// mainAxisAligment kendi özelliğini alır

//ama ara özelliğini kullanmak istiyorsan örn rowsa aşşağı yukarısı için
//crossAxisAligment

//mainAxisSize bir property var bunu min çekersek sadece sıkıştığı 
//alanı alır