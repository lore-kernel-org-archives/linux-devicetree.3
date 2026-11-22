Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.188.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795373033;
	b=Hy7rUzxuifX9P6J7O54ld2gt+siPJIARi3jnx5bVPpe0TFd02GQYjg5gKq9a0Ghd48aR
	 h90TntwsIVHcXmHXkvFnXqlqyA0ZavlLWuGQh9z5mGTdArqFXDxFFjAGhW1Kjtr5BVK5L
	 NfoXydKGU3RGEHjtQI2Oep/TCvLl6LJbXdiXBa5qwW+1pDMxSESyvzq1z3fjtFnic+mD4
	 D8gM8DwVPD43RZTqokfW2u9L9E+lfZDjlizutUv7+YlF5ms+GXogb4e9v3LoJGok4P/i4
	 z6gauAXKEfu4TGIz9Rn2ppgpPvNAA3yeN6c90GIO9eOYSluVu+xeuN73RAzcmVVj4nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373033;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Authentication-Results-Original:Received:DKIM-Signature:
	 Authentication-Results-Original:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
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
	bh=JBkxNZTUwI8mjUinCS2nZiCOMCBe5A8vkSsF38IQhnA=;
	b=DuK6xWmUs104O+kPCvSnVE4WjBvt4lrUMcidCD+VKg1uUcIvVPcleiY3cPDjKzU8bJJ2
	 8lmwgMl0vT85u4cE8rn50pZYNPpoTsyhzC1ABZmzFcRLMbG3dnNVxJWQFBZk1uIONh2w4
	 fn68568vC83dFE9Co7Zfse/fuBNvR9Vcw4oy2FaLD5VlYqZdPi8NqN3X33CQs6BO0PBd4
	 5BYuuFoomstm45pXfcIsdSurCXDwe4V93baWMIBEQ8EkY2b26sWrR8eqJYzyEI5lF+6+o
	 dQf4BikHgDLn2ZozyhwbbnVE2a8w9aj+bAz4hceUNRBk1/CR8lO8J0RTQu7lulKYZdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cern.ch;
	spf=pass smtp.mailfrom=cern.ch;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=syDBGTZZ;
	dkim=pass header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=syDBGTZZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.188.98
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020098.outbound.protection.outlook.com [52.101.188.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52128606A32A;
	Sun, 22 Nov 2026 18:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52128606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=syDBGTZZ;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256 header.s=selector1 header.b=syDBGTZZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w06sI5RMQe62XNq/pds8nIbGJR/ydVqudOaShccmMZy2WPmOHG7I3ejMSw/mQbRTpNgwpoiLg3dJn224Ljj5eYwD1Ye+5gQa75TX7SvaOvDZSS5bWEVVvfek+XcJmpuuQSsfE4S7AU1M2PgyVVVVsAb1B3wXhR78dlzShLkpjG3vYMjaEV5fXwFpO8vYdUGp1MI5Hhc/6hnit4E01zzC+zJeTRMiOhL8RPxr2zmpMejiE0Yhv3VIfTNkw6CCSNDTWU0uDMRnIqZM9/unjpqk6y3XcnYkDAXTim1MBYXwejUi/WpX89ylRzsEMLXSoD7W8n2EbwXMPdM/R9RbGCkBFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBkxNZTUwI8mjUinCS2nZiCOMCBe5A8vkSsF38IQhnA=;
 b=cUiFu4O0aT6hYS5n4aklnMIYK10OUocHYIZ4mZ2ZOUMiZIKJbiJUkNOhK4uUyzdX+qMgBlSgzQ+p5gFaVfzkWLV1MrO4TN10Uc7u5elAkPnr73b4a7z3k5OepMDQr0g//OqDpLJSvQ3zAc+yuJLEYb7z3/fNec52iQlfSH/neiKU9BKY2MpqF1Xzh1w959L1CHPX2wQfoWsdiDxgEDrply4ONsFGvEVmjgHrFZR2xGOtAMq9+s1I31F0wcdpfeq+rO1kF3Noh71KVkkMLOcRdWfB0ALh94SH8OnTdi3pNw7OMG/5cBqZ2/eF5ttLegW3amSXZ46x5vjZS6uANudm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=antheas.dev smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBkxNZTUwI8mjUinCS2nZiCOMCBe5A8vkSsF38IQhnA=;
 b=syDBGTZZhtBPVtfMBqJT97XM6VNsG+SVf0+11TDLzj1gnSx639B2Ey7BZh5quWjU8ERKctc6EbHUKhQRHc65RKp09PIr9ZQ2YiUqC7VbS5WwN5vSjyxMm3Kh4oueqG8D2TuWHG1wSh6Q/UyfRQcTGN+UePU3dYHUmFwSJZWbcU0=
Received: from MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM (2603:10a6:298:1::475)
 by GV0P278MB1244.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 18:43:48 +0000
Received: from MI3PEPF00008485.eurprd02.prod.outlook.com (2603:10a6:298:1::44)
 by MI3PEPF00008BF9.outlook.office365.com (2603:10a6:298:1::475) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.639.14 via Frontend Transport; Sun, 22 Nov 2026 18:43:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 MI3PEPF00008485.mail.protection.outlook.com (10.167.240.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Sun, 22 Nov 2026 18:43:47 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=syDBGTZZ
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010004.outbound.protection.outlook.com [40.93.86.4])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 263AB80181;
	Sun, 22 Nov 2026 19:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBkxNZTUwI8mjUinCS2nZiCOMCBe5A8vkSsF38IQhnA=;
 b=syDBGTZZhtBPVtfMBqJT97XM6VNsG+SVf0+11TDLzj1gnSx639B2Ey7BZh5quWjU8ERKctc6EbHUKhQRHc65RKp09PIr9ZQ2YiUqC7VbS5WwN5vSjyxMm3Kh4oueqG8D2TuWHG1wSh6Q/UyfRQcTGN+UePU3dYHUmFwSJZWbcU0=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:22::8) by
 ZR3P278MB1324.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:74::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Sun, 22 Nov 2026 18:43:45 +0000
Received: from GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8]) by GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM
 ([fe80::29de:97bf:5b0:49f8%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 18:43:45 +0000
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
Subject: [PATCH v9 1/3] dt-bindings: arm: Add Samsung Galaxy Book4 Edge
Date: Sun, 22 Nov 2026 19:43:18 +0100
Message-ID: <20261122184337.6551-2-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122184337.6551-1-mstoretv@cern.ch>
References: <20261122184337.6551-1-mstoretv@cern.ch>
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
	GVAP278MB0007:EE_|ZR3P278MB1324:EE_|MI3PEPF00008485:EE_|GV0P278MB1244:EE_
X-MS-Office365-Filtering-Correlation-Id: bb66386f-7a92-48e5-2710-08df48c88b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|19092799006|23010399003|1800799024|786006|366016|376014|7416014|261026121527099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 yARlN6+lTAfbwG0E4qu+84s+VYSamN8Mx68HM4vicMyhIVjaSAXJTKZVceKOS/ljTcm9bxCbrQhgVXR7p9rxSPIqWfzi3dyQrsOTnaWqwygpZdZhqvl3nnvwnIQU8ie36sk8hCnAhBIpPBuQzB4cvlZJ7/RPBea8GWesMXo2/ykN+FfyKzXmAPv2lSkqqEMyI0gCcfXNYSXdxOyWWpXdwtklMBNxjyYkWSBDG2BnlS5188Wyhs/ZIhruor1RzctI6z1u5TzzSL0afDquQYQ2KJzmUUFJKDEaFkJwuvNRyaQfpRtn5aHsoyjrd/vtbSKrZ9zEVCjrUf1OsD4RBSiqYH3+bsIkH472OR2YyKvFbJVys0IrYO/cjxRDgncvJHuiGQSm4CtDKmN+AxE24Jcep8UaQZiPZOn8wwNyF+5B/hwWNLtnhmEnlviNF4j5oRBvm70seUCok6KVIusa9oLxkKo+6zY4kdO+fqKqMGl7PCsRXxDNsvRhRiVllHrZqaS6/R5NdP0HvvRsOx27MewQySmg/OPCnpOqAcq0OCmuHK3ZzMnIIEvmwjo8HeXvgP1c91Vy0VOgnI21SGGF2GaaCAdHSAnhSWMrCwHAhKe6cbGieG/m4YZJkVKyRlO180/oF5RXu0C6wg9Xi4sEkf0fdcjlY36iN6Hlx2zpXDBechQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0007.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(786006)(366016)(376014)(7416014)(261026121527099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 NqP7PwqnrSXN6+K7j+wCORrLV6CxDmBI8K+GFzJFSBMHt2pFGeNEZ4pAJ9Vucbc0jxsZO/d++T9+g5CQK3jnUc/3f6bmmRMhElV4OI7oYhlc1ICqxNMg4PITXRIUc0vQ5BvayQWR0fqDbJWPnMDfRTDoMuozRUTBp6dR2BGD95EO14f7CqmAhS4PulMRpMthgeE6nyiqRH6o9En5n5pOeyTYmiTNvJ0Mb3UpKav9F2Sg59k4WY/Je9w3JQ1baEFuZ0YN0NnJyfkmYaOMC/cpEPQ6d8BGkE5fINQqU0416nDs71hHxkU6NuHudefWdu6fAynyIsmZzbZ6Gg5ntzKkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR3P278MB1324
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008485.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52516045-0ce7-4714-5be3-08df48c8898b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|786006|35042699022|36860700016|23010399003|14060799003|30052699003|1800799024|82310400026|19092799006|7416014|376014|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NBLQ9OZXQ+o9KhU0iewHVtAqLBUI0fQDNOn8JAsF9AVJPj1tFxf86w37g7Gv2upWIDdhFs4423YC3HZr0WI9K/1xUp7Pc3I56i+tA5oi1iokLJMUA7dU8jfzWDK1MdjwPzsjyz5CHz6TEblx2PJJT8dAnesNXR2eiYL/+gr6/iGtd+Qe8Pxg9xp+ajWjNds+VHuqYzK4KjyIyP5pxqs5ojO5WvwFVZiQJHy9NI3TDKeQpmpYp5PrrIwPnkjb0raK0hSIKLUHAa8TSMLb7QCKVaQ5UiZhc+eLTTI87SCzvBYa7JhWZVhW755O9tAelxO2eDm3GyG+W2aoVz9YMyTZAWLKqgYifkxSWJbeW0HDjk6KyOOZTw0EH4ekzqn86ipAiMAZqWBis44IR1MgPF5Dufa/YPNM2ck8ZFtqXCieitbRRDxVdpbICvwMu+4vVqmK001GT5f5Skw0b2FLdUAAQjnzRlko/ZCt8ADFZrcXn8h1Qh6p7vDLveWozmO8dihwfRpEh1NCSENT3OXs9CYwpRQsTt78zmUS4tjWnlzPZ4cDDAsCJD/tVeulFwXdBRlBYjiBpihGwGFp+4ulNZ/sNRsPectZGUww0z7Ds9+yierkuNuU5iZeOZPMlzfqjqILU0v1KGhJfakSwDpsov5qFIOg3ECCmeuYx7cnyEjqhUxoOGF6NKbdj/HznSEkuQrbLfcziEhrzzLgqsxNS35ang==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(786006)(35042699022)(36860700016)(23010399003)(14060799003)(30052699003)(1800799024)(82310400026)(19092799006)(7416014)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gp2sGznHjQ+P+kDnfo5yhc8C0TnEF4w9ZbtBf4x2/rRtkvT6bilaP9IvvKj7zePYnPeNsjvyXRGB4TXSDEt89e7H//ag6TvpFhd0Gp3q7GLJ+ivWyBnyDju6sQQ4XttMhU0AA58jgcsVcgb6q+y/Qg9Ifmmr9qOYuuM8U4U9EIxDF9JTp67rxRh2uNdodxauLgdjSFqOWjkN+E8twDZ1zzKlzG6n2JPXuqNqrGlyQGrtjUraqq8BguLkm08mF/tPfectqvBpMqD/WBhM4EDWpx5DJD8IpXcF9GMBAXltHe9ff2WyPuNcLFZu0zMvP5r4Xumq6peNQqB0B0k9UU0ktVZeVJyHgjie1Ko8lvDJBaapNOQPkirCrI87gGQuEn/TTNpStAFX+Cg2cUEKD2HIl6iRlf11pKDrjAOD5D5v7L8cAs32rhbKsao8SbArE+AB
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 18:43:47.5427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb66386f-7a92-48e5-2710-08df48c88b34
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008485.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1244

Add the Samsung Galaxy Book4 Edge compatibility bindings.

These were previously a single entry, but split to accommodate for the
two common 14- and 16-inch SKUs, which differ in several areas.

Signed-off-by: Maxim Storetvedt <mstoretv@cern.ch>
---
Changed in v7: the single compat binding became the two 14/16inch
entries below, one for each of the two common SKUs. Re-review
requested, as the tag received by Marcus was for the
previous single-entry version.

 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f699..41c9cecb5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1312,6 +1312,13 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - samsung,galaxy-book4-edge-14
+              - samsung,galaxy-book4-edge-16
+          - const: samsung,galaxy-book4-edge
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - qcom,hamoa-iot-evk
-- 
2.43.0

