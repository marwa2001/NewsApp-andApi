import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cash_helper.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';

import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/settinges.dart';
import '../../modules/sports/spots_screen.dart';
import '../../network/remot/dio.dart';

class NewsCubit extends Cubit<NewsStates>{


  NewsCubit(): super(NewIntialState()) ;
  static NewsCubit get(context)=> BlocProvider.of(context);
int currentIndex=0;
List<BottomNavigationBarItem>bottomItems=[
  BottomNavigationBarItem(
      icon: Icon(
        Icons.business_sharp

      ),
    label: 'business'
  ),
  BottomNavigationBarItem(
      icon: Icon(
          Icons.science_outlined

      ),
      label: 'science'
  ),
  BottomNavigationBarItem(
      icon: Icon(
          Icons.sports

      ),
      label: 'sport'
  ),

];
List <Widget>screen =[
  BusinessScreen(),
  ScienceScreen(),
  SportScreen(),

];
void changeBottomNavBar(int index){
  currentIndex=index;
  emit(BottomNavigationstate());
}
List<dynamic> business=[];
void getBusiness(){
  emit(NewsLoadingstate());
  DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
      'country':'us',
      'category':'business',
      'apiKey':'9a711dd016b243fb971e1783a9650902',
    },).then((value) {
    print(value?.data['articles'][0]['title'].toString());
    business =value?.data['articles'];
    print(business[0]['title']);
    emit(NewsGetBusinessSuccesstate());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBuesinessErorrstate(error.toString()));
  });
}
List<dynamic> science=[];
  void getScinece(){
    emit(NewsLoadingScincestate());

      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'9a711dd016b243fb971e1783a9650902',
        },).then((value) {
        print(value?.data['articles'][0]['title'].toString());
        science =value?.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScinceSuccesstate());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScinceErorrstate(error.toString()));
      });



  }

  List<dynamic> sport=[];
  void getSport(){
    emit(NewsLoadingSportstate());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'sport',
        'apiKey':'9a711dd016b243fb971e1783a9650902',
      },).then((value) {
      print(value?.data['articles'][0]['title'].toString());
      sport =value?.data['articles'];
      print(sport[0]['title']);
      emit(NewsGetSportSuccesstate());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportErorrstate(error.toString()));
    });
  }
  List<dynamic> Search=[];
  Future<void> getSearch(String value) async {
    emit(NewsLoadingSearchstate());
    DioHelper.getData(
       url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'9a711dd016b243fb971e1783a9650902',
      },).then((value) {
      print(value?.data['articles'][0]['title'].toString());
      Search =value?.data['articles'];
      print(Search[0]['title']);
      emit(NewsGetSearchSuccesstate());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErorrstate(error.toString()));
    });
  }
  bool isDark =false;

  void ChangeAppMode(){

    isDark=!isDark;
    CashHelper.putData(Key: 'isDark', Value: isDark).then((value) {
      emit(AppChangeModeState());
    });


}
}

