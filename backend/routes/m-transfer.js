import express from "express"
import {maney_transfer} from "../services/MoneyTransfer/money_transfer.js";

const router= express.Router();

router.post('/api/money-transfer', maney_transfer);

export default router;
