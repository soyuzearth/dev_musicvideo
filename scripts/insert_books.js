
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 1. Load Environment Variables
const envPath = path.resolve(__dirname, '../.env');
let supabaseUrl = '';
let supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl) {
    try {
        if (fs.existsSync(envPath)) {
            const envConfig = fs.readFileSync(envPath, 'utf8');
            envConfig.split('\n').forEach(line => {
                const [key, value] = line.split('=');
                if (key && value) {
                    if (key.trim() === 'VITE_SUPABASE_URL') supabaseUrl = value.trim();
                }
            });
        }
    } catch (e) {
        console.error('Error reading .env:', e);
    }
}

if (!supabaseUrl || !supabaseKey) {
    console.error('Error: Must provide SUPABASE_SERVICE_ROLE_KEY env var');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

// Data with Restored Tokens (from the scraping step)
// Changing /edit to /view
const DATA = [
    {
        section: "2 김보라",
        // Original: https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/edit...
        canva: "https://www.canva.com/design/DAGzETPEis8/ynEnDlTktHaIL9_7zJV2oQ/view?utm_content=DAGzETPEis8&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218331929",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000934357.jpg"
    },
    {
        section: "3 남지혜",
        // Original: https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/edit...
        canva: "https://www.canva.com/design/DAGzEcG4Z9k/A52XIHxNzssdifBhwLKo0A/view?utm_content=DAGzEcG4Z9k&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218608423",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938195.jpg"
    },
    {
        section: "4 도희정",
        // Original: https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/edit
        canva: "https://www.canva.com/design/DAGzEZNFIBQ/1dt1qZy55NixspiRqdquXQ/view?utm_content=DAGzEZNFIBQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218608419",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939277.jpg"
    },
    {
        section: "5 민수정",
        // Original: https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/edit
        canva: "https://www.canva.com/design/DAGzEct11xw/p-NB9gBoDjMNopjVnz-kqw/view?utm_content=DAGzEct11xw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218608450",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938584.jpg"
    },
    {
        section: "6 방정은",
        // Original: https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/edit
        canva: "https://www.canva.com/design/DAGzEca43d0/p_sYiOEsuk018ZbsQ3_weg/view?utm_content=DAGzEca43d0&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218626316",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939192.jpg"
    },
    {
        section: "7 소민정",
        // User Provided Special Link
        canva: "https://www.canva.com/design/DAGzEakvjiM/prvcAx3UulgKdXIaEVM3Fw/view?utm_content=DAGzEakvjiM&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h4a3c3aafaf",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218694094",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000942635.jpg"
    },
    {
        section: "9 유문주",
        // Original: https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/edit
        canva: "https://www.canva.com/design/DAGzEceTjKA/s_5Y3EeaJcYJmIEBBpOZ8A/view?utm_content=DAGzEceTjKA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218608429",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000939253.jpg"
    },
    {
        section: "10 윤다혜",
        // Original: https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/edit
        canva: "https://www.canva.com/design/DAGzEYrHWMM/tXM1sr6UKDiv7wgZ50nwHA/view?utm_content=DAGzEYrHWMM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218608424",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000938409.jpg"
    },
    {
        section: "11 이준민",
        // Original: https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/edit
        canva: "https://www.canva.com/design/DAGzEcYzyvg/0ps9ozQWb60UUkiazv3d8Q/view?utm_content=DAGzEcYzyvg&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218602871",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940051.jpg"
    },
    {
        section: "13 정경하",
        // Original: https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/edit
        canva: "https://www.canva.com/design/DAGzER44pEU/z8x33jUpyBk29vq4O5_m_g/view?utm_content=DAGzER44pEU&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218367892",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000935347.jpg"
    },
    {
        section: "14 최보선",
        // Original: https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/edit
        canva: "https://www.canva.com/design/DAGzEc0K5yo/qzzTwCGnJfk9mdt35YX52g/view?utm_content=DAGzEc0K5yo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton",
        kyobo: "https://product.kyobobook.co.kr/detail/S000218602854",
        thumbnail: "https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/1400000940068.jpg"
    }
];

async function main() {
    console.log('Starting V4 DB update (Restoring Tokens)...');

    for (const item of DATA) {
        console.log(`Processing: ${item.section}`);

        const { data: existing, error: existError } = await supabase
            .from('projects')
            .select('id, title')
            .eq('purchase_url', item.kyobo);

        if (existError) {
            console.error('Error checking existence:', existError);
            continue;
        }

        if (existing && existing.length > 0) {
            const pid = existing[0].id;
            console.log(`  Updating project ID ${pid}: ${existing[0].title}`);
            console.log(`  New URL: ${item.canva.substring(0, 60)}...`);

            const { error: updateError } = await supabase
                .from('projects')
                .update({
                    resource_url: item.canva
                })
                .eq('id', pid);

            if (updateError) console.error('  Update failed:', updateError);
            else console.log('  Update success');
        }
    }

    console.log('Done.');
}

main();
