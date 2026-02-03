-- Fix Data for '용감한 진우와 불꽃 괴물'
-- Force update resource_type to 'heyzine'

DO $$
BEGIN
  -- Check if the project exists
  IF EXISTS (SELECT 1 FROM projects WHERE title = '용감한 진우와 불꽃 괴물' AND author = '김미진') THEN
      
      -- Update resource_type to heyzine
      UPDATE projects 
      SET resource_type = 'heyzine' 
      WHERE title = '용감한 진우와 불꽃 괴물' AND author = '김미진';
      
      RAISE NOTICE 'Updated resource_type to heyzine for project: 용감한 진우와 불꽃 괴물';
      
  ELSE
      RAISE NOTICE 'Project not found!';
  END IF;
  
  -- Verify the result
  -- We can't select * directly in a DO block to output, but we can verify via notice or simple select afterwards.
END $$;

-- Verify
SELECT id, title, author, resource_type FROM projects WHERE title = '용감한 진우와 불꽃 괴물';
