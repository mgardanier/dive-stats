const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const getOrders = async (req, res) => {
    const order = await prisma.order.findFirst({
        where: {
            status: 'ACTIVE'
        }
    })
    console.log(order)
    res.status(200).json({
        'orders': [order]
    })
}


module.exports = {
    getOrders
}