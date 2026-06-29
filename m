Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76339A805;
	Mon, 29 Jun 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715422; cv=fail; b=YB7wApL3/iqVzldCpbCKPh122QBDIM/KGROThZAoqYTgBpiIlMeMFjS2TiwQBE15fHTjJs/UZhnjDhOuStBcdEtUtPJ1MTpWLVR3CgT6JZWcz0M4k6oTLw91fcYJ2e56pnQZC+ZbBoCiV2uGeAfZpyDnUutSqjfayZ9Cttmp5XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715422; c=relaxed/simple;
	bh=g+kafsll+/VbTBCpPnckIBZZNc5hUY9a+lsFc7iWZIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVi2/P+iIS4gDbmiQQBTC7L2zST9dAgKlyDADvJCGjBXWxdYPT57UW0KEUpPweUteNPl9r6N+OKmH8qqKxJ7DFiynUTuKxjXlS19jxdaGCL2/RdrbsmNQEtrEha57vi5uVg7SDnxcMc79ZrOsDLV8io2x8Ie9zZCglWLckVJ0tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=DSggC2Hu; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rGp6t+QT; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="DSggC2Hu";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rGp6t+QT"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T2d1ej870623;
	Mon, 29 Jun 2026 01:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD
	+I=; b=DSggC2HuF5kypPUaca/isP3nf18KECXjKALrsrMYFEFo+p5lGD8uq8XYI
	j67I/DNpIrG4LWToYKhKYQ20W4/lF4bb4qDnxL51bsxLaLdjM+wgHtbYz6CM9/un
	lEL/rndlGnDaiCLSYrGrBxTDbWG434SG5zIVLDpBgD1G7mUSmxfaW5P3uMcnpumF
	FkwQEDy2vjPa1HxGLAynK2Z+CgzjPjlmtkLNdQsVcmjyenJeabOW3uBTa7EwVmWL
	jVGaWdh3rshaNpKhVluuHkkDPNKTud4Bozgmo/bsACy4BDSj13th0gK+ms5T//YS
	73pkM0tWGlH0cA171NWmejfTxLmeQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012033.outbound.protection.outlook.com [52.101.48.33])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f2yhmwhgn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:43:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTIQzLqdf6yfEiDFnm/Lttc5P235M+j7bONttgUcARQnLOjThCmTrb/6A9tHny7/2B5hV2YHDVOJPn9rNw3n3uaP97RWLCEeriZ91ezHmX54c4n/HLS68rMfzT5LOLhmxsRbL3JePw+aDpZtQKk8u7N/z5hqGbrgftGl3P78JZx0x1nVmtAWEXbwP06oIO5dfczMJ7/jxU/Jnvd6CJCGgxLDEmM/iKbDa7oBhqu+ccg6slSXfc78ifmNVTbAvch5hvCCAIgAwv55bKBtauOWmdmmznBOJtYK/6zDZ9Ewuqx03ZznwIhHPbiyuR/y/faTcvMQU0QI0x479GE5QOQbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD+I=;
 b=m6tiHvhMVXwW5ltNpViwYFmqlErzeRn6fLSd+aaajQS5WgwY6bim3kITy2ylz+Atr0gmotqUH0HvGx1is83A6HtZaUsoEEGDBxTmTTsa2Fka+Uvf9rRJM9Tz+c8K/COxp2NYdAPINsE0PNkXA6KdhhXfW6/hiJ9x+UPSHDLGUzmX1JYBxmHNdqpeEfUE7b3tTbFTc6Ur6CmoUBeOm5ljLSOgbGvsG22t1Ld1kUqMnuHdQ+xmdpM/A4dNAoBadYXf3ElctHdUZskagSV4ssLMpd+ydlYULVRT6cJ06hyqeKET0Orpxy1YgFYwIsJAv4o+JeXpdsQs78yzhkg1o+Obzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gee6E+cxjJ7o/9ytKwBOBnN0C1abG7B4XotXNVScD+I=;
 b=rGp6t+QThvFEwntpqYJ99wmFIGLIt9F13NYjizj2UFpnVSj49fVP/x6RHJQm4dZW8sIPGt4n1FLXSLf4LQ9311Cix76CWiWWUxJweBW2t9PBDDNGNbm7wAuLUOmaMsWi0qrpoSGmbK10qHJy95Cs4yD6aK+bdKoEYTkZ5U5PbL0=
Received: from CH0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:610:11a::35)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:43:05 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::41) by CH0PR03CA0344.outlook.office365.com
 (2603:10b6:610:11a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:43:03 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:43:01 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:43:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:43:01 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6gd093437101;
	Mon, 29 Jun 2026 01:42:44 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.orgs>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] memory: ti-k3-fsas: Add TI FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:12:28 +0530
Message-ID: <20260629064228.860226-3-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629064228.860226-1-s-k6@ti.com>
References: <20260629064228.860226-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|SJ0PR10MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae65c24-0d25-4d06-2788-08ded5a9abac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|36860700016|1800799024|82310400026|376014|18002099003|13003099007|22082099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	QI45Up6Mh7WNM5WY3+dONn6CUi/rKNpWUWXXcvKAa7VAjtmNEk86cB/OFvyQEE9hQUAG1QNw9sNE6tXAYtv+c3Rbkf25NytsR5kDQcQ4xKWABdu30UmAd6VA98+yJ6ZJ3wmMrDQ5Mv9/h5N1lgvTclP+QtxL0OAGAILJSP8bJT2k0WZlBBD8+PeDjylWHhU7hX3m0yeI0lObbW0CkTQ3Ky1diGWltFLj/3iFFDkEMgAujO+efdfot46W9a+gHQ3hA4x2t+daMyBwnyYBjKYnBbqZqPbXYGrIq+BtsiO15sENv0C105HFRVwKO/ZDQGmPmrfuzGjdhjw5bk1pDJx1v2fT/ndyGriWLxtAvBU8E0HOZAUE1QEza4Ej9iplzI6hgA3J4Fx7zLWsnCmD+Ln4jArSXeCUEv28cpDMFR1EKJO6Z7xQjNJoXg0sSAQ/20G64CVCllESVJ54EDGjNHjsBID9roYh4lQOwZzrS2eQFsmRBdVLgc3S8zc1zM1ATtQqpnXSg+r5x4iH4mIES4weIy/se/8dub+K0ltgeEiH+r6uC4ulq/JfhvwTysav+HUAX4mUM7ZPzSUT7Ucar83ADjUj3k7YA9kSxGbcd+jwkbUF9ebleOTrrlK8A+oxCHrhquNfyh+gRFZ0SqgxligZCg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(13003099007)(22082099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wtje65BlqZdo6x0/z718oWgkz0fEM5AmD8TY2wIdBxQ+nUqMbTWsA/yEZdRW+8AzsbMeAMF55cQziLDUopU5MlkjPVPO4X5A8RD3lyyJCL1mQzOv0jZK9/BU3AKBAI80Qk/S3CufnUcyfMlFSQZEyfFUBZAPg5HsaWMsiFsugc3zbGSzuDGPmKYruu90fDYwXv/EHE+iGrOlQbgHuQpejDAL6tTcO23b/GEdThUK3/1PRgT57CuHdU75yiodIJM0n91Y4VSdqaVZZS0o5Q8whv6jj73FxsO7N5A7zwnv9jtv3BaZFe45HOvGRo1P3OCQ/shXWkTTAzEsW/BGQbJFYNKziHucgdcrqBwA4BY/jPXTOUW9mTKa04pbzTDkX2c9WtAM2Quj8c7t+vBCZZLQ8SQwsFqV6N+diMAi6nFPTrHniLQDa1D+CY3yOJC++7cQ
X-Exchange-RoutingPolicyChecked:
	ApXk+M/DeprWibduhnIz8STpcg0ygBi4/ge3UHb813EsAopSl1Irkokm9HBTDYIy++n23IXThp1xiguNrVM+8kX4DuD24CaES42m0apVI7nys2rVqA8k9k/tyKvVcHMHdHESMju5CLTzq67mJ3iscv9WVXnF3G0yiOjHIlRjLZxQUzwAgTqQ0PI34j9csfyqk3K1v7hDBpGqc0yP98HoFfi1tXIu6IuXT+ta/EDnaZzzKg5biy3oXq9yjCaMyCVztGGUQ3x+HY8CKsTut3rWpU8UWLkeKb7ReKoy6WRMjesn2A6hX3EsX1s9yRqcq3/P3aMuNXYkhkgnG12KSOIpaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:43:03.8563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae65c24-0d25-4d06-2788-08ded5a9abac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX1kRphJtSq+hF
 F7B1eyqzjufsfMTApZ2Bosr4kjkl0LoqXWS94yEmyYbPZD23EQNoc0UHmClYuvT/YaQI53rukxa
 oIUdFvx8lsnXbppiZFt39Y3lY8Xa1bU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXyi55lnZXsyjb
 S2h/O30uak99YBeTcNSVksZWz5jiClJdIeU1P9PryaZcziWSq/uewWHHsa2OqsNcFkpvbCiNn97
 mI/cFSfSFB4uhGSUYrBKYKUpyc8X80E5cAX2c3KUSp+ynSHVw9RzsbZASY/PksjGzxCDHZQaGns
 sRafOG8WvGaBBGBAziuuKkxdoX59LgXHwrDHlYnzeUtVCconGqL1AGJbbx0FCwS1wQPlxV3UePT
 l0aCvNbuuRmnU9eW/MdjsVmoFNWD3SlbYiXfxcDRtSwacIXk5lq5i+VgiD4NhqVUMmAn0PdNzcy
 6sky7IVdD4qiHGBaNvwuCS7aSRkzn6zdbvq3Rnpg8P0FSHTGSwxXdPZ14nlF4WjAdijmFomuWyk
 US8SVrTZXDdd8Nc6Uy0wRmyB8nIciIA3ecJ52e7R2LQcUA5V2Nj9g6SIKT9jLiEeuEqCRcyTEQE
 NMcOp69fkq2BHymdPQQ==
X-Proofpoint-GUID: PpiT5ekeHy6UAdjOsARbpL6NnNozNI83
X-Proofpoint-ORIG-GUID: PpiT5ekeHy6UAdjOsARbpL6NnNozNI83
X-Authority-Analysis: v=2.4 cv=SK1ykuvH c=1 sm=1 tr=0 ts=6a4213fc cx=c_pps
 a=Pvk2fBMKoGc+EtVHRePnOw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=-BatZKWJN6v7v1n9xRYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

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

