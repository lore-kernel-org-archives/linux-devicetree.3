Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BDD3F0747;
	Mon, 29 Jun 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728616; cv=fail; b=oAwE/ld2cVxsSAZUR7Mq/6bKL7n71v86rO3AuYnEOaulDjeCenx+2JyYCEqbPAKrbgmr3UVU5kwKQ/+Op8VYVNeK4D2J2xjRy7Sw1ffX2bsqVzalIAf+OclVm2JdjG83lkOFlxkR9v4maLYjF4v5Uv8rUwtZ1/6PhP+DzjkQTG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728616; c=relaxed/simple;
	bh=e4Deda8LUddJR6dBfMM0DbCjpDEZ7wX3UBKXBy4a81Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pK1zlQs2OIFLaB67ZcF24T46IbD7bTSoTcaeCseRpy0b/qkJ0krrWr1SdzHeJuQRaV2eEAuJtuEfEGHjS16iHOVrL3IOynWzFaKofo19gsw+e8tzeGoHYa7xlmYJGO1d6H/Sd9zRD9OlwqZG93A1MuwAC6sblCEGD4kNyx4baWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EggLjde6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SbRfJoC2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EggLjde6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SbRfJoC2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T6kfge1216915;
	Mon, 29 Jun 2026 05:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+ZqydMNg24k4ly3f0lyowH5GJs8FnsBa+RqUoxUYO
	pQ=; b=EggLjde6dJQzl8CaZ+RZ8SEmVRUmoGE2TSccyK4Cj2memBtYZbW9A+Xp4
	G0/7BQ0D0+HL04SA3gz6/7JnbwaQwBODLEFA1BYhB44fahYjuiVeE7qaOfzznkyE
	6By4PkhcbVHyaJhB7KySdZO5UlPOLSKGNOAiworPbJtjHtUduxPuxWncbH6/vQuX
	YmTiJICUmUqYCkjY5DURPoYAvEH7L+SQYrsPNA/yTPACQDQQ3EJOEnzyFBUMvjaF
	jMvDTflzFTyGZ6SmgP9efqWg3gnjKiRco5ljWgEpYk019w0RVhHJoUzIAUQWR0Ll
	gcB8A8ftc13y2FUDjh0tSVKWAWsGw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsepre-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 05:23:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMc5Cua1GAqNCImXQ5fpMRcbsQXE6TrMzpI3Q+RPl86Fr0iBfrTkTqKAf1mRlN1jjzC59VqAK7XrIGKTyLsrOnS0aIdQZ/iMKCzYgkG/8pfn9fHzNJ/6c6n9edn7Ez1W8QDaiR81Z0s2MV1W7bRnfeFr6Nsa/T77urW8hHnekPAWC0J76k8Rxu7efAmcxWaTg462qKrz6PsxIIvctnboSqkoEkxUFgsKnaltJiT6NySQ8RX4Qpep18cHWnEhdV3eulDQGaIXMr6m5+MuHOzKEbHr1mdU5MoNDChtexAE/HbdpT7kpX6reJy2xe5EBq8Bi3CbzkX9hqa9j9Osokt5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZqydMNg24k4ly3f0lyowH5GJs8FnsBa+RqUoxUYOpQ=;
 b=iTEE8DZ8BgL5mZXO7iGol1SJyF4kX3tXEtDWzxKlcdE/iqvMrDdfqt6N1XzhWAHefGbPobwoxQVV5yWWl8MXXcAfSDercqWJuE7z9CbsCM1elewas8CwHeUeLP4XDmYY5p1NhqiWM/ZuGB44PR+qpJZaP0qStKX+EJUGlCOofOf1FpRDXJ9huUKSE0m4n5LOyA4beU1gFrVIAo/NJNtemAh8AKj4HXLbn0iPuWFziqtfEzzwSxT2kxxUYxOs3w7/LnZmvSpMpYDiEfLo+TCHMRVFOG2yzfw6FzevhMPgzKO1Bp/O+9KlvxxlVFl+9di38OfulIJ3sgBFBpUDF8Cwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZqydMNg24k4ly3f0lyowH5GJs8FnsBa+RqUoxUYOpQ=;
 b=SbRfJoC2kZoRqSZicYd1VN3TW7YJ5o98LkfrWAgCXo8WlJLRa4jboRa3sZL4rZQ/pAnOsTQgMVcXExD360f57BUbgBeKz9iYsG6ict+zYUaljAU+OWlHEbpSnnKmRUDOnl3DCZAgWS+unWuW1O5JmGRlTQ48dDWc0RywX3WxB4Q=
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by DS7PR10MB4989.namprd10.prod.outlook.com (2603:10b6:5:3a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:23:25 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::89) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:23:23 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:21 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 05:23:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 05:23:21 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TAN9oT237237;
	Mon, 29 Jun 2026 05:23:18 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <conor+dt@kernel.org>,
        <c-vankar@ti.com>, <s-vadapalli@ti.com>, <krzk+dt@kernel.org>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>, <pabeni@redhat.com>,
        <kuba@kernel.org>, <g-praveen@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] net: ethernet: ti: am65-cpsw: Fix MAC configuration for SGMII mode
Date: Mon, 29 Jun 2026 15:53:07 +0530
Message-ID: <20260629102308.56616-3-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DS7PR10MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b6de4b5-b578-44dc-2825-08ded5c872fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	cZsNdQ2zAqr45ofsBnFtTYEwaeQPcorLzo0viwRJJmjIgdDCYLOHIGnCe68z2Qnjqjfz1GeRlWU6Ob72vQiryNTCXRskD7XuhDZ4vY6tbmnf5bNUltYDAv8tAJJ4RVTnL9B+3tRrOnDZ3LLDWCaqc1kHT/mvh52jM++GoIJUbTSuupealwTPrCF4o5ho9804b4060Qoo0RErwMyxftIYWqP+jfYH9ZELASFZXt6An9QaHQtusSATHPGvtLMoKlWYnOMK+eJm1gupDp+iHn4WDkLL50j3TLbZwmTUUC0D5MLtC1y/OR2DzVUI4xF5p7zzm6Y0zDv+Ik2BhcfBfKhQNA2T3hNuDz77q3KFU8bMPHo/Blc/v+M5cQDNQ5QiT6keyfEK165YYSTodPLVVH5BicYgEgxvacnfe6Cop0hMmVCZ5I6rD8OasqnrPnuUeSNmw/uDte+4BX84y8D5tOAyiNCbJJL/wsvpi2d4ql2SkTu5PhQODrKQr8XC6Z47SIPe9vbNYuYbOp3o9LQIEYwzbZYBeXqZp+W6JHhxAGnowjtoqV+fh7gMPVpegZbS13ex7qYaHbCsNvJtdE98L2a4glOZ6NeAZ9ZG+4ojztO1+v7DkdmFKt7cQOe4+5oooija5IhuDNz9x8/xL6bAnAdu3BdMNKDAYMBOReIW1LrWDLYIHqP3g4EXrjuxoKA0/y2aVBbvoUPWktxhXpSmBoeF37UL9cLQbp4ItYpa8O+K3e2Lf7BjY4reR/Iu5n54OZSY
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O8fV8JpT/lBEdGHsgHfIml2xjFV3U7qYprHKM4/utBcIegjnm6Pq1HzXiG9v9Vgd8eYbKOXRRdsvFzBoAWnNzleFGHA+xH/Xhesw0ZrLuLbkxUls3Y6Xxyq3EaEermkyJvIHE+iuJXJ/K969sXlwDpUYd43q9im/+OltVaU5gcjls4RR4bTnpZdVzwjzPZMUJ1fOb12Y9Y88fPed93qS1korbydAROsuzpw4y8y9oRGMdoRggJlYQIdcgLC1k9B3+l6WDxntVl9dhMO9FfyM3KZQypJvIHn6jw8s2OhIwovaRxp6ptyOMuOHdAv4jSfg43bVjxxUwuQ4JBg4WlZNw0W+VG6/s4Mr9A/q1qBa/NHkjS3zXj19fFSh5kgyNsQmDjsqIhFHKbZA02aX3ry9rObkZP/fvOPVEDANBjReKHvSwYnzI6Vo9IxaEqPd9ZN8
X-Exchange-RoutingPolicyChecked:
	Ltyn38HraPUmnzl5zTAKXFdyJWNR6FPMPHD5kHzYkGP1pKEFk5rrhDdKeZMm1Fk00HlxIkXsRXeftUyRuWV8bI7VGqxzxE9H0jaMIr3MDhA87CTm7DGG/TsFxUL0XEC6ZJObRM7KFAN5vLLFrH5DFpBigZc808lHz6AuFJtSqF2ztWAjDOSba41R50mgEX8R/fdLsmL5uZnmJMZlPq3BEo3KzhNd9rjN0YKA5FHyyO8S2W4ih3/l/aR+xucwLQf+/Tn2TU4l/9V0ijL5seZCcNRI3dF9zaMqKJtd07R8Soq3YBXdc0kE3EvxGc/Nx1nNGfVFyygkmb4oHx+BwqubAQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:23:23.1143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b6de4b5-b578-44dc-2825-08ded5c872fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4989
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX57h6yuLYAwy5
 DZKTPfv3Zl/0y3wGOiKr0+qrPe8nVNlCHD0DFFKqim9sbVHpcvyqsOFUuEApzFYXaC2t6Jv0N8b
 5MNR4GR5uyya3OoXSMJL2x/SNG+VvIO2+ib1CMtGH1Nm3GD0JFgMmapYr3OTHON8sOcJ0pBPkPV
 KdGVFyiBXTXeI8EPuMkd+rT0W6ZCoHqWnWaWPBkO1msc2JQKdPOAb9W5PX6ZuaMAh29RTOz4p5I
 bNqZ3mLlUX1KlGU6JTOmOnnAEJJlTXqR+3IEnx3ACiGLMhqh+pbnk9TW8O1waHP6/OvMQowZnH+
 4g5p0x7YUqJVoe0yFh7c/HhOinOiPIsd1Pzut99+BYJRT9dM1xUtzHceynODQPQVBnNp6PfUHzK
 CgIvZqXBSNfxjS6SXRrvB8+isl0jdNb8WpOmsvr1lJKOvmHn6kuet4/Ll5B9RmSaLuYG9XZ/lRG
 JYFHh2UAnC2cmrbbaoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MyBTYWx0ZWRfX23F6m6KyLaRG
 zuS4fNf+BrplDuWWJN1n7DwS9muIN0I2qjO7nuYqyfDCa7WVS4nz55SJ1fSnu5RIjVVTbajmfYn
 cEx/N4ryWlgZDXgGxZ4/rKlpobGuq/M=
X-Proofpoint-GUID: uK1B2UPIbT1IwnnlkwUoFPS7MbVpjWLM
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a4247a0 cx=c_pps
 a=s0vAXdo1X8BWGfCUIwR35w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=9T98uzhKb1fTqeNhA-QA:9
X-Proofpoint-ORIG-GUID: uK1B2UPIbT1IwnnlkwUoFPS7MbVpjWLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290083

Fix MAC configuration of CPSW Ethernet Switch in SGMII mode by
modifying the CPSW_SGMII_MR_ADV_ABILITY_REG and configuring MAC
in master mode as per CPSGMII Module specification.

Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 434a31080855..71555d04eb8d 100644
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
+			writel(AM65_CPSW_SGMII_CONTROL_MR_AN_ENABLE|AM65_CPSW_SGMII_CONTROL_MASTER,
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

