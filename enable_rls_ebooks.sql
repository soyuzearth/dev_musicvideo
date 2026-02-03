-- Enable RLS on storage.objects if not already enabled (it usually is)
ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

-- Create policy to allow public (anon) access to 'ebooks' bucket options
-- We need SELECT permission to generate Signed URLs.
-- Note: Even though this allows SELECT, since the bucket is Private, 
-- direct public URLs won't work. The API (createSignedUrl) will work.

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM pg_policies 
        WHERE schemaname = 'storage' 
        AND tablename = 'objects' 
        AND policyname = 'Allow Public Select for ebooks bucket'
    ) THEN
        CREATE POLICY "Allow Public Select for ebooks bucket"
        ON storage.objects FOR SELECT
        TO public
        USING (bucket_id = 'ebooks');
    END IF;
END $$;
