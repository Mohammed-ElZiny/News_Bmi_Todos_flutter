abstract class NewsState{}


class NewsInitialState extends NewsState{}

class NewsBottomNav extends NewsState{}


class NewsGetBusinessLoadingState extends NewsState{}
class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{
  var Error;
  NewsGetBusinessErrorState(this.Error){
    print(Error.toString());
  }
}


class NewsGetSportsLoadingState extends NewsState{}
class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{
  var Error;
  NewsGetSportsErrorState(this.Error){
    print(Error.toString());
  }
}


class NewsChangeThemeState extends NewsState{}

class NewsGetScienceLoadingState extends NewsState{}
class NewsGetScienceSuccessState extends NewsState{}
class NewsGetScienceErrorState extends NewsState{
  var Error;
  NewsGetScienceErrorState(this.Error){
    print(Error.toString());
  }
}


class NewsGetSearchLoadingState extends NewsState{}
class NewsGetSearchSuccessState extends NewsState{}
class NewsGetSearchErrorState extends NewsState{
  var Error;
  NewsGetSearchErrorState(this.Error){
    print(Error.toString());
  }
}





