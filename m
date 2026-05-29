Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7E13F1676;
	Fri, 29 May 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066887; cv=fail; b=kbcgHeexETsMwsI6F6J0EQNLbVywQs4aR94QrZ/uxAZ2P50Yu32PshM5SbpdYxpYA2HSDAAMmHEBljLuYUHEnSOmCxE+qYt7outkeztH/l1MbxWdkvmD2rqegTlN0C+4ezBT/oyGah+nvKV7eJf3mNlyjf2S2poEaRVfQnDZ1fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066887; c=relaxed/simple;
	bh=1eoHKTyn4u0ejar37RbLi+I4i45cstC6CEuQMZwiqmA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjM8ap7PkKgucOvvubvKpc9NxeGZ5VZQkV9innW/ackMSfWsdRhTET5T0aILXqslvKL9DGu5I/ik+3tMRa/0TROfXjFlbBpnfR8hj0kRD1+O9Te8dS8paJUgNHQ8S86eWM3+y+jX9aImj21ZlDiArU3XWtFcKed3Xm9PPdcLteI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bLphKM+w; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bLphKM+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL7kF0t7KMXC1JFr6KW8dlojA+HhdhaUxgyKk45H38d1/7Al79J9tvvxpop1/amlkEvXgRrXzm/yRQoOwZhqGAs9y+/9Gb3maRePxlk0JCl0Qs91WaV1hi5muAAzfbmgkzD6VhhhhPMNQL15aUBPnJjeGzvHO6y13m0J5I85ZjlNfaWf2Ym9CEMkulVdT2GWZhazv2GsyJnAlV+ztPJ9FUCm1Zjw0QBjmM86ORH1K0g5Bo6mhdfqd+f9MjpW+DByNbEOA/yaL61oaKMOy4i3mM2XQzp+moSv/XEitzzVC+xQQWt6k8ODGnlMBVXI+hcqk2DTSBOfcp45FyoTBSsjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62b1wl4Om1AjypywBgIY/B2C7sCmGdSRUc0VfpK7BpM=;
 b=lh3VWHuhwudvTYYYL0rj/Mmw9qeRz2Mppfwvhq5jPXB6mT/yMHqAjxaLRUxBK/ORLp35qj8avArTknj3hhSBjG2ZD+x+vxV5XdqNN6YvSpIRIOSh1lCF1jos9Oo8hoL7ZXmCA7h2rJnyISJpugNOtQV/6gMKLpA7Ud67kEa/oZ/PMirkr/NDk7f0//mZnwgoilbtb5MLKYHAz2HGEyi8GKIle0RUVpjk/C2VLyuAHtkTTOlQRdpMTNBtaEPyfE5xdeY3Mui3J5SJj7+ze8KCm4SwsCszEVlSpn+Vcv+H9soYCBT+vjLoFJ2F+B+xoZjhK0r8e+xif0rONAo06+rGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62b1wl4Om1AjypywBgIY/B2C7sCmGdSRUc0VfpK7BpM=;
 b=bLphKM+wUd4T9cc3qrpkr89SDXukkzdIHBrkcHYRHRs4fSYTzHVnZSKejOYNcFWlsx+hg0Gy7cB5qyyxAKk3BbPsq0dminhCiZHN+0VpoELMxFVUdu2JqDE3OTDmnoIeAGJ+v7AgFqTIbofactNpq2tuQ8VbcGEP0+e7mwI83is=
Received: from IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::14)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:01:21 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:558:cafe::35) by IA4P220CA0001.outlook.office365.com
 (2603:10b6:208:558::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 15:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 15:01:20 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 10:01:20 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 29 May
 2026 10:01:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 29 May 2026 10:01:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64TF1JLw3848666;
	Fri, 29 May 2026 10:01:19 -0500
Date: Fri, 29 May 2026 10:01:19 -0500
From: Nishanth Menon <nm@ti.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>,
	Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay
 for IMX219 on CSI0
Message-ID: <20260529150119.dqzzruc7xqliftwp@bullhorn>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
 <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbc83e7-6c59-4e18-c3f5-08debd9324b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	bYtoFT3M3dBEmZBEc0NtnHjerbuSjmQbQs/M79ZuOSbXMh1i2Dic1EEs9mGYMIxm3HFQ5Gs6AkQQ5G4PtE+5MXJuqkqTg6KMytPMon/Cvp6GM81LLcdt6iB0bVI3XGcQlgM4nr/7zr9DTTN91pivDJiCDv3uDJMwlazQPRD6GRQxBBACcDfNFHoVqHV8bA+ncuQf2OFcqo4MSqdrv8t2gZfOfvPE5jzMdWHr7XHxbeL3otiRR+UExsrZbuB5bRyH5xd8uqTNFSkT2HBJKd8VFIPVDfUsUyO5DCR18MXMVXyftVyJLcQuxGMHsRCPL5cLlvo+0XGjmOI6WY8EeGuZqLvJ3j4VW6TmbUYdKN8JzvFkYrg/furB4/FVeHllDrOZj4+McEviBO14YIGAR3iYIFeFJiNoQB22cVasuBHSM+8MlSRRtc0WcUoaJelxSA2P0YvFEEvZgCTh5CpHNX62cT4u6zd6TlGxp8pPb/OSriBamfb+pq+YEmFeLZt6gKQxFthQ/NsgfhTGUpASf5WwoppZEA6ZXXUikmTPCjQmNe2e04iBbojCw6teycdteYxWftkIlUSOttZkycAwFW54KSAGI/GUfCyvdxSrs62wrL1TzfJ0xrBlgIWt8nnl1SHYk7VdQpHD6/qvr8T4g4UkmcXbtYsvZv0Zk+0LftHpu7yw5NiyPfQgFB3jTigaTodiqSw5Lg5yCV601xsB+yCUrTxZI0X+6FzMFaqBUJxOOjE=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9rAEzp1F0SScHMbny4bk6+959Quc9aj8pSYICb/qY3oKWFGawYAAkN5Qnre/m2vSP8JdqUXHcs79G6FUB320jcJ7sXKGl3PcelEDp10TsdquDbLZ/jrJuciFK3tPP4J8DGjVJrP3PZ52OHqXoXRTtwhQUC9Z7Wv/KShkAqFbNbXk1bao1CB/d1LhuxJ/9gvLnqLRG/LMMHKpFFO9aDDSyq+qgZZ486SlkSt78AEbvW4vrlAzVSEPMc25DDw7/3kX7uW9sYv0z6TQt42rXf9Q/MUfZHVcy8Ry7Nd5JF3fHRiKW+S/2rNZPdrke58RxqmG5NMVp6fu91/9qLfh8PZ13R3VXtRwXvkvlOzS6MX1N9SKRGNmXSFbQ/TqYYDb4bO52WxNEvIwUOezTz+m1Buk5EIbHz4qu2Si4WjHVZ5GUop8Duw+qVk16nHBdfg7zv8e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:01:20.5560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbc83e7-6c59-4e18-c3f5-08debd9324b2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812

On 06:46-20260515, Jai Luthra wrote:
> RPi v2 Camera (IMX219) is an 8MP camera that can be used with BeagleY AI
> through the 22-pin CSI-RX connectors. Add a DT overlay to enable use of
> this camera sensor through the CSI0 connector.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile                    |   4 +
>  .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 121 +++++++++++++++++++++

Oh man..
https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/
comes to memory.. Afd - what ever happened to that?

other than the dsi mux, painful to see so much duplication..

Other than that, there is the previous comment (ordering etc, repeated
here). I also suggest people put the url of the board/part that the
overlay is supposed to refer to when creating overlays.. at least, some
sort of canonical link so folks are'nt confused in a future date.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
