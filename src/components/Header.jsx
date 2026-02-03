import { Link } from 'react-router-dom';

const Header = () => {
    return (
        <header className="fixed top-0 w-full bg-white/80 backdrop-blur-md border-b border-gray-100 z-50">
            <div className="container-main flex items-center justify-between h-16">
                <Link to="/" className="text-xl font-semibold text-gray-900 tracking-tight hover:text-primary transition-colors">
                    디지털라이프코칭센터
                </Link>
                <a
                    href="mailto:contact@example.com" // Placeholder
                    className="bg-primary hover:bg-primary-hover text-white px-5 py-2.5 rounded-full text-sm font-medium transition-colors shadow-sm"
                >
                    강의 섭외 문의하기
                </a>
            </div>
        </header>
    );
};

export default Header;
