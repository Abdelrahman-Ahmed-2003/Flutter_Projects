import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart'; // Ensure Hive is imported
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final Box box = Hive.box("category_box"); // Add type annotation
  List<String> categories = []; // Add type annotation
  List listCat = [
    "Work",
    "Personal",
    "Home",
    "Health",
    "Finance",
    "Education",
    "Entertament",
    "Shopping"
  ];

  void getCategories() {
    categories = box.values.cast<String>().toList(); // Ensure type casting
    emit(CategoryLoaded(categories));
  }

  Future<void> addCategory(String category) async {
    try {
      categories.add(category);
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString())); // Emit an error state if needed
    }
  }

  void removeCategory(int index) {
    categories.remove(listCat[index]);
    emit(CategoryLoaded(categories));
  }

  closeApp() async {
    await Hive.deleteBoxFromDisk("category_box");
    for (var element in categories) {
      await box.add(element);
    }
    Hive.close();
  }
}
