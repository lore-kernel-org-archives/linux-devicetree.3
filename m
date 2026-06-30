Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021119.outbound.protection.outlook.com [40.107.130.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C7D3E6389;
	Tue, 30 Jun 2026 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805753; cv=fail; b=CkjjEsHGbXThcrzkWYWKIwVB+LIg7QCRT8N84+uRlJXEGb0N+XHpQcEu++7IMCRn3l+8ggXkYkz7v2Gx8RfOmWk1m603t33FfQo859u5SPoDf5GY89xVDCzrkcVKR4LmxTWUAnOd55SORjWJaFs1pTZRrB+SmodGOKm4QhvQzus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805753; c=relaxed/simple;
	bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=d0SjaEDNTXg1bOuMHAbAfQhYpr9vf8rnFAJ6c5a08YoVyCYjXTNhdK9HpJWLwFoMQhI2YgKzX+ltqJOdud9kuG5GN4RWF/Qy0MFpN0FvDGLYDG0zQUTFT2iEFRLm5I/T8CEz0A0e4R9Ghft/NgxvsUdq1n07tKbCdd4h9j/AE/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=dy9sduPR; arc=fail smtp.client-ip=40.107.130.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="dy9sduPR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHIVEGg+lYrRcwW4VEr0a8NC8/EF058V0jWmWpTqTFwStiZKA00/Cl8WpaP/Fp0j5g9pxc5WBkMx4I7Ry3XsnuKSzn+jaSxOO0HGeNshBJ8Hm2eazUwis8FJiH770cYXY+hZhxWwKgaozNRmi+plLmeZ92CFiS9DdUzs3zXyHRGnYcD1r9C9AMJd1QBimGJABpiDeRwv1jEvu9RujrnBF3c+TtzSW7S0o2EcEJKbHF4awiqX6yVTG2h5cJswiPaYd6rRnx5LIpIVRpKkDp0tovl2F2dk1oDNhUzY9aDts55jIYUkOszWPR5tWHukJpZOCVThiDRWkY8AXLN3HdTfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=gaNll6z85h9doKnSp5PhKW/roQocR/40mAUnOc/F0Bh7BB0zoSXJqz6i51GJn4NYDUPknoAbVrITswT7BKGB3w0kDtY5vVHHjuva5wJyVhDushGpDnWdPQBghsPwukLjgyAJqbDhUcR/Pkk20dEcI8RtKX5w7p80rxcgSqomJv4t5Ib9+Xk+HAHL9Icox7/tLQHXqwxfN2xpBexU6Og7+1M7ZaootlkVnwTqe6BiG861kX/ulf+Go0cbXVxFAGFMdVWI3ovzF9H9NG9iEtLbuiQg0eIuhIbtgnn/MceJtrWGTNtHexij49dnGRmspJFy06XFEhkD8Cdvm1dsNwgt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=dy9sduPRxALF5VPN8D0vpE/EK01JMjAVrDC1wIT23EPHtFmQ+iT82ns2MElwm6w8xEXYb6dr8X3KqNR3v7TgZ0gs2YOowfkjLjVRtBmG1/eVTA8R66U3iEqTThc/7FKfkiiC3xXuaSGQll8zDLpQiR82oT6DE5W67PXnLqbk8+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by GV1PR08MB10535.eurprd08.prod.outlook.com
 (2603:10a6:150:161::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:48:38 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:48:38 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Tue, 30 Jun 2026 09:48:24 +0200
Subject: [PATCH v3 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-feature-mipi-csi-dphy-4k60-v3-1-176792ab71fa@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782805715; l=1213;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
 b=XuBjlPQ5QkaPsMuCIA3rQIJdjCDpjqt1z2f0DygEuE2ug3pmzbs5aJHweUSTgBSo3GV1PlSuv
 +sEiVJsudVRBNNAjMqGjWsfxj+4CnQ3Fo9ZSmE0pEBPh6JHFjT5PwlI
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
X-MS-Office365-Filtering-Correlation-Id: e544758e-00d8-4054-2ff4-08ded67bfeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|7416014|22082099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	e6fHhEmtAf9qDOmImY5fRFSBjdp06i/cT+V+2m5xUdlg90Wd0aIzP3+bHdkq6uzQCZ0uX8ZeokTMX3H/CuFlWSH932BmBzLm9g+6zBtLxheAB8sCLFwh0MkKGrdfjGyKCHcPUbZonWFtyfAPJx9ABUDXMqAULA5WAm+A90gC4rpwKpozNgofv+hjKZFnJkFUWhjqvEAon5k+MGC2YZhNEUUIOnxjL0ooL/Dca2HsGa/Mj+RMvwwEHln/e3n2ExoyYBKuzQaGXSXXn6ItHJP2u3AZEav8lGSmKGcl9PjM56C3DlvEcvFF0pgKS0y3abcR8NwWiKpB25XGokp1UO5r3SQt6fmVzBoJk0bjk/R4a5ds5I38hGdel28Dnyrs6bhzPgAQaJen9nA78iu9jd3gXRbi4pyUmxS46piHBRboIWERpSk9DGjRk+HG+ECjWKbgEw9v4/39lPLqv4YZxDwemDZ06tYmTlhPw7buhJDBUzCpRYeLazkOj7pM6GyUgB2ZW1bWjdkxi+vPcskWtuImtHd9SpYkuOVQb670CRYscVFPsHDCWCeDK3vp9ZmXxZHLggS2ePMT3vWoRllsjPO7wdUUQZLn0wwfd5exzXzQ9HB8f8Va5yM79d+a5tj0Zlox553mG0TvTsMkY/EeQgBh/DlkI4sOqQYBaw2D4Z+qtCB0zww0mZv6LidDtiT/j0JtwNtowDA/Q3TB7lWi62tT1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(7416014)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3I1L0ZUOFFQYWN0QUIyaFNYMlR4cDd3dzcxQlFmekRDSlZmRTZLRkVZdDZ2?=
 =?utf-8?B?S0F3MlN1bXkzamNqc05CSHZPczRqckJabkhqSEhjaGw2M1hCbEgyQUE0bTdE?=
 =?utf-8?B?cEFtTHpQQTR0UGJtcklzV2VWSGdEN2tuRnlIRXFrSHdFUzhJZjVYYmxpanBM?=
 =?utf-8?B?VHR5b0JqcmxEWW5pTGU4VzNxZmJnOTNPMVVSQ2VQbDNoTGtKUFdJSjlJK092?=
 =?utf-8?B?R3QvenludkM2clUyV0loNjZpZFlyNlNzY1RQNHlsT1dVLy9aR1lTbFFjZ2NV?=
 =?utf-8?B?MmNDS29kOFUrREd4bWU5L1kzb1Y3dWYxaFo4M0FIaVlsVXNRcms5OTJUNkYr?=
 =?utf-8?B?REVsbnBlZFp6eWJzbXQweHlHTmhzcmhIVEczcG1xU2RySHIyMUR6MVhCT0F2?=
 =?utf-8?B?bWFUdE8vcGFOZ2tlWElza1Jsd2JRT2d5dTNLNFhXclgzNnM5Rjl5OHNIQkl5?=
 =?utf-8?B?aDJRbW4xbE9HVUxHWGJZdkhHYi9Xb25LQzR5YVRVa09Oa2RBM0piSW0xSjdB?=
 =?utf-8?B?ZmIxWUtxM3U0VjVHNkJwb0JncUdwOHcwMDBrcmhyT1ZMSzlyK2s0Ly9kQWlY?=
 =?utf-8?B?RktJLzdMTmxMU2IvUmlqNng3Qk16SUN4MjhoUXZCeGIrTzJQNkx2NGE5RlV1?=
 =?utf-8?B?b0ppZFBmYkVOTVk1ZjFnQUc3U2VsK3B6TmxRMzBGWTZiUnJ2OWNsd01XUyt5?=
 =?utf-8?B?SWNCaHdCZm15QXpielhNWktXVDR2Z3IvaVNSaVVGUTRmUnFBeW5rL0p5a2Zw?=
 =?utf-8?B?Z0RJQkdXY2Nlemx1dktHZjVRQTd1dDRVU2lJZVpvVEJDRUgzNFRYdzVuUEZN?=
 =?utf-8?B?OTVBM0l3WVhLTTlJZCtERGJVVW40eUZVdEJIZ1ZwZllVNHNFUXNpMnVYMXBi?=
 =?utf-8?B?OTh0c2hvbDVLYmxGaVlQZEJzK2c1TU1PNHFqaVIxbExTdUtVVlM0QzA0UFZn?=
 =?utf-8?B?akNDRC9WVlBCWXdaOUgwbnh6ekluUDFBSXhHbU51NUFzaERiYUNOTXN6YVBL?=
 =?utf-8?B?TTlsY01vS0VyQ3FsR2c5bzVDOEtMeFUxS1AzRnFrd0JGZEdZaGpSTTlsbGd6?=
 =?utf-8?B?ZjNEQkkxR25VUUZCeHRJeGtISDc0THd3cTZ5anowSU5Ielpqb1JVcFVub2dt?=
 =?utf-8?B?MGFOelZhVTlETFBZN2FuTmxuTW5hRHhrUVlGMEVtZm90L01wVE0yVFpFd3hZ?=
 =?utf-8?B?aVY3UjdjdCtmaFB1UjRqVm1sZHY1TnhpOVQybmIxNFFON1lCa1BSVE84Rm1O?=
 =?utf-8?B?OFNEQ0NHWWllZ004czBNSVI1T0o0QkN0cnV3QjNwSURBTStlRjNmbDNjSytM?=
 =?utf-8?B?UUpzSlYxcUpRRnUwa3g4RjRzZUgxRkFqRjI1Q2xhS1BjK3NpTGxFSGxDL2li?=
 =?utf-8?B?U2J6RXFOTE5Zc3o0bzYrT25CbEQwbVp3cWQ3SkNJVi9uV0hyRGtac2F1RGhT?=
 =?utf-8?B?SGdDL3RtR3NaMTkwbnVmaFBOYkkzanJydjJjNzdtWTAwOXBaQlVrRnBIb0h3?=
 =?utf-8?B?OTRIMmlUbUdWN2g1UE9ubGNBMERHdFcvU3JrdU1ydFJKR2JSemJYMTNUQWtG?=
 =?utf-8?B?bVhmb0FETmdnK3ZPcHRXdjd1eGxXUjFhNm5aZHQ4V0pyK1BvdFZmamhOa3pC?=
 =?utf-8?B?RWNuSnZuaFB3eDNzVThaRnhWZEM1SmtTWGpVVVJvTjB0YnBCZEk1TDNKNFNw?=
 =?utf-8?B?b2tSeFJDNHNxWW5EZ2lUOTJzUnNqVjZsQkc5YzZ2RWQ5Y0paMFpFZkhMd0ZW?=
 =?utf-8?B?V2xoclh1aVF0VGNCZk9oZTZzN1lMQ3NMVFpZZkQvemZ6VkJHRHl4OUo1U3ND?=
 =?utf-8?B?TXdkQ2lpUDhJMHV5NG1OMHFOTTRyNSttY05CUVN5MGZ3U1NCd0FmU3hNNElt?=
 =?utf-8?B?WW5xWGpSY0FERnA4b2trREpCTjNSZDFFeSt1WmxGYmh0L1ZUQ2daN0RtOTZ2?=
 =?utf-8?B?dzhESi9IRlF4RUd3ZXJ4NEFacUJ3T25mTVVET1d5cVlNM0dxS1dQL2NHWFNK?=
 =?utf-8?B?WnQ1V3ZHbXQvOUFGZzJScDM3TXJDODI0OVd5d0tLTXBtT2NvSFh2Z0hKWGI3?=
 =?utf-8?B?S1lOdWRqL1dMRFQvamdiTXFmQ0xCeDJYVXlyTTZBRUJFR1A5SWRWWkt2aDBv?=
 =?utf-8?B?cnhKYTRPSHdIelhGb21Tb1VJYWdwN01tWUNwZUtVZUZaanFnNmZLUS9tUyta?=
 =?utf-8?B?LzFNeCt5VE5zNXFXVTFoRWY5RXVIMU5FTnkzMjByb00rbEtibFZFNGZHTFdL?=
 =?utf-8?B?WkJqc3NHOTJzTURrajBLS0poRUpuY1crcFp5cWJIejF1K3l4aEcwSW9ScTA4?=
 =?utf-8?B?WWxKMkJCVUtEOFgvUCtwSGZJbVRWdHBOWW9VSks4dkFIeVp2VXFHTnBYbjRZ?=
 =?utf-8?Q?9n1XsUMoWNainMfk=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e544758e-00d8-4054-2ff4-08ded67bfeea
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:48:38.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeEH1d8Kmxo9VIbZuhorSPKSAqTZiw/V83szbolg0slRvK12/cIl0ugXkAJ9xWj5yJ1YKFyW5DOiVfCVfXaavsXXz1UdATx90udTdnYBDNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10535

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

