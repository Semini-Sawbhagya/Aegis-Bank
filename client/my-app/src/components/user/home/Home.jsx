import React from 'react';
import DoughnutChart from './account-summary/AccountSummary'; // Ensure this is the correct path to your updated component
import TransactionHistory from './recent-transactions/RecentTransactions';

const Home = () => {
  return (
    <div className="home-container">
      {/* Add DoughnutChart component */}
      <DoughnutChart />
      
      {/* Include TransactionHistory component */}
      <TransactionHistory />
    </div>
  );
}

export default Home;
