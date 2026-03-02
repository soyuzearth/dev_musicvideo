import React from 'react';

const Hero = () => {
    return (
        <section className="relative w-full min-h-[75vh] flex items-center justify-center overflow-hidden bg-mesh-light animate-gradient-mesh py-24">
            {/* Professional Background Accents */}
            <div className="absolute top-0 left-0 w-[600px] h-[600px] bg-indigo-100/30 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animate-duration-[12s]"></div>
            <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-purple-100/20 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animation-delay-200 animate-duration-[15s]"></div>
            <div className="absolute -bottom-48 left-1/3 w-[700px] h-[700px] bg-blue-100/20 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animation-delay-400 animate-duration-[18s]"></div>

            <div className="relative z-10 max-w-6xl mx-auto px-6 text-center space-y-16 animate-fade-in-up">
                {/* Main Heading Group */}
                <div className="space-y-6">
                    <div className="space-y-3">
                        <h2 className="text-2xl sm:text-3xl md:text-4xl font-semibold text-gray-700 tracking-tight">
                            AI로 결과를 만드는 실습 중심 프로젝트 교육
                        </h2>
                        <h1 className="text-4xl sm:text-5xl md:text-6xl font-[900] text-gray-900 leading-[1.15] tracking-tight">
                            <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary via-purple-600 to-indigo-600">
                                조직과 개인의 AI 활용 역량을 높이는<br className="hidden md:block" /> 워크숍 프로그램
                            </span>
                        </h1>
                    </div>

                    {/* Refined Process Flow */}
                    <div className="flex flex-wrap items-center justify-center gap-3 sm:gap-6 mt-10">
                        <div className="flex items-center gap-3">
                            <span className="px-5 py-2 glass-card rounded-2xl text-base font-bold text-gray-600 shadow-sm">Learning</span>
                            <span className="text-gray-300">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14m-7-7 7 7-7 7" /></svg>
                            </span>
                        </div>
                        <div className="flex items-center gap-3">
                            <span className="px-5 py-2 glass-card rounded-2xl text-base font-bold text-primary shadow-md ring-1 ring-primary/10">Project</span>
                            <span className="text-gray-300">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14m-7-7 7 7-7 7" /></svg>
                            </span>
                        </div>
                        <div>
                            <span className="px-5 py-2 glass-card rounded-2xl text-base font-bold text-purple-600 shadow-sm">Outcome</span>
                        </div>
                    </div>
                </div>

                {/* Refined Description Stack */}
                <div className="space-y-4 max-w-3xl mx-auto pt-4 border-t border-gray-200/50">
                    <div className="flex flex-col gap-2">
                        <p className="text-lg sm:text-xl text-gray-500 font-medium leading-relaxed">
                            교육기관과 기업 현장을 아우르는 <span className="text-gray-900 font-bold decoration-primary/30 decoration-4 underline-offset-4 underline">AI 교육</span>
                        </p>
                        <p className="text-lg sm:text-xl text-gray-500 font-medium leading-relaxed">
                            대상과 목적에 맞는 <span className="text-gray-900 font-bold decoration-purple-500/30 decoration-4 underline-offset-4 underline">실전 AI 프로젝트 교육</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Hero;
