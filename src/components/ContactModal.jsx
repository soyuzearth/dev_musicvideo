import React from 'react';

const ContactModal = ({ isOpen, onClose }) => {
    if (!isOpen) return null;

    return (
        <div
            className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/40 backdrop-blur-sm animate-fade-in"
            onClick={onClose}
        >
            <div
                className="glass w-full max-w-md rounded-3xl p-8 text-center space-y-6 shadow-2xl animate-scale-in"
                onClick={(e) => e.stopPropagation()}
            >
                <div className="space-y-2">
                    <p className="text-primary font-bold tracking-wider text-sm uppercase">Contact Information</p>
                    <h2 className="text-2xl font-bold text-gray-900">강남 서호와 숲 속의 말</h2>
                </div>

                <div className="space-y-4 py-4 border-y border-gray-100/50">
                    <div className="space-y-1">
                        <p className="text-gray-500 text-sm">전문 분야</p>
                        <p className="text-gray-900 font-semibold leading-relaxed">
                            AI 역량강화 / 디지털 역량 /<br />
                            미디어리터러시 전문
                        </p>
                    </div>

                    <div className="space-y-1">
                        <p className="text-gray-500 text-sm">업체 및 대표</p>
                        <p className="text-gray-900 font-semibold">
                            디지털라이프코칭센터 | 김미진 대표
                        </p>
                    </div>

                    <div className="space-y-1 pt-2">
                        <a
                            href="mailto:soyuz.earth@gmail.com"
                            className="block text-primary hover:underline font-medium"
                        >
                            soyuz.earth@gmail.com
                        </a>
                        <p className="text-gray-900 font-bold text-xl mt-1">
                            010-9083-2827
                        </p>
                    </div>
                </div>

                <button
                    onClick={onClose}
                    className="w-full bg-primary hover:bg-primary-hover text-white py-4 rounded-2xl font-bold transition-all duration-300 shadow-lg hover:shadow-primary/20"
                >
                    확인
                </button>
            </div>
        </div>
    );
};

export default ContactModal;
