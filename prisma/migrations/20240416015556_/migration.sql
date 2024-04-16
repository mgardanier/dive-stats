/*
  Warnings:

  - The values [Active,Expired] on the enum `Status` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `updattedAt` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the `Widget` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[title,status]` on the table `Order` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `updatedAt` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
ALTER TYPE "Status" ADD VALUE 'ACTIVE';
ALTER TYPE "Status" ADD VALUE 'EXPIRED';
ALTER TYPE "Status"DROP VALUE 'Active';
ALTER TYPE "Status"DROP VALUE 'Expired';

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_warId_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "updattedAt";
ALTER TABLE "Order" ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;
ALTER TABLE "Order" ALTER COLUMN "warId" DROP NOT NULL;

-- DropTable
DROP TABLE "Widget";

-- CreateIndex
CREATE UNIQUE INDEX "Order_title_status_key" ON "Order"("title", "status");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_warId_fkey" FOREIGN KEY ("warId") REFERENCES "War"("id") ON DELETE SET NULL ON UPDATE CASCADE;
