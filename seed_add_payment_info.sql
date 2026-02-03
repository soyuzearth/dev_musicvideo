-- Add payment and PDF columns to projects table
DO $$
BEGIN
    -- Add pdf_url column if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'projects' AND column_name = 'pdf_url') THEN
        ALTER TABLE projects ADD COLUMN pdf_url TEXT;
    END IF;

    -- Add payapp_url column if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'projects' AND column_name = 'payapp_url') THEN
        ALTER TABLE projects ADD COLUMN payapp_url TEXT;
    END IF;

    RAISE NOTICE 'Added pdf_url and payapp_url columns to projects table.';

    -- Update '용감한 진우와 불꽃 괴물' project with the URLs
    -- PayApp URL is a placeholder currently
    UPDATE projects 
    SET 
        pdf_url = 'https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/ebooks_mijin_firemonster.pdf',
        payapp_url = 'https://www.payapp.kr/L/z47LU4'
    WHERE 
        title = '용감한 진우와 불꽃 괴물' AND author = '김미진';

    RAISE NOTICE 'Updated project with PDF and PayApp URLs.';

END $$;
