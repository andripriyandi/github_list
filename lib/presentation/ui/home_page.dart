import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_list/data/other/view_data_state.dart';
import 'package:github_list/presentation/bloc/user/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github User'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final status = state.statusUser.status;
          final data = state.statusUser.data?.dataUsers;

          if (status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (status.isHasData) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              physics: const BouncingScrollPhysics(),
              itemCount: data?.length,
              itemBuilder: (context, index) {
                final obj = data![index];
                return Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: CachedNetworkImage(
                        imageUrl: obj.avatarUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>  const CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text(obj.login ?? '')),
                  ],
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
