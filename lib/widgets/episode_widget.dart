import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtoonflix/models/webtoon_episide_model.dart';

class Episode extends StatelessWidget {
  onButtonTap() async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    await launchUrl(url);

    //or lunchUrlString
  }

  const Episode({super.key, required this.episode, required this.webtoonId});

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green.shade400, width: 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.green.withOpacity(0.2),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green.shade400,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.green.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
