Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148F23C516;
	Tue,  5 May 2026 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989822; cv=fail; b=HKdjvkA9plaI+v7J479fmZuBkR4bxiMqyx6O+P9nEN76605Ee9RV59kEmglZo67xMiI/F+MtHXyoZ0iamddgWbV/ASbMZ+6yeoIBvRV1fsUh3rlc4Li9XBEBfoIlgc+3szZ2AevKp2+mQEb2x0C7XQADinApB5K5hrV58MR3Cjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989822; c=relaxed/simple;
	bh=D4aeJzr19zyfUnyo1CuYgGVFgissRrtdBiZIXf/yK6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hvlGXmDV0PQCtB+plpLa3kL4Cqeqo9MhMeu80EvFPeb2Yrk2ZiNB1UW3uSn07wAd/hoc1rR6czh8MiZvYFnutAMc1chKsnAC8UxHHnXeU/sQsqXHtBgY6g5xywswXFBhkfviVs86l09HJrvP0KSnh5swAfVY+xdycVAOo8f85us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rOgRfIy2; arc=fail smtp.client-ip=52.101.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rOgRfIy2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwdk3DyS1u0JhRm0Ys1HmAlZM1uDRS+yLl+X7ikI5krLyya4PFfjQKK6N3CqhfQynE48Jsoqtq1o4CQL/5oTi/s9u5NwFP0U6bGLoTxszu3+1THdiYfGT9iQc+m1fJPrhfPalHJaas0SKFQIpHl7NeS9jqvbnCSbf4JMiubHalFcTyjn/eyzgp12fIgdFzunNVxLFueCFwPb8RZw7OEYBsc683iXkwKWxUtVimIJqtOX3bHR0NhTBJu+lWv7rbwMxfc17s+yk62g4GdeUbHyFcrTAq9ax+2Z/qNpK0bxjsg2lxxkog4JjDv74Rmn+sFWPWFEfTLU8wE1tFww8amkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnqoUCM/ZP9dPIjAn+iRZg6CVtgZb2DllP2YKSWHJv8=;
 b=Yl02H/3CAo9UcQ9B4E8b5/0zMSX4lZFF9zPDXwRueYLEBh9H1zxd4hA2JrbYprg1ngTzxyI6bJN3MsT/wBHjfhlWbE2tLJxXxlgfxrD707M/KTqOfF65LdE+uhHqGpyut216uvxYvktgXroATdX8IY9hNp8QB6IjEC2zw4hJ17M48D4FK3onxfzG5gBUehNRkKfGSnVQF4ee0QRksHciOe6vLbe4jTI/gDP4wLOWetkDwl7WJFIxWQw4JwfpNP+nwnJpDx9Wz8KZBnidnyXWZQPDBcz5Hk8pl2z/z8AnO9GDySM5CAZNyLcAwtpWNp9oNbPCnvaTRi7+8TjfAR+yWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnqoUCM/ZP9dPIjAn+iRZg6CVtgZb2DllP2YKSWHJv8=;
 b=rOgRfIy2ESJ8g/bnlnV6KT0wc0LwtnsXvdGrBfHo+U4KzL6l3gKDUtMtF0QJ61Lti8BBsgzLGqo1TzQA9ydHPh4e/t3RMq1LM5BYaf/DJkF4M3jRYPkFnG5ku22tyGMrQpMZapqJ4E9T864TOPF7k1UOQ2icmV0jh34tSnHcD40=
Received: from CH2PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:59::15)
 by SA1PR10MB997582.namprd10.prod.outlook.com (2603:10b6:806:4b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 14:03:38 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::67) by CH2PR03CA0005.outlook.office365.com
 (2603:10b6:610:59::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 14:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:03:37 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:03:35 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:03:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:03:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E3Y6X3396041;
	Tue, 5 May 2026 09:03:34 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, Wadim Egorov
	<w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD185-101CT panel
Date: Tue, 5 May 2026 09:03:33 -0500
Message-ID: <177798978207.338364.5197432688806967962.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260430130115.2380887-1-w.egorov@phytec.de>
References: <20260430130115.2380887-1-w.egorov@phytec.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SA1PR10MB997582:EE_
X-MS-Office365-Filtering-Correlation-Id: f7533f54-4436-46c7-c83e-08deaaaf1aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+l0X9FYJD3Bu56q2QKEtRkQgOrKXANOE6lz7OIv9sLcU0sX5tZDOITXMH4UYXVKw2YBKjLyw6Yr0rErD4Uw3/s55h4i8dgceG6CL73sUtLLjT8moelcXzijqp9/AxEg1mRdtKeDiIIzKAgBLTPJMJK+6TDaNavK9tfQ1nB2bynlxoaWSrcK7gsgMYfK6aLFzXvVVE2qgYUv4HovOp1pnk6CjXerviHEDbhv/y1iwyXFZ1cfDsezWVewXp5SimcLCKNO3eKOXPcFqOxvhzL/oogWBt0gbkIzkcUELQ9wWMgB4t6Z4txkPhZWiUP9VnSkhHh9qUc2xodXSWLPmYIRmapFqzc2Q9yxnn82LcAtVke4zaiwqc4N/f/efwgbkgEe2MMM0Xf8qOhdTLSUuavzOzpB5FalgrIXUFm3C3MD4oYURv/Zb2syq8caLtYNARDnUJgsJGH5h+lyaX4svndXiEMRJOgcCXE8p6lg+k4/bxtB1zI1H5MCMP2nTOhTDSHBTgZbwpT1UPBmg6RtdeeHI9PKcTumOuH53zngfJQ50bJq6Hv7G7VGXy20Z6RLa9ODdKi7Kb24BQRhh66MwMwg86UfLtURAbhBX4Rn4r3oW/HJv0tvWWOUMbF7pgTvOuzOkdXz/ODG/Mds+rEUuO/EZFz0SbiK53r2QY8FREzr76lOq7oTIUYT2hkKoHJ/BYOOUmMDOOWyoOSEVqKe48GmAEsgMcB53q+/Juwis0m2tjOc=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tTi1PNwmJKukbALI6ZwywnduJ3EfMbPEeX/lepDWE8jj5SUtEMT61rzvhpewWPelSLZ8mDILtERBnJcWgSPXZpd9GwvS8s8ZJM65MD4zPyKc5chS9RwZt93+xkGwLQv5M1X0PaPKwiP0AWfSXc/xF8FFi4hDWgaCy3Pr2IiGZ/hlXkFiJncFTqzEQeWYnt2PHmkinJWmRmGraloimhzDJTKADLRqFaxxdCT1+ofOAVtEdPQDUcqX+lK9vNmfBcRkHzBL+aYW5I9in2xDFGKKLN/DL+4bI3P2VNv/XK8eBgWh+UOkpxPeHty38+JFnZXr6ZfdygEC8qAOAVc0D5xh88NwXvnLORpvgBpedDlqYzvLT/mVOWLK9x5x87eAkp5qjKOsEGIG9mN7csebEiVdBmLX07TUUlXFVXzqbK0/MTTrggxtY1O56rMYxU/KkwU+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:03:37.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7533f54-4436-46c7-c83e-08deaaaf1aca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997582

Hi Wadim Egorov,

On Thu, 30 Apr 2026 15:01:15 +0200, Wadim Egorov wrote:
> The panel is a Lincoln Technology Solutions LCD185-101CT [0]. It is
> a dual-link LVDS panel and supports WUXGA resolution (1920x1200).
> Furthermore, it has an I2C based touch controller: Goodix-GT928.
> 
> Add an device tree overlay to support the Lincoln LCD185-101CT panel
> in combination with the phyBOARD-Lyra-AM62x.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1]. I did
some minor cleanup, do check and let me know if it does'nt work. Thank you!

[1/1] arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD185-101CT panel
      commit: 79c18f417a18c3211d815d6ec5b3239d74d951ea

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

