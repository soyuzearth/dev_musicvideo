import React from 'react';

const Hero = () => {
    return (
        <section className="relative w-full min-h-[85vh] flex items-center justify-center overflow-hidden bg-mesh-light animate-gradient-mesh py-24">
            {/* Professional Background Accents */}
            <div className="absolute top-0 left-0 w-[600px] h-[600px] bg-indigo-100/30 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animate-duration-[12s]"></div>
            <div className="absolute top-0 right-0 w-[600px] h-[600px] bg-purple-100/20 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animation-delay-200 animate-duration-[15s]"></div>
            <div className="absolute -bottom-48 left-1/3 w-[700px] h-[700px] bg-blue-100/20 rounded-full mix-blend-multiply filter blur-[120px] animate-blob animation-delay-400 animate-duration-[18s]"></div>

            <div className="relative z-10 max-w-6xl mx-auto px-6 text-center space-y-16 animate-fade-in-up">
                {/* Main Heading Group */}
                <div className="space-y-6">
                    <div className="space-y-4">
                        <p className="text-lg sm:text-xl font-bold text-primary tracking-widest uppercase mb-2">
                            Applied AI Workshop
                        </p>
                        <h2 className="text-xl sm:text-2xl md:text-3xl font-medium text-gray-600 tracking-tight">
                            AI로 결과를 만드는 실습 중심 프로젝트 교육
                        </h2>
                        <h1 className="text-3xl sm:text-4xl md:text-5xl font-[900] text-gray-900 leading-[1.2] tracking-tight">
                            <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary via-purple-600 to-indigo-600">
                                조직과 개인의 AI 활용 역량을 높이는<br className="hidden md:block" /> 워크숍 프로그램
                            </span>
                        </h1>
                    </div>

                    {/* Refined Process Flow */}
                    <div className="flex flex-wrap items-center justify-center gap-3 sm:gap-6 mt-8">
                        <div className="flex items-center gap-3">
                            <span className="px-5 py-2 glass-card rounded-2xl text-sm font-bold text-gray-500 shadow-sm uppercase tracking-wider">Learning</span>
                            <span className="text-gray-300">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14m-7-7 7 7-7 7" /></svg>
                            </span>
                        </div>
                        <div className="flex items-center gap-3">
                            <span className="px-5 py-2 glass-card rounded-2xl text-sm font-bold text-primary shadow-md ring-1 ring-primary/10 uppercase tracking-wider">Project</span>
                            <span className="text-gray-300">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><path d="M5 12h14m-7-7 7 7-7 7" /></svg>
                            </span>
                        </div>
                        <div>
                            <span className="px-5 py-2 glass-card rounded-2xl text-sm font-bold text-purple-600 shadow-sm uppercase tracking-wider">Outcome</span>
                        </div>
                    </div>
                </div>

                {/* Audience Specific Content - Refined Grid */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-6 max-w-5xl mx-auto pt-8 border-t border-gray-200/50">
                    <div className="glass-card p-6 rounded-3xl text-left space-y-3 group hover:border-primary/30 transition-all duration-500">
                        <p className="text-sm font-bold text-primary flex items-center gap-2">
                            <span className="w-1.5 h-1.5 bg-primary rounded-full"></span>
                            학생 · 청소년
                        </p>
                        <p className="text-gray-900 font-bold text-lg leading-snug">
                            미래 역량을 키우는<br />AI 프로젝트 수업
                        </p>
                    </div>

                    <div className="glass-card p-6 rounded-3xl text-left space-y-3 group hover:border-purple-500/30 transition-all duration-500">
                        <p className="text-sm font-bold text-purple-600 flex items-center gap-2">
                            <span className="w-1.5 h-1.5 bg-purple-600 rounded-full"></span>
                            교사 · 공공기관
                        </p>
                        <p className="text-gray-900 font-bold text-lg leading-snug">
                            실습 중심의<br />AI 리터러시 연수
                        </p>
                    </div>

                    <div className="glass-card p-6 rounded-3xl text-left space-y-3 group hover:border-indigo-600/30 transition-all duration-500">
                        <p className="text-sm font-bold text-indigo-600 flex items-center gap-2">
                            <span className="w-1.5 h-1.5 bg-indigo-600 rounded-full"></span>
                            기업 · 재직자 · 인재
                        </p>
                        <p className="text-gray-900 font-bold text-lg leading-snug">
                            다음 커리어를 위한<br />AI 활용 교육
                        </p>
                    </div>
                </div>
            </div>
        </section>
    );
};

export default Hero;
