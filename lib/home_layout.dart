import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remot/dio.dart';
import 'package:news_app/search/search_screen.dart';
import 'package:news_app/shared/commponent.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getScinece()..getSport(),

      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News Today' ,
              style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,

              ),),
              actions: [
                IconButton(
                    onPressed: (){
navigateTo(context, SearchScreen());
                    },
                    icon: Icon(
                        Icons.search)
                ),
                IconButton(
                    onPressed: (){
                      NewsCubit.get(context).ChangeAppMode();

                    },
                    icon: Icon(
                        Icons.dark_mode)
                ),
          IconButton(
          onPressed: (){

          },
          icon: Icon(
          Icons.language),)
              ],
            ),

            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (dynamic index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,

            ),
          );
        } ,

      ),
    );
  }
}
