import 'package:bmi/shared/components/components.dart';
import 'package:bmi/shared/cubit/news_cubit/cubit.dart';
import 'package:bmi/shared/cubit/news_cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                searchField(
                  controller: searchController,
                  onSubmit: (value) {
                    cubit.searchArticles(searchController.text);
                  },
                  type: TextInputType.text,
                  prefixIcon: Icon(Icons.search),
                  label: "search",
                  ontap: () {},
                  validate: (value) {
                    if (value.isEmpty) {
                      return "Search Must not be Empty";
                    }
                  },
                ),
                SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: ConditionalBuilder(
                          condition: NewsCubit.get(context).search.isNotEmpty,
                          builder: (context) => Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) => articelBuilder(
                                        NewsCubit.get(context).search[index],
                                        context),
                                    itemCount: NewsCubit.get(context).search.length,
                                  ),
                            ],
                          ),
                          fallback: (context) => Center(
                                child:Container(),
                              ))),
                ),
              ],
            ),
          );
        });
  }
}
        


/*
{
"meta":{"found":20799686,"returned":3,"limit":3,"page":1},"data":[{"uuid":"1ad8a4cf-5483-4a6f-af74-cf7c1ced7b60","title":"West Ham 0-0 Everton (9 Nov, 2024) Game Analysis","description":"Expert recap and game analysis of the West Ham United vs. Everton English Premier League game from 9 November 2024 on ESPN (UK).","keywords":"","snippet":"Everton ground out a point in a 0-0 draw at West Ham United on Saturday in a Premier League game in which neither side did enough to justify three points.\n\nA di...","url":"https://www.espn.co.uk/football/report/_/gameId/704384","image_url":"https://a.espncdn.com/combiner/i?img=/i/espn/misc_logos/500/soccer.png","language":"en","published_at":"2024-11-09T22:20:10.000000Z","source":"espn.co.uk","categories":["sports"],"relevance_score":null,"locale":"gb"},{"uuid":"3156ac72-dad2-4bca-a73d-a789a2c0cdaa","title":"Wolves 2-0 Southampton (9 Nov, 2024) Game Analysis","description":"Expert recap and game analysis of the Wolverhampton Wanderers vs. Southampton English Premier League game from 9 November 2024 on ESPN (UK).","keywords":"","snippet":"*\n\nWolves celebrate 2-0 win and first clean sheet of the season\n\n*\n\nSouthampton stay winless away, slump to nine defeats in 11 games\n\n*\n\nSaints controlled posse...","url":"https://www.espn.co.uk/football/report/_/gameId/704385","image_url":"https://a.espncdn.com/combiner/i?img=/i/espn/misc_logos/500/soccer.png","language":"en","published_at":"2024-11-09T22:20:10.000000Z","source":"espn.co.uk","categories":["sports"],"relevance_score":null,"locale":"gb"},{"uuid":"af69d130-05a4-4925-b29e-26ec8594fee3","title":"Fulham 2-0 C Palace (9 Nov, 2024) Game Analysis","description":"Expert recap and game analysis of the Fulham vs. Crystal Palace English Premier League game from 9 November 2024 on ESPN (UK).","keywords":"","snippet":"Fulham beat Crystal Palace 2-0 at Selhurst Park in the Premier League on Saturday with goals from Emile Smith Rowe and Harry Wilson while the home side were red...","url":"https://www.espn.co.uk/football/report/_/gameId/704379","image_url":"https://a.espncdn.com/combiner/i?img=/i/espn/misc_logos/500/soccer.png","language":"en","published_at":"2024-11-09T22:20:10.000000Z","source":"espn.co.uk","categories":["sports"],"relevance_score":null,"locale":"gb"}]}

 */