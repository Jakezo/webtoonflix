import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webtoonflix/models/webtoon_model.dart';
import 'package:webtoonflix/services/api_service.dart';
import 'package:webtoonflix/widgets/webtoon_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}); // const 는 컴파일 전에 값을 알고 있다는 뜻
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  @SemanticsHintOverrides()
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Jake Toons",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2, // 음영설정
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) =>
            snapshot.hasData // 여기서 snapshot future 로 변경해도 된다
                ? Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(child: makeList(snapshot))
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(), // 로딩표시
                  ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // 아이템을 필요할때만 로드한다는 뜻
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 40), // 리스트와 구분자를 랜더하고있음
    );
  }
}
