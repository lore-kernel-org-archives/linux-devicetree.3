Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDA23D7DC;
	Thu, 14 May 2026 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758881; cv=fail; b=Jmt6VbZWvVnH0C37Z9b1MnYrL286OzQ8Za/YX9rc0Td/ZPvOiokVmtfHcozu1NW8LToNZEtAeGnUUFnDT4bG/tOsO5Rs7jALvfSnHekM/aG9JchRF1tk27eSntcuzEkQ0Vw1SdBnLJldVJc4JkuGHVTtNDSRhT5ou8MPCPIPwWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758881; c=relaxed/simple;
	bh=kmlIdIMTvLTpTWCFAXlD8cpaGNZJFbGbIcyVAQv4oxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MC7thUdTQ1seJzwtJXAtlhMOdElPpWbULv6CwO2oqtWrX2GeOfpiHfXAzw78h1K9f64ywmRyLEQqdPekvt20AuMSRrC5BjchEsfA+uPX2TPMEv7d3ciWbFGqtL1Uw2hDjEQ1Va3nBik3+k4wHxWptnFX9rMvIOKy5g/MpZ/yP6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=g4kqeoVz; arc=fail smtp.client-ip=52.101.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="g4kqeoVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE1n6NtAvP+e+1HUffxplRzlBRmaWhfJDHgPHSNEpYwa16ZGmatOOoOipm7KXZTSrjJN2qriJK0liESUxKE64hRqb7DxIvX1tN5ej/braoyITjUt7zp0I2FWgynsEHrU+9iSIeJqcx62ATCgNiAhlm1VAQ8Ep6X7azitGlfeDFK8ZVTQw9oxSHKdb6v7pifS1gSLmQ1BvBPU620G5b4i5X5MqfEokOoXGeCGaOg52eHdaDWGhLA+DGZD9yiIbsjDNunYnJneIBbSUveSGL1oyieKumzEuth/sXS+8sNBkME+x7XKVkJHMHiir3cg8fhmIJyhazgfYxJd9iynGLhdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi4zg1nsZ/OadVuhyMOf7jLiWqPQGU593k6uqU1oIsE=;
 b=GS5j/THS+9gFsJCTNrw0qmagK0vLoY4ILYDspQRNCgHCTAUmC6uDSp6QCP5DF1j5txqW52aazfKfO6M9WNdTxN6wS2TQPqjxS6JqoRDi28HDMthyHhKnxhGiEyNwn3zzZZBuRXQ4b7S3W5IPd3dlSx28bESLMNP7hk+Cw+nNWEajjZHWoFV9wM/mV3sMyUJ3F05uXk05IgArjAXFL7VYkH0wUm02HowbRa7tZ2IObSOoDHZ9hxxhJcU9N/bN7US/yrDRV4dnXPvrgmRVJyxtCg8eAlyhYAi8k/vvyDUuh7hQjjCIsW/wRTegRoaKUWWWhzQNvClLS13mkoJn5+VWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi4zg1nsZ/OadVuhyMOf7jLiWqPQGU593k6uqU1oIsE=;
 b=g4kqeoVzSmNSXNIXUuSqwsSKvf/BqjIuUcOJGu18DYoKCwln4dwP5Oz0YV2KsPUgGxUVVVBLf4z828bj0ql+mygCq1hi3hEw0QBPpLjTfGPRWB7DOAA3NCuFA/Ax+VLI5nkVTzl5RM5iN2wM6B9A2pp6aOfS0TwUxOJFcJMlrrC7ISl58JBucQwCE8YdhmlyLr3YNZUKv7CwdFnFBfET8Pteb1Mt5P2s6wSlbpkESwMb11KLeIdfSXImzyYqaawVMjjmJtAc5We2//ghHhsOu1/JCi3igYbf5g4cOi2Imwo8L6jhWdj3P78fA3aUD2d8zC7e+Hnn2v8ag7a+/xxrIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA2PR03MB5707.namprd03.prod.outlook.com (2603:10b6:806:11f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 11:41:13 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:41:13 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA device trees
Date: Thu, 14 May 2026 04:41:10 -0700
Message-ID: <20260514114111.10574-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA2PR03MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b965ffb-1fb2-448a-3a02-08deb1adb394
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	16s6fW24uYvrbtl89x6tW/wM2iTCRImgUPmTWN5lfJG1ysecvmaVwa3DYV/4ZZlCgBlRQMOOZ+5ZhK6SccVzZKMOkDB20Pdjosvy9xPmgX4d5UMqMEghHFtsVyyKjBLVEBWnvTsQPfPVm6aAG8Xwwa0W31Yi1OxKmEtTwNmnZNhWaEN2RXZUpUtSl9cZvR6XdLXiqQHYo4K/7XQtkd3fG7Tb3zaiPY8uS4x/qJRyPdGHlmTM+8oe7YtyFrDEVwkyASoLOeNdJMB/wjrMDqWGpANsZAljaQMZbXRmQWKjqo+DPSa667zKxQsf3L0Uicd8y+E+5CBrxy3Esm/Q77c7oHwP/CZGp2goqvXVpfkZNPbFJMCNIF2BtIMOyvyC1g9Hw3U714xGOPlzSNZQWV+vGV8t18lZSbJckz/2rdbHziP6boCNPkX+pTquuanpH6Hx4WLkmRrOTvTFPOGGdkqeru0WV8UdihAyVDN8C85UB1UPfQjjDRBLaPfO+ikTOWK8+xVeysUQW5buC3/TujU5u8kSAIaysKnBTl5jRr3x3fCToANxhheKiMgf8dJYhQhQMpfsKECNJTCbwsMfOQ8cadVqBM2jLSWMFbAsW6TYvbJFgB0opzwdMqTApPwtq2kg2raAjvqzD5mDowtrNYGzO89+QV37mOSifIDy9Gpz3E/ExUArr6ZTI/+5r5n4dR08
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?njcZCkr3Gvh/FIRXwdGgl6nSmFHsV19GxEUw3EbakrgfcyGUl8dp/MX8PL/+?=
 =?us-ascii?Q?FUtqcCBLaXakp27vvBeVeTN+xg386hsmAmbBoGNyzPO7cdbFUtJ6GslDXEUu?=
 =?us-ascii?Q?tMn+kdevMUwT2m+d3WFdsucjC1Qhm72PBGF3YqsnKZv69XALaNgOPT1wJzSA?=
 =?us-ascii?Q?ZWLntd8hbS14qlw4ezgBSv1yewDNKrOaplNOF1EaGBFyzb51FrNNAR5P0Djd?=
 =?us-ascii?Q?k5K0zxjAus3jr7jFOgnqW2Uqx9+SryJRnX8sVZiDAi2/XskvHBmxROEqwt9q?=
 =?us-ascii?Q?PbQrmFFVm5k6WnbTGrtVNFfdkapox3uAkJXPzfN2imUgFczXJN0aooi0aJpt?=
 =?us-ascii?Q?xbkIpFLCt7BCzDlbBdLgD20EMBt+uvWPChwQ8wTBMm5mE1uldjt277Be4a/6?=
 =?us-ascii?Q?R2m0Fg0Y9oHRJaslmIl71I9IcMlPkL/fRnT+gJeCf5gjfX3g/ndV7k81sW65?=
 =?us-ascii?Q?qsXfNAHk+nOfCEO4lV4o+UOhY7EetMHfZ1keaNgoJhmqFRlpSAlHjVCh5Y19?=
 =?us-ascii?Q?wTEqOaeezePnL4FvPCsvZqr4kRxl065zDEMJ3hnxfs7IIyRPQ9psUvBfbM8l?=
 =?us-ascii?Q?hetE/DuefOea8dlY3y277nkWEmJxynE8yzHMnCvkq+1y4F+5O3VCV0s9mr8S?=
 =?us-ascii?Q?FhpJRJMBt9CgyHIz5AWV/SuKhsJJ+TW9VqmZhy0R5VdxUeTUYSEcz0WIXjpH?=
 =?us-ascii?Q?cjvfxL+mcIzSqVxtTjTz+2+LvMYMUGNpBaJHqtUiUgjsHoeYyXvenZ4xmji6?=
 =?us-ascii?Q?oCDAG8DFobYIr9h5Nig9NcDkQwHDT6hgpK5btdNKJC6wdrynQP82N3+fr0rP?=
 =?us-ascii?Q?FlwXzznjTxltKKFEGw/mD324rLQs2aXlP7aOlzkTismFh6v5lh7qiHjDtOQr?=
 =?us-ascii?Q?z5cz+Fpg0RmtpTvtI8qXC9JHsU8Jr0QvxefF1rZyPaXW/yjPjFfz9KlPAP2Z?=
 =?us-ascii?Q?ryZLRiXmpYDJpfzQqCESYHI8D6jHX3drU75aNuhPxxy7h9KzPC3jPHdzupS6?=
 =?us-ascii?Q?TRJn7T9rrPpNi4p0LbzbPcYqTR2NozqMc4Ym9V2EcP7I3sYqhok3+fXtpq7k?=
 =?us-ascii?Q?RuEvDxBfglwIlw/qfGL0RPal+Y33hl+1vaotZtQSnGEbfXlVDaXb4OUyS7d+?=
 =?us-ascii?Q?l82pK+bhAyS51HQVNfbJbFGdsxLYopTMTQFnsL+Ca2M7fEGCjbY/0vageRTa?=
 =?us-ascii?Q?GXPTO/Lx09OP/BQsN7ldz3GDeDFTN/lC6ofkq9zH3OihoS8gnjm7P98X63A6?=
 =?us-ascii?Q?6k5/iiOwAz9yWDGVUxKiYM1uIRuxauiM9gYw23uNYo5RW8A/wnYMM+Wevuyr?=
 =?us-ascii?Q?qsB4x6cyFdIjStJkBSULNUV07fdTzsnQC6kOec/1q91LtaptzRsu++t71Jjy?=
 =?us-ascii?Q?pqRUCjxthPubsojweZOY9Oc7eRSuztGP7ZGMDOOBuMANp6yo1d/1zXT/Q693?=
 =?us-ascii?Q?h8GyIiK/+7WsShxO3JM8oSbZHCQHRjr/EUqH6wNByAkdHFSMWgYXI4biSM5s?=
 =?us-ascii?Q?fN6voOvg3pkWlcO9j/OG+mMWzbBeWpVLg0/QriFTizH70WsWbRNlnFT2+fPS?=
 =?us-ascii?Q?P5FCIlp4q6DKb6BPLURSeJN+Bbm5nHGA8lq8IZeIQbAYlG4e2LEfXEH5ZFKg?=
 =?us-ascii?Q?y/sRwrGV/1UjiVyJn9z3jqkd73QThb9K2Ak/PkuIFvh7CbNNJZxi/8XVGy13?=
 =?us-ascii?Q?kfMTjnv+El+aH524JRfMeuYQLgTPAfcTr2fqWQaXsQEdqjIwoibmANqhUdjv?=
 =?us-ascii?Q?mh7lOwldMQWX978pfujK8C00WvQ9Zw4+rn4oAcFG1hJYEcSIXtkloYNRcarx?=
X-MS-Exchange-AntiSpam-MessageData-1: yGENHfYYK8/xZA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b965ffb-1fb2-448a-3a02-08deb1adb394
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:41:13.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PULjWE0Z2yIC98bJYVjJbaXvbGp4Tyj4CINzUdSF40GJFQFy+if6U/EmtANeNu2SigCs+KC+dGfuj2jjfrZHUGZvU0UeLr2R5ZlmaO0e8NtLoLjewgoU2NnZLvlDNto6vVTgXmZYdBYd8EIVEt2Acg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5707

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Enable the SMMU on the SoCFPGA board device trees where it was
missing. The SoC uses a different memory-mapped base address for
its peripherals, which requires the System Memory Management Unit
(SMMU) to be active so that the Secure Device Manager (SDM) can
correctly access those regions through address translation.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts      | 4 ++++
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index dae0db9f8819..66fc3c546b66 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -109,6 +109,10 @@ &usb0 {
 	disable-over-current;
 };
 
+&smmu {
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
index 21faa47681fa..33e6455ead0f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
@@ -104,6 +104,10 @@ &uart0 {
 	status = "okay";
 };
 
+&smmu {
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.43.7

