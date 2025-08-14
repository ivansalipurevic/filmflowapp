import 'package:bloc/bloc.dart';
import 'package:filmflowapp/2_application/sign_up/sign_up_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final String apiKey;

  SignUpCubit({required this.apiKey}) : super(const SignUpState());

  Future<String> createRequestToken() async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key'
      ),
      headers: {
        'Authorization': 'Bearer $apiKey'
      }

    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['request_token'];
    } else {
      throw Exception('Failed to create request token');
    }
  }

  Future<void> signUpWithTMDb() async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));
    try {
      final token = await createRequestToken();
      final url = Uri.parse('https://www.themoviedb.org/authenticate/$token/allow');

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, errorMessage: 'Could not launch URL'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
