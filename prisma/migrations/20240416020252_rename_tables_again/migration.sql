/*
  Warnings:

  - You are about to drop the `Orders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Wars` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Orders" DROP CONSTRAINT "Orders_warId_fkey";

-- DropTable
DROP TABLE "Orders";

-- DropTable
DROP TABLE "Wars";

-- CreateTable
CREATE TABLE "Order" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" STRING,
    "briefing" STRING,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiration" TIMESTAMP(3),
    "warId" UUID,
    "status" "Status",

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "War" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "missionSuccessRate" INT4,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "War_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Order_warId_idx" ON "Order"("warId");

-- CreateIndex
CREATE UNIQUE INDEX "Order_title_status_key" ON "Order"("title", "status");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_warId_fkey" FOREIGN KEY ("warId") REFERENCES "War"("id") ON DELETE SET NULL ON UPDATE CASCADE;
