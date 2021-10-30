const readline = require('readline')
const mqtt = require('./mqtt')


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

rl.on('close', function() {
    console.log('\nterminating...')
    process.exit(0)
})

function prompt() {
    rl.question('Emmit a command: ', (cmd) => {
        console.log(`>>> issued ${cmd}`)
        const payload = JSON.stringify({
            command: cmd,
        });
        mqtt.client.publish(mqtt.topic, payload, { qos: 1 });
        prompt()
    })
}

(() => {
    mqtt.start()
    setTimeout(() => prompt(), 500)
})();