import 'package:codeforces_visualizer/repository/api_model/data.dart';
import 'package:codeforces_visualizer/repository/retrofit/api_client.dart';
import 'package:codeforces_visualizer/widgets/contest_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContestScreen extends StatelessWidget {
  static const routeName = '/contest-screen';
  const ContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom) *
                0.2,
            width: double.infinity,
            child: const Center(
              child: Text(
                'Upcoming Contests',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getContests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final ResponseData? posts = snapshot.data;
          print(posts!.data.length);
          return _buildListView(
            mediaQuery: _mediaQuery,
            posts: posts,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _buildListView extends StatelessWidget {
  const _buildListView({
    Key? key,
    required this.mediaQuery,
    required this.posts,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final ResponseData? posts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (mediaQuery.size.height -
              mediaQuery.padding.top -
              mediaQuery.padding.bottom) *
          0.7,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          if (posts!.data[index]['phase'] == 'BEFORE') {
            return ContestDetail(
              contestName: posts!.data[index]['name'],
              startTime: posts!.data[index]['startTime'],
              duration: posts!.data[index]['duration'],
            );
          } else {
            return const Text('No Upcoming Contests Ahead');
          }
        },
        itemCount: posts!.data.length,
      ),
    );
  }
}
