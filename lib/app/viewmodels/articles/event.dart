import 'package:equatable/equatable.dart';
import 'package:nave_articles/app/domain/entities/category.dart';

abstract class ArticlesEvent {
  const ArticlesEvent();

  factory ArticlesEvent.gotten() => ArticlesEventGotten();

  factory ArticlesEvent.onCategoryPressed({
    required final bool isSelected,
    required final Category category,
  }) =>
      ArticlesEventOnCategoryPressed(
        isSelected: isSelected,
        category: category,
      );
}

class ArticlesEventGotten extends ArticlesEvent with EquatableMixin {
  @override
  List<Object> get props => [];
}

class ArticlesEventOnCategoryPressed extends ArticlesEvent with EquatableMixin {
  const ArticlesEventOnCategoryPressed({
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final Category category;

  @override
  List<Object> get props => [isSelected, category];
}
