import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/logic/bloc/character_bloc.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/grid_list_view_character.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/grid_list_view_icon.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/search_character_card.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../internal/helpers/error_helper.dart';

class CharacterSearchScreen extends StatefulWidget {
  const CharacterSearchScreen({super.key});

  @override
  State<CharacterSearchScreen> createState() => _CharacterSearchScreenState();
}

class _CharacterSearchScreenState extends State<CharacterSearchScreen> {
  // bool isActive = true;
  final CharacterBloc characterBloc = CharacterBloc();
  int widgetIndex = 0;
  List<Widget> listofPages = [];
  ValueNotifier<bool> isListView = ValueNotifier(true);

  void onItemSelected(int index) {
    widgetIndex = index;
  }

  @override
  void initState() {
    characterBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const SearchCharacterCardWidget(),
            Expanded(
              child: BlocConsumer(
                bloc: characterBloc,
                listener: (context, state) {
                  if (state is CharacterErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(getErrors(state.error))));
                  }
                },
                builder: (context, state) {
                  print('state  === $state');
                  if (state is CharacterLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  }

                  if (state is CharacterFetchedState) {
                    return ValueListenableBuilder(
                        valueListenable: isListView,
                        builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 24.h, bottom: 8.h),
                                child: GridViewListViewIconCard(
                                  isListView: isListView,
                                  totalCount: state.characterModelList.length,
                                  // в идеале переделать на общий count
                                ),
                              ),
                              Expanded(
                                child: GridListViewCharacter(
                                  isListView: isListView,
                                  chatacterModelList: state.characterModelList,
                                ),
                              ),
                            ],
                          );
                        });
                  }

                  if (state is CharacterErrorState) {
                    return Center(
                      child: IconButton(
                        onPressed: () {
                          characterBloc.add(GetCharacterEvent());
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
