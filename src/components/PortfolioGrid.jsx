import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import ProjectCard from './ProjectCard';
import { supabase } from '../supabaseClient';

const PortfolioGrid = () => {
    const [categories, setCategories] = useState([]);
    const [projects, setProjects] = useState([]);
    const [selectedCategoryId, setSelectedCategoryId] = useState(null);
    const [loading, setLoading] = useState(true);
    const location = useLocation();

    useEffect(() => {
        fetchData();
    }, []);

    async function fetchData() {
        try {
            setLoading(true);

            // 1. Fetch Categories
            const { data: categoriesData, error: categoriesError } = await supabase
                .from('categories')
                .select('*')
                .order('id', { ascending: true }); // Or order by some other field

            if (categoriesError) throw categoriesError;

            setCategories(categoriesData);

            // Check URL for category
            const searchParams = new URLSearchParams(location.search);
            const categoryParam = searchParams.get('category');
            const targetCategoryId = categoryParam ? parseInt(categoryParam) : null;

            if (targetCategoryId && categoriesData.some(c => c.id === targetCategoryId)) {
                setSelectedCategoryId(targetCategoryId);
            } else if (categoriesData.length > 0) {
                setSelectedCategoryId(categoriesData[0].id);
            }

            // 2. Fetch Projects
            const { data: projectsData, error: projectsError } = await supabase
                .from('projects')
                .select('*')
                .order('created_at', { ascending: false });

            if (projectsError) throw projectsError;

            setProjects(projectsData);

        } catch (error) {
            console.error('Error fetching data:', error);
        } finally {
            setLoading(false);
        }
    }

    const filteredProjects = projects.filter(
        (project) => project.category_id === selectedCategoryId
    );

    if (loading) {
        return (
            <div className="flex items-center justify-center min-h-[40vh]">
                <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin"></div>
            </div>
        );
    }

    return (
        <section className="container-main pb-32 space-y-16">
            {/* Glass Category Tabs */}
            <div className="sticky top-20 z-30 flex flex-wrap items-center justify-center gap-3 py-4">
                <div className="glass px-2 py-2 rounded-full flex flex-wrap justify-center gap-2">
                    {categories.map((category) => (
                        <button
                            key={category.id}
                            onClick={() => setSelectedCategoryId(category.id)}
                            className={`
                  px-6 py-2.5 rounded-full text-base font-medium transition-all duration-300 relative
                  ${selectedCategoryId === category.id
                                    ? 'bg-primary text-white shadow-lg'
                                    : 'text-gray-600 hover:text-gray-900 hover:bg-white/50'}
                `}
                        >
                            {category.name}
                        </button>
                    ))}
                </div>
            </div>

            {/* Grid */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                {filteredProjects.map((project, index) => (
                    <div key={project.id} className="animate-fade-in-up" style={{ animationDelay: `${index * 100}ms` }}>
                        <ProjectCard project={project} />
                    </div>
                ))}
            </div>

            {/* Empty State */}
            {filteredProjects.length === 0 && (
                <div className="text-center py-20 bg-gray-50 rounded-3xl border border-gray-100">
                    <p className="text-gray-500 text-lg">이 카테고리에는 아직 등록된 프로젝트가 없습니다.</p>
                </div>
            )}
        </section>
    );
};

export default PortfolioGrid;
