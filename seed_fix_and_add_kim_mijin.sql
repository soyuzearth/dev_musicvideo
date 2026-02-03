-- Fix Constraint and Insert 'AI 동화책' project for 김미진

DO $$
DECLARE
  v_category_id bigint;
BEGIN
  -- 1. Relax the resource_type constraint to allow 'heyzine'
  -- We assume the constraint name is 'projects_resource_type_check' from the error message.
  
  -- Drop existing constraint if it exists
  BEGIN
      ALTER TABLE projects DROP CONSTRAINT IF EXISTS projects_resource_type_check;
  EXCEPTION
      WHEN OTHERS THEN
          RAISE NOTICE 'Could not drop constraint: %', SQLERRM;
  END;

  -- Add new constraint including 'heyzine' and 'external'
  -- Existing types assumed: 'youtube', 'canva'
  ALTER TABLE projects ADD CONSTRAINT projects_resource_type_check 
  CHECK (resource_type IN ('youtube', 'canva', 'heyzine', 'external'));
  
  RAISE NOTICE 'Updated resource_type constraint.';

  -- 2. Get Category 'AI 동화책'
  SELECT id INTO v_category_id FROM categories WHERE name = 'AI 동화책' LIMIT 1;
  
  IF v_category_id IS NULL THEN
    RAISE EXCEPTION 'Category AI 동화책 not found';
  END IF;

  -- 3. Insert Project
  IF NOT EXISTS (SELECT 1 FROM projects WHERE title = '용감한 진우와 불꽃 괴물' AND author = '김미진') THEN
      INSERT INTO projects (
          category_id, 
          title, 
          author,
          description, 
          resource_type, 
          resource_url, 
          purchase_url,
          thumbnail_url, 
          created_at
      )
      VALUES (
          v_category_id, 
          '용감한 진우와 불꽃 괴물', 
          '김미진',
          'AI 동화책 - 용감한 진우와 불꽃 괴물' || chr(10) || chr(10) || '작가: 김미진', 
          'heyzine', 
          'https://heyzine.com/flip-book/899de4c6cf.html', 
          NULL, 
          NULL, -- No thumbnail provided, UI will use placeholder
          now()
      );
      RAISE NOTICE 'Inserted project for 김미진';
  ELSE
      RAISE NOTICE 'Project for 김미진 already exists';
  END IF;

END $$;
