Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DAE3F075A;
	Tue, 14 Jul 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017374; cv=fail; b=E//HZhI5sT9NZYxYgJDZyAKoUwfrHakFX/3hat3qiScNkVffdlK9xyOYgfOrM9CvSIuesQGzk4BB960IRQHNRS8N24ql9imxHn3DzKzZB2Wz0UPoQcSY/4Qvt5h+QBXZyX3L6MzjcMyK3USLd8CfL7HA8CKG8q8u5fBTYo1ZlUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017374; c=relaxed/simple;
	bh=2QjQzsx6MqWtHuCUGYq0bxG1vF6USxIACZS1bKBrKdE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYEXpRO76SM1yj+bNjp5eEJSQ2Q2nUQ3pZQQrVDoDAxsMnsmQ8LVEIXw6cNzYLx9u4GHW0LOxcOH6+o9voLQ4gQdwfO4nsPPsfIrvalbkDS3RgfYhhAkl81ekZ+stBY2e2oQM3KwdaetHLH5OwsITLOrlAyBKUVXVUGiscJwCSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nPmvncXr; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EptcWnBu; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nPmvncXr";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EptcWnBu"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6UxM51494435;
	Tue, 14 Jul 2026 03:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMt
	Ho=; b=nPmvncXrWBoYp9EjiIYvTQFRY7SgUd743V7t0yj2ndXa7bJVdLoLaHg7d
	zi6FW29gxEL7ALDlYBwQnQkF8rQBdDEfw0j8a4OaWcEbcXflRX2t/Y7cyi9L0pws
	ln1hhJqvC45h5yYl1KYNEVDUAMtnqzVf2JllcL3pE83yQCY6g0RVeXTX4IX7Qdst
	grL5FLALsJ45LXhxOrUUfvJaiVtZmYpIGq0ENfeHQ7Ygjuc9OheG/tVd7IOGoiJb
	IQiYum1BoQyFhFy/Wgt31NGVGMEQfqZwR4Jrms9OQgR0o4JDpPGNdOYuT6dbufjX
	1gbFztF1PlvwPxj/JN8uE6nrd0cmQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdcwu1cwg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 03:22:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDVM228fCNxAIoIcUQZ4RauaiC/pjsyr9vTaCnsrtge2qTHobyMbWzK59cdDHXtDOwup5YlgOnbxQ2SFj6+xuCzKBK7C52jMR05OunTclkhr0m+BBQ52Hf48XOh7Z2IrS+HM1SHhz8ZiHAiKPrOQjiR8DXvN/8AR378eLnGnEnN4tSy4NyFELy7JxEG3FqpUPjHpWXGYlV9S2Ck7gZ78I9qj8ImO8ZCOnyriTK1lCoMT95CGPyJt+L9O6jHecL6qEc38HsT6uZL4M/4eBhq7MR5zd5O5mdFfsfSHRTFi8ODuc4tIgX8ToZ7Lte7mAuF83Jq49t3/LKXzpJR8YfiRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=q/0MsLsO3Y6IekqFi+NDIl9j1pMxMEFLJO9vrtUWEG4pFiAv58wo4nPZWl0ghpLMLoFElnwXPpbLtqrJNoi8xZGZvQOPUKR+mJ20Siu3epYHQk6x+0Jo+nl+2p+Lctk16Jf0zFRbNeYEkQLQCd7z7ZeQFuck2I2o304saUQPRbMI4wpHSTxkApvdsiA4nr/xt3X+Asuwi+P28qFniBnrb3z6EzC3JE5nuCi3vmUNbVkQPlcOFZ52vayq0ehSMR+kbjhw0AJNLSTakdydTzC3rYQLcdpS4W8pVSsnq6F0YhiJ5xOaJBQAiVLeP8+vE47zAV1tez+CaduWkDsP27I77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=EptcWnBuMZW6Q0+eAaJxzI7v0PXHb6/uoa91OZRRhkeAe7tp0/0UanJ9WmAJmCtAeSSpy53a7g4O0pRlbUPA9iRrmmLGpjMInybMFYaxWVl78MOXyg2duhBkB9cgLRFPkmcFibwpc2wqXo7yVc4ccRJl7viQ1FJcAg6VT7nmcTE=
Received: from SA1P222CA0106.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::11)
 by CO1PR10MB4452.namprd10.prod.outlook.com (2603:10b6:303:6e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 08:22:19 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::28) by SA1P222CA0106.outlook.office365.com
 (2603:10b6:806:3c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 08:22:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 08:22:18 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:17 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 03:22:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 03:22:17 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66E8M7Ii068443;
	Tue, 14 Jul 2026 03:22:13 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH RESEND v6 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Tue, 14 Jul 2026 13:52:05 +0530
Message-ID: <20260714082206.501922-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714082206.501922-1-m-shah@ti.com>
References: <20260714082206.501922-1-m-shah@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CO1PR10MB4452:EE_
X-MS-Office365-Filtering-Correlation-Id: aed1ba2c-29ab-45a4-38dc-08dee181054b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|23010399003|36860700016|18002099003|22082099003|6133799003|56012099006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	IGkrnG8BUCo9aRHgYCLLT4ZeTtE/ifDV9GTqonP1/U77aczsqAOagi3OFBEwBCt9x1L0WOxXqROKWJsLja7oJRZe8yOf2t+v5o5xhrBRxRYDBUHJaCJW93Hr/J8WArv3lHl1hWWe9xQ6NY8i95r1kfkVGhlsK3DJoqTlv2p7nyhBuvgteBu61qWfkKtgTxOQa/xrrpJtGWCMFSzwa9094W18FS6KHBkkcYLuikBjpqm4ldksMduwLzXBWGxr663KtHORKP2N5mQQ8IeTgJYYhzbTh1McCQhg2sYrUBIdZHfYGYHAVhqJF6/vFX6JPl4qru6Vi4l07FwuPW+j9XQfDPWiJbaM+apwESDjsDjQ06+6gR73EOdSml2NlydYy+2uepOdi6rFmu21spFN2mzh6ZHSqqqZ3mGD9OC51Fz0zu1xjGDvyka1UXc2F+6+9CCNbkkgzHIXHi9T+drW6GIHiTjHDrAe1WCgH6bEOM+f5ykTxcs91QiGevzEp9NGPJ9s7W6NEph2KSkpEQ5l0MP1dj+c2+d9e8Vis5m3Zw13myThlZhT4ocGUs3VeheA4SNuDFcvJJJE2m9JU/5krcpptTk5QkxranKR0xCHNwRYmcP5FP+p/nOpBFBoW+W0/yXO+GVKdmFwfGyCQtytFKmKDdsqN3SxBdBk65O8WmzPTWTFDmJ47dNGs3h+HB7N5FR2EpRqQvkLRdUeSZ8mR7XouA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(6133799003)(56012099006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DoA72LptMiJe6nDtJeVpLZ6nRl35Nr+bYNTHmmOHKvLc86cBHDf1C2ItvalSCCLF+x8A+tCpyLpPyOo7PYI07mHcRBuZMYC1/VMsk8mTh+q6hR1X7Dl6jQ5UKZO+TQTWv8Tb9H1Lyr1zKuPEbTnl6AjTAhhujh3C7Vth/3jc7pUQMnR29XQ1pfHO5Q8VG5l57bJd/D8PFBkhawZIjACyLmwiklBs8KTECVF91TDUvnVN7wL4XWGN5K2I9KCahmiT/9HE29BgIBggOLgqHHA+66dpZQVAVKHBWWwMLRhreOp3P8HEJrXDLhDw8pL2p6M/Zyo7hCjxCcyUyKt/LqGHcsSMvoRkNb+Kdf08/CQM522GezxtuwNFepl37WEJU3se9m6F0ia3WiFJwNc4fYFTMnzzVksEXW3lN13WBIbEQrJekLcvM31yrrx6syRo2wGu
X-Exchange-RoutingPolicyChecked:
	ZHnBTnwX72bZyYlyDUrNtIEXxFIgbhzPXiNT9oP3lh5NhlGvut23hV8+r6mQQpz84nWQcJKzbZGOTRT8ThryGVZKI3wEXkh54PVYdQfjPaNoL/4A0TX42a4fyy7fS+k0g71KZjcj6ICXAPnZYswTvuJygjTEf9rrmHZQOfcG7majeIJmtPsm3E5gpsz++bhqKWze5WlvqvLI0+WkNkpXMMO3/8hZVCFDSclWARPe0sXBh++DWnADx2dSfAoirLX5v0Zjz7KD4/2mjY+1i5kY5TQOvfQMhfIRuEWaNdqUnXt0wnVpkb2SuSbV8YanTOlgeAPFK5lk2t/w87b715JwmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:22:18.8279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed1ba2c-29ab-45a4-38dc-08dee181054b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4452
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfX1F0Y77JeGgs4
 9334e8kqkY7WCBF8NiW2uhwAzEJauDCMvUy0+D4viy3Oe4uY+GVScXH0Ud02YWAGMkMOI+sXudD
 W9aDud37Pnkoi4nnbiLQA05NkRSWUNQ=
X-Proofpoint-GUID: ZgNIDL1Is_uQ9emrURPmfp1zXt5l16Y3
X-Proofpoint-ORIG-GUID: ZgNIDL1Is_uQ9emrURPmfp1zXt5l16Y3
X-Authority-Analysis: v=2.4 cv=LvWiDHdc c=1 sm=1 tr=0 ts=6a55f1bf cx=c_pps
 a=4NR8cDhszsP7ZiL8l4sOGg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o73yBMAOqiBwH8_aQz4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4NiBTYWx0ZWRfX254gqQnXLzTn
 ORCIIq5L8b0lmcsIiD1KCWXUCsFfOcX1xfJfDW7XXuhAyQdDea8Ox8PfFQO3vJpCO+CQlLEkoQ+
 Eno09wLp+/poyYMeAlQllKMokpvQeN7K1R+DHmfWWINzOvAyHDNnFJ4ZitfM8eNeOjcxw97ONbj
 rT+70mPiefufPBTeRNbn7C+Zn2l+J+ehK98WHyCO2Z4TdgIg81PWLH/vpVdIiETwILPhv9NUjrf
 RllUkrgMwS2IHsedilR12Mnl0FdEpspYQuBIvoy/JL4Q+sz5A5iFEIYSYyocrmVuIfwwS6RIYF2
 ff4PdpvZY9Lo19O9C4L9NDH57R87skddK6YITscmelUSCwepV35RNtOBkoCZhfkz+agqbE8priX
 TOIl8DObJ1laCkDMxXRJ01ZYooKRIDAYOd2WTx4+dHdJCgJw7Dz4nb63InfUDRTZzb/SRLmOhBx
 WHAhsqBQJcJV+uZD11g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140086

Add ti,j721s2-audio-refclk as a supported compatible string in the
ti,am62-audio-refclk binding. J721S2 uses the same audio reference
clock IP block first introduced on AM62. Per writing-bindings
guidelines, the J721S2-specific compatible is added as the primary
string with ti,am62-audio-refclk as the fallback.

Also extend the ti,j721e-system-controller clock-controller@ child
pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
oneOf constraint, fixing the alphanumerical ordering of $refs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
 .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
index b2e40bd39a3af..6c8fb0793070d 100644
--- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: ti,am62-audio-refclk
+    oneOf:
+      - items:
+          - const: ti,am62-audio-refclk
+      - items:
+          - const: ti,j721s2-audio-refclk
+          - const: ti,am62-audio-refclk
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279f..364be49f8c7c7 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1

