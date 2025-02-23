-- Step 3: Drop the old 'id' column
ALTER TABLE "profile" DROP COLUMN "id";

ALTER TABLE "profile" ADD COLUMN "id" UUID DEFAULT gen_random_uuid();

-- Step 5: Set 'id' as PRIMARY KEY (if needed)
ALTER TABLE "profile" ADD PRIMARY KEY ("id");