import 'package:equatable/equatable.dart';
import 'package:nave_articles/app/domain/entities/category.dart';

abstract class ArticlesEvent extends Equatable {
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

  factory ArticlesEvent.onRefresh() => const ArticlesEventOnRefresh();
}

class ArticlesEventGotten extends ArticlesEvent {
  @override
  List<Object> get props => [];
}

class ArticlesEventOnCategoryPressed extends ArticlesEvent {
  const ArticlesEventOnCategoryPressed({
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final Category category;

  @override
  List<Object> get props => [isSelected, category];
}

class ArticlesEventOnRefresh extends ArticlesEvent {
  const ArticlesEventOnRefresh();

  @override
  List<Object> get props => [];
}
