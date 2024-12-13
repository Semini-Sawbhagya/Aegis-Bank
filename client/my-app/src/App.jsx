import React from 'react';
import UserDashboard from './components/user/UserDashboard';
import { BrowserRouter as Router, Route, Routes, Navigate} from 'react-router-dom';

function App() {
  return (
    <div className="App">
    <Router>
        <Routes>
          <Route path="/dashboard/*" element={<UserDashboard />} />
          <Route path="*" element={<Navigate to="/dashboard" />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
