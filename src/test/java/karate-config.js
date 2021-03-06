function fn() {
  karate.configure('connectTimeout', 120000);
  karate.configure('readTimeout', 120000);
  karate.configure('report', { showLog: false, showAllSteps: true });

  // Faker for randomized data
  var faker = Java.type('com.github.javafaker.Faker');

  // Default value for URL config
  var config = {
    baseUrl: "https://graphql-teas-endpoint.netlify.app/",
  };
  config.faker = faker;
  return config;
}