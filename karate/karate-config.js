function setup() {
    var config = {
        baseUrl: "https://lista-compras-api.herokuapp.com/api/v1"
    }

    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);

    return config;
}