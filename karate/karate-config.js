function setup(){
    var config = {
        baseUrl: "https://academy-lembra-compras.herokuapp.com/login"
    }

    karate.configure('logPrettyRequest',true);
    karate.configure('logPrettyResponse',true);

    return config;
}