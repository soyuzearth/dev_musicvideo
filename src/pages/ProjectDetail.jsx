import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { supabase } from '../supabaseClient';

const ProjectDetail = () => {
    const { id } = useParams();
    const [project, setProject] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchProject();
        window.scrollTo(0, 0);
    }, [id]);

    async function fetchProject() {
        try {
            setLoading(true);
            const { data, error } = await supabase
                .from('projects')
                .select('*')
                .eq('id', id)
                .single();

            if (error) throw error;
            setProject(data);
        } catch (error) {
            console.error('Error:', error);
        } finally {
            setLoading(false);
        }
    }

    const renderContent = () => {
        if (!project) return null;

        if (project.resource_type === 'youtube') {
            return (
                <div className="aspect-video w-full rounded-2xl overflow-hidden shadow-lg bg-black">
                    <iframe
                        className="w-full h-full"
                        src={`https://www.youtube.com/embed/${project.resource_url}?autoplay=1&rel=0`}
                        title={project.title}
                        frameBorder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowFullScreen
                    ></iframe>
                </div>
            );
        }

        if (project.resource_type === 'canva') {
            return (
                <div className="space-y-6">
                    <div className="max-w-2xl mx-auto w-full aspect-[4/3] rounded-2xl overflow-hidden shadow-lg bg-gray-100 flex items-center justify-center relative">
                        <iframe
                            loading="lazy"
                            className="absolute w-full h-full top-0 left-0 border-none p-0 m-0"
                            src={`${project.resource_url}${project.resource_url.includes('?') ? '&' : '?'}embed`}
                            title={project.title}
                            allowFullScreen="allowfullscreen"
                            allow="fullscreen">
                        </iframe>
                    </div>

                    {project.purchase_url && (
                        <div className="flex justify-center">
                            <a
                                href={project.purchase_url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="group relative inline-flex items-center justify-center px-8 py-4 text-lg font-bold text-white transition-all duration-200 bg-indigo-600 font-pj rounded-xl focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-600 hover:bg-indigo-700 active:scale-95 shadow-lg hover:shadow-xl"
                            >
                                <span className="mr-2">📚</span>
                                교보문고에서 종이책 구매하기
                                <svg className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                                </svg>
                            </a>
                        </div>
                    )}
                </div>
            );
        }

        const isHeyzine = project.resource_type === 'heyzine' || (project.resource_url && project.resource_url.includes('heyzine.com'));

        if (isHeyzine) {
            return (
                <div className="space-y-6">
                    <div className="max-w-4xl mx-auto w-full aspect-[16/10] rounded-2xl overflow-hidden shadow-lg bg-gray-100 relative">
                        <iframe
                            className="w-full h-full border-none"
                            src={project.resource_url}
                            title={project.title}
                            allowFullScreen="allowfullscreen"
                            allow="fullscreen"
                        ></iframe>
                    </div>

                    {project.purchase_url && (
                        <div className="flex justify-center">
                            <a
                                href={project.purchase_url}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="group relative inline-flex items-center justify-center px-8 py-4 text-lg font-bold text-white transition-all duration-200 bg-indigo-600 font-pj rounded-xl focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-600 hover:bg-indigo-700 active:scale-95 shadow-lg hover:shadow-xl"
                            >
                                <span className="mr-2">📚</span>
                                교보문고에서 종이책 구매하기
                                <svg className="ml-2 w-5 h-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
                                </svg>
                            </a>
                        </div>
                    )}
                </div>
            );
        }

        // Default / External Link
        return (
            <div className="p-8 bg-gray-50 rounded-2xl text-center border border-gray-200">
                <h3 className="text-lg font-semibold text-gray-900 mb-4">외부 링크 프로젝트</h3>
                <a
                    href={project.resource_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-primary hover:bg-primary-hover transition-colors"
                >
                    프로젝트 보러가기
                    <svg className="ml-2 -mr-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                </a>
            </div>
        );
    };

    if (loading) {
        return (
            <div className="min-h-[60vh] flex flex-col items-center justify-center pt-20">
                <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin"></div>
            </div>
        );
    }

    if (!project) {
        return (
            <div className="min-h-[60vh] flex flex-col items-center justify-center space-y-4 pt-20">
                <h2 className="text-2xl font-bold text-gray-900">프로젝트를 찾을 수 없습니다.</h2>
                <Link to="/" className="text-primary hover:underline">홈으로 돌아가기</Link>
            </div>
        );
    }

    return (
        <div className="pt-24 pb-16 min-h-screen container-main">
            <div className="max-w-4xl mx-auto space-y-8">
                {/* Navigation */}
                <div className="flex items-center space-x-2 text-sm text-gray-500 mb-4">
                    <Link to={`/?category=${project.category_id}`} className="hover:text-primary transition-colors flex items-center">
                        <svg className="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                        </svg>
                        목록으로
                    </Link>
                    <span>/</span>
                    <span className="text-gray-900 font-medium truncate">{project.title}</span>
                </div>

                {/* Content Renderer */}
                {renderContent()}

                {/* Description */}
                <div className="space-y-6">
                    <h1 className="text-3xl md:text-4xl font-bold text-gray-900">{project.title}</h1>
                    <div className="prose prose-lg text-gray-600 max-w-none leading-relaxed whitespace-pre-line">
                        {project.description}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ProjectDetail;
