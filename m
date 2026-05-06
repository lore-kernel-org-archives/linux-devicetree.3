Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3C44DB6C;
	Wed,  6 May 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071356; cv=fail; b=Sb6ARTFjyZr5TrVKaCu68iQ4aix87xWRlM2+Ja/IRwAiWkOGSTO0CAIRl9YGGdlnriepvDj0ydN5bnsJgQyLicPu45kSLWqsAjKnxnnBSXlkBw58lJ+fKTARD6wSfvdoNzmGY/zCdUDFQ68Q7wv9wc0tieI4Sz+tPF2/QMyt2vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071356; c=relaxed/simple;
	bh=NQMXTRqbjS/uRzxWPE87ljLj8XMWgEUq+fn/tRQsYuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nKFWVhAkf0j6wWyrEZco7zhoXkAIYJFOWmSkeOqhr/Uq9IMvTpqxjOddDUmWX+77AfvR58MrFLtekIJ+2cAvb3K8IXvxxX5GT7wRfSMKygGEile0V+81L6Yc/AzA9hbUmFfPIRfR+Yi/VqsmNFCn0MBHn/pIYkqih5XZQeH6HNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VOsu+RP6; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VOsu+RP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfvWXYxIqWIuTCdDkM1fna3gZieN/YmLCjeD0yz2go4XxIDcDkKOJw92bxTrY6EsyK4E/eatuLFdAaqBJJTrIUCyTfJnKNkGW/atFnxEqLNPYrLE/ZqfKeuizNwM7gWs/wG+NYOidvKIERnv4ON0DQRn5HXIp/vpJqqIorxM+JhkNvGgptXhLreNklB7ZYUG1r3QTvX4+3R1FN6hOni1oxQi5HpwbahzNmiSqr7zTCeBr9iKk9IRlJGdEHZQfWRYjyiwEQ3yaVlvzMoJD/6WvRPRD31dlmocm/aBo4gHCnbyXd6aeJbZ5NEpXxeEfapVKuftOSHjhaixKgcrYTl93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xgJ4whMueBvOwWEDz10GkuZrPAJgs+6Kx3ZF4Orf2E=;
 b=TCBSuYIgOguy2WcyiNjxgy/FYjOld8UOkqHxSwXb6xAB4WJTGK6HFsruDsbMNvA0O3OAwcX9Xhr1BvkExHaRb3ihgBbFZBGpw/gq1caTHfYydETyUn7rLixtHiV0P4Q4thbUbqeSZFPWkfdXY9zxoZvcu4QhqQLWfyN6+1KW4fpnGKZ/P+Wg8qU3vnslmPR+X/0q/REqpfvTFfViAqDeW0A3j7KD6TU+WoKlNbro25ZjmROcDSDEEI/Ils7sTrOAuuYGrx3yv1y49pFlodbd/u9eXvuQziP7SOb0Zmed453yw2qJsSbXb410lEthFwDSr6JTPZy4ZFdRqZs8c/KR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xgJ4whMueBvOwWEDz10GkuZrPAJgs+6Kx3ZF4Orf2E=;
 b=VOsu+RP6GbjAPeyZyDm1/o87dhZxI2mObCT0SSiJAaJDanluq7PIijMWjESkW0Di5MJADVpEWy8KiPbqZgA0D7+KBjLza8DE+/5QC8cpea5znuekGDY1x7qZWwmrJiKdKJzj3UtdJXkAaTqwDdRviUSE8gE586Ry2kULKVR2/M0VuJ46tycWoRFwFSGMJVKXkbEPL72Tb3KHtR+ZCNNjhR1QVaCv5i9Qs1ZQhHPL6u7XGymDpjGo/dfJVsuyVFn1hkHiFPYlPK9NSltN4ITwmsjmiBMMPaSw7tXogDp+8VmVATN5nM/SecN+NcNAC6HW/dYbscPtQ/AgNn+A6GQt/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by LV4PR03MB8332.namprd03.prod.outlook.com (2603:10b6:408:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 12:42:31 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 12:42:30 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Tze Yee Ng <tze.yee.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Subject: [PATCH 2/2] arm64: dts: socfpga: add rsu-handle to svc on QSPI SoCDK boards
Date: Wed,  6 May 2026 05:42:21 -0700
Message-ID: <e7c3910954bc4a15a69e80bd671b8521bb2f65c3.1778070377.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1778070377.git.tze.yee.ng@altera.com>
References: <cover.1778070377.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|LV4PR03MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d67f3b-d778-4ec8-9e82-08deab6ceea5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	9wbyErM4eWBZJYGcvVUM0+/G8FxIa8+rohJ2NEHKSOY5+BX8qiEb/Y4V6RuE7A4B7CQWp0AvAI0TOe5wIXFDbrlVeOou1SCqebkh8oXMDFAm+TCiUKRAF+rMjRmHPj+Mdb/Bj96S3/cNte1CuqQtpX77tsIevy9c4Qo5YtjbwJd+OiOGGRObulrRYQg0lDi3vETOdqOEfzKGIw9ssgexPOQ87LQkDJo0CaT5JsGGdpVzUxBwyWX/HaVNc1Ez0FdNueoMQybLMOefjZ4RSzfJiVfUi/zsVD3rcKcaPzofHP/S07CfAOUFiPgfMTytrsZZaD35WzJS93B7VgBUdIIXgIipoB2pS5idjx2Ya/B5ZBNYh45K7Vtec+YRqaBXXBDrDbjerPG3CxvKTWZ/BkqXqGp4lLuMRenSiCSIuJqZVk2ize3ztxBmNlr9VEg8sNEZ2bff8l14Lp6feXFQ19UJs3X0+2XwFJD9WjJ5QmsgY+GUft8N0W506Ti9ohuL9CTOQKqWtfgowrTn2Y111WDw6CiKRsNrsuLXSmrq5bP5siFKHou4VcqSMBtuKJInHL4tl37tuyI74sH5gknx4X/1Fj0uab2tT6abYnwSh1JmeZdDTZT+7qXtJcA6NIlmNT3t4+BS/dz2PFKPdHdbJrOY25yLgotiNb2af1+i2CnQK8/h3SAMwBHgZwd5ac+ZXTxF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Wz7/pF2UVUnET3mS6ELJztsYIczdgacHesB1cd8xHAiuLHj0PR5rhbU7IJI?=
 =?us-ascii?Q?Qk9H5jGoQzFzJ5ieYtHMYmltY9SKG0syAs0C9rmNavogma83AwHbSXAgKl7Y?=
 =?us-ascii?Q?SuOEShdxMPMxcoKi7lLqJoIOecpxq3/904unenOTBogRUqB7iaxolzez98iJ?=
 =?us-ascii?Q?WSmMfvdD3SBEiFX3SXncu71Og4lWqmG1bKeOgkf0dLDZXvM41n6zUtBPFoCC?=
 =?us-ascii?Q?DSTqT8bBBckD1xnrvM/ZbvX2fdGE6WCgFBwiIAtKVYSLBukO7H5OJi0jZetI?=
 =?us-ascii?Q?7eRdjQM5lGatrvy79WqejlYDvWAjyJFeuzTinUO3my9co6noqGoL1qOSRGNy?=
 =?us-ascii?Q?Hh2DDAns261vW94jerVpGa7DETzR7JBKXWdMXczGPw9Mqr3YGcQJqJXkqQ9k?=
 =?us-ascii?Q?NlC2sUxTdDOyfDMZrD0RzC5H9wtbtgTReWrjtfju1+M0UKQjcqCXKqlLMAN3?=
 =?us-ascii?Q?hmQF8fsmHxTRtfijgmfXSpv9DNB5/WQQhPn9i3T2yradOcAWqEg4B0Ezqjs1?=
 =?us-ascii?Q?4tZI7ttAFhtMGib5q0HrukZ1K520bwLWP7BStqk6cEZGC3w6n4e8wt8UAm8i?=
 =?us-ascii?Q?U4gTRPrPsoIFVaqBoUUtO4I3yPynbdJLzeAuWsmPC1OZ6iMoIq/TNSadorEw?=
 =?us-ascii?Q?IsF1XlWXR0iR6ZVzRh3Ip3I1Mq/Cay4t3wYI6AuSwDsc7nmWHKS7vqwCm8n9?=
 =?us-ascii?Q?8ez5o9cG1Xb4Iyu5G/1HMNX5Kq1qIcklWebxqYJXzn79xScFr3lYl68SomMP?=
 =?us-ascii?Q?ql4bP9T+DvAFlR5YVvJm0zIVhFXV9wI0Nd3nNGClshXqzppDJGk0rA+DcHdM?=
 =?us-ascii?Q?eKDU/eUa3VCoZJdG+YOWi37qWWbTGhIWeWXeY230qIZFQvPnUWMWaR905Yfn?=
 =?us-ascii?Q?UEQXb3MXvYMEy9P+uFRp26qlID+PRhNEsreVC5sL8iYaKtl05Ze2UEgHlXtD?=
 =?us-ascii?Q?+DJDSmTov92tUfA2xgGZ9xxezJItZ/7nTySW1OkaJ7uMwtD7d2ZZm8ksCHyK?=
 =?us-ascii?Q?bqvvakHsMNHbGWFCbQiYqnC1pj6/40xZdFAPz0U2RaLpwX2bYKU+aPZ37PNI?=
 =?us-ascii?Q?L/L2hoK+EYfF0mXsebC9/hYzkb/8krHyfDPVDgtH2lb00wDzeOg/90a9XaEn?=
 =?us-ascii?Q?Mi10+AlnFlXnBxXbmiVs5Gd2SKcMnOD4K3VrM1AAx55g0GIUBt8XpsQDiFyG?=
 =?us-ascii?Q?lOfEdZZSWsimoFrqQZbLXS3RlEdf/N+8zGTi/Z/mfNfvqdgw4O0m3fdjtCk9?=
 =?us-ascii?Q?YhaFU2UmWbBu6a2F1Aqh2ILYSlAZvYAA3zWXMjoTmOXby+ZgrjK4Id6Hrqjh?=
 =?us-ascii?Q?q+yfyWMqYvq8Kb4hK/6i5ET99xt6DiQlZ9AHVKuaop0yPn30CqW2/EjJQ9d8?=
 =?us-ascii?Q?jX3y5Zm6Y0ZmVi+DD8mRgHBNh1YlwhN9v3PwvHEh8BvY+OLP9dhEMlwQV0Yx?=
 =?us-ascii?Q?QGUXsFkzdmR1iKE4sYj+aFQuTLSMz754qJ12YhveES10tIv5bWud6mba8vwG?=
 =?us-ascii?Q?hQB1+qEllhEbI8w/dPWaulrUeO76usdRaZPEr5a/buJgb7F3sCi5TJdg+v7q?=
 =?us-ascii?Q?n9OmzL3U+Qf1uvk2GeYq6RtuuXutR7UlNpaZPOtB+f7ciEign8Cws6vSxber?=
 =?us-ascii?Q?eJo3i3Oi8hj6f7mUzFRhUVilo4uqOOF2/ECmMToHB1Mx+GjLjiN0iozFHDj4?=
 =?us-ascii?Q?dsZQj7V/eaWvmjnmQBGol5LMsxE2VuLCTAeWBJSfWJ2aXNQx/c9LshBL8ewO?=
 =?us-ascii?Q?Oz/ZIr16FA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d67f3b-d778-4ec8-9e82-08deab6ceea5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:42:29.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sglzhES+Xw9yprP9ZJvQbONf2Pe/rN0Le9FhQjWTY3sTyEZIh6nONbrYc3S4MhvSyvaLOR3I2irYQ+Qcf4JWsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8332

From: Tze Yee Ng <tze.yee.ng@altera.com>

Label the firmware svc node as "svc" in the Stratix 10, Agilex, and
Agilex5 SoC base include files so board DTS can override it by phandle.

Set rsu-handle = <&qspi_boot> on &svc only in board DTs that define
the qspi_boot partition, so boards without that partition do not
reference an undefined phandle.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi           | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      | 4 ++++
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi               | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts         | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi              | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts         | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts    | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts          | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts             | 4 ++++
 11 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 0d9cad0c0351..64e9e1d8a852 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -70,7 +70,7 @@ l2_shared: cache {
 	};
 
 	firmware {
-		svc {
+		svc: svc {
 			compatible = "intel,stratix10-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index e2a1cea7f3da..f4c9f9bb26aa 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -134,3 +134,7 @@ root: partition@4200000 {
 		};
 	};
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
index 7951ce46ae1f..1f3e4b50412d 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts
@@ -184,3 +184,7 @@ qspi_rootfs: partition@3fe0000 {
 		};
 	};
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dfbafde8822..6440b4c6818a 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -61,7 +61,7 @@ cpu3: cpu@3 {
 	};
 
 	firmware {
-		svc {
+		svc: svc {
 			compatible = "intel,agilex-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 14b299f19f3a..af8b75107216 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -130,3 +130,7 @@ &uart0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 02e62d954e94..d415b762f328 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -80,7 +80,7 @@ L3: l3-cache {
 	};
 
 	firmware {
-		svc {
+		svc: svc {
 			compatible = "intel,agilex5-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 262bb3e8e5c7..0985e70dfe44 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -110,3 +110,7 @@ &usb0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index f71e1280c778..5948f125ba0b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -124,3 +124,7 @@ &uart0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index 1831402d8808..78be156208d9 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -107,3 +107,7 @@ &uart0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 8f8a5423ba02..d277b7073dbf 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -136,3 +136,7 @@ root: partition@4200000 {
 		};
 	};
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index d7d500f50a07..ac8cf8b7257b 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -126,3 +126,7 @@ &usb0 {
 &watchdog0 {
 	status = "okay";
 };
+
+&svc {
+	rsu-handle = <&qspi_boot>;
+};
-- 
2.43.7

