Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4469E466B0E;
	Thu, 20 Aug 2026 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254170; cv=fail; b=KubmX5/woVsaQf8XurOxVyol1gPNXlevY7rU8KJJgQHsBfG2J1/9Gflw7ExvfyD4YGUmO8KBqJdkMsITvu9ud3PBCvqoIuNwSy9ANP1E2Gq5O3OHmNJPiuQZSxgOndiptjJsbNDQcj2YDPfKVhCK3ay2U+4keH/N+E5ezqgfzrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254170; c=relaxed/simple;
	bh=u+4fCGKuc7Bpf5ww6UtwuSlsmVjzAGbH6LzXl2KSMTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FFf9ZRX2V++hBAF1wbJV6ZgRCja3cjo/Wi0I8vzYWqRC0xMM4bU5ir+o2n2ZDlauN1GpADW+JAYHi9STdkhKl+AYWIq55GnsVzw2vzVWYLGFXE7c6PIxkwYPsFwGvABxEkRs3jGlzDtsj+jhJ277i0leiNjTJmTG36PO9QWFU1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oXMy2ZDh; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sPgAZ3fk; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oXMy2ZDh";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sPgAZ3fk"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIKXCG1699111;
	Thu, 20 Aug 2026 14:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tzH7cR7AiYEafAw3J33wCFdGK6swY21NApTbMoses
	J0=; b=oXMy2ZDhpXf8p5TPLYnE4y7uy1TRgckp8S0acKvIJ59dz4K69wDiCnFn1
	IvKcztrT8GQhkgrAFcfliXj1+MTBbngviK1Sa9kQ7xYZf+ZOw7zbSBL3KoD6V7tL
	rF9BbAFa9BL0GpWeyonUbK9Fpu2S6Q4oQD4wJr0p94F/T5cA4OPaeCIdfL3qZxGr
	Iq37VII9nuzGBq3CcOHuuIXPSFl8Q1xnWk8bjm6suemqXQ3VVn1pv4UFFOTDSSYk
	Te4pk1PJXKSo4MVLzmWlPG3oD6lhBl912493xlTSuuY8yEl+KRjAa2cAQeVbPpGu
	EP7o4mhcU/G2TiDW4tJEvjyF37uqg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g60gfb2yh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:29:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh0Y8t+df6Q83KpAkdF3BotFa9ksKfqj3cKkVVRHCIPy+X/KN50TxZ8e6NdGHYWX6CN0QnfLUrhOH1+jEfnxvryx6hlt7YVq5hgQWK6p6hZMnIfYKACkM5RW4s0qVV/Xd8QYOyrx5zPkI1DtSy1w4yQvErj/JB5ok4xceN829BwvjN3/D7bxK4W8tI6AhkOFHafYFCCiD4VNhO+c0RXiKYn5pXr9x64hEmhM9jm/bs9hyju1MhRurTqcfNOC0rh3q2qVvmdT+XqqD3Dh7LH3fKBxLVoYOkfHkArCjfxU2fILoevurZlQGlrPKWMpEWK7bgLgS2qJ5IEsDIcwe8rtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzH7cR7AiYEafAw3J33wCFdGK6swY21NApTbMosesJ0=;
 b=WPrjaeBQH6BEnBQ8pQVHOi4ljsFhwAweFbEf/k3jWEw1sTCUJJO9ku31vQkt1/sxLcjVMqeztW5tmo83ebWFiO4MtgqILuM5Iy/gVeHVEfkwwYgQxzn9poFg5s26eVg1t3ZM4neGkNT3Ej/ojYibGwkUH6TLjM7kWT+6nGl7K/Neh4tiH3HKSrsY9uYePAA1oEPJLzZ6yfgSgh/bv1bOrPiC8c25CtILRq96ra0TOsQ52/YpwHKoCsMW52jVYZCAjL98n07elgyENHjvTYJ4NmBFjdzj6Lgl6ovXRn+iYSPVM6Jfk/bvF+MQo7mE9Snk/G2VrOfwByy5KuyINF/KOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzH7cR7AiYEafAw3J33wCFdGK6swY21NApTbMosesJ0=;
 b=sPgAZ3fkGIS+h9Fk1UmKmKGZAvwk6DKK++x/U2fdfLLUy9/ELrlbHb0CJOBeiJWhoro781HIv6icYhok8EdJwRA0p51BW9/fvREPwEhhjki/YjZjWiwnoVs3kbzhYNFda6NYc7odeqDiXCglsSXoxSVfrgz3wWUAD0l0AmKLcD8=
Received: from DS1PR07CA0019.namprd07.prod.outlook.com (2603:10b6:8:44d::10)
 by DS7PR10MB5038.namprd10.prod.outlook.com (2603:10b6:5:38c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 19:29:19 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:44d:cafe::68) by DS1PR07CA0019.outlook.office365.com
 (2603:10b6:8:44d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 19:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:29:17 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:28:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:28:51 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJSpvH1779937;
	Thu, 20 Aug 2026 14:28:51 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 20 Aug 2026 14:28:46 -0500
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p5: add standby cpu idle state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260820-upstream-standby-v1-3-6a0553b9713d@ti.com>
References: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
In-Reply-To: <20260820-upstream-standby-v1-0-6a0553b9713d@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787254131; l=1737;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=u+4fCGKuc7Bpf5ww6UtwuSlsmVjzAGbH6LzXl2KSMTc=;
 b=28MRaJaqjuF5v3k4GGxZ/oMTbDLX3q8p1J8TfyHgloLofjxKOaAnUGDXcPeSfVHjghSC+aGNe
 SSoE7pBiVlpC2leORM6dJB7KL/M6eMHjTO6K7HdJjkOHNh1ozqWnTRY
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DS7PR10MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 0782704c-03ab-41e6-645b-08defef153b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GvYcAtUWBwXlOAEJUvD3PHfmTzsBeCn2uPpkLfjcz1HDG/M3bczc1N/FAfDlGT8WwyHRS59mU30lhSTvTxdEY+GcoHNz4VZst4M53dnInD7I8qCaIe72WObVMXGZ7QR31KldxDVnoMgP6eNUyelf/k0tkXeePqPhRMSy2awxpmTG4KXWwOufXc5Hnx4Cby2fHez5usw5i+4IxkZZyIGeGjmTcJLKsd9ym9jeLXpUiWfblcTuUN/V8NY+0b3C3Fiy8IZrXLP/VD0K4hk5NLjXv8cllS6xjlo69LorDbk9zFvRobRi08xzC44MBthhLBG5EryljkHJF41bcmmYlgREDQmbZjlBIbqMBPytBtG5nVo4VNx9sqEVXeH0P1OvP6TXT/IhPtIedTCn0+l+FIhVylfV2WXmyUckc6pZb7G4+vLV6Vo0I/Zu4rMZm7lqrVpNycfDdXUVK8qZ92m7WwgABVsAxSyiOTzpPpv/mLsUpbcCOEkbFopTUbdaPvfLXA887IWP7IND0pM8WTTeh2CMNpvXxyK+kTJtJyaR+M4q3v6A0YnOo7AU4egerZl/mQF7ry5q0WUCS7CNPDUQL7ntJIdWu+PubO93441Vk1pwgYFYvojVlehkFfLPDBONn5FCAOormE79jZBYqBTghjhZ98iA/MBov+hKHynY9DcnuJnD4I5STUT1SxZz9GNxmJ+GnOyvyL0XUeNWD6x+vgINfw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MOkdGSLzkE6++60CTHciwExTYGkP5pFhgYgT4bo8Y4IBT28Z9FKrhVJDGUQE9kKlDzly/hv4qgT+2u9QbTYEFGmKWX88+Oc7aiM0GeEefo2gS5ZzqrcxnZZeGMQscnZDpa1Htn9dD1lEZYiZoH0GMQCkoC61UrqusxMe/S13lNP+ozoCP7vbgnlHHKOxVUEYQBK1U9wiIctx54y2JzBuAQxhYWovu/5CJcUzIOGygRO7VPtn0W59dyKJirQMf1vs6DSzHodWNKvKP2mhSnEaJ5AUjhIt9wj+6/xBYeFASCYYroRiVbcjcIdKhptq3co8/yHMKs6gx8fF6DcdxVOqaNrYl9BrFQhjcohQhtg5Pkm6ZkX4kKJbnZDUaRWMzL5jWj27nvH0fxAHB763FYHh8Djfx3keDuB2j1UOjGBusWPN5c+YDI3g9aY8ZkHfmtfW
X-Exchange-RoutingPolicyChecked:
	nzbEJ1nPwVgpyGl5n7y5QBcJAatyDW5nRQhBfm6LTqh9y2Kh5k0psINSbwc4/pRCYYRfS/QUW//0twP31PsJsh2/8lAoWWXXl+U6vM3Nb6Ac0sVS2LPznMYKmPAXfoadO3BBNlvDVb/6YGByhSvyoz5N4b+B1yjnNlB9NjTXEm8dXuh3HIg1sXJOIVKN9mlqbJVFKFx7k2FevKNaV3aONQv1FsDUKarTSl36iJm6lj9PgUIzlaFWQQ0p4axAKhHuFzCpEu3NPJ+gAHvB4dxrTd8xlNbFUVQ/Am5WLD8UuBO1XmPagdqgcMih/+81hE2Y2mK2hkFVTBcaThwACnXgsA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:29:17.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0782704c-03ab-41e6-645b-08defef153b4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5038
X-Authority-Analysis: v=2.4 cv=N8MZ0W9B c=1 sm=1 tr=0 ts=6a875591 cx=c_pps
 a=tFiMKzbuKqM0PzijJMXBtQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=g99NUqp_MWcefphZU88A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EOMmyCE3Ccj3VehqtwZ2nDeqWrsXSHE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX5X8V0GYDIKOF
 fCJgSpeJQnQIIootrFZkiazfX9trUmx9WdTGXJg+he9zSu82XoSWDrGPzbQcefx685dW/5S1f65
 JfaSjxSgFebj7A0Kb3lsiYJbm8ijzI/hREF4T8RNJd3Q+hnwOQ38lJdN2qEi5JiiKY3qXoBgR2U
 LEX8BueEHvsrRl3rt0Tv9CQt6RlBe3q26dPna24sR+MRjIPQqMkcGUoiK3iCRfRra6+BGVWsa2b
 g510LTh5xsvAGM+vZZykG/aI6YVaWDz4XtHvqBYCDQUH+9inX4nEBsy8NigBGwYlY/LBkXwEAcj
 TV9/aUbxkviTmmwiH/4pH068HJLew3rlZM/j8gqhVxqMif+ZCe9mcKl14OPaOJvVzXyNlTDnIks
 u5RGuN+waSqcVD5BFhY9xS+x7tHYYvhrV2aDx5Ozj96fYYkWgzcGXTow+kOtnruh7sVAGqHVUoG
 Pqc6Zi4bc5jPQfAL56A==
X-Proofpoint-ORIG-GUID: EOMmyCE3Ccj3VehqtwZ2nDeqWrsXSHE6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX1QLaNgcOrGQA
 oyJ037JoZHLZIljc6+C/IQi9bFe7hA6uaWPIOTE4s6aZ74CASEgxuaC7YBcj5A+3ahbO/cGnqi7
 Hio+oIWbrD4T72rBGkb2wcURqFwO2Jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200146

Allow the A53 cores to enter standby mode on the AM62PX SoC.
The standby idle state enables the CPU cores to enter WFI through the
CPUIdle framework.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
index 8982a7b9f1a6a1d1a0eebe9342fdfa5d46245159..74a588e94e22a9addb44b2df495d5a8ed75967d4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5.dtsi
@@ -50,6 +50,7 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 135 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu1: cpu@1 {
@@ -67,6 +68,7 @@ cpu1: cpu@1 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 136 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu2: cpu@2 {
@@ -84,6 +86,7 @@ cpu2: cpu@2 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 137 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,6 +104,20 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&a53_opp_table>;
 			clocks = <&k3_clks 138 0>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_STANDBY>;
+		};
+
+		cpu_idle_states: idle-states {
+			entry-method = "psci";
+
+			CPU_STANDBY: cpu-standby {
+				compatible = "arm,idle-state";
+				entry-latency-us = <100>;
+				exit-latency-us = <50>;
+				idle-state-name = "standby";
+				min-residency-us = <500>;
+				arm,psci-suspend-param = <0x00000001>;
+			};
 		};
 	};
 

-- 
2.34.1

