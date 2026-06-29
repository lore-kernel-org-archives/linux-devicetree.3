Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4B3B19B5;
	Mon, 29 Jun 2026 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716142; cv=fail; b=oF+kKGHltGVgjcgtIjigmgSXhAefhOvmGlbJ5ZRXE2WYCP+Lt3A1a3VvWJMbii4rKg5xGlU0lVNnrgiTlIixjd0Gjh6gxBI5DJW1GuiVLELhe4OihwBCiklPXzET6aJqcAG9CKuhQGW1IstK8SpKBCK+q8ygAQ+vVJxYJjAyNGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716142; c=relaxed/simple;
	bh=g+kafsll+/VbTBCpPnckIBZZNc5hUY9a+lsFc7iWZIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JiD6JIBnMnhdVrzMKWzh0YKEXmzd2Ce0HMUQd/R32/K0xwg2+YS+zVl6e2AVKHp8EAh1D11SBBNFxUf7XS8a+1d3VWvIdeeZJi/OxEW28AplYUYBp9g+8K8TA3fT47o0AAUAAUX1ESNSlEYGiX35WhkImmpADETP52hQO4/YQwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=FI5cpQ5R; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kaHq+0hS; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="FI5cpQ5R";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kaHq+0hS"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6ksoe1393937;
	Mon, 29 Jun 2026 01:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD
	+I=; b=FI5cpQ5RNY8d/RAYTbx5VtVRciq5q1uBgwObUjzFStDgzZop+7Sbuo9rE
	Il/pvVX4cv0bgWSy2aA7AJKNbCatpqeGdX/YTT/Mv57+gNBS2ngRUW/6glt1/J10
	JhDQreeCs6h9lXD4c47lOGQqsPkR2ArNd7BG0x8+pjZiRFYF9dVlOvhjUbof4Or1
	1hKnz6EGAeQoK3vGLBjIkSJ7Ezevy3mXKhshblKzO+EUN/NRCkhoH8+3MVYH2qjd
	YdSnbn1azdC1AQG/Mj7rSWs4CrXdXujqNgCJ7bNB797DNRMIeVIL21tuT37jxYd2
	PbJ9+j+OmGmdqbKSWRTPBohDTuu/g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f32hjmr1n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:55:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuAZdzNDvW3zdJfsxcARU8Cjs8r5g7YK9ijNm8uB0wlmmmv8YcpU6yEV13lgGiF3/5VvwGpw+UbSZwj3gEpa8xeO5UJZWpE83frJZfjVFBwxZBHisAQlRTjn0vep41oRCiW1ncjsZZ7/T+sZtBsdvUmaFXEze+fX2C/inbnMU1GYI4eqOzIK2FmNuaKjdHvLo0eVZI1Xcj73zkYg/sH0VsBxhnzeS31YX289t4pg/fBAtI8I9j74cLYWRdOTw3EeVgwjVnm6eC5oHPoFL7357F9FSdDE20vF73PDpgrFJZhfZ3UZHDIEWcln+P2eq6dDq1B1BjAUdnLyKUt533loIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD+I=;
 b=o6DtXQ4VJcQV13wiOk0BL9UrVN439NQ90q5kGY+hWCPgAZdp6E1gjmpgPVa1zqVBqdAy2WjGQCOaJfWh2Dx4AvNtN5fn+Tt+AW5lS3Lz7bCAqZn+mvH+9hbEsEvs82suzBgaznYAzWDkowGiRAaDVYD86aPc4ptbjViL4isX7U/7GW41tPQJ8l0waLrb3MT75EzF0KG841iaj2GTYF+k6meB3qANnJSkiQKzvWbLPjPJrrORHv6c/IztYc8TRLSGheJZP6jjYEFXttJbThrgoLLN1gjr/hvdF2NWlv91lwMH6kOqfrYNb4B6+oKdc+M1wgCODAsKEX29/rjcHmKm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD+I=;
 b=kaHq+0hS2HNnbe6vFPsbPgeOLDadm8vywd33pooDT1bmiW9fRJIByS6KhU9vvpOz2pdduu8Feeif16OTuQGABHTC2OjRsmLFzq1TofkRyKiTP8+PC4rwVNztP4EKIBi0BcPPfV8/p4chHhd4eDjUCQsTZYiv4L7ZTqGr33EnRkM=
Received: from MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::9) by
 SA6PR10MB8063.namprd10.prod.outlook.com (2603:10b6:806:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:55:27 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::53) by MW4P221CA0004.outlook.office365.com
 (2603:10b6:303:8b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:55:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:26 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:55:26 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6tJbW4031738;
	Mon, 29 Jun 2026 01:55:24 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [RESEND PATCH 2/2] memory: ti-k3-fsas: Add TI FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:25:17 +0530
Message-ID: <20260629065517.868418-3-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629065517.868418-1-s-k6@ti.com>
References: <20260629065517.868418-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SA6PR10MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dcf254-8e31-4066-1b57-08ded5ab66e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|30052699003|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	J9fOMmyizZUpTqPPzG+1iNn9dSURLcBOfYOdm1ajCnz3jcApdC8xcqG2cpiWxyQiAo5hPQ5qhGLxtgtKnWy+fg6fladKVVYwXGsFHmIxPjQ8XjdwUTe2vfD2GdzcJ+hfSqgS46UndAMmHEdJLqpQXNiB1hPYYUN1v+bhYxvHA/J8akIfkjqSo8snImp3X4+r92wI7nfsTQN3brBiHe6hKuUjEYq+lwVYCwfA2LTN3+8wPAv+qkaih6zySZ6ViTdXn9pFQSo92qq+EmqX4BsCH/2Z616GhMAhdasZYV4HuP1GqB7yOjB/8ReJ6P/avSnB+7FsLvAohUgiuxrP5JrprEN5d1f5KTpa5Jtnz4/wx6dfwvRxFzVlXeey4Nd1FKyGbfaxVTORm8ni5aMJ4zxtq3pwIAUIQQHqXPZ7YLxSY+2sy15EMI55sMla3Gu47krODjhkck4tHMajOyfAemxpoUgnyTRfiiYHca5IZcGHrgazwDKvQkNQ0lvMaml7xdCCBwMUJYbk4kNPoNKgyQSdfhtsTH/NWk6AkbkuoIA1+uSxF1Uu09Jm3Stdj1rk2djsT0PlcZzlMs5TxmhNAr1FrS35SMBfIMq9fkGIhKkvCo/zGkv6DR7z+glMQUd5Z6cQmr5uWQbHCC97dt3fzAeB2Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(30052699003)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7P5GjgwFC7ymMrQH5DXATFW5wXzURzYgu4ph9axwu7UdEZUdMM8iYkQ9u3vo4S4iW6oM7ShpQdyK61gay6cx82jWwR1ZyUJOc0iNUo/uubhg2vM7DdKeDfg7UP8zi3+5xDV8ROwFQj4M8i/mAmiDiYcPItOxEFn92715ztRfJQASZMWPNeYbHiayLsZUpvPdJ7C2ycbpPaq611uf2y8L3bzthFPDFrTA2o4cCVW07RNkIBOa8J2xi+zSQaUxFwWomLLG0ngHRbATfJ8+Ab7sQ2k5EMA2IqZQeRA65pe5/Di6t9edT64nFuy0C/8TT9f+P4+UVe1/LVgjs+xybCbceYl5z6obFzbbjqn1FIcCZ8YkYFHkgWmcvaZDXcqI7dD03blwGH3T3L17JNYewRG7Z8xbr8HJMAGVS/+ZsRNbDnUSAC5grNv//7RI6/Kw37Oy
X-Exchange-RoutingPolicyChecked:
	UsJeLGlHAoFg39uVHPYZEtdDRdqylhW2p7OwPaPLpLELc1impYGU+hjeQ9OHIl57ExrRn2Q+FTv6n5qwFx2ZBpxkvtunMx9/Vp7JoDxcnjt8xG0Oc4e0zyv1xqSPwQw1JNYNGxRzJ2enz8szVyJQw2IjpVvQl74/6Ud1t3Tk7E9ixyJQkU5RN4qQQYcH8EhSDZE531k4ejgE585we3SH4drZvHUMWwgbDitLyRMarHCCe7BEAbZ1vBmRftdGUUljGPL0lzGsLzkjVpdHXVBgGm2/m+haY+vJJSFcR4N1wAs+OxDf8DE0sJypmx6BIIxgE+icIQ9p8rXo95PHt4s2VA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:55:27.4550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dcf254-8e31-4066-1b57-08ded5ab66e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8063
X-Authority-Analysis: v=2.4 cv=DrlmPm/+ c=1 sm=1 tr=0 ts=6a4216e2 cx=c_pps
 a=0bDVNUKav+K/acou55tioQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=-BatZKWJN6v7v1n9xRYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfXyGpdcbIGbCxj
 sBtkgK3a/zTFHV0I0RAt/RADHUieJgX+nlvGZ5htTNYuK5xozoabRRLk6YjvkARIohsPMDSIQEP
 2BdrV84d4o0W4nCAQY5BKgf+fNLUDHtDjyWSSIFR5Y7P6iOQwEe59tzpjfU7Q0zHsWtuTiWJmDF
 vnv9bS0Id29MTPfeTiIhcNPBCJFiHJmdW7SbAAiF6uw3K/erSKqFWIPc0MJyPWGwS1sbbYsi9B+
 YhK8JADNNXM9UfojzcHcwufXUvkb1VEVSM34l6k/SUc9sGJN3D65AabX81HhQKU9zePYAI4o+eD
 aOSIrWwJgv0PmqN+OSbF2PSgAqREV5ZlBIMYLi2yLQmaNwaHsZDbb2lQd11G6qCeapRfQ0Zr+5T
 H7+E5notoRlxKgz1brT79tJXRgRsHHifWnxEdoBBso+gv7MimAfauiTTRso6mieZOvujKtYdIuB
 90tP+queh4EYe+dkIfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfXwwq/taJyB1Hq
 AwJoIJAIkL5980Mhgj8juR2xkJKQ2QYSyIlYc7g9Hf9fBoAHlgNPeoRykqFERPt/7FR6yVTQmqk
 ZkpXRtU6XfkSY4mOMXPLQtQtG9PPHcc=
X-Proofpoint-GUID: 5dOPIUUBemBKfKUP07fGqwgnh_5kRA7h
X-Proofpoint-ORIG-GUID: 5dOPIUUBemBKfKUP07fGqwgnh_5kRA7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290057

Add a platform driver for the TI Flash SubSystem Application Subsystem
(FSS_FSAS_GENREGS) in K3 SoCs. This driver takes care of disabling the
OSPI XIP prefetch which causes DMA transfer data corruption.

Set SYSCONFIG.DISXIP to disable XIP read prefetch, preventing DMA data
corruption when the OSPI DMA source address is not 4K-aligned.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/memory/Kconfig      | 10 +++++
 drivers/memory/Makefile     |  1 +
 drivers/memory/ti-k3-fsas.c | 74 +++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/memory/ti-k3-fsas.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index e5527020ff33..954e47810e8d 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -125,6 +125,16 @@ config TI_EMIF_SRAM
 	  sequence so this driver provides several relocatable PM functions
 	  for the SoC PM code to use.
 
+config TI_K3_FSS_FSAS
+	tristate "TI K3 Flash Subsystem Application Subsystem (FSAS) support"
+	depends on ARCH_K3 || COMPILE_TEST
+	help
+	  Driver for the TI K3 Flash Subsystem Application Subsystem
+	  (FSS_FSAS_GENREGS) wrapper found on K3 related SoCs.
+
+	  This driver takes care of disabling the OSPI XIP prefetch which
+	  causes DMA transfer data corruption.
+
 config FPGA_DFL_EMIF
 	tristate "FPGA DFL EMIF Driver"
 	depends on FPGA_DFL && HAS_IOMEM
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 3ee883c8759a..8dc4860f615d 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_STM32_OMM)		+= stm32_omm.o
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
+obj-$(CONFIG_TI_K3_FSS_FSAS)	+= ti-k3-fsas.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
 ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
diff --git a/drivers/memory/ti-k3-fsas.c b/drivers/memory/ti-k3-fsas.c
new file mode 100644
index 000000000000..9ff109b8d96f
--- /dev/null
+++ b/drivers/memory/ti-k3-fsas.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI K3 Flash Subsystem Application Subsystem (FSS_FSAS) driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#define FSAS_GENREGS_SYSCONFIG 0x04
+#define FSAS_SYSCONFIG_DISXIP BIT(7)
+
+struct k3_fsas {
+	void __iomem *base;
+};
+
+static void k3_fsas_disable_xip_prefetch(struct k3_fsas *fsas)
+{
+	u32 val;
+
+	val = readl(fsas->base + FSAS_GENREGS_SYSCONFIG);
+	val |= FSAS_SYSCONFIG_DISXIP;
+	writel(val, fsas->base + FSAS_GENREGS_SYSCONFIG);
+}
+
+static int k3_fsas_probe(struct platform_device *pdev)
+{
+	struct k3_fsas *fsas;
+
+	fsas = devm_kzalloc(&pdev->dev, sizeof(*fsas), GFP_KERNEL);
+	if (!fsas)
+		return -ENOMEM;
+
+	fsas->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fsas->base))
+		return PTR_ERR(fsas->base);
+
+	platform_set_drvdata(pdev, fsas);
+
+	k3_fsas_disable_xip_prefetch(fsas);
+
+	return 0;
+}
+
+static int k3_fsas_resume(struct device *dev)
+{
+	k3_fsas_disable_xip_prefetch(dev_get_drvdata(dev));
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(k3_fsas_pm_ops, NULL, k3_fsas_resume);
+
+static const struct of_device_id k3_fsas_of_match[] = {
+	{ .compatible = "ti,am62a-fsas" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, k3_fsas_of_match);
+
+static struct platform_driver k3_fsas_driver = {
+	.probe = k3_fsas_probe,
+	.driver = {
+		.name		= "k3-fsas",
+		.of_match_table	= k3_fsas_of_match,
+		.pm		= pm_sleep_ptr(&k3_fsas_pm_ops),
+	},
+};
+module_platform_driver(k3_fsas_driver);
+
+MODULE_DESCRIPTION("TI K3 Flash SubSystem Application Subsystem driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

