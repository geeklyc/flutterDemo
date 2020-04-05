// 自定义JSON解析
//import 'dart:io';
//import 'dart:convert';
//import 'package:flutter/foundation.dart';

class NewsItem {
  String title;
  String authorName;
  String url;
  String picUrl;
  String date;
  String category;

  NewsItem({
    this.title,
    this.authorName,
    this.url,
    this.picUrl,
    this.date,
    this.category
  });

  factory NewsItem.fromJson(Map<String, dynamic> parsedJson) {
    return NewsItem(
      title: parsedJson['title'],
      authorName: parsedJson['author_name'],
      url: parsedJson['url'],
      picUrl: parsedJson['thumbnail_pic_s'],
      date: parsedJson['date'],
      category: parsedJson['category'],
    );
  }
}