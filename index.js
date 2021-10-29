const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

rl.on("close", function() {
    console.log("\nterminating...")
    process.exit(0)
})

function prompt() {
    rl.question("Emmit a command: ", (cmd) => {
        console.log(`>>> issued ${cmd}`)
        prompt()
    })
}

prompt()