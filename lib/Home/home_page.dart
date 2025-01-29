import 'package:flutter/material.dart';
import 'package:flutter_task/CustomWidgets/character_container.dart';
import 'package:flutter_task/Home/home_provider.dart';
import 'package:flutter_task/Home/home_state.dart';
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
    context.read<HomeProvider>().getRandomCharacterFromAPI();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, state, child) {
        if (state.homeState.status == HomeStatus.initial || state.homeState.status == HomeStatus.success && state.homeState.characters.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.homeState.status == HomeStatus.error) {
          return const Center(child: Text("Error: No se pudo obtener la información."));
        }
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30, top: 30),
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 40,
              children: <Widget>[
                _widgetRandomCharacter(state),
                _widgetCharacterGridView(state),
              ],
            ),
          ),
        );
      }),
    );
  }

  //---> GridView Builder
  Widget _widgetCharacterGridView(HomeProvider state) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
      ),
      itemCount: state.homeState.bHasReachedMax
          ? state.homeState.characters.length
          : state.homeState.characters.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.homeState.characters.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: CharacterContainer(
            character: state.homeState.characters[index],
            size: 230,
          ),
        );
      },
    );
  }

  //---> Random Character
  Widget _widgetRandomCharacter(HomeProvider state) {
    return state.randomCharacter != null ? CharacterContainer(
          character: state.randomCharacter!,
          size: 330,
    ) 
    : const CircularProgressIndicator();
  }

  //---> Scroll Controller
  void _onScroll() {
    if (_isBottom && context.read<HomeProvider>().homeState.status == HomeStatus.success) {
      context.read<HomeProvider>().getCharactersFromAPI();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll == maxScroll;
  }
}
