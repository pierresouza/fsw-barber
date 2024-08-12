/*
  Warnings:

  - You are about to drop the `BarberShopService` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "BarberShopService" DROP CONSTRAINT "BarberShopService_barberShopId_fkey";

-- DropForeignKey
ALTER TABLE "Booking" DROP CONSTRAINT "Booking_serviceId_fkey";

-- DropTable
DROP TABLE "BarberShopService";

-- CreateTable
CREATE TABLE "barbershopService" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "barberShopId" TEXT NOT NULL,

    CONSTRAINT "barbershopService_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "barbershopService" ADD CONSTRAINT "barbershopService_barberShopId_fkey" FOREIGN KEY ("barberShopId") REFERENCES "BarberShop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Booking" ADD CONSTRAINT "Booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "barbershopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
