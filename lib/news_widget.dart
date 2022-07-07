import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/dataModels/dataModels.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  Function fun;
  NewsArticle newsArticle;
  launchInBrowser() async {
    launchUrl(
      Uri.parse(newsArticle.url ?? ''),
      mode: LaunchMode.externalApplication,
    );
  }

  NewsWidget(this.newsArticle, this.fun);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchInBrowser();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                imageUrl: newsArticle.urlToImage ?? "",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/nature.jpg', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsArticle.title ?? "Not Found",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    newsArticle.description ?? "Not Found",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          newsArticle.author ?? "Not Found",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            fun(newsArticle);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: (newsArticle.isliked)
                                ? Colors.redAccent
                                : Colors.grey,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
