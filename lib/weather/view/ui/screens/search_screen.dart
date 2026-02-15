import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/core/theme/app_text_style.dart';
import 'package:weather_now/weather/cubits/weather_search/weather_search_cubit.dart';
import 'package:weather_now/weather/view/ui/widgets/background_container.dart';
import 'package:weather_now/weather/view/ui/widgets/search_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

@override
class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void liveSearch(String query) {
    if (query.isNotEmpty && query.length >= 2) {
      context.read<WeatherSearchCubit>().searchCity(query);
    } else {
      context.read<WeatherSearchCubit>().clearResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Screen'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: BackgroundContainer(
            containerChild: Column(
              children: [
                SizedBox(height: 10.h),
                CustomFormField(controller: searchController),
                SizedBox(height: 20.h),
                SizedBox(height: 30.h),
                BlocConsumer<WeatherSearchCubit, WeatherSearchState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is WeatherSearchIdle) {
                      return Align(
                        heightFactor: 10.5.h,
                        alignment: Alignment.center,
                        child: Text(
                          'Type a city name to search',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.quicksandWhite20.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    }
                    if (state is WeatherSearchLoading) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    if (state is WeatherSearchEmpty) {
                      return Align(
                        heightFactor: 10.5.h,
                        alignment: Alignment.center,
                        child: Text(
                          'Type a correct city name to search',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.quicksandWhite20.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    }
                    if (state is WeatherSearchFailure) {
                      // Handle failure state
                      return Align(
                        heightFactor: 10.5.h,
                        alignment: Alignment.center,
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.quicksandWhite20.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    }
                    if (state is WeatherSearchSuccess) {
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.searchResults.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                final selectedCity = state.searchResults[index];

                                context.pushNamed(
                                  Routes.weatherResultScreen,
                                  arguments: selectedCity,
                                );
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      state.searchResults[index].name!,
                                      style: AppTextStyle.poppinsWhite20
                                          .copyWith(fontSize: 18.sp),
                                    ),
                                    subtitle: Text(
                                      '${state.searchResults[index].region}, ${state.searchResults[index].country}',
                                      style: AppTextStyle.quicksandWhite20
                                          .copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.white30,
                                          ),
                                    ),
                                  ),

                                  Divider(thickness: 1, color: Colors.grey),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
