import React from 'react';
import { Routes, Route, Link,useNavigate } from 'react-router-dom';
import MoneyTransfer from '../MoneyTransfer/MoneyTransfer'; // Adjust the path based on your folder structure
import AccountDetails from '../account-details/AccountDetails';   
import backgroundImage from '../../../assets/background.jpg';
import logo from '../../../assets/AegisLogo.png';
import settingsIcon from '../../../assets/settings0.svg';
import logoutIcon from '../../../assets/logout-020.svg';
import helpIcon from '../../../assets/help0.svg';
import transIcon from '../../../assets/wallet-020.svg';
import loansIcon from '../../../assets/bag-040.svg';
import accountIcon from '../../../assets/bank-note-010.svg';
import moneyIcon from '../../../assets/currency-coin-dollar0.svg';
import homeIcon from '../../../assets/home-010.svg';
import back from '../../../assets/back.jpg';
import './UserDashboard.css';
import Home from '../home/Home';
import Cookies from 'js-cookie';
import Loans from '../loans/Loans';
import ApplyLoan from '../loans/ApplyLoan';
import LoanDetails from '../loans/LoanDetails';
import LoanPayment from '../loans/LoanPayment';
import TransactionHistory from '../transaction-history/transaction';
import Settings from "../../user/settings/Settings";
import { logout } from '../../../services/auth';
const UserDashboard = () => {
  const navigate = useNavigate();
  const handleLogout = async () => {
    const token = Cookies.get('refreshToken');
   
    if (!token) {
      console.error('\\Logout error: Missing token//');
      return;
    }
    try {
      console.log('Logout request PROCESSING');
      await logout(token);
      navigate('/login');
      
    } catch (error) {
      console.error('Logout error:', error.response ? error.response.data : error.message);
      console.error('Token:', token);
    }
  };

  const menuItems = [
    { path: '/dashboard/home', img: homeIcon, label: 'Home' },
    { path: '/dashboard/account-details', img: accountIcon, label: 'Account Details' },
    { path: '/dashboard/money-transfer', img: moneyIcon, label: 'Money Transfer' },
    { path: '/dashboard/transaction-history', img: transIcon, label: 'Transaction History' },
    { path: '/dashboard/loans/apply', img: loansIcon, label: 'Loans' },
    
  ];
  const footItems=[
    { path: '/dashboard/settings', img: settingsIcon , label: 'Settings' },
    { path: '/dashboard/help', img: helpIcon , label: 'Help' },
    { path: '/dashboard/logout', img: logoutIcon , label: 'Logout' },
  ]
  const userName = Cookies.get('username');
  const userRole =  Cookies.get('role');
  console.log(userRole);
  return (
    <div className="user-dashboard">
      {/* Sidebar Section */}
      <div className="sidebar">
        <img className="logo" src={logo} alt="Aegis Bank Logo" />
        <nav className="menu">
          {menuItems.map((item, index) => (
            <Link key={index} to={item.path} className="menu-item" aria-label={item.label}>
              <img src={item.img} alt={item.label} />
              <span>{item.label}</span>
            </Link>
          ))}
        </nav>
    <div className="sidebar-footer">
     <nav>
    {footItems.map((item, index) => {
      if (item.label === 'Logout') {
        // Special case for Logout to handle onClick
        return (
          <div
            key={index}
            className="menu-item"
            onClick={handleLogout}
            role="button"
            aria-label={item.label}
            tabIndex={0}
          >
            <img src={item.img} alt={item.label} />
            <span>{item.label}</span>
          </div>
        );
      }
      return (
        <Link key={index} to={item.path} className="menu-item" aria-label={item.label}>
          <img src={item.img} alt={item.label} />
          <span>{item.label}</span>
        </Link>
      );
    })}
  </nav>
</div>

      </div>

      

      {/* Main Content Section */}
      <div className="main-content" backgroundImage={back} >
        <div className="heading">
          <p> Welcome, {userName}.(Customer)</p>
        </div>
        <img className="background" src={backgroundImage} alt="Background" />
        <Routes>
          <Route path="/money-transfer" element={<MoneyTransfer />} />
          <Route path='/home' element={<Home/>} />
          <Route path="/account-details" element={<AccountDetails/>}/>
          <Route path="loans" element={<Loans/>}>
            <Route path="apply" element={<ApplyLoan/>}/>
            <Route path="payment" element={<LoanPayment/>}/>
            <Route path="details" element={<LoanDetails/>}/>
          </Route>
          <Route path="transaction-history" element={<TransactionHistory/>}/>
          <Route path="settings" element={<Settings />} />
        </Routes>
      </div>
    </div>
  );
};

export default UserDashboard;
