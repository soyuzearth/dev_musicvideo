import React from 'react';

const Hero = () => {
    return (
        <section className="pt-32 pb-16 sm:pt-40 sm:pb-24 text-center px-4">
            <div className="max-w-4xl mx-auto space-y-6">
                <h2 className="text-4xl sm:text-5xl md:text-6xl font-bold text-gray-900 leading-tight tracking-tight">
                    신나는 도전, <br className="sm:hidden" />
                    <span className="text-primary">내가 주도하는</span> 디지털 라이프
                </h2>
                <p className="text-lg sm:text-2xl text-gray-600 font-normal leading-relaxed break-keep">
                    초등 AI 뮤직비디오 만들기 프로젝트:<br />
                    아이들의 상상이 음악과 영상이 되다
                </p>
            </div>
        </section>
    );
};

export default Hero;
