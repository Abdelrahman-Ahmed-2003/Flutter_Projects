import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart'; // Ensure Hive is imported
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final Box box = Hive.box("category_box"); // Add type annotation
  List<String> categories = []; // Add type annotation
  List<String> listCat = [
    "Work",
    "Personal",
    "Home",
    "Health",
    "Finance",
    "Education",
    "Entertainment",
    "Shopping"
  ];

  void getCategories() {
    categories = box.values.cast<String>().toList(); // Ensure type casting
    emit(CategoryLoaded());
  }

  Future<void> addCategory(String category) async {
    try {
      categories.add(category);
      await box.add(category); // Save to Hive box
      emit(CategoryLoaded());
    } catch (e) {
      emit(CategoryError(e.toString())); // Emit an error state if needed
    }
  }

  Future<void> removeCategory(int index) async {
    try {
      categories.remove(listCat[index]);
      await box.deleteAt(index); // Remove from Hive box
      emit(CategoryLoaded());
    } catch (e) {
      emit(CategoryError(e.toString())); // Emit an error state if needed
    }
  }

  Future<void> closeApp() async {
    await Hive.close();
  }
}