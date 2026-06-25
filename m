Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152E3DEFE2;
	Thu, 25 Jun 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389324; cv=fail; b=eFwJDva8myg934a9DiesS7SB0jz+HowTEprbrn7GNCRzArQ0MTymrmbRKEhOPqaojFprvh9Yc+FPtjMqsY/EgFD2RiBey2tNXgImGOINZbUFKAZcIVZMOUFahYS4qFWM23+9TzBbuM1zkhHrK4t4TeTyQv53H1hLpIvEoLWK16g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389324; c=relaxed/simple;
	bh=6xKJlOzpsbaaJaW+l8Mp6mpa2HtKfOUMQrLptdxXH0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMA+Hle4xRX8368qhLiEktKYtI4K/r+so3f7zUlrcLqdMZPuWtxmPQusKRAFW4VYCEHBc8z0ADj+WxKt4RKqRtNaRmPBm7M3WS9XmA3VA0wfx/iqydK4Za6/l7M3abXgeg0g6Z7LunoIqo6h6kziSLnGWSu7QTcEWIAcerzm3lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jslEXXRW; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xgR0aRVN; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jslEXXRW";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xgR0aRVN"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PBFRZG3154591;
	Thu, 25 Jun 2026 07:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VZx9M1rfyxOv3VCrFBa2NgcYEwbObfxwuKZVu1dnO
	YA=; b=jslEXXRWHdhia7VLKGmf3zbBO8/3KF2mHedtWzjngYmZskqrerPkuia0N
	hRDih7t3sOnnb1p2kfHZhbrknEU2tY7ue6sUhOBWsrynHxwkXllPaxyjkQOCU/bN
	fQlRqnYM1baQ5C81MNg8DZBieeBB7ddJuFennI6nhpKfG80yodB+ylcRi4oakV0G
	zSv0EJ9v6r+qbduvoNz9AN2Xg2CiiH5RdbOOaDRhOunhAwV5aW6M3GzjYn1PCeUX
	GPgOezwiJ21KLf1XocFYoU6yWVVjt+t+mcAITL4iSD2DjgUrRNtIPnngPb/kurGz
	Vxgsb4Ynzj6l1r9mK87VAvBLlxREg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0r7fm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 07:08:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpsjvGTGK/4eVhPCZWKjgrhJkqe2P9DU/q/dCKSDsujdxPBjubgxO2854uJp9nRsmfr4zUK4ryZi7l8JC4mzDtKt90vIT+rjme0zECLKui1DHV59N0j8cpis1GN31zJTMZEGPKDp0DMQzjshrmsA6tJr8s0327ZSofALns/YAZ6o2QpSeymdr3YJSaofZQ3qsnKPCubqup4Iwa8/TblbZpg23D44X8R9yXrf4fIPT2nqndWFJuTG5yFRSul3xxqLI4cEqJMJM1bkWRvSQj3/KZSkvZZO2wmIV3lz7w7RitzGwk7YNby3owpCf70rj7VRL/+siwdbfghZ/+db3Cyn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZx9M1rfyxOv3VCrFBa2NgcYEwbObfxwuKZVu1dnOYA=;
 b=JmP5DgkOaGcE+nCTGEwT2SSRairKl4uWV2gNWmpYTzxIEfFOdMW6j+L6c38tUrAulIlYC3hGp2LtfOn0YhI73vv5qe163cldrhR7kuHDVo9HvJBnzSFxG8mJXeE9c+900nLReBUU47k/N1pUirx/nlbkIxFYBe9Zcs4FX2Hrhp96tjQ4zSDUmWodSr+R6wZPaWKUv8rsjSr3S8OqKaxpHHAhO36Tl7+XMTiCs/X9K/jPpRdaEP8zydiS4a11+L/C55dGT4aP19TI2l8gcRx+t0W+ZnbkUMLdRCMFxvDKIFqL1sDllbEpFsiJCEHi4Y8R25qIg2DVSDpJe3YNNxt6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZx9M1rfyxOv3VCrFBa2NgcYEwbObfxwuKZVu1dnOYA=;
 b=xgR0aRVNLTdOXp0uEIn5GMjADACiPXkLgPl1KiLr6aDD/e318cHAY9pARkmiGRF4t2bzQ/4kLU1R2+UiM3wQDgzIiGOUgR2vakNuSsiS/W6NEU373i0UpcSBr29jvlrz2pWVEARCS9lu9MH6JFIUzVlXqDg+XWjMIOU6etlkqUo=
Received: from CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37)
 by CY5PR10MB5986.namprd10.prod.outlook.com (2603:10b6:930:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 12:08:25 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::2e) by CH2PR14CA0057.outlook.office365.com
 (2603:10b6:610:56::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 12:08:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 12:08:24 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:23 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 07:08:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 07:08:22 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PC86Yw3270572;
	Thu, 25 Jun 2026 07:08:19 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode
Date: Thu, 25 Jun 2026 17:38:05 +0530
Message-ID: <20260625120805.28948-4-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|CY5PR10MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: b75e7a0f-de43-45f5-fe5f-08ded2b27572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|921020|13003099007|6133799003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LxQuNikbVw6+vAYjMl6QddBgpwDd7A3jUhMRauCwBwaMXDsHJReKUQdOkZxH6WHNgBnbI44QLLmCxHTMS79csiIh6O+1JFxZscLJRdtmXjkom12cgoeHXFRkj7tgtKiSn7xEaCqxfYr9qPluRHThASby5/Ycwfm0ewyifnHC8bH2SDwpVbuegtIDl3vttL0t7UKVuMMoqOUWJms5HrzyH73DffUtdgukohfUDSq3GHb+gCZnX2LBz/YOSP4+JT3kdpdV62SPD+h1/hfSU8vAP9ChQKGZxEgVzNoOZMZHdoL7ddglF9y3yB8iTkz/MWlShRcLa+066ccExQTRRYFwNWocUGZv2vECuq7V0JIpXorBGJfkZayF0rbs+lUBo6tB64pAs8GtLgqdCgbSTwcSfCtsJXcdvhSADDWwVg713HNFjRP0ua38fwkd2vbBIc6p120QEsBecxuUfhR2U6zSh5gkxwyujzD9LsJAn+6Z2TZDnGlu0XRURjf2IFbzvqa1N1JEAAv6udGaCfdriYM9846czR5v6IVY6Gx6bfEmN4JlnRnvDOdRO7ezf7tMPvwwGqwZf9XYCCBeTUdVxCqT3LTci7/mH+8rWjnI0Gkc1bSHaDjCc7n4cknSl/3SwUt4AmP2sjib/+OyaZBkLK1L2e+tCEzyTcSVdKTzzeSAfkhlma8Y49AMLtOFW6/gb1bd
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(921020)(13003099007)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0/x2sEFyclBsO4ky3MhX3gZT4qDKJo/2Ocby+Um4fcaRm6dtM1FxEmX+NVrHXUt1I/cgtful0sFerpxAfUNtbi+G8AeGIDYklDrgrV2l22H0eEpPDcdJ+iYhIVpAs3bnTjQm0jaeyYzezZYU1W1wgnDrNptYWCF77QlSUfflGFvT0BE37bN9s+bUy8qWp69lTjpnWP2T3ZI2DnrhEclOh+6eDKRSn5E8UG6edxIAZu1LSB+6KfNS8PEqrzCVwF38OOWgsInWuPtE9D+HQg7d3MCghrkLCrO5PoLJxwrcU0GMCA8VHhzMXlqHC0k+yzuc6XR1dmjOY3ekKRHMbK6FK7uQTTgFRp0JPmj5bCf3DZGTMOBY8TDrbdlIDPMbw//NWqJ4ktBWK45MBjbkxQT9Cbk5BfLSNH/WFOs2JMSQVrHeR29y5TViOm0FMvyQq4s
X-Exchange-RoutingPolicyChecked:
	fehJrJtVDhs2Ouni5/EmDPVMGPLd4su0fWP7cLolO2sWzBGaFvZBcjLYXkIdQ+C9kXKuGYri2P1d5QTlJ+ry4vPPDqAAglu3juELMg5xS2k+gED5uHdThNv8LsbhcSSAJoCHl8LrA8S9N3tXi810zGhEJScfvIuxHVy2VyPqUc36kbAq4b2YmLyA4iV9CqPhtHP8uHaL0l1xh/uvPMhq9lf1cGR7aOp1GdgTlBKPvifNpkDGhLwDrVQ6q1krcB/aQ56mq71RrOs+jRSCyyuUBWj7LNGlImg19Y0BR2dk+HInQkKS9rEQ9S8CSnpahkCCJnp1Uhqwa63o0Idoy/xlZg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:08:24.8787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75e7a0f-de43-45f5-fe5f-08ded2b27572
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5986
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d1a3d cx=c_pps
 a=5LsHMtEjVXEroYtotTqlkA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ihQbKY1oqo232dlC7LMA:9
X-Proofpoint-ORIG-GUID: GdkZzljfVySz6pFxj_D0KcaBbQ6-Iu8I
X-Proofpoint-GUID: GdkZzljfVySz6pFxj_D0KcaBbQ6-Iu8I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfX3GyTakA8U0yL
 m5fOFv9mPDQNeiQbMdyLlLYNaq866TQ6K5/3avDxwdM9wxEnkAtnvHvUD3WgjSvS5iKbXG+KnIG
 b+ekMIXI3j2dtmgBsvlR+Js/mHmg4NM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNCBTYWx0ZWRfXwQXrs6J6haLI
 Rx18xC6ZwL2Nof1LzV3BfKIFThyp1Net7lSj8MntjSAD+Y7uXXzYSpKaeorxz+zcF11JJpQ7e9z
 DlkziIoVlyAiS0SsQqsKQqtICKh/BjikPxb4TwFROhZvDPN8ZosSobKFFNwiewKqkvllzcozazv
 NhcuyUrojNwo9QhNxf11mzG53JWsunEYmYfsj4zHtF6kudlB5w8EEI2/miIA3BkZUQN04cMgFFf
 zNudsOyzRvT8+ycfVRiKu/dMHZXiCQKMs5ZL1yqcgYrvWI3adr+d3qeZyownfuShmh/2UkkDusY
 YgfMyM0wvDMZ9x/i0wVEoz9hiDKDHUskkC8hhyXDzLwyckjPl/3XXhb9ekra+yEoAxttQzBy//H
 bE7LiT8cnaTrN1tQYAgE4EnCeZNMHw3kjnz8v4OpGie6DBECZSbzI/dnwuCjKMDai4Ai1/I6AlL
 Y2kRouL24KsH08VPh3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250104

The CPSW9G instance of the CPSW Ethernet Switch supports SGMII and
USXGMII mode with MAC Ports 1 and 2 of the instance, which are
connected to ENET Expansion 1 and ENET Expansion 2 slots on
the EVM respectively, through the Serdes2 instance of the SERDES.

Enable CPSW9G MAC Ports 1 and 2 in fixed-link configuration
SGMII and USXGMII mode at 1Gbps and 5 Gbps each.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               | 11 ++-
 ...s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso | 93 ++++++++++++++++++
 ...s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso | 96 +++++++++++++++++++
 3 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..253706415833 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -199,6 +199,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -338,6 +340,10 @@ k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1-dtbs := k3-j784s4-evm.dtb \
+       k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtbo
+k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2-dtbs := k3-j784s4-evm.dtb \
+       k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
 	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
@@ -404,7 +410,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
-	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
-
+	k3-j784s4-evm-usxgmii-exp1-exp2.dtb \
+	k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb \
+	k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtb \
 # Enable support for device-tree overlays
 DTC_FLAGS := -@
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
new file mode 100644
index 000000000000..553546b281a9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/**
+ * DT Overlay for CPSW9G in dual port fixed-link USXGMII mode using ENET-1
+ * and ENET-2 Expansion slots of J784S4 EVM.
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy-cadence.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "k3-serdes.h"
+
+&{/} {
+	aliases {
+		ethernet1 = "/bus@100000/ethernet@c000000/ethernet-ports/port@1";
+		ethernet2 = "/bus@100000/ethernet@c000000/ethernet-ports/port@2";
+		ethernet3 = "/bus@100000/ethernet@c200000/ethernet-ports/port@1";
+	};
+};
+
+&main_cpsw0 {
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&main_cpsw0_port1 {
+	phy-mode = "sgmii";
+	mac-address = [00 00 00 00 00 00];
+	phys = <&cpsw0_phy_gmii_sel 1>, <&serdes2_sgmii2_link>;
+	phy-names = "mac", "serdes";
+	status = "okay";
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&main_cpsw0_port2 {
+	phy-mode = "usxgmii";
+	mac-address = [00 00 00 00 00 00];
+	phys = <&cpsw0_phy_gmii_sel 2>, <&serdes2_usxgmii_link>;
+	phy-names = "mac", "serdes";
+	status = "okay";
+	fixed-link {
+		speed = <5000>;
+		full-duplex;
+	};
+};
+
+&serdes_wiz2 {
+	assigned-clocks = <&k3_clks 406 6>,  <&k3_clks 406 5>;
+	//assigned-clock-parents = <&k3_clks 406 9>; /* Use 100 MHz clock for SGMII */
+	status = "okay";
+};
+
+&serdes2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	assigned-clock-parents = <&k3_clks 406 5>,
+						 <&k3_clks 406 6>,
+						 <&k3_clks 406 5>;
+
+	serdes2_sgmii2_link: phy@1 {
+		reg = <2>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_SGMII>;
+		resets = <&serdes_wiz2 3>;
+	};
+	serdes2_usxgmii_link: phy@0 {
+		reg = <3>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_USXGMII>;
+		resets = <&serdes_wiz2 4>;
+	};
+};
+
+&serdes_ln_ctrl {
+	idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>, <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
+		      <J784S4_SERDES0_LANE2_IP3_UNUSED>, <J784S4_SERDES0_LANE3_USB>,
+		      <J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
+		      <J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
+		      <J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
+		      <J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso
new file mode 100644
index 000000000000..c98be3bbf2c8
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/**
+ * DT Overlay for CPSW9G in dual port fixed-link USXGMII mode using ENET-1
+ * and ENET-2 Expansion slots of J784S4 EVM.
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy-cadence.h>
+#include <dt-bindings/phy/phy.h>
+
+#include "k3-serdes.h"
+
+&{/} {
+	aliases {
+		ethernet1 = "/bus@100000/ethernet@c000000/ethernet-ports/port@1";
+		ethernet2 = "/bus@100000/ethernet@c000000/ethernet-ports/port@2";
+		ethernet3 = "/bus@100000/ethernet@c200000/ethernet-ports/port@1";
+	};
+};
+
+&main_cpsw0 {
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&main_cpsw0_port1 {
+	phy-mode = "usxgmii";
+	mac-address = [00 00 00 00 00 00];
+	phys = <&cpsw0_phy_gmii_sel 1>, <&serdes2_usxgmii_link>;
+	phy-names = "mac", "serdes";
+	status = "okay";
+	fixed-link {
+		speed = <5000>;
+		full-duplex;
+	};
+};
+
+&main_cpsw0_port2 {
+	phy-mode = "sgmii";
+	mac-address = [00 00 00 00 00 00];
+	phys = <&cpsw0_phy_gmii_sel 2>, <&serdes2_sgmii2_link>;
+	phy-names = "mac", "serdes";
+	status = "okay";
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&serdes_wiz2 {
+	assigned-clocks = <&k3_clks 406 6>,  <&k3_clks 406 5>;
+	//assigned-clock-parents = <&k3_clks 406 9>; /* Use 156.25 MHz clock for USXGMII */
+	status = "okay";
+};
+
+&serdes2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	assigned-clock-parents = <&k3_clks 406 5>,
+						 <&k3_clks 406 6>,
+						 <&k3_clks 406 5>;
+
+
+
+	serdes2_sgmii2_link: phy@1 {
+		reg = <3>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_SGMII>;
+		resets = <&serdes_wiz2 4>;
+	};
+	serdes2_usxgmii_link: phy@0 {
+		reg = <2>;
+		cdns,num-lanes = <1>;
+		#phy-cells = <0>;
+		cdns,phy-type = <PHY_TYPE_USXGMII>;
+		resets = <&serdes_wiz2 3>;
+	};
+
+};
+
+&serdes_ln_ctrl {
+	idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>, <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
+		      <J784S4_SERDES0_LANE2_IP3_UNUSED>, <J784S4_SERDES0_LANE3_USB>,
+		      <J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
+		      <J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
+		      <J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
+		      <J784S4_SERDES2_LANE2_QSGMII_LANE1>, <J784S4_SERDES2_LANE3_QSGMII_LANE2>;
+};
-- 
2.34.1

