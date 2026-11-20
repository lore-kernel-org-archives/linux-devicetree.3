Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177444;
	b=ngIijyKlBUArrHIXLog4DCqvuqdBI4QJr9Q0U35fI2txLJCnLpBEOWEPXecEDxQwaYF9
	 a94hcKRZvCMs67wlB8D0d+rBaIRcpsxz8eVgrNiU7AUeF4LiSnvM62dJ/buF0zlqppRx3
	 GLS2vTMgZNLIEX1RFiAtScS85KWT8TjpNsntLeurE5uI2naPX38QKfHKO6h7E70krj4o3
	 HM7MPABDjHy+92WXUnDjsDfFlo7s6esQsOfAp59JrD5HEAT2QF0wCdloNvpbeSb/ip5FC
	 TtTY9EMz+a8NLICvngmtlwyI4fW+WsnuJ6sRenLBEnUxErepkR1nxF8DJe3ytBAK2pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Va0CBO6fLlcGHKXc0ZD10I3Q5EYFIBF8P/DRU5pwFeY=;
	b=xSIFLz0KS7emi6xpd+AhRTSc8eNj9/NPuX8gc9ek65FRJrccwU3vVZfPd9ZE/JOgKFqV
	 Ht70m4uEjN0WCdHyszgBWEEFDho3M+yY3iliqBBvAJGuygZwgj/ncv3dRX5xgfMQSi4uP
	 F8zak4gtsUD8tgMmU6jLQkRqZh2sLZRx6hvHyyc8ENkC2RYZSvakSc5sVgCm8F40dOLpx
	 1G1uS9bAtecNjdgu/EwFOct78df3QRWTeXB8k1vmTMBGJBxXQvVEg7HzUwpCC3MIwQPYu
	 7s6UN2H7xXbqbGuFuiqcjG8wTh9hYpK8EAyfcYsXF2+G+/4l1x8W3UZFbVtieFhki6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GMSBOtOH;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=fZEF8p+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF7C606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF7C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GMSBOtOH;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=fZEF8p+K
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk5xP3504959;
	Fri, 20 Nov 2026 06:23:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Va0CBO6fLlcGH
	KXc0ZD10I3Q5EYFIBF8P/DRU5pwFeY=; b=GMSBOtOHIamNsMNRqy5E7EwE8ja3f
	vndgdqq6GNBS4cAw/9VExTQa9Fqtd0HbsnWk2NUI1zVL7HJdLa/gqZAAyMqnpLlj
	58T6pyUQknwMFJDyDowNJ5hkUOAOlFS6Sqbw3mpk8yp3VOaiaHrwJZadjmvyxgy3
	5kV6AlQD6XBrNX+nABxuuxz38iuI+8CwusZ5ohHpFLxrwa9wW7MfMmDnbupXJIG+
	k27L2cPZLVWMOAFQUAy/M4DazPbpIssTk15hQBCuZHYU242RxKCYphtucWu7YloE
	1PkVKCxCsqWosdsTQuxS08EiT7B7cbYcm8lrpxqwT1LR4kZOet9G2j5Gw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j281nm9a5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 06:23:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgqiOmNooE417PFTtziDTRENtFpKz8rW6dyNxSflE9k0YjZWU81mcs2/vUeNJXbo2NpodxetxtVmOKNcPgHmg/z8buc3WQhZ+QUHgU9rX6vnLqpB9SkVJ6sJuC7MZCOFlHpgX471CuI7HDBpnKsa6xPp5wSAfHakaaDJvxuw4/IvWl3lrYh+MAUvsh91i1TDFC85Zq8uQbL+bu4nFoYQuNXJvMjrqQP30U0otV6bubflDWVZp8zZKmFwG5BfduT8gABZ/RxKaAXaXb8+V9dMHGnMeLbZW0rosRZFUqulsmpd46sjneeuO4BEhge0U8lx+B0yVTPcccWiPBhsNKmeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va0CBO6fLlcGHKXc0ZD10I3Q5EYFIBF8P/DRU5pwFeY=;
 b=NoZIT1hOeg4sCJ4U0of2uBtQ6yuIf5+fj2MQUt/p4rAFciMdDI4QPLohHacmSzntT4/nq1tL6gnfErcmJvY6jUBwXlteZDATCrfVSP1aZhP7pWRIBKXBprA/u7m8m6rzFRQk2o4po/7XCtVYkgcvYkD6hy3e8QuhLap/rtTNy6wEMQbDtj2gzMH3yvf2RT1ZWr2yf2x85yKHsKyFfTRpuafq/F3cOCAKfrJuWTRKMu2Ynwni4Nc95Q7cNQ4NoLxeGdH7oxmTA3G1QFYchPf9fOo07tRMCdbBP1P8vx4CI+rzbCNRTSPaWU0m1Ax7h26qSuAri2KYg66J+vy7Sesi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va0CBO6fLlcGHKXc0ZD10I3Q5EYFIBF8P/DRU5pwFeY=;
 b=fZEF8p+Kj5y76kJ+IZxUbVyx2fCksXrarLkdgMeEx+aHF1u27F5Ym1COQuVn2juy8TADiwj3nR1R7Nqd6g3a2RUuI0NKYoItI8VDBYghSyayBq6Ncnnu02AFhVh+mI8pant+wRLvDiZEQ5179HoNcEK88U63fQI9xiB0NVtUyf8=
Received: from CH2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:610:50::33)
 by DM3PPFA632C0238.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 12:23:45 +0000
Received: from CH1PEPF0005BD5C.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::1c) by CH2PR16CA0023.outlook.office365.com
 (2603:10b6:610:50::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 12:23:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0005BD5C.mail.protection.outlook.com (10.167.244.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 12:23:42 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 06:23:08 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 06:23:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 06:23:08 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKCN7Mu1088725;
	Fri, 20 Nov 2026 06:23:07 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.73.69])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 6AKCN6BZ008594;
	Fri, 20 Nov 2026 06:23:07 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Siddharth Vadapalli" <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <danishanwar@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL hog polarity for Type-C
Date: Fri, 20 Nov 2026 17:53:03 +0530
Message-ID: <20261120122303.38795-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0005BD5C:EE_|DM3PPFA632C0238:EE_
X-MS-Office365-Filtering-Correlation-Id: 48078f46-5d51-4c9e-29f6-08df47011d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261022075727099003|261021123027099003|10067099003|261021121427099003|56012099006|261026121527099003|261102123227099003|261009223027099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	nT7majWKcSnungRmwWyI6MJSCqI6hO9xg7ryMRLGeSvF1/vKB31HOsQMGpQAH1GezNwDzE14/OqC54saANENr2bUEorfbahXG+jB6eqQtJZz4dNWALPQAfhdV3X7t4r8ctYE/uzImcWD3n3jeqGGPNj6iYBtH+37c6cJDvsgUuhNb6oZ+9rh4eXmC/l3i5ZN+awy5kZ4pAo3j03lIgnh2Mg/O9PIpphz9OVBemcdR9OBYkzDbNjiCihwZV0/mYL1lV2LgUicMHZ7pSedAUeBdZo6PY29/1QN0YqRdJWKXwoUyBi0YdULkScvLI1CI1FJQOwu7NcyIg3ZaiRivhVhZaPl+RhHoyyOMG09TzaY2Gq/HOxyvOjbLS1GZXM2RoqNtotVvjjAXqAPUrdArthS0ltZWY55iGuwlP5OH7/rg2TWvbeYFeX+fjwX5tJqPVFQNRh2mFVpR50u88GyjLssax4fMRKDyAVHWKGu03lJqcKgU3L7lYdB0MQk7F/zBoJQtvkeRhXLPvsA8XkS16dFyKrfifJNoDNabnSoSW6X1wjDiELjaLyFOrj3BUNWVwSENJp3sbYVVaCX3NDGTW5xXMnzUJ/8wIp3srWjOd8w0DsA8GOhfcupLi7SDSTFlh/YuTbMWSrKzfZ09Yqqpa0/4Q1inbj/LUkfXuFqhSkLb3sUNpdYsLLeykgAMce953T1mdtL3LCwvOC57OIJvVeErg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261022075727099003)(261021123027099003)(10067099003)(261021121427099003)(56012099006)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ef4PpAYygQafqmQu/U3tuSfmtPVkaM6ZoBt/9d+dGcfH9tK8Sw96XwmYF+q3yKgQDYta76xLArdRskoysO168ur8Ma5XdBqRHua33Ws6zxBfsA18YQc6jlrrCMoVr7yi/WNU7Z1LIWR9ut7kYUxOMFYU16BtVvZxiutSbrdhOLcsP4KdJH9sLybLkhymsJct7xWw+h/8yfQdr/n8O9+d+1AHgECdnigJCkw26kmB5HuR4N4zkdrvVNnflFxr6ox5gGcRhX8gV8VeD26K4mf2dknEDSaQH7d0Hyt1p8TrQ2W1bPHBBaKt/qvU3tBH6Fk64++RZfMa+xAhP+cL+T5V70cTonIl2iq1fasJZKlFK0TnYSfu2GRAL+CMb6B1EL94L3lXu2iR+vpyKMV3JthhNs/OHRfaSwgCr2TyjyfQUXPtSJc7SaJiMGfglyhS/EGa
X-Exchange-RoutingPolicyChecked:
	4OLx89ho0/3NkaKTIMGag44IyPkgyCcf0kUWPYCzwJCVar880uM54QBPh/Bu8FmVrRl5qQizXcCyHnkrwSVsKodbzO/CZLYu+i0jE5ipEDMsN303R5DF4IC/7jJRyAdn9Nl9eLcvfa0symXSLqgNRr92xXEiMxLKR1O9Ny7Izm3vVzLsvqSg5yDwDLhy97WBXNZZsBfuVAtQmQOR2psanPO2KVSrjf8sWW8tjodQYOpPvcvLduOydAG6TDy7Fjv6y2F/EW0hu5+f0CUsvHl+xkVeWDSPazrtzj6I+jZ0A6jmL1pEeohQWJd/TfD7N+e2y3RpkTDkffgugpFZrBCV9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:23:42.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48078f46-5d51-4c9e-29f6-08df47011d90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0005BD5C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA632C0238
X-Authority-Analysis: v=2.4 cv=aIZlOr9m c=1 sm=1 tr=0 ts=6b003bd4 cx=c_pps
 a=D3JKZc7amZFyEdfjSn7DlQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=0QROqvTylk8XpBswj7IA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX6gLGFKbtlBta
 cjbtsOVvOCgKv4z2agn/qR+v6dcBil50wI9Dx65AvaKV8G2GySW9+XGxEX/PO4RykaMS2tCopR2
 CAj7Cf0nWzpIk+YhKJz3VWzWWRApZwQ=
X-Proofpoint-ORIG-GUID: y2Pe76Iyipj1wk9L4j1qltdTzQweOqdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfXxgEzqOb2LV0E
 HXIdeNWUYDE5zXlI5QVz+3xZmY7TDXu/0K+HA+k+JjbHGgFk6gQN0vZ/2nrNr3fwO6pkgMorcl5
 sKfEHato2t2eiSdRnLX/StkyX6Al1uaI42ZPirWumgB8ZfE6ngLvoH6GmYl6v56ev/oFZQLy/rL
 +sDdt8rd5PvDdhM5GhUn9YMFHHKtjFfq0QX1DWQgZudlVLqsYEVhixsWRY1dGsh0D/uHg7PngKm
 vUD3rzkFOYLlgXMe/x57ancO3isaOP6n3tj1eWD4jP4CEuLXOxqm8+Ospkx0eC3d4iZSrqzlHze
 vmvrHI2Oys94M0sY/7ZMaM8uBbsYL5j6dLaLT2jo6kjlORjhIyEU52qa69hTDIDlhExyrHPgd0o
 oFMpp49oCGW1kyfVL2j2mNJwcxIEl6HUh6nfjzElPoQP/K1jsFimDhMRdTr+l3wnbL1nERnDSRx
 q0xobIhJ7/gHl5SW4Hg==
X-Proofpoint-GUID: y2Pe76Iyipj1wk9L4j1qltdTzQweOqdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200049

According to the "USB Type-C Mux" section of the J722S EVM Schematic
within the Evaluation Module Design Files package [0], the Type-C
connector is connected to USB0 when USB2.0_MUX_SEL, Pin P05 of GPIO
Expander 1 (I2C0/0x23), is low.

Commit 65ba2a6e77e9 ("arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog
level for Type-C") changed the p05-hog from output-high to output-low
while keeping GPIO_ACTIVE_LOW. As the polarity flag is applied before the
level, output-low with GPIO_ACTIVE_LOW drives the pin physically high.
USB0 then does not work on the Type-C port: with the gadget bound, the UDC
stays "not attached" and the host sees no device.

Use GPIO_ACTIVE_HIGH with output-low, so that P05 is driven physically
low as the schematic requires to select Type-C, and the devicetree reads
the same as the schematic.

[0]: https://www.ti.com/lit/zip/sprr495

Fixes: 65ba2a6e77e9 ("arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index c6486cf5a05c..80a915925c1c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -586,7 +586,7 @@ exp1: gpio@23 {
 		p05-hog {
 			/* P05 - USB2.0_MUX_SEL */
 			gpio-hog;
-			gpios = <5 GPIO_ACTIVE_LOW>;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
 			output-low;
 		};
 

base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.34.1

