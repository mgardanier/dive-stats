/*
  Warnings:

  - Changed the type of `orderId` on the `Order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Order" DROP COLUMN "orderId";
ALTER TABLE "Order" ADD COLUMN     "orderId" INT4 NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Order_orderId_key" ON "Order"("orderId");
