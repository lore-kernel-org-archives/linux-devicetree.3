Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E290E3064B2;
	Wed,  6 May 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048765; cv=fail; b=ibaje1PrHcqnUPFgfsVsmoUJxWvtWceOWSTo8Iob8N33Vkmt3VIRdmO1g2WeSpe7GQmWqyAAS6nvAAaj9bbAltKmnhmKqSPJWYymGPmhReJi90H0ud2YCfogVe64ITZtp7xuCN4aeEX77TUDaEEsSScQahEDFX6vjuAtkrj6Ops=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048765; c=relaxed/simple;
	bh=pKM6BogvCfsrrQ7OeUDQebvK5xCy2ShZCP+u4I/6lvo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oXSAKRIqFSpicpmGSQ5cAlXn91tyQNLFRhzTDHwH45xmxEpPcFGiedh/qOlg5bdNsWXsWihiMC62jYAMYNkcoxz7f8LcROY44e+MKuVNXBu8DPLfBa7LXqNy4ihp0nYPAsBuWPGXAVCsexG6HGNHcUW7NdIIYaLrFNyzw9qrHpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=RmImsFbf; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="RmImsFbf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3XI3m2n8/Zc4es+jL/axwgIeqzyk0tqtAPs7BrrhddQleFn4kTEJRA3N3QKoieTzxvmKheo66pdhcvuWB6meJG+/AiF5fVgPKOU3t9a6vBx7PTOrgaW/VFi+JrvRNZj1k6h4sH/wCpVv5NWuSL92RKAipDYHRmhutNx5SkGmNbNks+1xhxraQENaxCEEPHOHapXRvqL/cGcJg9sooM0rfELwKq5nw/d3xzCZmIesXwYDoKPowRs53Gq81qgzBhUj769Y85/kAhYwIf/q9Calyad9Ap1gIUNjiJngOO5U9kNg4Ic4l6Fy6gCeTDLQ5SPmuYafD3+ycPxR6IZYvyYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydkscpVe+hnEyqs6d9CT1FHyUWrir163hegyD3BZJy4=;
 b=kL6wP+O+8T74BdRraZoEoNg41T50fw6t07ZFQ/6Yw4PBBB90UvBAg8motpnu6G74RQBIu/fA+rQX2Fa082yEwCmHTmqAU1t9edFHfPCRyLJBiq+8yFfHJyk+ayEMbr55EddbYAZJvZMssKu+rER522JwP1XjkzMdZTnVgiEiZpI+fervvqyV8iwyBkL/NG4b2swCWuXYPHYhtoeXOZlL3UUMiIsCRVqrmT5ZwjjqMe61xSov0SNUvLgygktDRnTWh4zILoU+AbSW7hTt6CdiC0cMS8atm6ktgDqdZkALTsGq5GvribNe/+tPCsWytEAjVE25APSecW5XZHNI3SZbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydkscpVe+hnEyqs6d9CT1FHyUWrir163hegyD3BZJy4=;
 b=RmImsFbfjztRzN8Wn/qZosfv/y+F7NHrgf+EH2AwUjWwN0DqCGPhp3CPfXCy+VE0MrOcChNUJSKSu4Em3yzyV05ilwHYu4uqcqyIRq1sZosLpTgqaxu+qnqni5POy6+ObHSvZs0pTzZ6LDoeudaAZUMrrbpqGFLzGAP1w7Zky4Xsierin0aLar2mPm4NwyMCrXXOjTOMmcx2VRNN+7Z7GX+92r4FiG8oEutub3LiqfihDl+G8WJ72HUwVsMrWpA7Smfoyv4nuphpweikvxt/vXn6cfFj1EmVeXZIkhUoDp428Xthu8CcSHhX6Yu98GusWDy/yjl/uRCSRXwRElwksw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CH1PR03MB8141.namprd03.prod.outlook.com (2603:10b6:610:2b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 06:25:59 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 06:25:59 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH] arm64: dts: socfpga: agilex5: update data-width for dmac
Date: Wed,  6 May 2026 14:21:49 +0800
Message-ID: <593cb7874d90b6d1e7e68c2c0795e55d051dd90a.1778047935.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CH1PR03MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 8280534e-e2d6-4e2a-7fcf-08deab385643
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	6aasyQ+ksfkvS4tHEOm8v1ngMXQ54TzZNQw9S3EHNTVqGjm45UZ+mJy/oTMmnofTHAjVgafIlMseUvHGrzHvR7DRiBHktIEbLxuVFtPjS1237Yuu3GD/Oaf6p2LsGqYkeabQ50AZ8hD8A6s9NBIGz+hZz0aeACPmF8DqI6NSXux7MabeLD2D8D3sHwc10ASAEYpsvDR1CA02OpPqyzm/6lS69IA148cNixD751uIM19WjhR0swWunR+G49NNLCCwl/74vPoIsDacsr6qRxCPcJuelK4cNchXlWqsSx4pxqJE3Vv0uCxIT5mIHI4l/yYdMJl1H0hcNhZOM9LBZNhErnwB4AeGpmLFhfzXAKCt5EpL32bN65rLVUF7D0gq7K9osSA/s9K6SoijtaHfFSXBQF1gFJRaOuavi6T+iqOat2c90gZgpP0EKsYIdU/LRKLXI5ouKmQw+FHvSxycEnHwTjnl07bSx280M6tdydxKPWAJPe3zYh9ID9SOa/sgAXliszOJ6azJUFuZLEwfKgxiw3OghS0+QqJmA5ypuVaLzrObcFVAVGcR6SdRtR/CgWxlsukZk3LjFSaCi5LNyCxKsje14mcfn1MRLIGTVdMpnQJRYHjslxyllSbmS4+nTUWV53DCGp9JrBP7tWIi7TssrrXAOCJo93pcJbxtATu68rYtBstkQLdrQIoU05Ad8vhF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SqI84vSRjB+yKvu65C6hWVRzrfWBrKRFdY3ZzhZS1eiLW0mAq7EyJ1sxtGj5?=
 =?us-ascii?Q?lPIFoSfgKufgHraZ8GK45doXwvai0fZC2lVAqgii3t2IAt+m1ZAmoYyW7k/5?=
 =?us-ascii?Q?Kg4isTU6MhdM2c/0LXeM/BeImXOZHcq0nKhxNqfEtz2PMlFbEizmuV0Ld6um?=
 =?us-ascii?Q?aG0gPyYeUI+WchLNaL5CSCs7ITGjtx10bHJG4r0hMvkrnnKhtu8tijYYnYJ/?=
 =?us-ascii?Q?+jNxR8c6pPNxdjG1vo9uT3eWxpv8O80P8C9ExAP44TkUALZEGgJYiVCdB+5T?=
 =?us-ascii?Q?uxql3q8dM2T1adQWHqWDRpqPGFREvWYB63RdUyjn3I2HSs2glduHJeKjkE5L?=
 =?us-ascii?Q?NiHEC3gJ1KE0ML9DeqA0sDnbzUfaeCsRm+wdfbkgEi9L3W4gM9mvY2SX2VCR?=
 =?us-ascii?Q?jCE4NlWhuNELKXrsQok+Sc3frdfuS/Z8PxY9jzdNRZO5+SCG/WkQ6ZlqV96L?=
 =?us-ascii?Q?8A6m5XZesX371l2AqfexZjoDi3rhgPg3huui7Xy33YeNkWtamDYLsll4OMSV?=
 =?us-ascii?Q?s6MucCbSJwKkKW1RR6nGc4wjDHJoL5Kx+E6/7mFiNcS4Csn2CQ0o+eXZsloj?=
 =?us-ascii?Q?ahqCKQwPco65woIT3CHekdKj21b4TmxWv4LxxVlVhJ/xB+39JvoFmx/HPASj?=
 =?us-ascii?Q?2RNY8qxGE0vMEa0uBjLArYfQY+JHN0dB1DLxrkrPOU0ySd9+EWViPaEIHSVJ?=
 =?us-ascii?Q?Aho1q5MFEIq/GJN5Pla6/6RF0H/SK3V4obwehdyzmnX7HNkY+F0u6dpQtNRo?=
 =?us-ascii?Q?VmVuMTMvqg7ezNhWwbA0Cbjbpc0JUX3Rx0PskDMeiLVTfUV9WXiB3AjPT+xg?=
 =?us-ascii?Q?7WdlFJvtst+lUPpcWpTTF2ZOcV3Lhk+Yg5D/Ck6Hq0Vvfj3VDaodooLYgvu4?=
 =?us-ascii?Q?GPUaEmfP8POxTw5z/X5p6ytmrjjixmZv7qSUwtSQ18sMTZAZWtIFAU+ifcdB?=
 =?us-ascii?Q?ZfHrCFlP+16rn3L53y3poEtNaSpgeCoLOV2Q6fZNw4cu83QO9ImXLauaoAFM?=
 =?us-ascii?Q?gXrQ97SM+YPUuCN3h6qtYogWniBQvoHTgGVOiL1gRmSXqfZGjF/UvFPoU1NZ?=
 =?us-ascii?Q?QELWAtvytljY6Z5k5Apnb+zc+guNf4ZPWuH+wqPHStS1M5Y7iEpv+sizK/0h?=
 =?us-ascii?Q?ADpQ02sgNjL8lOZ8gSi4FXj5dr000LTYW632RSg7qhTfugC4fyXUbTwyc072?=
 =?us-ascii?Q?PatYoreIRNppzvCM2sjNXDKtmPUMbqPSseT+NK+n6kS3yjsouBWSrbn9Lh2H?=
 =?us-ascii?Q?OQnpONXFRO+ckukIBNkBv0YUI33HJ+ELbTf50ez0LNrGKVgtN2rnLfzGJ1/y?=
 =?us-ascii?Q?/k7X0SlRc0cQZ4Ls4G+MyovDzDlP/g4KBe57K1guq1NyuqzVPGNkVCn1hmOk?=
 =?us-ascii?Q?k91lpHZ3nw/GfdEdBGfirkED6PaBHdQ8qH+DdONbfrr5SoViEGy5EZtHevDc?=
 =?us-ascii?Q?d7fEq+itcIJtSIQpfFSpim3x78qPNKrwtB3AE7UXuVPJ2D4Jhhp2Q05OA3qQ?=
 =?us-ascii?Q?B4Ta9lf8pts8BpuhzS7LO1SAfW3X/4ZGV8/iBBXNyVJ+LuCrhqEHgV4BHMSP?=
 =?us-ascii?Q?cwk89eG0EA1KSOUVC0ro/Rm0dd8IPCfVevoQYCP4jBCVvZV/bLEndd4/QpRM?=
 =?us-ascii?Q?gVXaIJWYl3E2m6npZIhvwMT7E7n7csZp7bhoGMyBlDdr/ZtuAnfuURh2t0a1?=
 =?us-ascii?Q?0G4D4tUCib5EImVY4wRkk3Bc84/BmrtaFR/FA9/xJdFa0E6iZD6U9awVAGv8?=
 =?us-ascii?Q?RNa0BEyXe151SKacAFT8Q7gEMbBl6aM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8280534e-e2d6-4e2a-7fcf-08deab385643
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 06:25:59.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDEIsfzEVn618kvq7FeQj9EHrrJE8QmXsXb9j9Yv8TQ1ClxUbfb5yttQAyP8/CSZSQBm7pvEbJLe1MPp5G8NmuTAo2ugCgEDCWHdTnekBtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8141

Update data-width property for dmac to 3 which is 64 bits to match value
configured in the hardware register.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 02e62d954e94..b06c6d5d60ee 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -343,7 +343,7 @@ dmac0: dma-controller@0 {
 				#dma-cells = <1>;
 				dma-channels = <4>;
 				snps,dma-masters = <1>;
-				snps,data-width = <2>;
+				snps,data-width = <3>;
 				snps,block-size = <32767 32767 32767 32767>;
 				snps,priority = <0 1 2 3>;
 				snps,axi-max-burst-len = <8>;
@@ -362,7 +362,7 @@ dmac1: dma-controller@10000 {
 				#dma-cells = <1>;
 				dma-channels = <4>;
 				snps,dma-masters = <1>;
-				snps,data-width = <2>;
+				snps,data-width = <3>;
 				snps,block-size = <32767 32767 32767 32767>;
 				snps,priority = <0 1 2 3>;
 				snps,axi-max-burst-len = <8>;
-- 
2.49.GIT

