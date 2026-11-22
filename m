Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.105
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795318570;
	b=VkZicpQcCB4nC9RqxOZJ2DFPst5FIXa1haLDb4tDLbUy24hTy0PNUpziKMQb/7H7VL7+
	 FYW8v+HVhR2l91BexO0HQmTxQV0PRz6kFt+dI2g9ZN6INQRr+GQxOSwQolYErn6jwHZY3
	 O38MZe3ZTlgUpgGXNDDXY6EDouMVKALaoMVeAVNWYcycCMjDR9Hb8xw3mplivG1jUFzON
	 FzFD9N02Uj8cGdtcG9+aFQQQUUYjErvfk/rN4Ghb92pibg4us9UAhsamoIOv7lThvaLgP
	 5fLAej1ZY+jZjSxFHPLE6oyo2MTGfcKEsCp3wvbK9whx/A/zbpo471LYzAhWPMIKKJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318570;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=wjWNvasiebAydZfgtj6Bb+cSuhx7ngQOzsh9oRyAYYY=;
	b=tnvnomT+RuYcHbhUxnYTe4eLb8IGbbqHUkEHI25CAWeRBZwZ03jmI4HjQHOk09dUw9KN
	 TcRGM6e8+E6HIEf/ZqlwlubNVQArLuEo7psG6u6VObg0RgG4zOTMmXf56S1FjdE/6N1Y2
	 JbGgFEBdID2p/pWAU89vzxyysgpbIPiVUnkXsj4bi4fsaKR1I6t7h8QMNdCNdDX69inr5
	 /3CLqDSIYJNpXS0t37tR3zYtG13w8qICT2fOw6hzZRud07EPSY45HA+fbDqBeVxoQ4XT+
	 YSr2JZYATb5QAzIHgzomwCNXaYvHV+TktC7a+dR5qbg5u8SdEs7bSoBaA0a4q1SLJjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.105
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022105.outbound.protection.outlook.com [52.101.126.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5FA606A320;
	Sun, 22 Nov 2026 03:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5FA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+eh3vTSeFr6xsXHJOYXR0dQBu1jfKkqXU0owIK5+vN2DCGoewIlA1BKP4NfMkC2bCEo4YJZ7Ib1J3F2juy2vNlSo+3kHIvCvdpDxrJ1NRwK54W6I5cR4MyzR8d4KxjF8B1kqKyxAoWeyNJBRI9y6FDDjjVLTcMo2A1hqv3J30uJbSYnx59rEV73aQojthD+J9UBPhKh59KG2ql6VM7tCrIAmg/47qfl7CxHqY9lxVVerLjJKPpSo+hW88OlutmKIlflFO5UiSWUGWXGLMGtApE4+h1gFRhYER8IQURrzEyPTX8Cc8gGrfY9R8K3/qwuQY1+Y4OsEAcLLoJyie3wjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjWNvasiebAydZfgtj6Bb+cSuhx7ngQOzsh9oRyAYYY=;
 b=WcoyF8sZyC6khOha8S0Vy/gw+RxsM0ltwMK6Jy+F90f6YJ6bLe56ikp9CdtPPgVzRG/FuvkzH61yiPqyMt7POz1k/JKAbLoRvRnmfBYdibNwOo2BmAesf7a9klLqT6NW2XpmDOVrf1Y0vMrj7vxaYXF5vT/arwpzseWnkUBcPJ+7iSmVy7ajEGunQy474dVKnTygQ6yz3RlbHRhtcnIYTkr+0ydrOu2WAeMuNcRAGuTe0ADweJuLxngRAvmsxnQP5mO8UYFDqVNuBZU8yy4+H3Cgs8JcDYYNOatlVNIEsiL715QIekCVsdsX5v7dPwSHEx0p16pTbpQ7TF3jol9kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2b3::11)
 by KL1PR06MB6426.apcprd06.prod.outlook.com (2603:1096:820:f7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Sun, 22 Nov
 2026 03:36:03 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:2b3:cafe::9a) by TYCP286CA0083.outlook.office365.com
 (2603:1096:400:2b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sun,
 22 Nov 2026 03:36:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 03:36:02 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3654A427EFD4;
	Sun, 22 Nov 2026 11:36:01 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	Gary.Yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Hongliang Yang <hongliang.yang@cixtech.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Date: Sun, 22 Nov 2026 11:36:00 +0800
Message-ID: <20261122033600.25806-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121-friendly-slim-jackal-fecccb@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com> <20261117022858.2210212-2-hongliang.yang@cixtech.com> <20261121-friendly-slim-jackal-fecccb@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|KL1PR06MB6426:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 231b45c4-5653-4c67-de80-08df4849bbd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|22082099003|18002099003|261009223027099003|4143699003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7T8lDeJsKHsEisAVHyAwqCVi8jVWVbAT3ep6I0anhn4Ko0RR4F7jd7iUMjkQspY7bTcUexvW8pKbNBw3gGSYFLhnA1P49omBCF7ER9Q+Spx64CKJ2+nKxHiYEQsxN5SsqYBQbxk5RSzkwZpUSoBP+ul//HsHdk+DrwRMYag2qBonyvUPTHOYfarkRLxu5nS5zoHwjHxqtjpsFQXcyxR8bYjQiL9ilXhiqyTfAexnJCZsinnpQr4nAyjmWozXoy293XJNYW+rU/OwUuqI3ohcU6bSx9xvxwwgsmnjkCU7ilBz6uDUShcgKtj8aNo2OrZ/VDXiuDw8KXRJO3EAuiKm44v6hbXvAAa8rp2VO6mtL3mGwlHI1y3jZZqUgsWS0px8/istWoBz7c9DrRxSqTW+8As1XKBwlQWZK4mKFkRhbShPrFROlKmcfsYPHc2a2DuhB4LWM47U4+f4BRrNcBBVMZFH1HlrFNX+l/hxrrBUFKhBwz8Ggpns9kf6ryy55Tkcc7vL6mOO4EwrP9cgsb0dW3e6OksEupCcU8maaJ/NqFfJ68IbFG8BMVGLTeXmQWWEZV07fycQBsv8GbYpoVZCdQee40bpsk6Acw7PfyCTzAez/zvYEcvVZhKrPDeCAyWaa17YBZbdAghxJazw4/KtfwMO5jCw48wuH2eCbiC5St2Cg6Li/sFlYgigY+48gkJNuoQpLRlBbgWxFWMyfvJ2cw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(22082099003)(18002099003)(261009223027099003)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cXM3CZQ01/wEYBQMwxO1rb7+Zmo9RoMIJdMlAtK1pCbNJjtDoRKLdfVss65smickz713LASkU8vC4Qmc9+2ZGXPK2Py9zzkPTNvcbeYQx/ma8zQLkB5QvEnk/0AdI8HH8cJ4mTKuodhW5AtW4Xl5l3gTo1jRzYIEZ+zozA1kks/NL88u54Qp32Me5wxyDlHVTVnKqLKiDlqY5yeCO204BSiv1+eyZDAH3UVx/oEVvn6dVBkpMTiboHh2fK5mM82l+BwsBE61okQ5/BxoPNSc2R5xVniDVgVvnt49DJaZi4dUb+OrAEJbnZ/UPISXuCoMVFvu2wOtbYtL+ARViTUxReMiberrW3AalQD4JCQeazFDqD9zQPiT3acjVzWm7L4W1doiTuQ6JFk95nAEGH1dW5zkxaCJuRHgpMfrqw4Wp5EADgpBiJ0+fJVpijsClI1k
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 03:36:02.8881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231b45c4-5653-4c67-de80-08df4849bbd4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6426

> Neither two clocks from clock controller are separate devices... that's
> really not the point. I don't get what exactly is here common between
> these two lanes, but you have several per-lane registers suggesting they
> might be independent.

The lanes are the two lanes of one PHY. The two controllers above it are
separate devices, each with its own PIPE interface:

                        Sky1 SoC
  +----------------------------------------------------------+
  | usb3_typea_drd_tcp                                       |
  |                                                          |
  |   +--------------------+     +--------------------+      |
  |   | usb3_typea_drd0    |     | usb3_typea_drd1    |      |
  |   |                    |     |                    |      |
  |   |   USB3 Ctrl        |     |   USB3 Ctrl        |      |
  |   |       | UTMI       |     |       | UTMI       |      |
  |   |       v            |     |       v            |      |
  |   |   USB2 PHY         |     |   USB2 PHY         |      |
  |   +-------+------------+     +-------+------------+      |
  |           | PIPE                     | PIPE              |
  |           v                          v                   |
  |   +------------------------------------------------+     |
  |   |              USB3 PHY, 2 lanes                 |     |
  |   |                                                |     |
  |   |  lane 0      common block          lane 1      |     |
  |   |  TX 0x4000   bias, calibration     TX 0x4200   |     |
  |   |  RX 0x8000   PLLs, at 0x0000       RX 0x8200   |     |
  |   +------------------------------------------------+     |
  |                                                          |
  |   one register range, one APB clock, one reference       |
  |   clock, one reset pair for the whole block              |
  +----------------------------------------------------------+

The per-lane registers are the two PMA windows; the bias, the calibration
and the PLLs they use are in the common block, and there is one reset pair
and one reference clock for both lanes. The SoC has no per-lane clock,
reset or power control, so the lanes cannot be brought up or down
separately, and the driver programs both of them in one sequence.

If the lanes should still be separate providers in devicetree, they can be
described as two phys of one node with a lane index; there is no per-lane
resource to give them separate nodes.
