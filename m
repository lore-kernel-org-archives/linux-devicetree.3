Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538904;
	b=MlywBIKj6e1BRaUAyH5ZX+jNCHctUO5t/pL6djqOBoAlI81oncVOh6oR2n2E8pi5EvAL
	 DCM8pub/FTaF3ILMbC5ElHTWL9IwBc6ruqBwIt433muJDcR7uZMymZAI+xo7acRqx0G+i
	 ihPjQT0S/65M3Cio1MQd9kzlgOkYUi5eq99+QlJjlUkA37ks+rcbT3EaWXuKCCYNo5h82
	 qJukDFedsqgVnSK69dmTs15IgyInvVd1mIPdhbOU6Ohj/HVeA4JhZGsFWeKs/TgzbqO8K
	 HQh2+3D+qsCs7aTOTRC+ApmtuJG1OQjQVbD/Jp/PPoMz3+P9kPtbg/+FCmMdOwLubCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538904;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jMmNq4+1xyzw4wmTLzWZJG6dBnkRD5RdRawc1OWO6m4=;
	b=zinbjKrbxAGkgi8P55lbwAVUCM1kFQlywdoQpBjWs03Rk6KU65XM9y0025LRkxs+WTQ5
	 IWGE6QPj7N/hWtoXi9aLKCFq9GQ6C0ZvrkwzTXxyJkIJCI+QZE1bkKnRHPqQdC9vOidzI
	 ewLc0kArlvtDGaR+CPks+nrlNs/hXYGIO0JUuw40XL262yMD5OVA1h9ge2zfEOl6/2S30
	 ruWydP3csQy97vtoemfl4yj3Cftw5Q1/2DuFq3InL6owA/tlNMiHK03+4TVsNjvSUfB15
	 pRfMMVBVqwUWG4hUhZn5U4lX5wuq8Ot42aoPoczU0diKBzC9ImrDQb+G2l5+qd1n/bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d4WgkyyI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.19
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAE606A690;
	Tue, 24 Nov 2026 16:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AAE606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=d4WgkyyI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehNQlncWS39WFk/zDzD8ReZ/4/GP45f4UmOb0PpF4hSxYn1ptL3j3vqBYRUI2t2EX4ELDzrM/aB4MBlWqvnjShB92ChaVpbd81n2dijDbC9H2Eqreqezv6LFXTqTJ7QAgEHYqXSBe4TWoiBnr2vUc5hFNaALhvok1Vz0eOBXSvIdjXIUxJPmrdv2njqvScBhf+W+GD54F2pKxOnQaBRF+ZKqbREOYUmuUOTaahOvhQ2QDJe9lMG2Acp60Y2RFNfDfyOeBhcqiPYo0ob3u7nqTAfurqlYhUzTYN3SRxCjpH0cE32BLeOQXiAsSLjNwZ1Hp70XmSGYAxC2DpEeMGsk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMmNq4+1xyzw4wmTLzWZJG6dBnkRD5RdRawc1OWO6m4=;
 b=hBtnc8badKSFRhbhUAG3jU1yEeWpkjHkS19hApcfSL6DzSFEs/g9+XPskZ/UOZ3oLFPA6/X1FZNVyKcQEJnu6gqIE3A+lA/9ZmnT86rBubqoMTA9nVs5SX61KnzTvzhUgSMgCVuwz+HSQHozGBEuG7dYGd4LF4KFaA5SvEyRAjakk9g/UhDb5wfe6/avLIh2/VqoO9zy1t8esQWJVwm2rmjMgmknkT8YaPRHNfDGrEEsy6kp5mARjMsMIPKgOqFEYiQi6eltLWBPktyMjLZ0l+VruaCV2B+WGXJOtVR6DHui5jhSFfDafr40Xwcq+YlKw+u53CKgWnyyx4LH99qS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMmNq4+1xyzw4wmTLzWZJG6dBnkRD5RdRawc1OWO6m4=;
 b=d4WgkyyIlAxWx3GSFUQlTC3o2msP29BvqFNhrAg/zg294sW2W5KPw/odMrouD/i/WZk5cLk/w+1GGKkPJY391KqnTNOEkya2w6tETzIaiA0RSeiSNdgFV8P6cj8JXAE/UVXgwt1WR3KeJnEY1g5Ux7XTaiqMN1LStOrRdh6R2qaEuIw6Y9i2yOqDzc3kCW8mLw1D14NnY//84Q975F4B8xyWjdnc8B1q/yBgeOlc3TO+n4yTOQHOJU+W820ivs4vVSe134anBrHonSOL9AFJWHHhZ93BgalJyG099C2Y6xJHWESJUoTC28YZy0OpyQVGIlXAkhMBduLC8xw0K/XhGQ==
Received: from DU2P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::27)
 by DB8PR10MB3979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:140::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:20 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::18) by DU2P250CA0022.outlook.office365.com
 (2603:10a6:10:231::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:48:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:46 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:43 +0100
Subject: [PATCH v6 10/10] ARM: arm64: defconfig: Enable NVMEM_STM32_TAMP
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-10-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|DB8PR10MB3979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8e14bd-552d-4df4-73e0-08df4a4abeec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|1800799024|36860700016|18002099003|22082099003|261009223027099003|10067099003|11063799006|56012099006|261102123227099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Z0SkE2TPauZOwCvoS8m1ONgYzayK6EvCOa2SoN8Yox34xrEdkEFkOlS3ThlZTo0w54wp8KyFz4B7aQc7hm1KKRNJ+Bnqiqx8KnMfrUtNHJ/IEVOmTk9L1BBx+xJLQMJPy/sgFEkCE1MOL9w1mvZUjAUNXKZ1NJGdpvjEvFSCkGi+2pVlGnTssJe6z68iC+jsGSID8lGDNgdPwQystK6b7TxxYyNYPF6QDaK6wT5oXWAUxJqIZ94xdGDC8aY3hAx7T5it+BVnWDaOQ9HuE/x57Y3YiXdgSBrOKv4gXuTAtbWp1atUbYSnSSOozomKsxW5d6GC9DJMS58HybG3W4E7OzpTplxRv9s+hrnbCUJnm+yS2YuG8XtnUey6I/AOI0tK3emOM+Om5w60mmBVndEOSPGlOz034Q9iROVpYTLmuMCmcO4NP+gTsJ/sPcNRpZU0HldPjirrYgBLbdUVRnCl/bfQfYyQPjjryELiZQiVCLHUuKmBXXsfdJ/CDEVsQTVzVHd4szlx0W5F+0PMaj8bqEMrr08MTQwSCRDqIdQzNXBD2CHsRbxG+gbe/gS/ny0N/re7d4218PA+jzRKq9k/OJlwfYxElmbd2ZYialtDfMubJWmVh9OvpG7xHOWbXFoG5byKtUvbu4tzmJh2rFyvgeYT4BgrtMzL7yjaG1PFU5Oi9NtAU5oH1UI4JqUdoKz0gvfzzpQEyE3aTNo9vKT4PQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(22082099003)(261009223027099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZZ+2h7PG8qq33ZhoJM6kXS1Ui1bcRHL4/jsqfW8x8QgzEkzsaecBxb/L36yjqCjWUXSsC0Igt5wHSjTsx51Zu3mAaQMFj1SOiyB5WVOM9USsvIdxJmJw4HJ1YbHV874Bvlr0Wz4lKmdJ/IoKkkHyF5UQyTxCPgkuU/7QnoSHujYJ5d9h9BE5sThGbNYW62WsmL9v8S8WCGcdg6MRc+IazmvDAIgmG3nRDbdJVtgOaV3oGV5EBu241/SsnroaOUsxz+fewxkJiP4HgmdDoq/oCL8ft7zUxxHZJVxEcPWKomDz8jZu7xb6b0gq9rPyHfcRUZ5XKBHCf99Yi+mPBhK4o9EoXKUSH6Pj2NUBR85mKk2umWqdj4rVHDArjGTU3nKiUqHo5DoOs7P7JjjtDicjWW06NBm/axTWrLnXkB02XnpKnejzhTPrCazLxdAui/XI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:19.9906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8e14bd-552d-4df4-73e0-08df4a4abeec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3979

Enable stm32-tamp-nvram driver as module in defconfig.
This driver is needed on STM32MP2 platforms to get access
to TAMP backup registers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..42c06ab99123 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1737,6 +1737,7 @@ CONFIG_NVMEM_ROCKCHIP_EFUSE=y
 CONFIG_NVMEM_ROCKCHIP_OTP=y
 CONFIG_NVMEM_SNVS_LPGPR=y
 CONFIG_NVMEM_SPMI_SDAM=m
+CONFIG_NVMEM_STM32_TAMP=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_UNIPHIER_EFUSE=y
 CONFIG_NVMEM_ZYNQMP=m

-- 
2.43.0

