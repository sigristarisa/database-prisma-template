-- CreateTable
CREATE TABLE "Students" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tags" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,

    CONSTRAINT "Tags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_StudentsToTags" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Tags_content_key" ON "Tags"("content");

-- CreateIndex
CREATE UNIQUE INDEX "_StudentsToTags_AB_unique" ON "_StudentsToTags"("A", "B");

-- CreateIndex
CREATE INDEX "_StudentsToTags_B_index" ON "_StudentsToTags"("B");

-- AddForeignKey
ALTER TABLE "_StudentsToTags" ADD CONSTRAINT "_StudentsToTags_A_fkey" FOREIGN KEY ("A") REFERENCES "Students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_StudentsToTags" ADD CONSTRAINT "_StudentsToTags_B_fkey" FOREIGN KEY ("B") REFERENCES "Tags"("id") ON DELETE CASCADE ON UPDATE CASCADE;
