import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import path from 'path';
import { fileURLToPath } from 'url';

// Load environment variables
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.join(__dirname, '../.env') });

// Use Service Role Key for write access
const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('Missing Supabase URL or Service Role Key');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function migrateAuthors() {
    console.log('Starting Author Migration...');

    // 1. Fetch AI Storybooks (Category 2)
    const { data: projects, error } = await supabase
        .from('projects')
        .select('*')
        .eq('category_id', 2);

    if (error) {
        console.error('Error fetching projects:', error);
        return;
    }

    console.log(`Found ${projects.length} projects in Category 2.`);

    for (const project of projects) {
        const fullTitle = project.title;
        // Expected format: "Author Name 작가님 - Book Title" or similar
        // We look for the separator " - "
        const parts = fullTitle.split(' - ');

        if (parts.length >= 2) {
            let authorName = parts[0].trim();
            const bookTitle = parts.slice(1).join(' - ').trim(); // Join remaining parts in case title has hyphens

            // Optional: Clean '작가님' from author name if desired, or keep it.
            // User requested "Author Name" separate. "유문주 작가님" -> "유문주" might be cleaner ui, 
            // but "유문주 작가님" is also fine. Let's keep it as is based on the split, 
            // OR remove '작가님' for a cleaner data field?
            // "유문주 작가님" -> "유문주"
            const cleanedAuthor = authorName.replace(' 작가님', '').replace(' 작가', '').trim();

            console.log(`Migrating ID ${project.id}: "${fullTitle}" -> Author: "${cleanedAuthor}", Title: "${bookTitle}"`);

            const { error: updateError } = await supabase
                .from('projects')
                .update({
                    title: bookTitle,
                    author: cleanedAuthor
                })
                .eq('id', project.id);

            if (updateError) {
                console.error(`Error updating project ${project.id}:`, updateError);
            } else {
                console.log(`Successfully updated project ${project.id}`);
            }
        } else {
            console.log(`Skipping ID ${project.id}: Title format does not match "Author - Title" (${fullTitle})`);
        }
    }

    console.log('Migration complete.');
}

migrateAuthors();
