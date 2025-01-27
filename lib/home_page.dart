import 'package:flutter/material.dart';
import 'package:flutter_task/Custom%20Widgets/character_container.dart';
import 'package:flutter_task/home_provider.dart';
import 'package:flutter_task/home_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HomeProvider>().getCharacters();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.99);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, state, child) {
        if (state.homeState.status == HomeStatus.initial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.homeState.status == HomeStatus.error) {
          return const Center(
              child: Text("Error: No se pudo obtener la información."));
        }
        if (state.homeState.status == HomeStatus.success) {
          if (state.homeState.characters.isEmpty) {
            return const Center(child: Text("No hay personajes"));
          }
          return SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            CharacterContainer(
              character: state.homeState.getRandomCharacter(),
              size: 275,
            ),
            GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.homeState.bHasReachedMax
                    ? state.homeState.characters.length
                    : state.homeState.characters.length + 1,
                itemBuilder: (context, index) {
                  return index >= state.homeState.characters.length
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CharacterContainer(
                          character: state.homeState.characters[index],
                          size: 200,
                        );
                }),
          ])));
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
