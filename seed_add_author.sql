-- Add author column to projects table
ALTER TABLE projects ADD COLUMN IF NOT EXISTS author TEXT;

-- Optional: Comment on column
COMMENT ON COLUMN projects.author IS 'Author name for the project (separated from title for AI Storybooks)';
