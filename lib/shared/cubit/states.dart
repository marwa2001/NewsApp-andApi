abstract class NewsStates {}
class NewIntialState extends NewsStates{}
class BottomNavigationstate extends NewsStates{}
class NewsGetBusinessSuccesstate extends NewsStates{}
class NewsLoadingstate extends NewsStates{}
class NewsGetBuesinessErorrstate extends NewsStates{
  final String error;
  NewsGetBuesinessErorrstate(this.error);
}
class NewsGetSportSuccesstate extends NewsStates{}
class NewsLoadingSportstate extends NewsStates{}
class NewsGetSportErorrstate extends NewsStates{
  final String error;
  NewsGetSportErorrstate(this.error);
}
class NewsGetScinceSuccesstate extends NewsStates{}
class NewsLoadingScincestate extends NewsStates{}
class NewsGetScinceErorrstate extends NewsStates{
  final String error;
  NewsGetScinceErorrstate(this.error)  ;
}
class AppChangeModeState extends NewsStates{}
class NewsGetSearchSuccesstate extends NewsStates{}
class NewsLoadingSearchstate extends NewsStates{}
class NewsGetSearchErorrstate extends NewsStates{
  final String error;
  NewsGetSearchErorrstate(this.error)  ;
}