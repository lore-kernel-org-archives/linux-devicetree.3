Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021119.outbound.protection.outlook.com [40.107.130.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0DF3DDDBB;
	Tue, 30 Jun 2026 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805742; cv=fail; b=e1AQZO2VXY6X+WMeMEH9aBhdGuPWuGB3jZOgq8jKnLxDmcYkeYA1uuXRC13uG8dLPzxrhq1NmgWNx9/s+ePE3WwwqZgIfc+cLmzMp6YF4NLh/80APRlbVEVZp6sB3Rsr7WFFBYs7mKw0mxrXG09A5gfaLm6wagNhL+BUD/xVjjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805742; c=relaxed/simple;
	bh=XOInAcYeVANBzG1ouWWiDWDNbXTdfyB1GnggM9VN/vI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WbVcvkWUHyBBgk/dKOezon8n1EKUu0TmpDccVA3igNwgpaPjwkbMj7yGdItF5ZzI/rkp+UBNz0kOrxAu0rQBSZFQm4s+Viy5fkRBPs3GhfaFj5NXghba+yxj/Y+/mRmVFyyReVUGJcZ4LjuuoVr1lQnjk486DDeSt1wOqMnjII4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=FoOjdkyj; arc=fail smtp.client-ip=40.107.130.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="FoOjdkyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yII+ipZnzEsSOUzC8ia6WQZmWa7mmKaNCcke4ZcOmco8uUSGv9UwXGvYfMip9Gxq/1FLDnhE46n4YNwPrac0ZNQksk2XmLih9MhNOI18TI9ll4lpSfjqZz8ThYctRCcCX9Dq4RhTQmZ0kd1zoj4kTKmmbMttfUULcjFjCcvXp7laJKAxMuBrtPUsSS2aW+2DajhFnj5lFezxkckx2HIyAUdL9stw5In1cZOAIHTb5+w4NGmmCHG7hC+qOemiwmMPcHvedMlMmUEekzUSCnOcIGByH1APIF+j93b7yhI2+rCrdMXmCgQnc/cpaRjyb6RhkXFjTxqQbZRgUpe0XgHAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyxjuxbWIId1KydJ1iQKnZUbGUZvrOByju1Nf40tMpI=;
 b=f+LDh+tMUVYd0lHxft3ZNBeTg/FmYRVE3X6YmgdAuysRV1onES05BgEaVNz9ufZszyM9EuXLVl98KaCmc0XCUUYow247i1DH8XoQZZqIiWL8js8tMSf4lzMlkS98Y+EbxkfSPzKQDy9Zbjnig7SaM4C38E34K/zCHRtJhrguF4th6e1y4pmiBj044CfhJDGKLXW5q4XfLq/PFplIJo6AcvwqQK2MuKb1Vugnz5PVr3OJ0syc+7reu3VAxStLXcDDjcqyplluTuhjM/PLG8YzYoQyb3rOFFNqZNsxFj/q5bNz7K23EqlToZp7jHSNaJW9z35Z5uGahrGKvqQMdMoDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyxjuxbWIId1KydJ1iQKnZUbGUZvrOByju1Nf40tMpI=;
 b=FoOjdkyjDPgujw5Vg4TRDlOk+C7mPOJ9a8a7+WZQwff7gMjrtRFPGBtYiMQa+UowaBZBTj+4p2+D54FsxplYjuEJk/CSjDNKUWbhIPrNBLvtKbMyjztKECm+qwJq/idtbQ7d3DljfdIKgmdIDJ9gPDGQ7z3JHyWPRok82Xij3EA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10535.eurprd08.prod.outlook.com
 (2603:10a6:150:161::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:48:39 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:48:39 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 30 Jun 2026 09:48:25 +0200
Subject: [PATCH v3 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805715; l=1239;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=XOInAcYeVANBzG1ouWWiDWDNbXTdfyB1GnggM9VN/vI=;
 b=KeDnO4R+61XIw8j1Q+ujHiQxRifjpK2kZTNNGnVAmqaQuy1Ohv0MUCPHtXc9DVq6fUChLGFHK
 A/hsONTy6jsCCbkAVdqvgTN90v+WSqJ7/da2pAXG1e6dResvpLQOcec
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|GV1PR08MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b76f525-c260-448b-d797-08ded67bff93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|7416014|3023799007|22082099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	whhcLbv3R48HEnNABHHjRMuNDkRadKfY2izTEaX8Mt7p/bUCNBbEKRlWI7L50fy19gK6YrywScdPss9hBQ4kR95joyLgd3OAc0xJGS4TKDkTxAkxoHuEFXweqfgfeHeQkAeiFTOwzOkGymkLTQ97iFayNb7D6HOVDUdGqU2x0nQq+12NS0SIcyRfZ1OV0FBOAEN2HP1lD9wpsCo15IRqMR28R2h2aRpxn5OfTm91DxgJQj0mhms9qzYx+0kGWzM0cJx3xpBTvL02Wu+Ug6xp24/L/1PhqPvHyOiBSRZVrHHIpvh2GI/Q0jMnSTbVOnkrVrvTsM/toqAlZpIi+EI6uoLsW4+sH+7kv4puPSZrOtS4xqPD38O8scqc8gRZhFHHT3nz9N0PAj+nu966mFlBkZbp88pVMEGYycHt0JwQ+FxzXDUf06lyJVYa2KlIhlWxiDc32WUPY727QQeKSA4EHYnVRwWUru6TbrHLZf6Ukx+4A6/C0tqVY4kvyH7LdUOQwZRcvUv1FBr9qeIAq1RHF1i1THprlPerugU1jolC1VlMx2i3oPeQodMUcG2bizbptuK9+5GL9a9acml3rQw20XUpmb9jdEDGYknRm8K/Unup90iTAsrL+ScnfVFDZmPQ+5+Xqe6nOnndwq8E2wnP/ky0ACbOx7J4nlYHyZHwphb6cCHwoDCSVZ+aK+396/qWO+alO4dtzwKQrK1kEHq9ZYdQ9y3i7mE41XO7oQoSuNA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(7416014)(3023799007)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZEQVFDOXFsZ2ZIZFlYTDNpZFFLNHpTRktaMmk4UUUwZ2czNEFJdWQrOEFX?=
 =?utf-8?B?RmlUa0t6ZkZNNjRUT2VBai9UcVVGNTBGNFJDb0ZWNHczei9DdlIvb3BwNFlT?=
 =?utf-8?B?R1FuNGdwR3N4R0M3Yy9ETzBwaWJLQ3FYVi8zZFd6T3pkUzRsVEFJMVYvbnZB?=
 =?utf-8?B?K09lMUV0K3FGekxPblJxT3d1YnhLSVJNdzQvTU9SVjllbSsxMFVOVzFDcDgw?=
 =?utf-8?B?SmtqLysyS2FhNnplenZQQndFZVNxYndwKzlLS1JZVnpXdG9vdkhqRmluSFlI?=
 =?utf-8?B?ZHVWVktVbjZ3bE9MYkdmNnhmSG1mREEyNnkrVXBrR2hDU0U5b1Rudm9yNGV5?=
 =?utf-8?B?by9TWXFhcE8rYkdyLzhTWVhWZkVsMHZlNmxra0dRY09KSGlRWXAzUlZNMG9I?=
 =?utf-8?B?S3Q3SEpTOTVxUG8xSGdxdlhWY0pkc0R2RG0zVHMvaEFjTlRrMGtuR01SQ2lC?=
 =?utf-8?B?MWt0UnJWZHQwZUVrMDJTUDc1dDExZS81bkg3ZEQwMDhjcXg4QmhlSEhZMzJJ?=
 =?utf-8?B?WGZvemZQTXlCWXhXR3hqako4VnhUY1FlQnd4NU5ES2N0RWdzM3hqMzlrZ3Jj?=
 =?utf-8?B?L0xScFp4d2d3MzBPYkIzcElGRFZ3UU84Z0lnR1A5S2hVSVNUR3RxZ3pCSFpJ?=
 =?utf-8?B?eWtlTlBpYWlvTGsxSUc5Sk1ObEJEUTF2SFFZMTZWbnJRL3psMHVtUEF5RkRY?=
 =?utf-8?B?TlpLanl0M1I3RllzQ1UxdXFrNnBVMW4wcjFxU1RFbU1kMEwrT2hHMTIzOHFI?=
 =?utf-8?B?bThUNk4zRFBzR1ZpR09Zb013Wmg4a25vdUgvNEJZbW1yK2lZZGdSMjRzS3JC?=
 =?utf-8?B?UElFNnFtVjhGNno0RDczM3Y4djFvOHJNNXRnS3dOTDhBemlzRk9NQzErbk5i?=
 =?utf-8?B?UUZNSVR1S0dtSzF1T095OS9WVUhpOUEzWE9IV1U0aW15QmFUSU9vK0RiSVBm?=
 =?utf-8?B?WlMvNlY4WC91RUtTaXljN0NjQkZuZmpSSXppVzQ2aWFLT1dwRFJTZ2JpdWda?=
 =?utf-8?B?ZjRWQVdpc2FFaFA1YnVkRWZSUlN5SE1PNjhhQlVHN01rSE9pL2J1RkFOS0p4?=
 =?utf-8?B?bkNEaUxmWThsdmdPcTdpaW9pL1RvUlR4RzJVS2hscDB0VkE2Qm5qa2RMWTZC?=
 =?utf-8?B?bjdPeG9oS1pjNVFWOVhHb1hTREVHN0ROLzVrbkFEbWJ2dHlDTHp6WkpFTUJ0?=
 =?utf-8?B?TWNvVCtsUG5mOEd4bzQ3NTVPRW1lMGtZMG1UQWNMUVptTk1OR3pyTkRmNGZv?=
 =?utf-8?B?UlY0ZmRqdDVERDk0MjVaeFpDMmdEcU9vUDBtNFJocm9vZE4rOGJ6c0syRVFn?=
 =?utf-8?B?Y1YrWHJTNDJyWkVUUnE4S3RUcTVadFRWZkduRGh3VWdTNDg1UWtmN0RJVC9r?=
 =?utf-8?B?ZjZFZ3dsampNajVOdXRwaGhDdExQUWNUeWxvbklnN3hvME9lZ0NTalAzQTRp?=
 =?utf-8?B?NXBxZmlpNFZ3d3lxb0I0bUpOT3NtMFV5MUR3c0NQVVBOV2J2WXlYZHRHK0Rl?=
 =?utf-8?B?aDZiV2N2VkpYY0NTM3MvWTdJYlBYemRDL2tjWndrTlF4SCtDRksxTGZPaXZV?=
 =?utf-8?B?UStmVVN6dlEzZk9sMmNpVEFPOVRwb25icm1qODJ0akRmSDdqOGJMMEh1RjdN?=
 =?utf-8?B?QUl5Y0tSYWFZbjd3dnhhS3JPVkcvbmhLeEIwM3NGTTc3bDlvcVZsM3JhSTNp?=
 =?utf-8?B?YjdSV0kvTjB3eUl4ckRYdUF0ZnQrQkdoeVBjZGwwOHZ3UnN0RmhqeG1Jdnd4?=
 =?utf-8?B?d1JoaXV3MFEvS0pXUUMyWjd3Nkl5K3UwVWJxR2FjeE1MWUFVYW1yZW1raWU0?=
 =?utf-8?B?RFZJbWtxakVUcGlTeDRDcmRTZ25ObDJlcnNkOWJVdHZoNmdGM0k2a1F4endO?=
 =?utf-8?B?TWRnUERwM2ZCRHRaTXZjNzlvUnh3djBTbm1VT0hLZmJnbFZXQ0o0Ulp6NmlT?=
 =?utf-8?B?K2xyU0F0bzAxcGRrSGdiYlJ2YWo1S1lNNHZ3WkJFN29WNjRuR0F1MzVtZDdR?=
 =?utf-8?B?bHpRN0VvWkRMbHNkOWJ0ZU1EVTRkSHlmUngzK0FudkQrdU8zb2xtVU1iNVRQ?=
 =?utf-8?B?dDVrR1NCclVUQ0pWaFc3cXlOazhJOTdZaENJWWlxUVRUV3dKSVBsaUNSQk5v?=
 =?utf-8?B?dlVya3pkeis3emVaV2VPRkxrdXNTNzBWUTNQNnVHaFMrWmpaYjJJQzkrczdo?=
 =?utf-8?B?ck9TUlZGdWNxajdhbEdwNzdncSthcG1qeVZwMDBoalFmWDJaMzVsclpQSjdC?=
 =?utf-8?B?dDVYTmVQVDA2RUY5MDdEeW1KQ0RhMkNEeEViM2svSDJFc0FKSXIrT3NOZS9o?=
 =?utf-8?B?SnF1RFNCTkRyTDEwN3J0QVd2N05MbDljbFF1WFI4YjlEdUhUaUs4dFUyK3RE?=
 =?utf-8?Q?tNvNe1KZnY7lCvJY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b76f525-c260-448b-d797-08ded67bff93
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:48:39.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsVFN3C6BvYI745GLISNPC7H9ALbmN5knUgrgEWDZj5cby8hdYD0HyWNkl9DRZfwTs4F12fwUBGK59jCW5TcxnHSMsGafQICqkvWyKMOep4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10535

Add support for the optional rockchip,clk-lane-phase device tree property
to allow board-specific tuning of the clock lane sampling phase for
improved signal integrity across supported data rates.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08c..913aa688c0ae9 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -56,6 +56,16 @@ properties:
     description:
       Some additional phy settings are access through GRF regs.
 
+  rockchip,clk-lane-phase:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 3
+    description:
+      Clock lane sampling phase selection (hardware tap index 0–7). Each step
+      corresponds to an approximately 40 ps delay as described in the hardware
+      specification.
+
 required:
   - compatible
   - reg

-- 
2.34.1

