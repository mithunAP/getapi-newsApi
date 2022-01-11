import 'package:class36m/models/categorymodel.dart';

List<CategoryModel>categoryList(){

  List<CategoryModel>list=<CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();
  //1
  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg";
  categoryModel.categoryName="Madaripur";
  list.add(categoryModel);
  //2
  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://images.template.net/wp-content/uploads/2016/04/16071519/Nature-Wallpaper.jpg";
  categoryModel.categoryName="Kalkini";
  list.add(categoryModel);
//3
  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://images.unsplash.com/photo-1529419412599-7bb870e11810?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80";
  categoryModel.categoryName="Dasher";
  list.add(categoryModel);
//4
  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://wallpapercave.com/wp/wp2611198.jpg";
  categoryModel.categoryName="Mondal";
  list.add(categoryModel);
//5
  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://wallpapercave.com/wp/wp2568544.jpg";
  categoryModel.categoryName="karnopara";
  list.add(categoryModel);



  return list;

}