import React from 'react';
import { Outlet, Link } from 'react-router-dom';
import { Tabs, Tab, Box } from '@mui/material';

const Reports = () => {
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  return (
    <div className="reports-container">
      <Box sx={{ borderBottom: 1, borderColor: 'divider', display: 'flex', justifyContent: 'center' }}>
        {/* Customizing color of tabs */}
        <Tabs 
          value={value} 
          onChange={handleChange} 
          aria-label="customer tabs"
          centered
          sx={{
            '& .MuiTabs-indicator': {
              backgroundColor: 'rgb(255, 203, 16)', // Change the indicator color
            },
            '& .MuiTab-root': {
              color: 'rgb(255, 203, 16)', // Color for inactive tabs
            },
            '& .Mui-selected': {
              color: 'rgb(255, 203, 16);', // Color for active tab
            },
          }}
        >
          <Tab label="Get Customer Details" component={Link} to="customer_details" />
          <Tab label="Add New Customer" component={Link} to="add_customer" />
        </Tabs>
      </Box>
      <Outlet />
    </div>
  );
};

export default Reports;
