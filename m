Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0CD3DDDDA;
	Thu, 25 Jun 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389325; cv=fail; b=G5iMOAy1p4Z7U91AqmpJLWkkD29q2H5GhMR+aU+Nz5tywfm2amM/kKDz/4S+ApKKgAQAsRcW/521xqq45dP/VrIPALLK4klPCOSFafUWsAGb0PmeRot2sKn+mnzdLb4eL1lqlNd3TK9PzBsdwhwspWbPkyzvia/aCqYPRQSKMoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389325; c=relaxed/simple;
	bh=7+w4VXyBA9VWrc4quRY+gl5689cFv479S3ECq858TRs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f4qUGRKNvnp4Dtt/blUIuTkpJSHjRB3pGV1G2iJ8Ny2dNVnvjy2rPBjq6XG+llh5885WeRiTJfiO28IB+Ci+M4dJ8hgE3qBTGQ3BQSxni08vGYqpCsM2M2y9HJji6S1zPiEFGhM/vl3ZMwh44jMX1dqmlcVi/VNCV3oYApjCOrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qnt4cWhX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nvj3gOp8; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qnt4cWhX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nvj3gOp8"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PBFNT33154506;
	Thu, 25 Jun 2026 07:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MhXhEzZStCBaSzGYZzgJXMwR3L4iaFYszwqHKPKj7
	fQ=; b=qnt4cWhXF/w6PAr/5+OiFx02sTBV60GEHUr8xVjtUfq7RmUB/LGEfq8ZK
	2Bee1Yv+SGsFs6L9dmkJmFL0gcLq1p9zZJHUl5I64gAvhYEOrSiZgbHyW7M5YDEd
	hPa7v036YFOw+AeE/XgXdYpyYNqpN3qsIafN4FnnnaQDMyOSn1ggJcLxHdVTuX6F
	lYqb4r5EkVXKxIMw4v43TkrmL3BS7DPetkfXTk5QisOTd7UyCOo6FcMBj6uU5XyI
	0iPhXYYSNCv7ydFC+ejz/MaYSWObfv9zySErA4KbhAB0l0gCVfGuQn0Z9EgvGlW/
	t1MByQ6VvG5ASVT1F25H7DpGaMnfw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0r7fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 07:08:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gloQklA3EO05GpC7jq41c4j8ZyBccx3A3Yd21uJjsrQjfNrQLctMH5Nk57lBXHFRQRtaOS0dIGSeA9UNRjVkbUi/MCaLwtwNCTaPEcO6InGDE+xQ+O4bEjb6EpbIVRGT0f06ZEt5x3uwuDyssdIqJYxmvGySKjgFJUEz+tvabDVVl2VJ2AMglhs0JMbjV3vTj8xdkPDIJpXlBJa52Avn+o/VA75vziHHTc+AHX95XDG/PS7wugG/7/dQG1z3SyCkGfs0YtJF/TI9PPp/xl+Uz/ccP7qiETZePvknK0hcWw0IUrwfRQymUnBecHFmLJedT4wouRkTmvTBUm4gf8qOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhXhEzZStCBaSzGYZzgJXMwR3L4iaFYszwqHKPKj7fQ=;
 b=egCG+CP3ot+6m0Jd5BJSw4gbGnvXtgUS8tHVLFAxwJgZ5llYXwsHMEiuZf8Yr2PfK49mSE+6oFqyg7cZDizk5pDkv2Gxh9uQtFSbDKpPuDJ0eeWqK0b0Pahjq3QwVZvTOFEapXbM5Qeajb8ejTZirVjX71rJhJ680igNadJpNV0XdMgsVwHu7Ey4KxZI6Z/zGbKIYZOTt/xM7Pol6JfjdQMffF577DxrVaft6mDH+aIRXmNBwvMTKwN/WlZrv2z7xk4Z4DLvgFe8EEKRkn3gmSfjQqT7EsFKpju77KCHdO4BCN39DDe/krJQzQ9gdPEw3HQst+W4236D6kGrwxbVYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhXhEzZStCBaSzGYZzgJXMwR3L4iaFYszwqHKPKj7fQ=;
 b=nvj3gOp8SRoSnOQ9uGZ4eLTiphsW6KxtTygOKKb+1kcLYRIyjYNDraJgk6JYGVK00ghE7FEgURMHt5zvNOwALsks2DmDu75xajRwYN13H6aTSVs1B3ER8jb68CLtSD7I2JsaOomUQisLlGShKw8G0cU7tMzzu5hp2xjfeMfPyvw=
Received: from CH0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:610:76::30)
 by IA1PR10MB6123.namprd10.prod.outlook.com (2603:10b6:208:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 12:08:19 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::70) by CH0PR04CA0025.outlook.office365.com
 (2603:10b6:610:76::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 12:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:08:19 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:19 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 07:08:18 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PC86Yv3270572;
	Thu, 25 Jun 2026 07:08:15 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] net: ethernet: ti: am65-cpsw: Fix MAC configuration for SGMII mode
Date: Thu, 25 Jun 2026 17:38:04 +0530
Message-ID: <20260625120805.28948-3-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625120805.28948-1-g-praveen@ti.com>
References: <20260625120805.28948-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|IA1PR10MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5609a0a7-7d9a-4510-29b4-08ded2b27239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|56012099006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	7Nk50KvEjV4G26JOBMk0AwXTAXat1QIzF5Du80r787kYT0HyjLu5fo3dhjLxrgQop6nVOvoOKi4TEWDO+4qT5oldTHlIJDx0XmOlfm9GWpAASKtCg9KKooF1aIK537Gbcwb2xZdcqd698e3WNk/21VHzoetAS5vmRgTvZ5fc+X4mBsqzELKPc/EGoF+oVqL12d6bL9TJ02dSdXrw8mQ4/0o47k/KRMN2dbyghjUS7ambFMX8lWy0nkKYyUWcUA3yjAJd49I09GL5jtVw4u/eAh59ypE7R5xJr2qpfSDgY7gniQzuZHdUMkEGvu0n/iiPW/FIa8XWF1Z2igXmmt1eryBCIZcqbr57KI2Dfx60Zwg7yS58a+bh/7993+sIqxhfQvFLn+sKBeoa7NtgR4GNtUqyDkcyZhHkxDmtB/aTQM40doRjujxTXrmwweiyoX+Cg5ppBoCq1gz+ngDGvobB9OvLEDjJBba8pDExHa4QEifh/RIsYaHhkiqccfOC0H4zG+VxBBUolOyRoPqhD9nbk6AqEo+pbYY2i++Pp6WgindL6CyAxoQR+Psdsm5hKeV11qO/4pIyp2e6IR2PwHGjFODFyTxvamxHYZq8k6bp06PqmXrdO+R8p3e23q6c2dlmDXBO6EMGdcghd5+UPd/HWDNHAnVU8+QRDVDGaBCxpHU0U1E12K5XikQLAF4dE9wzdt6HxxB72JLDgNBso8dV00YT00gxEBUdJ3RdGEJTnTdZKF5b0DUq9Y4z87LpC5EF
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(56012099006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BlrKgWWZlo6jZs9tll5w+/IaisSrNL+77Z+LfV+J0CxO4hHERscZjlbH/iu7jOeazuP2AMt5C+AImY2WvotMB9VHzDk0TRNj82Zis1EMzfPqOn7eaOS4bxUvZkHCHw9m3Bqu8X//xRKADHu+Zyv3H0sEnNSUnltPywvXnHqBjfFfU4jcc3ps8H3uQiQj6IdcfxRE1+yJYK65vLnoMSjT9gEB0EPurMu1SqyKsLTcU2ehK5KZnrXigvrXcdo8R3BNZ/lkdefluwiKTKTJPAf0JyEGuXBDwpoN2lieuu0MnjO2UN3wzU9H3nbG41/OOiE08Yy4oJFgcg4TEpB4gjyq/qRvmc83Qhjfx+6HQam9A13xkOSMvDf0YAFfu1vleDJ3R9JeqxCJZoWkB9YYim7RvqtOmMO7TZYN/SwHKvc3qAEzgSEBALhj8q4+QYIcjLji
X-Exchange-RoutingPolicyChecked:
	rNjvwnBcaAwlgAjkPDoNRPVzF3alA3B1eiSPHY+2+L7igau278PY0FW3nVk4N2tyozrdodcevwfHXqg/ILAyz1tpt53Prhq/4f3UtdcHj19vx/k8ZtSVG9hpIEM2PEXBFXVb4lk5z034yvGmJVq6eCwY/vwc3iTE9Qq3qBW/vzIDaVhXQSDULUDURmr2stL2zs8/i3ZW8xwd74Z57XRxbo/Qp4uCcG05siUzokGizp95JW6pp4gz06VeLoggEfuFTAikqdOOZB+uGcIgz0mortqadW1LmUB5zgaBz/lUMgKB7EU+S/GbnmI8/tqY7J4QQoIESCJOIgJuaLLozP+KVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:08:19.4494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5609a0a7-7d9a-4510-29b4-08ded2b27239
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d1a37 cx=c_pps
 a=kVQeibrV0jayZGAE3rze0w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=9T98uzhKb1fTqeNhA-QA:9
X-Proofpoint-ORIG-GUID: -5HExsrNh9tfHwAL74Apc4SsUnXlk9Js
X-Proofpoint-GUID: -5HExsrNh9tfHwAL74Apc4SsUnXlk9Js
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX9nOMcXOvqc3G
 74fNmD6tILsBdNNITIjnoaOauVxhJyAOdq34Q/e5eRm93x485h9ErFgNGlo24fhpA76tzl/EeCP
 D7asR2ITp6XVKOppK1wt71YdNeIReoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMyBTYWx0ZWRfX4INRxYaCDoBD
 s1CZXhflsVeiWF8QSkBAGnLB1HnOvNk4jo1iDC/yIRZHvoywcLod50OhZA8XxtqS4S2R7kJ+Plo
 iJcom6xwEJhC6o5yZ+LrU04euyqTi9IAlTGDPoaks4k8QxGMV/6tcdWckBk839wrrVtFv2YVKoV
 N7budJH2j4KB3O7tjoY88rkPBCmbLwZqoorJs/9qFJyRWZRuv0gw6mRo4v3cLYyrzxlH6vbYMPk
 sD2lYQDrqWIsq9bsfjTjohZAGRwt5GL7UBrZ3Yg1J549CIIo/VigrWPXNOuwJztsurj4K6gfFpT
 RU2WWnbb/vHsW3xlaZphlVW+CIHys3Ya3RS7+BZKUB8GcVQlr35Z7g2blsXnJbGvMEKJ9LSmE4H
 t52IfuGaBCSiYtPC72NUJKbrAjU264KwJ8t3Td30LdIW00dQG05Cuqm/qUj7ltTglZjsq+4TUK3
 dT7s0V39z7etXoiphfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250103

Fix MAC configuration of CPSW Ethernet Switch in SGMII mode by
modifying the CPSW_SGMII_MR_ADV_ABILITY_REG and configuring MAC
in master mode as per CPSGMII Module specification.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 434a31080855..291697d82491 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -84,6 +84,7 @@
 #define AM65_CPSW_SGMII_CONTROL_REG		0x010
 #define AM65_CPSW_SGMII_MR_ADV_ABILITY_REG	0x018
 #define AM65_CPSW_SGMII_CONTROL_MR_AN_ENABLE	BIT(0)
+#define AM65_CPSW_SGMII_CONTROL_MASTER          BIT(5)
 
 #define AM65_CPSW_CTL_VLAN_AWARE		BIT(1)
 #define AM65_CPSW_CTL_P0_ENABLE			BIT(2)
@@ -2061,8 +2062,10 @@ static void am65_cpsw_nuss_mac_config(struct phylink_config *config, unsigned in
 
 	if (common->pdata.extra_modes & BIT(state->interface)) {
 		if (state->interface == PHY_INTERFACE_MODE_SGMII) {
-			writel(ADVERTISE_SGMII,
-			       port->sgmii_base + AM65_CPSW_SGMII_MR_ADV_ABILITY_REG);
+			writel(ADVERTISE_SGMII | LPA_SGMII_1000FULL | LPA_SGMII_LINK,
+				port->sgmii_base + AM65_CPSW_SGMII_MR_ADV_ABILITY_REG);
+			writel(AM65_CPSW_SGMII_CONTROL_MR_AN_ENABLE,
+				port->sgmii_base + AM65_CPSW_SGMII_CONTROL_REG);
 			cpsw_sl_ctl_set(port->slave.mac_sl, CPSW_SL_CTL_EXT_EN);
 		} else {
 			cpsw_sl_ctl_clr(port->slave.mac_sl, CPSW_SL_CTL_EXT_EN);
@@ -2076,8 +2079,6 @@ static void am65_cpsw_nuss_mac_config(struct phylink_config *config, unsigned in
 					CPSW_SL_CTL_XGIG | CPSW_SL_CTL_XGMII_EN);
 		}
 
-		writel(AM65_CPSW_SGMII_CONTROL_MR_AN_ENABLE,
-		       port->sgmii_base + AM65_CPSW_SGMII_CONTROL_REG);
 	}
 }
 
-- 
2.34.1

