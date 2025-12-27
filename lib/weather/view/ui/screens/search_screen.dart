import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/theme/app_text_style.dart';
import 'package:weather_now/weather/cubits/weather_search/weather_search_cubit.dart';
import 'package:weather_now/weather/view/ui/widgets/custom_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

@override
class _SearchScreenState extends State<SearchScreen> {
  void initState() {
    super.initState();
  }

  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2196F3), // Blue color at the top
                Color(0xFF90CAF9), // Lighter blue color at the bottom
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CustomFormField(controller: searchController),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform search action
                    context.read<WeatherSearchCubit>().searchCity(
                      searchController.text,
                    );
                  }
                },
                child: Text('Search', style: AppTextStyle.poppinsWhite20),
              ),
              SizedBox(height: 30.h),
              BlocConsumer<WeatherSearchCubit, WeatherSearchState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is WeatherSearchEmpty) {
                    return Align(
                      heightFactor: 10.5.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Please enter a city name',
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
                        itemCount: state.results.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  state.results[index]['name'],
                                  style: AppTextStyle.poppinsWhite20.copyWith(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                subtitle: Text(
                                  '${state.results[index]['state']}, ${state.results[index]['country']}',
                                  style: AppTextStyle.quicksandWhite20.copyWith(
                                    fontSize: 14.sp,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),

                              Divider(thickness: 1, color: Colors.grey),
                            ],
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
    );
  }
}
