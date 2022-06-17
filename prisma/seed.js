const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function seed() {
  const createdStudent = await prisma.Students.create({
    data: {
      name: "Bobby",
      tags: {
        connectOrCreate: {
          where: {
            content: "cool",
          },
          create: {
            content: "cool",
          },
        },
      },
    },
  });

  process.exit(0);
}

seed()
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
  })
  .finally(() => process.exit(1));
