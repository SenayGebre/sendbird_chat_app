// This will be an abstract class that all feature entities will extend.import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

typedef Constructor<T extends Entity> = Entity Function(
    Map<String, dynamic> value);
typedef TypedModel<T extends Entity> = T Function(Map<String, dynamic> value);

abstract class Entity extends Equatable {
  String? get id;

  Entity copyWith();

  const Entity();

  @override
  List<Object?> get props;
}

typedef UpdateCallback<T extends Entity> = T Function(T);
