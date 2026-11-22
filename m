Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795373033;
	b=LV6XeR8tjl/otx00xwm/vdNcMhxM+IAu2DkEy9doch+PkjPQh/t4C6YAQlm3W48fpV5y
	 EgOVjBZtpT4cNp+ed6X8vLfXRcXCYdZyEZ4eWs2LuOIooOkDaBQk0acejEoCo7//UtIV2
	 q7K+MQB0jAvX2/QuGv1NCY6DVxMMPGIrVljVxchYQLjQBWpUQQAh5hwII5Dk1gG8/c/8m
	 +h1clxg84QynEV1L0EMZfMbdMo1MkQLajT34pXaj/rlRFlg2axs4Y0CMCzAC3Q/Yhjuum
	 Zt9f3sdFIOJtIeYIRdxwFDV3mDI8+QGMh2CbeR/Lsa2+6OSnuymPMYPvaMfZDEgatCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373033;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Authentication-Results-Original:Received:DKIM-Signature:
	 Authentication-Results-Original:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/vEcYCMhhKedReEt7PVJMILQCRmMYS7pcNGKhRU46Zk=;
	b=2BgDwC+V+D/usm0yAt2u3lM4oYf8l+cE1ot+8OeACVRm/ctPgKlF3qGQWeb8UvGOVIrq
	 Xc7zizG9IP4dAw37lyqtnRgdUgMQb4MueQdR/5i8wE2KWfr8H1/FpKjpQUuOClySXnqyl
	 FTRvqjj+zlsN4/poe8kjr51YZUGBMM1HNHMihxvvzzjAGhGXbH0OXYTpijxEIRzZCMh3T
	 koKSiHY+McACxeLLBBdnOZx/VmIxQAggt3oRU0YgcgGLl0Jg0xj05wFTZwGN+5VYm4Ys1
	 iRb0sVp23gahosy3//6Q+/8YwbeT4UBWgcqRAryu0d67N4MAFMXNxyMot8rt8jbdxmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cern.ch;
	spf=pass smtp.mailfrom=cern.ch;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=LTSMRRrl;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=LTSMRRrl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.167.92
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021092.outbound.protection.outlook.com [40.107.167.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504DF606A335;
	Sun, 22 Nov 2026 18:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 504DF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=LTSMRRrl;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=LTSMRRrl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKLPNd7TdrbpuV+T20LT5mIJd7pCvyoqTpldnHASR+R6WtVBUtHDSk9LPFF9rMpPIitkTGdo3mZc8eN/0i6Gn59/g/Eb+5cf+yO96wWydPqAZAyv+lLUkgCuBcKBYHUjeZ5MlanOcBkTq0qFLoEe3BNtTf5oV5xTcbgMU1xKyra2TGYN4UlfhohYLCCpFYlnTTWrEVOwPZctJNextlzCclmWLMyF5aExWnX84Tt3CZY60lHr/hUwDrY08U/uJyua3pEADVqmtbvTGi5Yd5mhjmp2R3YXv4SfbhER62+4tWKKkODT71uohae4skFNaApnZ8HBuOoAgfxTgsG/A3rlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vEcYCMhhKedReEt7PVJMILQCRmMYS7pcNGKhRU46Zk=;
 b=xTXLl1lKUYXWUbpkSvCDv1MLMXKKGimHL1TrVh+kqF646reHgT7imMEI3c0E0duXUvmqmCbQHeZ7J3kExrUPRIKov1CQ/xOkg1am4MIPtrdL5TbMuxMlq94kmF+ePvzbK9j50iyuQR77PKSSuiugShxJ0cFitMx4YRtqEMjsJIsBsTDUUQeS+VLSlWz8E3WWbFKHwnNaB/mW0MvaPN2dF2gpliFoCiKmZKqgEzJw9nM+EZ2WzBcoxogQxbHcVt60wZ5JNwtGR5dKWfUfqOITUn0QIgM1CYEcdVbsIi6fmUIGmsQ0gyhxjM9rq7tqmr6eeaCR2d98mJVrS3ZM0l5Utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vEcYCMhhKedReEt7PVJMILQCRmMYS7pcNGKhRU46Zk=;
 b=LTSMRRrlRU5N6u1rfj8b0gH3rTll8PLk5jo6SKwhE4rnDPHYVGAJDpT8iRGELTMpCltC7MSlSFGHESPNcT72P5F3FLI/aBTOth8GfjvtKLifjW22qDz2xdz3htk7csO8KS41PRZ5RTHckMsZ46Rae4W6d2bIKMU328XpuFmfKeY=
Received: from DU2PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:10:232::28)
 by GVAP278MB0181.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 18:43:48 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::3e) by DU2PR04CA0083.outlook.office365.com
 (2603:10a6:10:232::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Sun,
 22 Nov 2026 18:43:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Sun, 22 Nov 2026 18:43:48 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=LTSMRRrl
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 3526080181;
	Sun, 22 Nov 2026 19:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vEcYCMhhKedReEt7PVJMILQCRmMYS7pcNGKhRU46Zk=;
 b=LTSMRRrlRU5N6u1rfj8b0gH3rTll8PLk5jo6SKwhE4rnDPHYVGAJDpT8iRGELTMpCltC7MSlSFGHESPNcT72P5F3FLI/aBTOth8GfjvtKLifjW22qDz2xdz3htk7csO8KS41PRZ5RTHckMsZ46Rae4W6d2bIKMU328XpuFmfKeY=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::8) by
 ZR3P278MB1324.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:74::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Sun, 22 Nov 2026 18:43:44 +0000
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8]) by GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 18:43:44 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkml@antheas.dev,
	marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v9 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
Date: Sun, 22 Nov 2026 19:43:17 +0100
Message-ID: <20261122184337.6551-1-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::16) To GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:22::8)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVAP278MB0007:EE_|ZR3P278MB1324:EE_|DB3PEPF0000885E:EE_|GVAP278MB0181:EE_
X-MS-Office365-Filtering-Correlation-Id: a649bb10-5144-428e-51f8-08df48c88b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|786006|366016|376014|7416014|261022075727099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 NdHWjHFUvO7g0+zhqdvn7gJinZB2f1yBm+MUpwaakHfXpfhMNV/dc+oawuIi4yjA+lknCoRFbqT1ESvjCUPjr2RomzdmWbdf2O2ISq/KLkPhgI3i77zv4CPnx0v16hW8BPuSx2L3PjOBcAc1EST9kdDAC9aDesBicRMhrcbV9BTqjAfgTAjActW4jhM6QeoMJKQ9HyuWa1NF2PGdbupEXt5Hfilj/lyRzdlEePwH+QMcWZiYJnSmGaknyPoZ+NvsM/P8THM3FPaT8QQaHb4BQ3JgNwyqhlXmJU27Nf/9BRt2+jUVdKLGkr/YmSHfhzRgPT8DLUAy/yrTrfJG6Q6fN4ZfFYJyooMxeN6erAMZZI7pbWNKXwZdAe2r9azrBRKVM07px0W0GJq8vOt9W+YDKZY9wb6V/RmcVmx2xisqYpCPpnnFmlxDEkViCvDD5Cz2IIa87SCYLO+gpw93ZYPAgGxESRXXe+h/g08i47C3mthtyqsJmXYrdKLs1VHyqzPpYRsNN6eK/MFA8sg1Cd/74TzokJWDNkIGaV1zbad9bI81XwmqUWk3+e5Da10i2Os2+1rkXzAtb4T9jKJCi3eBEbzpMzqoID0HtATixJGhcR33LK/eVjCd8aiX0exWMGq2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(786006)(366016)(376014)(7416014)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 P80Tkdk45ZYLjr+hySFoxwLPHnZba/65kYV4dSrxweYT0UPdziUMvC0nYGgKq0hwC5krLhbK1jDYal27gGq8jVAuVlKGhCiIk/k0uWAZneeGldiT5oz9Oo6K2NCCKW3VdUKyuXJSKh3Yxkq1BPYp0U/y+ul1AmOwOr6NdnvtBrng2FVvzcRbRgb4c8q16FU4NPw8tLqN5nuWYUpU57JqCSLgHB5nNZO0qz6FqL/2CmNhEnXH1+69sbVGSzB3nQD/vSXK51nnpa1Yz8D2dTb2ANAV08mEUNHyw6VHcyEVzcujCWUBeqDInMcDiEWiZz7GFh4g0x2depHJq6R9HYngIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1324
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13db220b-6ec5-40e6-3f23-08df48c88927
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|36860700016|14060799003|35042699022|30052699003|82310400026|1800799024|786006|376014|7416014|261022075727099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	9q/rqAQjXhez6atqSSMLdS9b57aBcxeC6KkKCLK1PyKSVutLeeFy6Ls7XcoIgDYz7DZmTnJHnbVjEwmTwwV2skrZz0ywV5ftOjxXlBUMv5GU88R7tonxLt/YN8wEg4yiLy7nqUQXwBviNS5o6Fw0dDMnNFXyEftTgvtR1H67PlgdjnbyDUMMcbtMo43SD5sgb3nRLa7PhK0526pxyB44+VAUF2vUv1Iex9jn+phha9krlOqLoQq5+YpPTrvP5BzIPwLvNjWfsv2ykRX62FiY//zvYfjTSWJViEBWF+//lG+s82rAN6nCMnilPGb+X2/4raM3EB6WtNhtAmC96PqPDpf1OQd2x+65JR5AvrMWKzieUih6hX7LQGJF5KeqHviPwFmbQz7jMLTGNCkjWiiJq6FlPMc+hh5NFtZeulAXiBgClB2pfnAvJvoL8sjI+erBQ9DhvIKkSQlav8oGddH8j0G6cyWMbYBNMmw1Vm7Chj28SAI2ntPclvekMZjIjFH0PMWmo6dZbFxg4Rg1UEpHNXUa5J/yuge1JoWCa7aCpPerd9AR5qDHw3b6Gb1bVrIb2zFVHh+1s1EgxtnFh/o/2Mx26ZY9fVE/U2YasrB5FMYywmOk2FzG6blQXR2Jp1xv8Th2MaLa+y/xXXA7HbGST4g2c0TqMVp1le0TpsWqLV0=
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(36860700016)(14060799003)(35042699022)(30052699003)(82310400026)(1800799024)(786006)(376014)(7416014)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LhEcayKqltzJM1hjD0QAWrWfjfDW3AedYqgGvphrjdKzbr8eauFPsF8jQdRi+d4N0vT7oervZQEffs50GB2k8QuiVkBnranTWFO5R7r74w3bpfVmntFgYJGturavvPUX36+2PtQSAiVdxLXqmU+nM8Iovcd+RPWoYS48gKPGrXV4A43fg8m/D4NSSo67mDnxiQTA5mZndsN0CPP8umVVEiJ8uwpoolLvdt2T7FlQMn0cfGRxHBv4ikZBDlYLa95CpJqixm5cGG+Wip+Vz8m3AcdhPi5NbKzbjPzg4AvX3+aHDwd0bP6HNQqNshGgKNjkZp+SKmt8Pm7xmaiZ+CkJtGsAfKr8jBFpP8ZlSGFyeJ68xDJnPKS824aE70UT15HylqCwchroBAQLamLXJzX0zA1DsabR7xmmewOqsTTg5MbE4e9uUG5VHClF2aEvJzhw
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 18:43:48.0726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a649bb10-5144-428e-51f8-08df48c88b8f
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0181

This patch introduces devicetrees to support the hamoa Samsung Galaxy Book4
Edge, and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.

It continues the earlier patch series started by Marcus Glocker, and the
previously submitted v8 [1].

Supported:
- Keyboard
- Touchpad
- USB C (as init by firmware only)
- USB A (on 16 inch)
- Display
- HDMI
- WiFi
- Bluetooth
- ADSP / CDSP
- GPU
- UFS
- Suspend
- Touchscreen

Other features (such as camera) are also confirmed working,
but for now need patches/changes out of scope for this submission.

Changed from v8:
- Move USB-A related nodes to 16inch dts
- Remove speaker nodes carried over from initial dts/dtsi
- Add updated dt-bindings changelog and re-review request

Changed from v7:
- Fix sashiko warnings
- Add touchscreen
- Add proper tags

Changed from v6:
- Updated to match current linux-next
- Use 14 inch SKU as base for the dtsi

Changed from v5:
- Reworked DTS/DTSI for both 14- & 16-inch SKUs
- Added Galaxy Book4 Edge to QSEECOM
- Removed UFS node from the patch

Changed from v4:
* Fix previously missed commits:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v3:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v2:
- Squash Makefile patch to new DTS file patch.

Changed from v1:
- Provide the patch in the expected format.
- Added missing bindings.
- Removed sound node.
- Changed regulator syntax to be consistent.
- Changed touchscreen node comment, and removed false pin definition.
- Rename ufshc@ to ufs@.

[1] https://lore.kernel.org/all/20260930212421.4810-1-mstoretv@cern.ch/

Maxim Storetvedt (3):
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge
  firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1378 +++++++++++++++++
 .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
 .../x1e84100-samsung-galaxy-book4-edge-16.dts |   82 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1500 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0

