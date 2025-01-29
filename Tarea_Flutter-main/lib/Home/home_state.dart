import 'dart:math';

enum HomeStatus { initial, loading, success, error }

class HomeState<T> {
  final HomeStatus status;
  final List<T> characters;
  final bool bHasReachedMax;

  const HomeState({
    this.status = HomeStatus.initial,
    this.characters = const [],
    this.bHasReachedMax = false,
  });

  HomeState<T> copyWith({
    HomeStatus? status,
    List<T>? characters,
    bool? bHasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      bHasReachedMax: bHasReachedMax ?? this.bHasReachedMax,
    );
  }

  T getRandomCharacter() {
    return characters[Random().nextInt(characters.length)];
  }

  HomeStatus getStatus() {
    return status;
  }
}
