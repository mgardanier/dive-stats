import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

const getOrders = async (req, res) => {
    const order = await prisma.order.findFirst({
        where: {
            status: 'ACTIVE'
        }
    })
}


module.export = {
    getOrders
}