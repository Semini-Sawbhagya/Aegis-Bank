import React, { useEffect, useRef, useState } from 'react';
import { Card, CardContent, Typography, Box } from '@mui/material';
import { account_summary } from '../../../../services/auth';
import Cookies from 'js-cookie';
import Chart from 'chart.js/auto';

export default function DoughnutChart() {
  const [data, setData] = useState([]); // State to hold chart data
  const [totalAmount, setTotalAmount] = useState(0); // State to hold total amount
  const [error, setError] = useState(null); // State to handle errors
  const [loading, setLoading] = useState(true); // State to handle loading
  const chartRef = useRef(null); // Ref to store the canvas DOM element
  const chartInstanceRef = useRef(null); // Ref to store the Chart.js instance
  const userId = Cookies.get('userId');
  const customerId = Cookies.get('customerId');

  // Fetch data from API
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await account_summary(customerId);
        const fetchedData = response.data;

        if (fetchedData.length > 0) {
          const accountData = fetchedData[0];
          const transformedData = [
            { value: parseFloat(accountData.savings_account_balance) || 0, label: 'Savings' },
            { value: parseFloat(accountData.checking_account_balance) || 0, label: 'Checking' },
            { value: parseFloat(accountData.fd_balance) || 0, label: 'Fixed Deposits' },
          ];

          setData(transformedData);

          // Calculate total amount
          const total = transformedData.reduce((sum, entry) => sum + entry.value, 0);
          setTotalAmount(total);
        }
      } catch (err) {
        console.error('Error fetching data:', err);
        setError('Failed to fetch data');
      } finally {
        setLoading(false);
      }
    };

    if (customerId) {
      fetchData();
    }
  }, [customerId]);

  // Render Chart.js Doughnut Chart
  useEffect(() => {
    if (data.length > 0 && chartRef.current) {
      const labels = data.map(entry => entry.label);
      const values = data.map(entry => entry.value);
      const colors = ["rgb(107, 25, 58)", "rgb(51, 16, 61)", "rgb(173, 180, 29)"];

      // Destroy the existing chart if it exists
      if (chartInstanceRef.current) {
        chartInstanceRef.current.destroy();
      }

      // Create a new chart instance
      chartInstanceRef.current = new Chart(chartRef.current, {
        type: 'doughnut',
        data: {
          labels,
          datasets: [
            {
              data: values,
              backgroundColor: colors,
              hoverOffset: 4,
            },
          ],
        },
        options: {
          plugins: {
            tooltip: {
              callbacks: {
                label: function (tooltipItem) {
                  return `${tooltipItem.label}: $${tooltipItem.raw.toFixed(2)}`;
                },
              },
            },
          },
        },
      });
    }

    // Cleanup on component unmount
    return () => {
      if (chartInstanceRef.current) {
        chartInstanceRef.current.destroy();
        chartInstanceRef.current = null;
      }
    };
  }, [data]);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>{error}</div>;

  return (
    <Card className="shadow" sx={{ maxWidth: '50%', margin: 'auto', padding: '5px', borderRadius: 4, marginTop: '5px', maxHeight:"20%",backgroundColor:"#083010", color:"white"}}>
      <CardContent>
        <Typography variant="h6" textAlign={'center'}>
          Account Summary
        </Typography>
        <Box display="flex" alignItems="center" justifyContent="space-between" sx={{ marginTop: 2 }}>
          {/* Doughnut Chart */}
          <Box flex={1}>
            <canvas ref={chartRef} className="p-10" />
          </Box>

          {/* Transformed Data List */}
          <Box flex={1} sx={{ marginLeft: 4 }}>
            <Typography variant="subtitle1" textAlign="center" fontWeight="bold">
              Account Details
            </Typography>
            <Typography variant="body1" align="left" sx={{ marginTop: 2 }}>
              Total Amount: ${totalAmount.toFixed(2)}
            </Typography>
            {data.map((item, index) => (
              <Typography key={index} variant="body1" sx={{ marginTop: 1 }}>
                {item.label}: ${item.value.toFixed(2)}
              </Typography>
              
            ))}
          </Box>
        </Box>
        
      </CardContent>
    </Card>
  );
}
