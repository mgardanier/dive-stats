/*
  Warnings:

  - A unique constraint covering the columns `[orderId]` on the table `Order` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `orderId` on the `Order` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropIndex
DROP INDEX "Order_title_status_key";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "orderId";
ALTER TABLE "Order" ADD COLUMN     "orderId" INT8 NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Order_orderId_key" ON "Order"("orderId");
