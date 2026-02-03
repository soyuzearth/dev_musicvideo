import React from 'react';
import { Link } from 'react-router-dom';

const ProjectCard = ({ project }) => {
    // Determine Thumbnail URL
    let thumbnailUrl = project.thumbnail_url;

    if (!thumbnailUrl && project.resource_type === 'youtube') {
        // Fallback for YouTube if no explicit thumbnail provided
        thumbnailUrl = `https://img.youtube.com/vi/${project.resource_url}/maxresdefault.jpg`;
    } else if (!thumbnailUrl) {
        // Generic fallback for non-YouTube items without thumbnail
        thumbnailUrl = 'https://via.placeholder.com/640x360?text=No+Thumbnail';
    }

    const isYouTube = project.resource_type === 'youtube';
    const isAiStorybook = project.category_id === 2;

    return (
        <Link
            to={`/project/${project.id}`}
            className="group block rounded-2xl p-3 bg-white hover:bg-white/80 transition-all duration-500 hover:shadow-xl hover:-translate-y-1"
        >
            <div className={`relative ${isAiStorybook ? 'aspect-[3/4]' : 'aspect-video'} rounded-xl overflow-hidden shadow-sm group-hover:shadow-md transition-all duration-500`}>
                <img
                    src={thumbnailUrl}
                    alt={project.title}
                    className="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-700 ease-out will-change-transform"
                    onError={(e) => {
                        if (isYouTube) {
                            e.target.onerror = null;
                            e.target.src = `https://img.youtube.com/vi/${project.resource_url}/hqdefault.jpg`;
                        } else {
                            e.target.src = 'https://via.placeholder.com/640x360?text=Error+Loading+Image';
                        }
                    }}
                />

                {/* Overlay & Icon */}
                <div className="absolute inset-0 bg-black/20 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center backdrop-blur-sm">
                    <div className="w-14 h-14 bg-white/90 backdrop-blur-md rounded-full flex items-center justify-center shadow-lg transform scale-50 group-hover:scale-100 transition-all duration-300 delay-100">
                        {isYouTube ? (
                            <svg className="w-6 h-6 text-primary ml-1" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M8 5v14l11-7z" />
                            </svg>
                        ) : (
                            <svg className="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                        )}
                    </div>
                </div>
            </div>

            <div className="mt-4 px-1">
                {project.author && (
                    <p className="text-xs font-semibold text-primary/80 mb-1 uppercase tracking-wider">{project.author}</p>
                )}
                <h3 className="text-lg font-bold text-gray-900 group-hover:text-primary transition-colors duration-300 leading-tight line-clamp-2">
                    {project.title}
                </h3>
            </div>
        </Link>
    );
};

export default ProjectCard;
