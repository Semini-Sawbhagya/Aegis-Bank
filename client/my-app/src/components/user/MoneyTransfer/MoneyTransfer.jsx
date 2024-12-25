import React, { useState, useEffect } from "react";
import { Card, Typography, TextField, Autocomplete, FormControl, Button, Grid2 as Grid, Box } from "@mui/material";
import Cookies from 'js-cookie';
import api from '../../../services/api';
import './MoneyTransfer.css';

function MoneyTransfer() {
    const [selectedAccount, setSelectedAccount] = useState("");
    const [userAccounts, setUserAccounts] = useState([]);
    const [beneficiaryName, setBeneficiaryName] = useState("");
    const [bankName, setBankName] = useState("Seychells Trust Bank");
    const [beneficiaryAccount, setBeneficiaryAccount] = useState("");
    const [transferAmount, setTransferAmount] = useState("");
    const [description, setDescription] = useState("");
    const [transferDetails, setTransferDetails] = useState(null);

    const customerId = Cookies.get('customerId');

    useEffect(() => {
        const submitTransfer = async () => {
            if (transferDetails) {
                try {
                    const response = await api.post("/money_transfer", transferDetails);
                    if (response.status === 200) {
                        console.log("Money transfer successful");
                        alert("Money transfer successful");
                    } else {
                        console.error("Money transfer failed");
                        alert("Money transfer failed");
                    }
                } catch (error) {
                    console.error("Error during transfer:", error);
                    alert("Error during transfer", error);
                }
            }
        };

        submitTransfer();
        handleReset();
    }, [transferDetails]);

    useEffect(() => {
        const fetchUserAccounts = async () => {
          try {
            const response = await api.get('/user_accounts', { params: { customerId } });
            const data = Array.isArray(response.data) ? response.data : [];
            setUserAccounts(data);
          } catch (error) {
            console.error('Error fetching accounts:', error);
            setUserAccounts([]);
          }
        };

        fetchUserAccounts();
    }, []);

    const handleSubmit = (e) => {
        e.preventDefault();
        setTransferDetails({
            selectedAccount,
            beneficiaryAccount,
            transferAmount,
            description,
        });
    };

    const handleReset = () => {
        setSelectedAccount("");
        setBeneficiaryAccount("");
        setTransferAmount("");
        setDescription("");
        setBeneficiaryName("");
        setBankName("Seychells Trust Bank");
    };

    return (
        <Box className="MoneyTransfer" p={3}>
            <Card className="card-container" sx={{  margin: 'auto', padding: '20px', borderRadius: 4, marginTop: '1 px', alignItems:'center', backgroundColor:"#083010", height:"80vh", width:"70vh"}}>
                <Typography variant="h6" gutterBottom color="white">
                    Money Transfer
                </Typography>
                <form onSubmit={handleSubmit}>
    <Box display="flex" flexDirection="column" gap={2} >
        <Autocomplete
            options={userAccounts}
            getOptionLabel={(option) => option.account_number}
            value={userAccounts.find(account => account.account_number === selectedAccount) || null}
            onChange={(event, newValue) => {
                setSelectedAccount(newValue ? newValue.account_number : '');
            }}
            renderInput={(params) => (
                <TextField 
                    {...params} 
                    label="Select Account" 
                    fullWidth 
                    required 
                />
            )}
        />
        <TextField 
            label="Beneficiary Name"
            value={beneficiaryName}
            onChange={(e) => setBeneficiaryName(e.target.value)}
            fullWidth
            required
            InputProps={{
                sx: { height: 40 },
            }}
            
        />
        <TextField
            label="Beneficiary Account"
            value={beneficiaryAccount}
            onChange={(e) => setBeneficiaryAccount(e.target.value)}
            fullWidth
            required
            InputProps={{
                sx: { height: 40 },
            }}
        />
        <TextField
            label="Beneficiary Bank"
            value={bankName}
            InputProps={{
                readOnly: true,
                sx: { height: 40 },

            }}
            fullWidth
           
        />
        <TextField
            label="Currency"
            value="$"
            InputProps={{
                readOnly: true,
                sx: { height: 40 },
            }}
            fullWidth
        />
        <TextField
            type="number"
            label="Transfer Amount"
            value={transferAmount}
            onChange={(e) => setTransferAmount(e.target.value)}
            fullWidth
            required
            InputProps={{
                sx: { height: 40 },
            }}
        />
        <TextField
            label="Description"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            multiline
            rows={4}
            fullWidth
            required
            InputProps={{
                sx: { height: 80 },
            }}
        />
        <Box display="flex" justifyContent="space-between">
    <Button
        variant="outlined"
        onClick={handleReset}
        fullWidth
        sx={{
            marginRight: 1,
            backgroundColor: "#614915",
            color: "white",
            '&:hover': {
                backgroundColor: "#614915", // Hover effect
            },
        }}
    >
        Reset
    </Button>
    <Button
        type="submit"
        variant="contained"
        fullWidth
        sx={{
            marginLeft: 1,
            backgroundColor: "#614915",
            color: "white",
            '&:hover': {
                backgroundColor: "#614915", // Hover effect
            },
        }}
    >
        Submit
    </Button>
</Box>

    </Box>
</form>
</Card>
        </Box>
    );
}

export default MoneyTransfer;
