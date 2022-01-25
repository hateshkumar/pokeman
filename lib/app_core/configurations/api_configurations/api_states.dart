part 'api_response_model.dart';

abstract class ApiResponse {
  ApiResponse(this.apiModel);

  ApiModel? apiModel;
}

class ApiIntial extends ApiResponse {
  ApiIntial(ApiModel apiModel) : super(apiModel);
}

class ApiSuccess extends ApiResponse {
  ApiSuccess(this.apiModel) : super(apiModel);

  @override
  // ignore: overridden_fields
  final ApiModel apiModel;
}

class ApiFail extends ApiResponse {
  ApiFail(this.apiModel) : super(apiModel);

  @override
  // ignore: overridden_fields
  final ApiModel apiModel;
}
