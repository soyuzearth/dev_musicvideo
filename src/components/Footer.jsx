import React from 'react';

const Footer = ({ onContactClick }) => {
    return (
        <footer className="bg-gray-50 border-t border-gray-100 py-16">
            <div className="container-main flex flex-col items-center justify-center text-center space-y-8">
                <div>
                    <h2 className="text-2xl font-bold text-gray-900 mb-2">디지털라이프코칭센터</h2>
                    <p className="text-gray-500 font-medium">대표 김미진</p>
                </div>

                <p className="text-gray-600 max-w-lg mx-auto leading-relaxed">
                    AI 실행력을 높이는 실전 교육 파트너<br />
                    기업 · 공공기관 · 교육기관 맞춤형 AI 워크숍 운영
                </p>

                <a
                    href="https://slashpage.com/aistory"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-block bg-white text-gray-900 border border-gray-200 px-8 py-3 rounded-full font-semibold hover:border-primary hover:text-primary hover:bg-gray-50 transition-all duration-300 shadow-sm"
                >
                    맞춤형 교육 문의하기
                </a>

                <p className="text-sm text-gray-400 mt-12">
                    &copy; {new Date().getFullYear()} Digital Life Coaching Center. All rights reserved.
                </p>
            </div>
        </footer>
    );
};

export default Footer;
