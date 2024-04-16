/*
  Warnings:

  - You are about to drop the `Order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `War` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_warId_fkey";

-- DropTable
DROP TABLE "Order";

-- DropTable
DROP TABLE "War";

-- CreateTable
CREATE TABLE "Orders" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" STRING,
    "briefing" STRING,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiration" TIMESTAMP(3),
    "warId" UUID,
    "status" "Status",

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wars" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "missionSuccessRate" INT4,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Wars_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Orders_warId_idx" ON "Orders"("warId");

-- CreateIndex
CREATE UNIQUE INDEX "Orders_title_status_key" ON "Orders"("title", "status");

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_warId_fkey" FOREIGN KEY ("warId") REFERENCES "Wars"("id") ON DELETE SET NULL ON UPDATE CASCADE;
