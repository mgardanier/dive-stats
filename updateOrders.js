const axios = require('axios')
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const headers = {
    'X-Application-Contact': 'mgardanier@gmail.com',
    'User-Agent': 'divers-stats/0.0.1',
    'Content-Type': 'application/json'
}
const config = {
    baseURL: 'https://helldivers-2-dotnet.fly.dev',
    url: '/raw/api/v2/Assignment/War/801',
    method: 'get',
    headers: headers
}

axios.request(config).then(async function (res) {
    let data = []
    const statusCode = res.statusCode

    console.log(res.status)
    if (res.status !== 200) {
        return
    }
    debugger
    console.log(res.data[0].expiresIn)
    const order = res.data[0]
    expiration = new Date(new Date().getTime() + (1000 * order.expiresIn))
    console.log(new Date())
    console.log(expiration)
    await prisma.order.create({
        data: {
            title: order.setting.overrideTitle,
            briefing: order.setting.overrideBrief,
            expiration: expiration,
            status: 'ACTIVE'
        }
    }).catch((error) => {
        console.log(`Unable to update order: ${error}`)
    })
})
