import React from 'react';

const Hero = () => {
    return (
        <section className="relative w-full min-h-[60vh] flex items-center justify-center overflow-hidden bg-mesh-light animate-gradient-mesh">
            {/* Abstract Shapes for Depth */}
            <div className="absolute top-0 left-0 w-96 h-96 bg-purple-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob"></div>
            <div className="absolute top-0 right-0 w-96 h-96 bg-yellow-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob animation-delay-200"></div>
            <div className="absolute -bottom-32 left-20 w-96 h-96 bg-pink-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob animation-delay-400"></div>

            <div className="relative glass p-10 sm:p-14 rounded-3xl max-w-4xl mx-4 text-center space-y-8 animate-fade-in-up">
                <h2 className="text-5xl sm:text-6xl md:text-7xl font-extrabold text-gray-900 leading-tight tracking-tight">
                    <span className="block mb-2">신나는 도전,</span>
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary to-purple-600">
                        내가 주도하는
                    </span>{' '}
                    디지털 라이프
                </h2>
                <p className="text-xl sm:text-2xl text-gray-600 font-medium leading-relaxed max-w-2xl mx-auto">
                    초등 AI 뮤직비디오 만들기 프로젝트<br />
                    <span className="text-primary/80">아이들의 상상</span>이 음악과 영상이 되다
                </p>
            </div>
        </section>
    );
};

export default Hero;
