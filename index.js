const {init, start} = require("@tsmarsh/server");

init("server.json").then((config) => {
    start(config.port, config.graphlettes);
}).catch((err) => {console.error(err)});

