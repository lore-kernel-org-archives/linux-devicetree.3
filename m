Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023139.outbound.protection.outlook.com [52.101.72.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2193644A6;
	Fri, 19 Jun 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860437; cv=fail; b=EQiw6OxtzIIshvPGM0o5cV3lX5/aAAeEbqM45o4dqt8JW6NDBQx994bIn551heTKGnUuyOKMugf/s6hiG5aMb/e2uTQBaKXnvKsDVATlN0w4f6oCy/zFoVAQImN2ef0ZnsPDcnkAXiLe1Tm8m4d2jQMmxHS477WxuvDa5r0o3BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860437; c=relaxed/simple;
	bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JQ1QB12XTXYgE7dfapW5Lmv7NXodydhOQVB9UgsAqa1nUMe/cDnjGT77TE6m82IuVT39IsWoQdw1iXkmZUvJ19AohoJ+ATlZLaM+AVRRz4pTcJqJEtuBr0BVY1yArpnhRLJumVzGmCDxS4EGSrrRrIdgC487+zX40gX0C47RrXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=SlQQ7E1f; arc=fail smtp.client-ip=52.101.72.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="SlQQ7E1f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooFcmcqbtolbTm4IKuNJQkWRHzaExt+aSnOlV9Fv26hK/eOxzPeTimGX2FGbCpi0jpkaxaTv2J45CR8w6QFlOm05Z8JKkL9byeEGS33UkU0UqUn+z1k6nKTOyrCV/fWtEe2gK34ji1dPjh0tlt9rpDfsuVjgI0uFcvECvgS9J18BPHYA+gVLFjZNrKSEdMdOXJOzTbPljMPuu/z5yPoHM2meWCG6AlfnFrkm399pEqVN/IumuyHWEmv1aBeNGGqAEqpBpEjzPMIxmCjq/fCAx4xvJ85jOs0BLbsf/TRUxOGGJ+4nWxFbWkpbhN66YGLyRUQ+ZJnnKcopBdckov/NWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=W5++jpL06RoV1gzYpYF19q6myNT2jj6dUEoZ+VLHx08bpuayPuMUWjT2c7RQu2OhsYX/Y1apKy8jmeLZQpE+pgtFNdwh6l3lpV0ymMilP6cSMJlNdhjjNNNfBrVZ7jawwM7m2crAbUy8gtCREXAZDm+GnEiXg0xrGrKHKhSEAVbRkL0p5oe6qBV3zV9D3rlkIRNEMuVss2j8RY1BVwgIn8CQZoeR0Ux2w8K/2VMvGrglUH7+tEnIx593MZBCyab/QMWk+11MB4Drl8GLi9FQ5Uw9Ye76WzNNpW8/Jk+4ovwc/M8beNMwhE+RFJFcOTEDO2E+V2i1aNJ8bJXVO/jisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=SlQQ7E1fYQkavNldd9PHxOc6WS7nsIVJ0DfOgO/TPamtDQZyKh96S3c3WNZE8dVCadPtPOse0rCDA5SaXlcf7xtVZoQ5hDHpEDtPd4p4zjE0zzno+MGC1FsIwa+AgIDR79BffnEdfHXHEXj6Z1665IIcXsS/1tYDeH9ZJYARCD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DB3PR08MB9010.eurprd08.prod.outlook.com
 (2603:10a6:10:42b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 09:13:50 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 09:13:50 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Fri, 19 Jun 2026 11:13:39 +0200
Subject: [PATCH v2 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-feature-mipi-csi-dphy-4k60-v2-1-323356c2cc2e@wolfvision.net>
References: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
In-Reply-To: <20260619-feature-mipi-csi-dphy-4k60-v2-0-323356c2cc2e@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781860427; l=1213;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
 b=oBEPE4rdqKX0nrQpBCU+RPuywESCP0dQY8rwgt4Ui0uUpds6n7k1dnt5SVazPDNES2YPYSRkB
 B4CNeR1Hs05DedShQ2qHqKTL/ltXHjiKDCkXNhXk5Kmep8HNLiqa65I
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DB3PR08MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: df1283f0-82fc-4118-412c-08decde312e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|52116014|366016|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lk3yPGvCjzU3MvFit9AzSXPoSS/A6/xl+xcigJJZ/R35YhcinOKkTKoQ6mU3DiNEjBLBSR5Gz/0rLX5hHM1N529cvPmdwuZf0+f9ct+LzP1sTY3TCeY0SQY24O73C81+lWHKR3vFaHzj356AOGT/aji/pAM0eXRj2t8xGnvN7R2IBW+djT69mecD7jXpb0hZd66JCHTgiDOoq2MhFTOQ9tfnegQWCgTYpNj/bb8kpfaBRjdHjOAnGEqfyePxi1JaGm7PYP5qqwTBcEB9wFXTzKpkMKX+g5lUv4cIGb7Sufto5pUjNibxwDG55OonPqxNFuVBm+4GJ1FKLZeMuI6n3qn+BLFQf7CLavSLPFVtnuUgSLPMO01ndPz0k+IF7kHex3jU4E5J2URkdLG66wCl6N4wJj336Kuw85agP/70E9J/HbHzuXt6IecqhONyCq9TiyVLmevtqr9HN0MWV+d48ZVxUwCbYhT+3YmyhTMALJlP4TW4igdRm8LZQ9IhVKXzk+gBw7G0yXs3tWhgnC/vb3fwxBhaBH84WLPWWi21gjAGyCS6aJBZBRpXI80hlNoi7PVS53iwH1qDOAGMqr0fr1F5cGMLKmCNZ1ZcWcj7ch8xc/hglUkPaSgb/Eox9/tBrdKlJ2B0C5CWcxVVxED2i7qXjqaKgG74bHemApat50i+XN60to6//ZDO/imI3OgMSB41MQ/97Rd1/BcaAZ+HKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(52116014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmc2USs2a1pkRzh6ekNESEdGWERiMlBnOUc5Vk5YczR5L0ZYS05ucGZIOHh0?=
 =?utf-8?B?anJXVDF2QzAzdEJQbTBxT0ZCRDFBK0toeURpcHhyb3VVdFd3dm5id3dOZ3Q1?=
 =?utf-8?B?ZGkyTkcvZU9jN1IydEhwYjh1NTlBYXNBNzkxcWs4WTVYR0M3cHEzVThOVGJo?=
 =?utf-8?B?VzJNSDhBQzQzK1dPSHlrOENxdE0zcTR1UmwxWTg2S2kvVitrTXA3bmdKWi9j?=
 =?utf-8?B?eGtkSXBBY0t4RFlXUmVlRVByRXVmRUVheHJVQ1RWV2xhZm0rT3BIOW1ta20z?=
 =?utf-8?B?YXd6SE1UYWpYWlhCbUsxdkUyd3BYelQ3em9NZG5qTUpNWXNITVNDMzNicncr?=
 =?utf-8?B?K1ZxT0FLSWpxbENESzhPaW9qa1BTaVlEQ3pUc0lLZ0RPc1FxOGtTZ2JxN0Zj?=
 =?utf-8?B?cWpDVUtTY2llYXdoM0Z3MHlOMEFZeEc5Vk9iYWxDNFR1eWZ6R2lGTjFmaVF1?=
 =?utf-8?B?MlZPZEJiSXBJNnZVNVUrVFZISTRJd0FNcTFHa2xRbVYrMTNSVTAxNUV1L0xs?=
 =?utf-8?B?ZGMrb2xJbGNUa1pDdGNWYm5HTmJJajNyM2JmTzh5ajdjaFNaWS9Yai80UnZx?=
 =?utf-8?B?L3o5Nlp6RlQ1Mi9kZnZHV2FBSG1aeGIwV2ErQmRJMys0dFhQZXhZS0tjY2lM?=
 =?utf-8?B?ellWYmZtQjBReWx6bHNkN2tBVmFmOGNabkt5V2RQcXN2SzFqVkZhTDB4Q1c5?=
 =?utf-8?B?UjhRUWFYenlEaHk0dmlOcEMreXVVRi9oUSszbFFtSWhCcXpzK09BclFYWUh3?=
 =?utf-8?B?dUhtZW9qRGxmM0JGZ1NkWUQzcVM5Vjd4cGkvMnNlQ3RlSC9URENRNXVrSWkw?=
 =?utf-8?B?UFdmMWFod3F0eWYwQXdmcDkyUU1kOHcxNStBb0tqdkJQeDEzREdFQ1V0NFRJ?=
 =?utf-8?B?bW1EVFhESnhBRlE1WXR6WXVxVHhoTFNSTzV4b0ZtY0habisrcTF0YkIySmxR?=
 =?utf-8?B?MndCcmJ5cGRBVTdEZVIzbWx3UTJmWk82VUJ3dUVmU2RpM29ycThERFVGdTNY?=
 =?utf-8?B?UWNGQ1ZldVh3MUgvV3o2Lys4RHoyb1EwSnVuL1NkMzBYZlBsTmdIN2E4dTcw?=
 =?utf-8?B?ZnRJTm1xemxOekJYcGgvcnNYendiSGNqRWpYam5GeTVkQVU2N2xQY00wcXhp?=
 =?utf-8?B?ZjJUWGJkVXI3QmVzaGcweitNMWQwdUdQQTRUelpZbUc2ZExpbzE4MmdjdFNE?=
 =?utf-8?B?cUs0TE9wTFNYUVIrWXlLS1J2cTZiby9YcFhIUlprVnM5TDFZU2JYeE15TTNm?=
 =?utf-8?B?WGpEYVNYeEEyTExaZEh0dmVkMnlleWV0UmRZWG1MTithaWlpZTR6Z2h2QXN3?=
 =?utf-8?B?N2ZycU51bk01RGx2TEZMREZPSEJpaGdFd0puTUJFY01UK3A1V2hRbjlhbUVX?=
 =?utf-8?B?QnRNT2p3Y3FIaWUyZEFHaU1aS0o4NXFpWEViOXo3eDFCbnBXNmtvMnA5azVt?=
 =?utf-8?B?WkFLdkxQbXhycyt4Lzk3VGxuWW0xelpNcGFCYlRTRWUwT2l6a0hmWW92Z2Vq?=
 =?utf-8?B?VlAySkZxUUxRL09PV3dPd2JWdzJOcXI1cTd3ZDhsUmtvTDd2K0kyS1JlT0x2?=
 =?utf-8?B?eFg1MDRsMWZCVzBsaG1mWWZUSmJ1U3BsQ0lTc2hLanpma29xUGFKYVIrcnlN?=
 =?utf-8?B?Q2pJaGZQZGxHVGNORHYwWmZOWWpNQzNPNStwQkQ1RzViMWZ1TGpsWFBRSlJH?=
 =?utf-8?B?Ym96K1U5a3p6cVRVeGhCZDlQY1Y4V0I0M25SbmpjcHpMYVQ4WlhDN1VIcE4y?=
 =?utf-8?B?MFBvWWZFNTE5VzczeVhOZWtpZ016TUpydDFuUUJQS1pTK3NYWHJZUkpMbVBG?=
 =?utf-8?B?c2hIY0JLRm1iMUs0dDFnZ3dlbk5uNVU1eUpHcXhrSFVPQTI4KzJtWU4xMmJa?=
 =?utf-8?B?UXRFd0VMZVJCS2VCU3FPN0dJdTJ1MmozS3U5Zmp1WGF3OEU0MTFyS1pSWkhV?=
 =?utf-8?B?bVZtR3h6bDlsZlhUQWFnL2JoRGdhZDVnT2lLVHdYSmFMY1JNdmNqR0tVeHFF?=
 =?utf-8?B?RXRPOGc4ZUJQVkQzeVMzbGxxMG9hbU80NEZWVHI3dVVVMUlER2lMN0VERVk3?=
 =?utf-8?B?OUFORzRDMmV3akRidkR6Zlg3WW9OZUJLMjFmNUF4YVl4a1N4OUl3KzJ0T0RE?=
 =?utf-8?B?TzhFRDBQRUY4UEVSVDFuenVZSXZIVU84WFVrTzEvcFZRMmJURFBaS0JYQ2o0?=
 =?utf-8?B?Z3ZHRU9qVnlieEN5S3AvdHhPQ2R3NVB5d01RMDZ6aXlWV0ZRbHo0Q2dkc2tE?=
 =?utf-8?B?RzR3dVdoanNpNUpQWnJaSG1wUmlnekpIZHVwMlRmL1paR3BuYlI4eWl5b3d6?=
 =?utf-8?B?OVRtVGdycUpqZklaTzRQMzAyaTRmNGNtZnNzUFFQdjM1ODFCOEpjM0E5ZW5i?=
 =?utf-8?Q?TX3OHIZMTKlhsvXg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: df1283f0-82fc-4118-412c-08decde312e8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:13:49.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyjcwSbo6BjeHtg9FvL5Cl6m/mex4rX7mfFCPNMb4eDXn0Xo2QnLphwQ7kDxtSSzJFvKM2BgQEO4FI7X4EIPquS8qX72UR22YbYd58nM+tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010

The rk1808 hsfreq table capped at 2499 Mbps, preventing a data rate of
exactly 2500 Mbps. Extend the final entry to 2500 Mbps to support this
rate.

This is essential for RK3588 reusing this array and fully supporting
rates up to 2500 Mbps.

Fixes: bd1f775d6027 ("phy/rockchip: add Innosilicon-based CSI dphy")
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5c..5281f8dea0ad3 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -170,7 +170,7 @@ static const struct hsfreq_range rk1808_mipidphy_hsfreq_ranges[] = {
 	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
 	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
 	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
-	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
+	{2199, 0x3c}, {2399, 0x41}, {2500, 0x46}
 };
 
 static const struct hsfreq_range rk3326_mipidphy_hsfreq_ranges[] = {

-- 
2.34.1

