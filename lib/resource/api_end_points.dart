class ApiEndPoints {
  final String baseUrl = "https://api.digitalskylink.in";

  //login
  final String loginGenerateOtp = "/user/user-generate-otp";
  final String loginVerifyOtp = "/user/login";

  final String getMasterProductList =
      "/master-product/vendor-business"; // without token
  final String vendorsSearch = '/vendor-business'; // withought token
}
