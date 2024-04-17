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

    if (res.status !== 200) {
        return
    }
    const order = res.data[0]
    expiration = new Date(new Date().getTime() + (1000 * order.expiresIn))
    const existingOrder = await prisma.order.findUnique({
        where: {
            orderId: order.id32
        }
    })
    if (existingOrder) {
        setPreviousOrderInactive(existingOrder.orderId)
    }
    await prisma.order.create({
        data: {
            orderId: order.id32,
            title: order.setting.overrideTitle,
            briefing: order.setting.overrideBrief,
            expiration: expiration,
            status: 'ACTIVE'
        }
    }).catch((error) => {
        console.log(`Unable to update order: ${error}`)
    })
})

async function setPreviousOrderInactive(orderId) {
    result = await prisma.order.update({
        where: {
            orderId: orderId
        },
        data: {
            status: 'EXPIRED'
        }
    })
    return result
}
