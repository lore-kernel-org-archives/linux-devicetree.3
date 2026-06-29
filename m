Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F733FBEA7;
	Mon, 29 Jun 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728624; cv=fail; b=KftE1FyHWcP/ZEfXShl+Dj2NX9sMKdJTh3/tbjpohlhnAW9GiwAkUzT43le355kTEOK6bp7OXM7r3rRp8JGnm0MU+0D/C7M8j5RY7EMBXr2KymffzYWm5Y0ynuzkfzzPUchv7uNq+UeE970rS1Ih1uvsGe9qFZgtXe/JgaP1+7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728624; c=relaxed/simple;
	bh=lur5xWIASWGYuGWT6GaKHLwbB4M3d6qeupw06U4ZtNo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jlYatFSObyqeTpzWq2hGTGUmiTPghwDKK5A7wbz9+UfEQJkuYD/5hTREmcl8pCepWno8ZBwiZMwvBt9zT1mIXkcsnasavtO5qfV5cYVjvmgghz7G+U4HiVZfnNiJlDHMBShOM4PfkFaPsf717FSPPiGmJ5gKH65esDo9yjFfF6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZltvXsZ8; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=huxREUtC; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZltvXsZ8";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="huxREUtC"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T6kiVe1217038;
	Mon, 29 Jun 2026 05:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zWpjEWZYJrXjKx9h08seuOPMP2jFb8orVqC2W8n1U
	Xo=; b=ZltvXsZ80l3LruwP1Z29XSWrcGZeat91sZI6T8hvJPJOEHcu7XnZO+xen
	0TTSf6Wg5MsI6EOaaNkshfhyp2XFrt+q2dg2v7hcV37tWf6fIyP+eadFzsEkRuly
	TG/AxA9Zj8qtc6Wttl2Oddp16wWr3cNMWe+HSAUXtq5J1CmUM80Ln8Xh9n0hlNtl
	mCtCQciwtwe0NuBP/0rtd5rGSD3S/CoFcb4r4kKxUZsurrPuZswZI/eGl3+LX2Ro
	uoXwTMMXeCXdYDwJfmGNwKJMSLAFKhntw0xrDv968aeGf3/fjWGZtjjjV11BBQLw
	jM8J8XqMSl0bCyylb7258vYcd3vQQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsepru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:23:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UI5R66L8RvL7poslBP4sn3aJ9XO+R5P/LFj2yaTOTqrlwtzsxlx79NJAS6sRPoqokAgilytukVN8J42/3C/qALiJAC8TlfVuYUqQzpt2KHFwoBpU4I2fzVlaljr9qG5Ma9G2daKa9HielPoJy12yj1YP7Bbg+M26wyrmFT3xAR8K7xoQ2kKK8EbB1zu0C+qmgCmJw1BMZ2wt7LlqwMS1cmGOT3aA82+zkTR2fJf2aGelFcpUhGQK1eaqS+I5ua1NEkhRYaP06EN6w1Ol8uCcGXKQSAZ+imDrqGkx2DJP8ZpdcWSNWHJiVuZCzPIxrVnj5ZFPF6tkQ23TnMng38blzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWpjEWZYJrXjKx9h08seuOPMP2jFb8orVqC2W8n1UXo=;
 b=NBb2F1kh8Y0bBnQMIUCIKqWIiIMCCXRig51n4lsB0PmOhJJmFu2DOnWLs3RMrqK7VX60z+pLDFyAMzBWVhBkYBhej3PUsCkJqdv8CVHbFoSv3S423JC9+mCwlQsCT0CdzRFNDc6Jds7kHmW5mpWeEAp1+HpiK5Tc+Z6xo0LuVCF0M/nPuZMcdlP6KnDyNaeKc8AzWsZl3jf1RbLlEAcD0Vh+S4FwvuQTlDNYjcSeJCQqGl7SMzUTaK08l7a+Z2hLzjBLU14/lnAJujVupOd0xy00aD9frITCTq5QhFAuWRWbwwSFSQWda30848updRaAarF8arSS3BYp0FIYlPL2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWpjEWZYJrXjKx9h08seuOPMP2jFb8orVqC2W8n1UXo=;
 b=huxREUtC9pASgLCGVl7gI6RcXSN//e0alxT91F3soGhQ9obiK11/OjfqHk/0mWoKxz+TkAxXTAjfRe0I2hA7u2frPe2gN2KLFyJQSxO2fZYNVs3hP6B9hWN63seqTanHz/AtyK8e0U3sIT1qm1i/4/DT6dHG6L/MdsLKF0VBJHw=
Received: from SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17)
 by DS4PPF9FE99AC64.namprd10.prod.outlook.com (2603:10b6:f:fc00::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 29 Jun
 2026 10:23:28 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::8f) by SJ0PR05CA0102.outlook.office365.com
 (2603:10b6:a03:334::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 10:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:23:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:25 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:23:25 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAN9oU237237;
	Mon, 29 Jun 2026 05:23:22 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode
Date: Mon, 29 Jun 2026 15:53:08 +0530
Message-ID: <20260629102308.56616-4-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629102308.56616-1-g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DS4PPF9FE99AC64:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d925f96-4b59-4258-1734-08ded5c87534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|921020|13003099007|3023799007|18002099003|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Rr4glTTR1oBuQCNKYIv+UmMtBrYv0WlHNzWqNqtqCF8h+8gcFxJoG2CDdchNBK8ylFBz9X/QWsTxNH6LdvkGspJX6VRSnxZjPSsF7Ofc74hU3K2/hTY2d/qr03rXjtUSO1J5h52OGwdCEUAjWStIACOX0r0/zveNkmT/XKmmgaIXZWs4/8L5AWJN3Il5QeQ0CYtL59UwTHy5f/P/X0FQOUyXZk6hgSY9algx5C0x/ebolY1nG5WCmN7lOz0xZmF7GOw4A7O74Q0sIjCHqah1bI6KXKbeII50/amFgCKlFBGSehzff6i0U19PoJMmFPIznst7j88X6TUEbe33FbBvpnCYgi+3Glo76iL0o0KHxGmLroKeDGtdxKMO9n4OQeBVCmjXeqNab2nUD8BPeUcJ37J5pH2QwsRMP1hY/cJPC7Pn2qIQIaj9FO4gxP2a3u3PLDosKiZlgwWz/FCWjGl7lRosBFQlyCLs+RCBlzitWa5djX5+ZjtHgOa/4F3Z/aiv5cwCSEu/kwKA2ReTZc/E3mqy4nLhrdya2zswG4zXJuKe5MnUy3s0MnuU8gR4/XPgccn4BmT3WJMStSbI+h47opPkmomtLm+pYNz1TQ5t1RqZeaRElI0XMotaDov0FEP+qtODqL7OkMoSC7rltaWpuryQKMOnJiH6E2hufSONR8gzneWLbC4Ak1YOLLFGqgMy
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(921020)(13003099007)(3023799007)(18002099003)(56012099006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Tjahy7LMxrlLpsnqKpV9r4U4KaqPx3qJ7iCFHBjZ4WppROmOF/vgeu5rLTkpihAG5IMdZXm8p/RZEikLKUpFjyn70+68VBHuokginPmmaJ28KyTAMgmiaYSoevMKzBA9/WZvdvG5b0JdIZdxLiPF/ithxjQpqlMYPKMXKIR8ylbF+mA1WDzuFdUd6QT3YigL4IBvY64JEFTnD1Aspxsi2AN1Vdf2AKqEmWGyrb6GAda9PNLuFcTWDHiTMfMuwAKdST+SwI3kAUWBAYVE9BejZC6u0hlIhTXl1EaCS4ZjIMBb2G0ctuOoNnsiODOHrW+dgz/aIhDg+R30V2auGEoklfZUvnJ/U2jF2UjUXfdgGoMwe7x5JmU4gktMSLQBSADOPY62DBeVNn32NFQKkLzFh0/iC/HgJIk3ivLiZtwrrx6e5NKDh1nZ5lgf+cOUUgbD
X-Exchange-RoutingPolicyChecked:
	ScKWJRl+A2kHCyy/f29i30Pv1plNDzQQAL2lwkm9iBds7nJ7U/f8lkpjyhNnjpnVpJRPi+FR9xVJoNuGutmboqpiNjdnIvvWB18crbGNxM8K5rgjnebFfv1x6HlIFLWnDZ6wxsUVxP+4MDk2yBW6j2tbCaQkSkG2LXzUuYV0X4EExD1BYIdMJTBKyABjK5b8Do3CQmtyO8FNdLdEo92gPvPTCtF9j2VKidtmUWFdrZMZeJGqmxySjDMYu7uaW9PMd39nzCDak6KwtvxnFXNOQzukftD+fXHrSZqyi/OdsdRpZyem9RFpvV7wJCqYxwucar23fZCXqTFJUcIFk+wI3A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:23:26.8431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d925f96-4b59-4258-1734-08ded5c87534
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9FE99AC64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXzM3ccToR+Lb8
 wWlQRlf7xyNwjytBwuxGhM03R27ie03Tj7O7GiLfVs0W1ES4kOzqKy/YPlWF4b2Gf+Mpf0QtPqM
 M3puyZYCF/Otec7PhhGw+2HshszgEME25iDBkg62sVHOyWM7INgUpgaaf+nnhjGEODdrRUN0ql1
 5lQwQubhGV8bvtUsj3C1yyqX7zGwDxsdayBxDzfwhLbMK0SwIQFh6ZtOLJ76QkB1W3eqTknEBDC
 m3lvTXvvIAqO7cyrMf8OSUROzSH4+4u5z1JIhP+u3ijE4lHFAVVQBLbbAfB97VI7BSrmRvWU6ES
 os9UbLR1H170r0S3LaUprDi2qbdNxc1pMppskzBK9X8XxmaxCh3c6w1Jw1jVzEbYokXs6pECymm
 eeO4nsDGrj4QFQttjR+SWTjnpxXL5OnUqi3j95F6uG0V3oZ9E+cHHZgHxeU3nsNHoaefYbbq/T4
 IqW+zYA1cdHvFxzaxJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfXxcQFFWpXYzlX
 cAB1/JfDGMB9xyyig1ku2yKZowAwVJkL+I4kWB0/qxiSriqslEQbMUf0dPaZ8DxMjkxJFtZUIBp
 MDKfMudvvyHZgs+W+keVTQ0w/5v8cyE=
X-Proofpoint-GUID: RcTz3PEVcLimglQH9wYyvBo6SBttjqdV
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a4247a6 cx=c_pps
 a=LBR8CsJoUNkXwF8+XrmcNA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=vgQuWsfiJAJnhVesZcQA:9
X-Proofpoint-ORIG-GUID: RcTz3PEVcLimglQH9wYyvBo6SBttjqdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083

The CPSW9G instance of the CPSW Ethernet Switch supports SGMII and
USXGMII mode with MAC Ports 1 and 2 of the instance, which are
connected to ENET Expansion 1 and ENET Expansion 2 slots on
the EVM respectively, through the Serdes2 instance of the SERDES.

Enable CPSW9G MAC Ports 1 and 2 in fixed-link configuration
SGMII and USXGMII mode at 1Gbps and 5 Gbps each.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               | 11 ++-
 ...s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso | 92 ++++++++++++++++++
 ...s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso | 95 +++++++++++++++++++
 3 files changed, 196 insertions(+), 2 deletions(-)
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
index 000000000000..4ceb99c5c808
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtso
@@ -0,0 +1,92 @@
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
index 000000000000..ef4ebb551546
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtso
@@ -0,0 +1,95 @@
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

