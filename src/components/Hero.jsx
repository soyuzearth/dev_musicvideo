import React from 'react';

const Hero = () => {
    return (
        <section className="relative w-full min-h-[70vh] flex items-center justify-center overflow-hidden bg-mesh-light animate-gradient-mesh py-20">
            {/* Abstract Shapes for Depth */}
            <div className="absolute top-0 left-0 w-[500px] h-[500px] bg-purple-200/40 rounded-full mix-blend-multiply filter blur-3xl animate-blob"></div>
            <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-yellow-100/30 rounded-full mix-blend-multiply filter blur-3xl animate-blob animation-delay-200"></div>
            <div className="absolute -bottom-32 left-1/4 w-[600px] h-[600px] bg-pink-100/30 rounded-full mix-blend-multiply filter blur-3xl animate-blob animation-delay-400"></div>

            <div className="relative z-10 max-w-5xl mx-auto px-6 text-center space-y-12 animate-fade-in-up">
                {/* Main Heading */}
                <div className="space-y-4">
                    <h2 className="text-4xl sm:text-6xl md:text-7xl font-black text-gray-900 leading-[1.1] tracking-tight">
                        AI로 설계하는 <br />
                        <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary via-purple-600 to-indigo-600">
                            나의 다음 단계
                        </span>
                    </h2>

                    {/* Process Flow */}
                    <div className="flex flex-wrap items-center justify-center gap-4 mt-8">
                        <span className="px-6 py-2 glass-card rounded-full text-lg font-bold text-gray-700">Learning</span>
                        <span className="text-gray-400 font-light text-2xl">→</span>
                        <span className="px-6 py-2 glass-card rounded-full text-lg font-bold text-primary">Project</span>
                        <span className="text-gray-400 font-light text-2xl">→</span>
                        <span className="px-6 py-2 glass-card rounded-full text-lg font-bold text-purple-600">Outcome</span>
                    </div>
                </div>

                {/* Description */}
                <div className="space-y-3">
                    <p className="text-xl sm:text-xl text-gray-500 font-medium leading-relaxed max-w-2xl mx-auto">
                        각자의 목적에 맞는 <span className="text-gray-900 border-b-2 border-primary/30">실전 AI 프로젝트 교육</span>
                    </p>
                </div>
            </div>
        </section>
    );
};

export default Hero;
