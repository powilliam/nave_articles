import 'package:equatable/equatable.dart';
import 'package:nave_articles/app/domain/entities/category.dart';

abstract class ArticlesEvent {
  const ArticlesEvent();

  factory ArticlesEvent.gotten() => Gotten();

  factory ArticlesEvent.onCategoryPressed({
    required final bool isSelected,
    required final Category category,
  }) =>
      OnCategoryPressed(
        isSelected: isSelected,
        category: category,
      );
}

class Gotten extends ArticlesEvent with EquatableMixin {
  @override
  List<Object> get props => [];
}

class OnCategoryPressed extends ArticlesEvent with EquatableMixin {
  const OnCategoryPressed({
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final Category category;

  @override
  List<Object> get props => [isSelected, category];
}
