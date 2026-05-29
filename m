Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6F3EAC8D;
	Fri, 29 May 2026 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065691; cv=fail; b=XZfRZXBAEJsIAkWZMSbTJLGg24R6Mfwbk0M8GDOj3D33bRMdsKIGCYsnAC+4dUFC7Lb+QfyZvoF/n8a2SmDjQOKLFJkTIUwA0DBs3kchVpI2yY4DTl3W2FX6mEpnYyw4s86+zWb0k55ERnETE5W0QoL/lTglKfCokrY6h0bBWFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065691; c=relaxed/simple;
	bh=LcZSrXnx35VwV6+oyTlyy5cwYjfhk4fdNSHAAgFnBBE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dx2it8U21iq0n3CsfiJiuO5GrIv2dUNXsWg+DKfkyHdNtmYTuNUbTPMVx/XwFZE94aG1gHiXxh20+J+ULJxupKfn3iqJItQVMDF/wNbbZhYIqMBxIj/9Cmfeist2SoIdBSO9g5i/QfwFDrotHAe1B7MiCdToXwq99YqyyoXj0vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gVyPYfU/; arc=fail smtp.client-ip=52.101.46.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gVyPYfU/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXbEmaFXSer/xgL6rOqTzf5A4jv1o6xPv5oHxCMZ4pEbuj8wOTGhspkCoEHG8bG0dFy6xkP+sVhZalRSC385jhHwR0aEnMHwUCckKYHZ/terRQT/SIe7Hn6LBo9jqGbaBBNIUtLtsW4bAArYTRNl9ij6Y0DlUEVmkvL40hs6iTJ6Hl/at2+Em7ro8mlciZfoRE+s82fHkBexikZbVuBho1SrfYmd694FAPdCVL1VHndj8FW2VLUhjFIcbl4DInXAnWhYvPVeRqYx3OQIP55U6/T7+vCTJt138GFAOZq7hux6FGOFl1J1lYwx9aEmH968cMo4LjgAT5+h9qSIOGzQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zqn0VJnup1amED1+jIaovwqBpHKsTnCzDBWIf1qhL8=;
 b=C0IlbIXX6O8GKD3f/J6Rp18WYprZ/muj5VZHY8Lx0/VnF+AvjAfhuAyYxhDzykgpKzkx80F7ErcafoTtTxP6jy40zCOHugBU/+QUT9p9gJwE/Any63Do8+zjVH2uM+xa+wucbng7WUc6YDnSJJZlc8Zb+Rh8t/oLW6TvU1h976DnyO/CJW4ZNg3zcmIxFz9ZhYN3ne/d+f2o84OhZeN3kVgAu23ZqVL5AopI2Fqk5ar0LgYQ39odw9KyhbejYM/9SBS7Wlc+eK7N/qkM9NZ6sMj8atyy72GzLXYzvFwOOOGffyU4UBjMeUzt2GrEsiOowkCVQ1qLCI99Jfd8lzzQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zqn0VJnup1amED1+jIaovwqBpHKsTnCzDBWIf1qhL8=;
 b=gVyPYfU/fV9rystSQ7bMqQmUJd1yEpm1D02BKcmESUkCtOPii3XQjkZKZyVqVq7b9i8US+LlL3tL14y0c5VRkzKkhQQIUkBGQLFogzdVsWSCkRp5uKQfTpuf9pc4q/IqB66DuaT2VtT/gIWYH5jV3UGeDs4Mj1L/23jy+twuigY=
Received: from MN2PR06CA0030.namprd06.prod.outlook.com (2603:10b6:208:23d::35)
 by IA0PR10MB7229.namprd10.prod.outlook.com (2603:10b6:208:400::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 14:41:26 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::40) by MN2PR06CA0030.outlook.office365.com
 (2603:10b6:208:23d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 14:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:41:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:41:25 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 09:41:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 09:41:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TEfPH0160677;
	Fri, 29 May 2026 09:41:25 -0500
Date: Fri, 29 May 2026 09:41:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
	Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Add I2C2
 pinctrl
Message-ID: <20260529144125.vs4bds6nwimqdnbg@quack>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515-beagley-cameras-v2-1-f6acb66c9995@ideasonboard.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|IA0PR10MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 53da760f-afa5-49f4-fb4f-08debd905cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|82310400026|376014|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eRFRYcvd7b2flm/v364ZuhLm/+zUqZM+AJvI5Kcdku4WHl6Tr+kAc0VXqPimmI8mTzFSEuohmcmkIkDPHN9J3POZf6KTG1JMc7Mhu5/6ekslGc3G3sIapvgc9pzVV6uN1z3Xc/vvtC6wBMdse3Z9N+FqZg8qKtZMybcjd0yOYKO6zwOTtkDHvKfC4oMdaKNGBOe/li6gxHl5ieNrQ5IAafk483WpyRtB/tZw3k7slKx1Rjrm4q9tUhMEGch/dYwi8oXdYd7edxUVzuhXHgNGKqobdhPNS4hVRtQzNMPOVI54kaAoMcP5ROD6r/5hu4aZ5yGqNjm7zBs7uiSD2iPlP732LkiNFCuzX7QcV7xljqmrumK6uHrnwveOsiqh0m8TE9KJquxZkQZsYiE4tsM7ZLCtJXQ/ka8jumr60h+4RJ3g2ujpJmLVsw4B7+TUgPSzBRR7iLuA1LiiOT0SruIKChZITrk3qO0/a5kq6AFbfcydrs4PsI0sDIaBG+WgJTRPX/QEsw93og86bRfcOY3i91Z2/mBQXDZ8TYwwQg4B1JpjJ6QVoImDoYOVvCUbnknvEIhPDl4pG6VnwKk8cR7/7fytK+jSsZFGSl6X1W2P5IP9ciCH4q0M4c9Z4XOI7c/rmNEFjrN0+syBYdqMDRNYA0N+81oRLKBPq2x70w/jXq3qPBlUaFf0NRDATHSr3rsXMEZ3t0q5A0GGsOxxHQXu4VIiQnyG0EI0AcJj1tLs41c=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(82310400026)(376014)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q4zE8lXVRgK7tHUfeV+x7gNJ1ORRxAxjgRYPJAlfxn6v+DBv/iulzZXeL+7y6eREPJiwcksJ3AKjxHuX0/BeQjo9tmexPwoydUQq5gJgcAIsWauAld0YSXIbygi0JifPmiAj0HbbTb1Bcc9Ny1bMmtFiUKfX19y5X3WdEZZgIN3ifU9KSWHxNMBAXPVCviOl1v01Gy2lY+vLkIaF7VtgQi7tqvCxTlonZEn+bdYEbAc0+gOb0GRU2WFzzQJ+7b4ymgHA3bhZvstt3JQSD2VW7+lQueuDz31WteXjZn1mM7EPNsig84mmA02WoUpEbag4cZf2Up6INKsIXhlcFAzEbY6T4YeL3tzR0gxj9tWoUKW5aFRbJ4m7HN1FybHI0HKob+ZLUpm+7xqUfdHg8dzOjc0FExZBSK/YCjqoJuRX6qc5hphEEHtjZMqyGELwTLpj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:41:26.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53da760f-afa5-49f4-fb4f-08debd905cef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7229

On 06:46-20260515, Jai Luthra wrote:
> I2C2 is used by camera sensor devices connected on the 22-pin CSI0
> connector. Add the pin definition here so I2C2 may be enabled by the
> camera sensor overlays.
> 

Why not add the i2c node here with the pinmux, but disable the node with a
comment that this should be enabled for camera sensors? A bit confused
seeing a orphan pinmux node. but i dont see any other function for the
i2c2 other than support the camera sensors :)


> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> index 5255e04b9ac7..06aac02a7668 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
>  		bootph-all;
>  	};
>  
> +	main_i2c2_pins_default: main-i2c2-default-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
> +			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
> +		>;
> +	};
> +
>  	main_uart0_pins_default: main-uart0-default-pins {
>  		pinctrl-single,pins = <
>  			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
> 
> -- 
> 2.54.0
> 
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
