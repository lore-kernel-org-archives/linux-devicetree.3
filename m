Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795710792;
	b=yZDMBQIXedXbkWyNYrH0ooD8ii10wVLx5vHD+J0vlwHAD08Zuth7s+5nux3EkwO4LtaE
	 QWCIi8eThj+W7LgPchbXJ9NKkZpibxBikPnY7RHYLugmfv5T0h4B362fkFqUi4DgQoUNG
	 yQB6fxGRhNmxLgCYa/T34kg+eivKQk9fp8CHytg2mBrbOyi6YeasrX7tBZJWrnjFrfiSg
	 sQ0t5FKwkYpPaC2tAyw955utbhs1/HaCfysNbpoxBSzZajGgzNRBO4uaUb4CFfSREvdIV
	 ULWS9CO46kxkQsw0J1VHIKPcC18gOK59YiSDPUSzOWYhiq0oskNRmQx4YO2ygXuXELQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710792;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NN40zuvdIzZL5gRD7CWvCn8b36fSwO3XlH+v+NWej+Q=;
	b=BlcKShve6PHsjYNndbF+apWNaafUGhPGFMil8jfg/BbT6nWQRCvwNYAgSCrZFDq1t1JO
	 jfZd31sZt7+ZrPwsOg9ms60NoSBudCZokm9dgPHholvopZW5OsBC2h9/NZ7oBKKD3Rfkh
	 CYBjLIXWT9ff9ax0NS2Fb9LDBN8Ga3B9RmUCiHiO1EWQe2zxFj92sLt6NyKCSoTVabCey
	 S/3lezwZlz+X4ZF8YGTka97nzru6KweIqKP8uKc2pt0u3XuMRYyv67aB8Uy3Gd5abL1fs
	 hLrJ4nf9BOSS0rDby8lZBezcVm5whC2BFaoy07C/Q4zLvyAqRoe4gRsxxMUMFi6+D9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GRklMCfP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8957606A31C;
	Thu, 26 Nov 2026 16:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8957606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GRklMCfP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfE4bDQLfE2YppNB1lTGLG/pQprjeo6m4dvNMnkDoA3T092QnE7BgTrFEnC84bGBDxByJX1IjCq3D6/mCW5l9qCJFmI1ivqSMvWL1YYwns/XSPZR69+4xHuHhcXcP5Hwl+N+1gWRTVjAG1zFR6xhtwH+coSbPzj/1xUdrnBRjZLy36uFQ/gHpFWTGCkSVI877UL/zXIWiFZO2OeTInCTLCHxdO+7gpz3emnCL1USjeOWi4nqSHBbKhBz/LovaaRoUlI0Y6Qn1obO0T61r3OlFbcmAr8JIzPoMh1ql+8XY8bvIUakUeyFdir+SH0uBkcyuL4pSWEJ7U/BMbLvncC2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN40zuvdIzZL5gRD7CWvCn8b36fSwO3XlH+v+NWej+Q=;
 b=emGrqIuu8JOg3rzLL8ySHtztFe7MnbeEHThCa5SJ76u6gShGzOJG4KLNJYj6BGNPM5QRYNXG1Tk1oHFLHgOyYT0WiW5pK4OMBc2ey8BKrulsYDnV8DkMJ/ksveGzU6s109z/o5M/PJitgfqZhrRLCD0eGGju5r0HAjraf58FTseWWCtTSHEnec3UbO5HQmmjpNjivkIO5XxeAseWjb+ETeT8AMY/pdHGHorl1vGHca818KYZhJVKbsFXjNmcGbWu5g6st0Rrri+sdMAtMt7tm2YaQfe2ycdqJClrgMzccIVFUFuWq51vWtKlY+KtQRM6VtsuJC4bzb2YsowcyCXYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN40zuvdIzZL5gRD7CWvCn8b36fSwO3XlH+v+NWej+Q=;
 b=GRklMCfPOLIKQkzzMlZTvVH5l3WxWC0a5ZmJAsXrVM4KdrJYEKVBDBA9rbxzKL+rEvInBVg3Uv1RsyqQ8C2/IMoSnbgxYIirY6OYEyLvVCiDTEMpnl1VHd9no4XuiL9PpR9t9nY7PYYEkn3rOWlBo7PzMvxIgJEqTH8tQgFF0XhL0wamBWG/D97E2MOhBIcc5lHbNY6xHyIU2NHPnhlVCsGLazlbPIZ/rlkWzkx6zVC1GOSVHk8BuBQx6PQpKqsOELBe6K9U12S/JzUwg2LnmH1Wz+LCOX26soFbfVKP8Mk1dDCCBqKxmQXKfuc0r9NqyqTK9z3QsH0nvES33jNp5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by DBBPR04MB8009.eurprd04.prod.outlook.com
 (2603:10a6:10:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 16:33:09 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:33:08 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/8] dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6 APU
Date: Thu, 26 Nov 2026 17:46:28 +0100
Message-Id: <20261126164632.978624-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::30) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: adc122b7-2de8-4a86-c3ba-08df4bdaf3ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|10067099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/X9suUoAMAGy0dbv2Tn4SU7pkfLf7Gsu0VGrOScxLwsKvwPhpsFk1zkFNjDuRwR3gu85S93izzdK/CW61JFsqnf6XwpvbK4+CDc3Qy55HDGiV+5gsQp5SbilnSbBSGukTGw0ZePNKUloxFfVjGqYj0AR4LaqghtytxL6jkGp5PpKjtgj3pWHr5XuBYCJBlZ9+9IUcKISPJ3d2Os9pNoJ3Uv2r29XW+pRa8QF5vdvUA80DkJE4v/Y6w6sP8I4CxAWNpQNEsx1J1dpn0KYC0PfuRJ41MdcRSnnSPKavsw+ly5+UxjSNAKIOEKeRtl9aWqfSTCgYke9DBFyDVi6iyE5P8mKBTqebHXK7pnkYKJ8XxFl0uDZjejDnjBnupPGo/s4sRFw4q/qWTFubICclMCHzJfLchtorRFEdOcviSiYYKnIijLyOLi5uSGjUoECgzuHPiBTCWZOKlGKZCdlxDlrfiNdB5XAtPGHCIZVkuBxWkUtWBVzy/L7VjoCIQUSOEolBqCJ0XvqNSVOv5elIYuVJ3eoGpV09P0FfBNxD5gdffbbRIsMdmIXBbGM4DrmaM191jPP39h2NfBZwF7KMIUkj/BYMneukH9dRBT44pb47GMtdEO+BWoxlaSgmstOJFWwyobwNw1v1D7dQmwSr+r2BG6wDINO7GD/LgfQYZ7gB6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AX9SqO2C4rx/NowjFTWO7WmP0nZuy4EsYsaweR9RniLyNXqESCaNpnE+L/9O?=
 =?us-ascii?Q?kViWIOaz2CfJP8ITlF0L3XyQVELw0yc4aA73pMi3O8OKQBw7lv1QisXVUA5Q?=
 =?us-ascii?Q?7XMFBMD3B8ZgmcPvQySyO3VYd2Zk3fvAmQTz7jRhjfPYBYv8qB1zNFt/OQ7l?=
 =?us-ascii?Q?zprSnS2IVeDkhLBT9Ziky3VkRF7t8H2n/vLU1MwPSA5YTk9fwFt9TGQcIJ7q?=
 =?us-ascii?Q?OYvvLYRbDNJZBJ208wjfgSmNwSrrdW3WHEpSKY/cdNueGiEgRU1dn/O0TJQw?=
 =?us-ascii?Q?1BCO5F0vSGtzvAqZJUQWEC+kZgkp8dQGssXC/Iq0DJZqFofAO4oAMQboz5sW?=
 =?us-ascii?Q?nn2OkEv9O2O4cN2LYlUeMeSIPJSsSiRbnjxodB46zYniellyqwqygKBYOydq?=
 =?us-ascii?Q?UZOjF0KMR1zg+lKyqzj60WLhDUxy5dJc1QGedJGyiKhtvbb3odi8ej2s4HB5?=
 =?us-ascii?Q?DRUiOg7V0zNHmgQm1gRxtBquIH5Mq8fj+Grl2kunQuiG6jh4bKV/3xoB9r1b?=
 =?us-ascii?Q?FmL1u7mk2TNH8w2UxKkAC5MnoMP2aCTGLX7+8VdTSKHnvAV7WBojTalPaMTP?=
 =?us-ascii?Q?39DBR6/x4kJS7rdIkMM8+ilI+AS5grDsrWs4+UYVI8DBL8eoyi/Kc5NicTzA?=
 =?us-ascii?Q?CeFfkb0H3bq5GNMQQ2eJZSnlRWUHcxr+h3BBCimRVM2ZPmbwafufXDZJAXzH?=
 =?us-ascii?Q?hltqmSbH2slXbZbUdDwm4TF6x1N3Cj/Y7DEASMWdHeGKXOWAcJIhE1GSN8Io?=
 =?us-ascii?Q?oegg38kMWhXKdNPzd2hCj30bRBXGmW+AcAd2ny2/Ql4sMXKHy/mJ9s+teX8P?=
 =?us-ascii?Q?kOsF5OoDbMMK6Us8cYtNJYueL/pLsyNT3IVGIiaC3oCI1cdp5cLGFzw9MOQ0?=
 =?us-ascii?Q?71i78E/3lWG/NtYiiNCU9ubC4iFc/0UyBPSodi2qUR1io282PMIrEb6uG1z4?=
 =?us-ascii?Q?NYzHT2pPscchQFd39x0iy4EXr7ImGygTTItmvlTCDrJtVfk5r07elK3BWcXz?=
 =?us-ascii?Q?2Kmf/WI/qf5C29ERrUUC9mUZ8cb0iYnj37S9/GZhf625jSQpvkAzpeGMwqCl?=
 =?us-ascii?Q?3PGM6kUmcBV2+i1EpCsa96uvWTJh3h2RmuDpBm8QHoSnueF2m4+vTkHyZMtA?=
 =?us-ascii?Q?iEV/A/KTtXsJcYN0U6P8EJKLXg0nPnPEbSHKAv3AltxdPM8XLFoocnybkpQ1?=
 =?us-ascii?Q?hC3phQmKs3S1Cz9LZW1rTH6iNqX5yt75nS0RIXJnQk/njsBd4tHY3n39yuzV?=
 =?us-ascii?Q?5ixMdduRB1TmRnjtiFIER8oARpWDb9qpQ2YHV00Zjgx0HupWwuMhiQYUhzJi?=
 =?us-ascii?Q?YsnAah9uXxVhosJPt0g5hQfeG+xRb4h/dud7P9kDkRyLrv3BBkvY0RgiQCAg?=
 =?us-ascii?Q?SnCl6geevuuUTEa5mKBcstqXJigf1P5/ZTFS6S47WML6eEu4mfd+sIsCvSc9?=
 =?us-ascii?Q?lm8PrcvXSzDosuK8TMPs+mq2ElpedPvX+3hEVakNInf/lrZfNAvJuwtbQsyU?=
 =?us-ascii?Q?dhAfuEFl6bne47vrx0EQmnj7q9p0dSRbpL2v4eVsv9is0eqGVDhKPQ9sHuoA?=
 =?us-ascii?Q?sFIT2LirVxmTo6uIJmPDnp84wv5u9+N9XgCgCA/+GO2aQd56v1r1SpM7QZsk?=
 =?us-ascii?Q?aqf2/40VWUYj2v5Nc3B4E7VDHleHNcGB0n1bEaqB7lfg/W51H7e9nDGMq0fv?=
 =?us-ascii?Q?qYCoT1fhdUbwXb8qjOKL/8k8Nc5SRqaYqW0XQmyOki/a7LouF2MqY4z1SjJb?=
 =?us-ascii?Q?PS4n/mTSpOcACcNZ6a2KB6bxKgj0XS6HDY7sagoXJu0SyPbYTxoAmjoUhvnQ?=
X-MS-Exchange-AntiSpam-MessageData-1: Yd66XYkYCTVG1A==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc122b7-2de8-4a86-c3ba-08df4bdaf3ad
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:33:07.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtYHKalll/EF8pcFIcNQu5E9VKnYaKnBGH78K1s/uO3HqjeD5H7GSxI8TPpFlz3SKOBj/W1Tav/VjjFbNsRuPi4MCrmYE0G/6oSAIQgW31LExGCGmvMwJ3xwoyt/cr0A0U9TcWmzVNZcKXpsAKrMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU FPGA platform integrates a PLIC compatible with the SiFive
PLIC 1.0.0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v2:
    - Collected Acked-by from Conor Dooley

 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918..00ad63ab0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,7 @@ properties:
               - canaan,k210-plic
               - eswin,eic7700-plic
               - microchip,pic64gx-plic
+              - openhwgroup,cva6-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.43.0

