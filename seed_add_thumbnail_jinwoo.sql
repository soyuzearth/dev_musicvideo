-- Update thumbnail and preview for '용감한 진우와 불꽃 괴물'
UPDATE projects 
SET 
    thumbnail_url = 'https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/Thumbnail_BraveJinwoo.png',
    resource_type = 'pdf',
    resource_url = 'https://udlyikebeopjnewoydbg.supabase.co/storage/v1/object/public/ebooks/ebooks_mijin_firemonster.pdf'
WHERE 
    title = '용감한 진우와 불꽃 괴물' AND author = '김미진';
