Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023078.outbound.protection.outlook.com [40.107.159.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC423B7B8E;
	Wed, 17 Jun 2026 12:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699031; cv=fail; b=VsyfPUL62YMGR+pvJpOf65tv+SDRZMG3foIUsPd7qjUJ8qjY10k5mmqPg1vkM5f6oxDubh9HQlA5iclFt66Z3DXrK5x/ILNnrBjpl/5kfe7EcB6b98Y5NBHQOSy0RPI2ZnRW4KJbQZ6vP8bChtMaXrOA8TLTMz8w6KiZn//4Deo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699031; c=relaxed/simple;
	bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SpO1EaZwoAJBekDxYFJReVI6yBbH8I3h352R2P+SPmGMjBe70OfhUyoCNsXCawnZB4FwJSkGwqdzbC6E4eDeZ83K7Houwhr55cSmYNv3DIVqRpqX5EqKmA506Z92aC6ViksetvD1mo0bEhqkvJGTAT1GIJA4kBf6ZELtzWGgPUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=YUJGJl9C; arc=fail smtp.client-ip=40.107.159.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="YUJGJl9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjLuH1AJ8YeSU86IpPEBaazVYxMO1mP07lUgelOWmcryRZ8KcYGSNGPiBs+lTVVBwmxfv8kQN7ksGKUtJ+SqFKLkOf6G3NCNTiP+moBJmZ/6SgzhIPDVF20RujAAxEGfHJ9zCJBFEqEXANs1usMFDKH8MjlgywMlmv1Os//5n/LljZmrJqX9ZYmEu3TreCgkXLa8tcgSaHW/newsPZ8ZsmjTIaYbvN/6xtN/IAp14WH56jwDFh/HICOfvRe9KyCcjpoEY2nfCpv6X9m+dpGrNaovSZQExPSuJyWN+slk7QlQwPEJbE31AOglk5XyMsvv2lSlhkamrJXPd9cvnq88Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=IhoD01ZmVPDuCG5neeGo4EO0OoVtt6zoqkXm8BNGSTc8d9KwXksIZQxqyyYxP9/GoRSXjsnEKN03/3eId27yljdBU/NwZWewrh726n3oIn2to5kEDEXApxP4DcY3FUKaUSzDNomvXuXqdsnzC4KJmxq6y9NWOYo9NWJ4S9+S+oZs+W3KHCK1SLI2Ip6NmGvLlG39Yes/vFiMHcBnvh/4k2o0AIeLDcuS6fJImSZN3/EeA813sKyNF2y1vd21caIbirEplvWTA11pFuef+wTh9zJbwll0Rym6d3EAxRM2oVE3FGnTSLYI+YzSkRaLduR7VrJP2t4EiMmQUQWIkv1o6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCeY/zB3xmyDSbOpt6LbjXGHoNy30ZBjCxOh5sitsxo=;
 b=YUJGJl9CKzz7/JgJFuodGxpcjons7YvV6XOiutHqq7viR8hmpzTzmVWm8mHbFnjFvR5OLJeWLL1iuHuujW3Bu8y77/Jp+ZLrEm9K3HYnzWqzn25FSZELWYyW1qc1xkE+ehcsM2KQDtMvWc8e5YkZvLO45Wohn34ZYwgwFlwIGdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DBBPR08MB10697.eurprd08.prod.outlook.com
 (2603:10a6:10:52a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 12:23:40 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:23:39 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Wed, 17 Jun 2026 14:23:13 +0200
Subject: [PATCH 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808
 hsfreq table
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-feature-mipi-csi-dphy-4k60-v1-1-4611ff00b0ff@wolfvision.net>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
In-Reply-To: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781699017; l=1213;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=iAFqYc+D721UACce7C8jhgjnJ739wGdoHdGF35Ms4UQ=;
 b=tWS/O3uB0aAEkKtya1CYFfyhdnHEwTEqjI8CnE85lYe+E/4dnKfVnX7TgeSu8S9uu42EiUeMM
 vZG8SsTKFsIAtbDA1OkNom77eG0SGj4akXBtf2Su05iQTw3zAMHpErt
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:803:64::18) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DBBPR08MB10697:EE_
X-MS-Office365-Filtering-Correlation-Id: 66064927-740d-4539-c0d0-08decc6b4316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|7416014|11063799006|38350700014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n/lD3jktE1uVhlEcd0MnJPIMmJsXA+KJh2rnk4pUUB+QRwiFN8n7CelhSgBwsoYCjYlvM5jcPLQScqwP+xpupnciCsXbfNsgOvLe+22wehFKL/xM9HeLzbdamMhGOZJBfZ5IuwMIzAtN0KOPItRAOr3p6feugmNHQe14JIWZutYrIEExxvA1pAi5bmbEBe+/fdThO2MsUSjKweeuc4x6tCLqYHwfvU9FxA9lAaijHntbOcxJ9UEpbrHImskyKcpYw7Rv0O1oPxsNkgghAXmuFlPuPyUpDmIxppvjidTXhjivHzmgmtKuzxHGo+YXrAP4ouoo0yFo4NacSTFC+qu4Dh6cfobOkdZpyWHYDpHRoP5Ey7eg0/mtzfPXjxa7y7RD5aFLRi2KUZy4vsR8np9eB3ss/zDxCKRGjhAAQ1FBL6flQN9skrDNxJCjp10Sr60IR8a/lHLXP/hM15ADml55sNrMj7dLd//3XSngMos/AlM76BK285RFgxYAzN56xBOQKZCY1xF5mQLPZBBc1FRaSduJfvlozsN57qK2XpvLvrYz3+1wzNYs1ir0jtq7ZQYT+FsM9o69vLfrhFKPW8F/8ZaQu25fVJuk2YrHLpcpkk0lNIn//gRaQvOTLEcC3UMidYqqyQ7tCJVMkMDjUr15DYqYUXVGmvg1/r/mAtVi8jG6YRvvIC589n1H+rOqjq2HVyNokNdWWgpJsy6TnUMWNk666jODbEfeCwIk9ZEbatZkQUnXxZgcwv8v7pJ0gu2K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(7416014)(11063799006)(38350700014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUZBQkJONnFwZ1d1WGdhL3BrS0F2WXhsbkhoTGFMVkRmZFVhZGQzUFBJVnEz?=
 =?utf-8?B?SkwvbFRpSU00VHR2MGNaZHljSTU1dUtCaFlKMWk3NHMyVHhpSytaR3dGQXVo?=
 =?utf-8?B?cFJQNGphMnN3NGJ0WFkvam0zNXI2Y2RDWjN5dUZSMWxramw3NGpWNW9VTnVQ?=
 =?utf-8?B?bmJrWGkxSGRaV1lDYzNCemJhVGpIRld3Qy9BTGN1am00YWZ0SnNEbTZSYjFr?=
 =?utf-8?B?K3lzVUFkYmRSTVFuYkRCc1dnbWJBYUw5U3hDOFI5TWxkODFEWFF4cU9CYWti?=
 =?utf-8?B?cXpCU1JubkVnRStRMU01Q0pNTFhWSjQrYTlVWlp5SElsMnEyZXpDQ3p3VnB1?=
 =?utf-8?B?T2J3MjVmK1hZZ0V5dmVtbTVQSG9BWmtMUWlXU0NXcXExbHJUam5sTVNSSlE0?=
 =?utf-8?B?ZnlsWjdMVXgyYk9FNk1qbzcvcTd5ZXl1T1Z3OW56ZHlaWDVSaCtpNlg4Sko4?=
 =?utf-8?B?elZnTDBuZ3BjM0owSk5rcllIYlNIdXg1OCtmWG9SVlkwSWxRditsd2xIUGtZ?=
 =?utf-8?B?NTBmUGFLQ2kyZkRmeFJNZWppT1BXSmhxYjZ3ZFMwcUEzNkd1ditlemZJNzVM?=
 =?utf-8?B?NU1SS0pCbFhqaVdpdjdFNG1Wb2hyTzhxN2tnaDBJcGhNNXRyQmZEcDBSZ2pv?=
 =?utf-8?B?WVd4NFZKdEwrYkZ4N3praG9pbTg0ZDRZYUNmY3JoSGF4NDlIcUNTa1FidGtv?=
 =?utf-8?B?MndFUDg3S2hHZ0VhTkx1RHJuRERjLzZTS25HOUNqK1d5YnVDUVhlUzQ5djFC?=
 =?utf-8?B?bytHWFRDZUxWQ0tVWWl0aGxEdTJLb0F1U0lUUmFlWFZkcUltOUFTKzZveXNP?=
 =?utf-8?B?ZEZmTitpNEtHbVhHNTJQRXl6NnZyT1l6TWlpR3F2RXJCM0lMdnMwM2tid0pD?=
 =?utf-8?B?YnAxaDNVak5DcThnV0JZa1g0UXMwclV5TW1ZMldDSjUzeDFMUm92aStDelJk?=
 =?utf-8?B?QUIyRkdHM3cvNlh0ek04bEF1UHNjYldBL3NxOHlSTU5KUWQ3eHRIenovbUNw?=
 =?utf-8?B?bm81NitrS1p4WmZmNkk1UzdoMTdKRUozTkwrd2E2VWQ0cXpuMUk1RWhOK0VP?=
 =?utf-8?B?N1F0ZjlCYnNTUGFOWGZzQk1yYjZwUTlyS3VIL1IrdEZzN3lrSmZkekpUZlN4?=
 =?utf-8?B?MFIvMTdERHVmSVhPdmN5UFduTEpnRWY5ZmVFOWZnbFlic2RFWjBwMzE2ekRi?=
 =?utf-8?B?OE5xcTQ5UThEbVZlbW13UnQwd3g5RHJwZi9uc2RlK0QxblJqZlNBaXZmZHhG?=
 =?utf-8?B?VzlxZmx4ZUkybW9lc3pvTXh6ZXdZc05tdnJXRkQwaFlsUUxtT21ZVFNDSjhB?=
 =?utf-8?B?WVV4eTFHaER0czlHTDNSNGRBalVLcHhLaXA4WDhZSFJReDJvL1B2Qm1QcXM2?=
 =?utf-8?B?dXJGeGlBQzhjZFlITi9ra1MwMDhLQXhrdFNwaFhjcTdzSUhwcDdMVUZJc2Vq?=
 =?utf-8?B?bnp6TDloVE1GVWszakVrc1ZMdkovSzdJOGtVRnFja3BVVzE4dHpMcmpVY2Zu?=
 =?utf-8?B?VDc1ZDdheUViOWQ0Znhhb05oMmRnZHJDUGtMK2NDVnA3KzE2L1JuYStUTlNk?=
 =?utf-8?B?Z2ZBcy9YT3pxRGVyRmRLMUxKREZvcDVxbVlrWFQxMFJDVDhEcFZFZkVvSjNa?=
 =?utf-8?B?S2JVTjljVFR6cjRHa2MySklUOGpGWHV4Wk8rQ2NVNXdQeXZBTDlxZ1p1ZHIx?=
 =?utf-8?B?Q21qZXdYYXM2K3QrZlp0ZXRiaHdSVE44QW0rajV3OXJuckxrMzJRYkFlR2pQ?=
 =?utf-8?B?cG42U01TajRPQmx3eHExM3VFYi84MTNRdWIrYTd2MEU4YkV0cFJueHZJaE9j?=
 =?utf-8?B?SXl6WEVIZExHa0dIdnJyZVYySmxwaEd1K2FlL21CeE5xUVVNYUs3RDlPUXZ6?=
 =?utf-8?B?a3FWUHlsS2tkRS80RE1pUXA4WDNOWEV5NkxlTm1veUszNHBqcDkwUWozK1hR?=
 =?utf-8?B?S0tCVjRpakZJU21YWHhmUTR4ZDdudk56bkhKVi91WkRIVlg2RmVST0Z6dmRR?=
 =?utf-8?B?S1JUb3EzaWJpQ0hQdzJRRGZEYkNjQ1pjMHlwRS9qY2cwU3pvRHoxTWlqYzNN?=
 =?utf-8?B?UEZia28xR2JsYmpEVjAyQ01VR2JVYUw0STR6RG1EZmg2ZEkvSWJZbWVPbXM3?=
 =?utf-8?B?Z0UwcktWWHpsL2kzTEhCa3JzUHNDd096b1h5R1Z1NVZxUERTRkUxM1o1K0Vy?=
 =?utf-8?B?NDU5OFg0Um9MQ2JsM1I2SnVXczA1VHVXN1E4NjRDUEJUMjhaZ1k4cnFlZm5I?=
 =?utf-8?B?QVhoWnBIWnlHbGcyTjNHZDhmQlZNQk1ZYXFOMkNFbWxOMmQxVGJiRGRCSHVY?=
 =?utf-8?B?RWJPWktZSFRRaTdtZmJSSWQ5NW1qcjY1aW1JendROXA2dU5CQ0o5NUt1enBl?=
 =?utf-8?Q?eToYDGWkhYM/N500=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 66064927-740d-4539-c0d0-08decc6b4316
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:23:39.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ8YI3H9oG3FLHkHdfwcKTXrn9BP3UNEM5eBe6cCioaYaUM6IUBFjOwDtpCKTEIwecQqoqZT16XqgPkB6zVX4zQKC1aH9Zm/V2nhUUehoy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10697

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

