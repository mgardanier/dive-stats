/*
  Warnings:

  - You are about to drop the `Diver` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Status" AS ENUM ('Active', 'Expired');

-- DropTable
DROP TABLE "Diver";

-- CreateTable
CREATE TABLE "Order" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" STRING,
    "briefing" STRING,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updattedAt" TIMESTAMP(3) NOT NULL,
    "expiration" TIMESTAMP(3),
    "warId" UUID NOT NULL,
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

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_warId_fkey" FOREIGN KEY ("warId") REFERENCES "War"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
