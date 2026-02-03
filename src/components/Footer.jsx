import React from 'react';

const Footer = () => {
    return (
        <footer className="bg-gray-50 border-t border-gray-100 py-16">
            <div className="container-main flex flex-col items-center justify-center text-center space-y-8">
                <div>
                    <h2 className="text-2xl font-bold text-gray-900 mb-2">디지털라이프코칭센터</h2>
                    <p className="text-gray-500 font-medium">대표 김미진</p>
                </div>

                <p className="text-gray-600 max-w-md mx-auto leading-relaxed">
                    AI 활용 교육 전문가로서<br className="sm:hidden" />
                    수강생들의 디지털 창작 경험을 돕습니다.
                </p>

                <a
                    href="mailto:contact@example.com"
                    className="inline-block bg-white text-gray-900 border border-gray-200 px-8 py-3 rounded-full font-semibold hover:border-primary hover:text-primary hover:bg-gray-50 transition-all duration-300 shadow-sm"
                >
                    강의 섭외 문의하기
                </a>

                <p className="text-sm text-gray-400 mt-12">
                    &copy; {new Date().getFullYear()} Digital Life Coaching Center. All rights reserved.
                </p>
            </div>
        </footer>
    );
};

export default Footer;
