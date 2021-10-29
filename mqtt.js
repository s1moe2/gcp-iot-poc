const fs = require('fs')
const mqtt = require('mqtt')
const jwt = require('jsonwebtoken')
const config = require('./config.json')
const topic = `/devices/${config.device}/events`
const host = 'mqtt.googleapis.com'
const port = '8883'
const clientID = `projects/${config.projectID}/locations/${config.region}/registries/${config.registryID}/devices/${config.device}`

const topics = {
    pub: `/devices/${config.device}/events`,
    sub: `/devices/${config.device}/config`
}

const key = fs.readFileSync('./certs/rasp_private.pem')

const username = 'unused';
const password = jwt.sign({
    aud: config.projectID,
    exp: Math.floor(Date.now()/1000 + 24*3600),
}, key, { algorithm: 'RS256' });

const options = {
    host: host,
    port: port,
    clientId: clientID,
    username: username,
    password: password,
    protocol: 'mqtts',
    secureProtocol: 'TLSv1_2_method',
};

const client = mqtt.connect(options);


function start() {
    client.on('connect', (ok) => {
        console.log('[connect}', ok)
    })
    
    client.on('message', (topic, message) => {
        console.log(`[message] ${topic}: ${message}`)
    })
    
    client.on('error', (err) => {
        console.log('error', err)
    })
    
    client.subscribe(topics.sub)
}

module.exports = {
    start,
    topic,
    client,
}