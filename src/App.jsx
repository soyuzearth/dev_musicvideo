import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/Header';
import Footer from './components/Footer';
import ContactModal from './components/ContactModal';
import Home from './pages/Home';
import ProjectDetail from './pages/ProjectDetail';

function App() {
  const [isContactModalOpen, setIsContactModalOpen] = useState(false);

  return (
    <Router>
      <div className="min-h-screen bg-white font-sans antialiased text-gray-900 flex flex-col">
        <Header onContactClick={() => setIsContactModalOpen(true)} />
        <main className="flex-grow">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/project/:id" element={<ProjectDetail />} />
          </Routes>
        </main>
        <Footer onContactClick={() => setIsContactModalOpen(true)} />

        <ContactModal
          isOpen={isContactModalOpen}
          onClose={() => setIsContactModalOpen(false)}
        />
      </div>
    </Router>
  );
}

export default App;
