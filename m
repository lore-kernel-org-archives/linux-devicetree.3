Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2333A3E92;
	Wed, 29 Apr 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469186; cv=fail; b=QDYLBGkBU1WCSLJPiWOGQ291aDUxlh5Mwn+IWHjGl3uCFEzHTdy/1qAXnXXOvpb5SkEZlYb6776PYahjm4FdgzTTEiFW3eO/2Yh+ZA6rU7uOQdePXZGKiDRBcpXIxbRsb0Kc0r+8bQd69C6K4P40mxnm/s673LSmIITAow9LASA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469186; c=relaxed/simple;
	bh=oIyScM/JwOnQsoSTISs1wjnd/r2/43tzsJepnAAPENc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o/0mM+EvVyOCmYC9x5ByczTxcgkVT/7JEo3IGzvDo5LmXXd47iZKzEi43TMJAIlSgrWqJHx7cEvMrU5dqFOTokagOj3y/F7JHEXq1eC7ZCQi3aYKFo/Dcgq5mnCnPIp79ULVPWUAST2nHs4DpgoLNWExjgcsTr4y3PfcPPtqsYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ekzGvVGi; arc=fail smtp.client-ip=52.101.57.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ekzGvVGi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPtRzSfAQIEWCRB/tA8K1X4v+FYpKpGRTMQ1RXvDkncx3NViAhHVVqN7nZP9N4e3RuOh9ooMYkY5txzOAAXz//IAMF3MBFzPeMB4YynUoaPLFQNCokzYW+RFg757KBspetL3BWWWGoPQBtODeAWuW92aJdOuQ1djvMbH47+3s41Q05eTw/Pu56cAIGuA1kQibfzln1QxZfXVvdSwt7qYqiVnR7A56LGmpsnFs740mWVxN0WzY7aPV2XDiVy+DAsknD97s4BhBS9XcbIpDQqe/YVMj7bRADt09bmyCdPuifFg493Tu9HQPwIGnHn7//I/8th+hDCc3x0wVZY8Ap0uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTz4AqQQgf+OuPXuQPB6yKXZ3jOQG1mYKmtQrnw9XAs=;
 b=yBPCnQw/mvfj3OTlzTmFvpMgdoEvN5pwKffQFDLW3PqwKwOpy40wG/lBNCfGt++Siy8tjmwGAmdu08ARnkItYM5scGijqpfJ23mUFy+Bf3r0iwG/46zRc1UTRmHuHnVWhjrfgvB8nTCIx/BDkWsY/bQTKOVS8UywUN9d+kvebLh8IEAUOdXBC8bSemiyRjCMiOcFqWywky6XITAEPijcIRAppcObx+qTWsj3RgkmmD9qv/bhLkVsIp+ffJzwYk7tvV7HOkkOsnrTFspj8u85Ym7c6mbb6Fth25wkz2av0hsp7ll71SHSaXzi/wxi5V+ttY5RnwN1kvmKCVBL8rskzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTz4AqQQgf+OuPXuQPB6yKXZ3jOQG1mYKmtQrnw9XAs=;
 b=ekzGvVGin1YjuEz4OwwyNoR1lQ73us4aGR9j1LdXX+W6bM9quM30jVPqJcVjuXKcc2FXpC4lKrimKjRA9uQAAsltiwv7KqA/ti87CDtRwcVKqfNuWaShhqfDYZlyEEamZADopt3nIhRdbO/WstRM5BVOJ0xMYYslPskRt0Eh/Xg=
Received: from CH5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:1f1::21)
 by SJ5PPFB3F166793.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 13:26:21 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::94) by CH5PR03CA0023.outlook.office365.com
 (2603:10b6:610:1f1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 13:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 13:26:20 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 08:26:19 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 08:26:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 08:26:19 -0500
Received: from [10.249.134.231] ([10.249.134.231])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TDQFqK3399609;
	Wed, 29 Apr 2026 08:26:15 -0500
Message-ID: <f9a85835-3101-4b88-9db2-bf25ae114501@ti.com>
Date: Wed, 29 Apr 2026 18:56:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to PMIC-B
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, <a-kumar2@ti.com>
References: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SJ5PPFB3F166793:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b2bea7-3165-488c-dd59-08dea5f2e69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HHClesGAzpJMXqyAa9lPZ78c/7Nuqup7NcUnldl3ScEUagFVGxN3KtYcT5gS3dgeYeaGD9Vj6jAxxMxK5Hs/V51kYcGStTgAtOGl+hQ3YZsKk7cOcrtf3kHUi4D1AkzfU4fH7r673ia8kWm7BS+DTpaJR22X70RA9jtm5z1o/mKORsUSdKZNZQppm76/VvlcvM5Mo/dsS0UAbVn+O71GLWiMJhUh7myXgvMbCk2UgYllVzB2LgNpRW+f6RiKUYHhzbqnSzaPVqlXRpocsHWL8vaLZOy8WlF5AloILqbWSfv256o5JWCXXSWQvVTVLwfZts+RCrqXyMLTG0BIjhwa9HlYTyzLcqwoyY3ejPDdSWbLvuT9aRAJJpjucd8yFOqAHFuiimOeR42x0BdspD1XfYtsaF0JJZKMWvFieZE7aJp6HX2IwZ6eThXxKjUa3tfc2Qf7NNkuEYrUA0HxmyYtqoYDjI62bz0NjD+b0uk2I9YTLOpeAhP3ptfQxGUyNrBWSJsGDj1Gqrr+s5zrLRzvDs0ijIwyaB7LeLWXpOZVSvBQ3FvGsz3kMVxi+t3HSD3AZKbNctHfurSFcpZoqrCjUsbBqHZWAr+ejadQxEVM/g/aoud45YiSBKqxfEWUWrJb1bBJlVSLiEH74XggvK3/rRBePtvVVxBqED7R7sczG6rz7s0lbnd5UFS6bKKypaFjpZZMLJQqVK3zCMJ7sal4MBidkt116HuHuEd49IJexFaeqxSanrYGQgavqoMDdhWeu7ZBoRreZykDPLCVaPKRZQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wetMSdiS7RotKf+YSyi7DXeQTbn0iYp4rQ4PeHmcoD0e8ZGLqt7tqmWena4E0m1vmUAqf2FwSS4dzXxE91UvHEsJ2L61J5LKK39Cm6t7Tf3gnoCKJ0xk0aYPtTeDp+vZzfFT19Ec6PzZo9S05N9giDqxauhgq9LEQYYsZpqlf0jaFNYgknGsWIVMaXgyL93KGCDYskUHv0jEF0vbyRr1dT7NteQIhU5QFrlljRu7oxmR+xZ8+KHEty1Yrb0KHfKvTLzdrNlGX3VT1vUlFRCnqCsF+M4tcKdCv95FOw00bPg6u8f/dV7p7kkcWZ4QdwxBe0PwcIG+JS6nIaOdgXyvCmQ2Q3FNjBWwYam5EqSD8ammYVknQRCvWI9qoJ0KLZwIGMNxfyQiY96GerqjYM+NXJN7xKUnPKu8gHZQEtKSfUme0zgxA/IVddHGrVIsds55
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 13:26:20.2142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b2bea7-3165-488c-dd59-08dea5f2e69e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB3F166793



On 4/29/2026 5:49 PM, Thomas Richard (TI) wrote:
> On j721s2, PMIC-B is needed to exit the DDR from retention after
> suspend-to-ram. Add bootph-pre-ram property to make PMIC-B available to
> the bootloader in the phase that sets up the DDR.
> 
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
> For the v2 I just updated the commit title and message to use PMIC-B
> instead of pmic@4c.
> ---
> Changes in v2:
> - replace pmic@4c by PMIC-B in commit message.
> - Link to v1: https://lore.kernel.org/r/20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com
> ---
>  arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> index 12a38dd1514b..a19e535f4946 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
> @@ -250,6 +250,7 @@ buckb1: buck1 {
>  				regulator-max-microvolt = <1800000>;
>  				regulator-always-on;
>  				regulator-boot-on;
> +				bootph-pre-ram;

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

>  			};
>  
>  			buckb2: buck2 {
> 
> ---
> base-commit: 59b04cb2325c07ddc1cc7d984bd8c8f89f161746
> change-id: 20260427-k3-j721s2-som-bootph-pre-ram-pmic-4c-744fb90b05a3
> 
> Best regards,

