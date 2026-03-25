Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022103.outbound.protection.outlook.com [40.107.75.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16522315D33;
	Wed, 25 Mar 2026 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417747; cv=fail; b=gx6z28Vddvjxtj//oZkYyO4+k2rPSn+GHhsdr+SZQwqO3wUz0prl0bKkYkmlFYrdCRd3n4CovQmL5eBAfiM/gnSToVYMEudEZKRS2JczU+CRqabeVHSM2Y26ngfbbwUC7nOU8mTmCysucSvMnkVf6kUk4YzP34yCbXSEiFoaQXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417747; c=relaxed/simple;
	bh=7c8YTRd+u3/4p8oEjTy9FAoYt+aCUz/2QDP8bHouoAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gapJqA+piVfSHNSf0KQXMNlaAE+YlnL4BM2VT+ihUco1tJ45ehvP2FY90boq2dub2KfiV3fZLCJrCcKk1BtMDnfNOdA73bd0x80Gjj1HGKtFOy+0w9VXd48u7ypf03JKroXFsZf/KRdlDjHErLE/7wjaklWrRuWBGcHMdcxyCLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=40.107.75.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+UxvjIubbN24LInNyu1WbIXxXgI/tNIrCMWemYKVtVgmhwtHfJ4Cx9vn8R4TN7f4JOn3zPyZkbb+M1dBAYN1UUXTqmqG4GfmzahN02xINb5yu94w0O0VTJZYz8ywUnfSC3OQ1RtrsantTUSz4BkRx0UAwaDE1xEY63GM4vrCgnCD3OMLju59eSc5X9Cmxc5gd6OEySfwnStLrOCNejr2I+oPVQxzYcaKLBHr2/iB67C4OfJRarTWebJ5fQf5L2z1UBoJIyJqMWWLDl6A/rD1IZVzJumQGg5uYyZB5bAxo1ZKd9DOyHGZdWSUlvWrJp3Zd9uTQj+sqob2reClhpKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hRADmsgLfO+hAl9dXYm7C/R+CO2nv9FpuvhWrqPWIQ=;
 b=VjCr0udAy3AWLJAgeRQYH3H4jy0kiRKffBC2hcll4aNKhxVW62mPpSFnSQzvYc0jEvx7PNvi3qkLGYnjwhGfnCshUlG+flu5n6IXWi4aUvwsxZlKSRHR/aJ1V5ZVKI+xOHuTGqPiNyzseLycYb2NnPcBWNYn37ivnlu2BV81a2AW9f/x2u+WTKKBEh7uWdm64uEN2BhkzWjo6VBfDRTi83au6p8/cd3mJJhvoZsVDxrJTrwAm+qNxfmfQAQn4bpDMhQbraIgq4h+27/t0HF7iFNUfAjKoMyLkB0sZ4BqKNTK9k1h4p4BQlEyhfj472lYtoJvGNOLcIjbZMkwH+f/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by TYZPR03MB7721.apcprd03.prod.outlook.com (2603:1096:400:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 05:49:02 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 05:49:01 +0000
From: Gray Huang <gray.huang@wesion.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nick@khadas.com,
	Gray Huang <gray.huang@wesion.com>
Subject: [PATCH 3/6] arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
Date: Wed, 25 Mar 2026 13:46:11 +0800
Message-Id: <20260325054614.1497147-4-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325054614.1497147-1-gray.huang@wesion.com>
References: <20260325054614.1497147-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To JH0PR03MB8617.apcprd03.prod.outlook.com
 (2603:1096:990:91::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|TYZPR03MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a80b6a-96d0-4b10-0894-08de8a323757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	55HVxskcOrf3Q2Xp2kAROGR4WSURUV/Hkzoim7JMIblL+UTparY7+VENxpKyGVPZZumD4PHTBWkFEpchMbwm9mX5P/zXt4xHhLe9HZnZyC2SZlP+7STTigOwlZmbBSX69jfpxpJLwSjTrVi4vyY8cN+X1e5gk6dQDZGwnEmZLNDHNN9ItEB+cAcQrNtQvUjIsU6oTC2mzUsPqo4eeTQvEqGO/C06DJYARUS0Iwp5oHqJ1HC9oYVUlcVdamKrn9azCZTD8X0Qs/UwS9+eaqHmPM475Ixm2FCSycnOeIHOiqw+k9bLh73f9K0dFGxkYeu49yUWjvEXJKhpg68VLAPIA5JwzzveAiJed7UWDqaPxaHTq0TDK7xBlEI3V7B867XUDCdla+O8ObvgYfOP3YybtbfvOnnGJ3mYRL+OOfNe/SefuBg2QJMI0s50oMF/3ZJDBrE2+SZ8wURamUnbwIQFBwcmUsdPw5+kaRrwnOasHE5kMrEg+X5Ug7AxtwnMY/Ra+tuhNLpnLOqS8kwaWgZyTlhjoPXpDLk9hmBr2+pdTBNAv9EDwFT8o0oJaKbbVy17Afxt8nO7Mhdx1YxaFx/B56l6BE4t8pLShIpbgJBW73C7aaIl1CBkVghjRiA8I4d+bNo6t1qB6mHol5+Pb+2tuEHx1qg0D0qMEZbLayHjIPvEySoCMNAwZkzev7RDCGSmmYZWn8+NR47PqNsC7zk5iuw8HN2BWP8wXVrIDTbIZMDbdbQBkSF20nW2cilVAafi/GlLr6CD97PNRamIdXcxJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u/68RfQk/TUf61ngT+peqAG/ctPKyEckLpDYTMHdpkR5SmlJsNFksAJNrU3g?=
 =?us-ascii?Q?YlGETXPaiFuyZOMHbSW91qVOnTC2ZHM7Ti+azfswR7djsY31ZlMcT0vSEMQp?=
 =?us-ascii?Q?iTf3vYBe65C6Ls2nfcvVZ/0A0mZ84cG9WBDI4AY3M+bcVHFRYM25Q22UO5vG?=
 =?us-ascii?Q?IJam5lgTmuaP5pdUfv6ox7ibuskEfRg2hvW/YZwLjnJVbp6V0qb88X++pruF?=
 =?us-ascii?Q?HgYb+rI/hAVCrLGFvvmY9mlA0cioIPud7/QA5MbJgk+D7U3up4rXOkZ5HQo8?=
 =?us-ascii?Q?VHWgUP2aNDxQ2ox0137UFmKz3QKnFKbJ+Z3r0xyzbLkPrmwkazFQkgSHJAvy?=
 =?us-ascii?Q?2aX27dg4EQvaWLmCowJHuXp/9QXVBt/3tmAEH9zQlybe/jGnLlB6kVgRRAh2?=
 =?us-ascii?Q?PstosUeoI39HIqj5WQXxoBpIAXfhidnip9ubQe7h3zmdD6tZ+gbf7TYungFk?=
 =?us-ascii?Q?A1bbejx8VDXG0xObO5tKBZEY0LDiSUcVxs4J81bWn0MCI1MHKvOKANuI2J6H?=
 =?us-ascii?Q?E1qHpX7gOukzBva4d1uaRDkcQg5Gx8kZVMMP5O9MKyxnYtxr7FwYwNYA8JOi?=
 =?us-ascii?Q?0IAclSkaAFlD+u0d4/epaTKQooInD36ffESMF0MKUnIWO/r1HIrkJmXmgWFX?=
 =?us-ascii?Q?wmJhmsQU0F4n5mY2AgrgF0BFUSAouemNqIn1UaAHc5lzRpurg+qgw6lQFPG5?=
 =?us-ascii?Q?6IwXH8vMaqyqIYS3E++CGlQt0Ne4SsfLvEXxkOnERaGSOCIHSCbY8PFizgPu?=
 =?us-ascii?Q?BBOEcQniSOlAR2ujUmBq3MnQB6V23wDU1E/2rDt/Gjsp587HOimbgPDKUpVp?=
 =?us-ascii?Q?/itwS1So8k80vRIis1BZ0lPPEGkWX0SXWPFU5IRZJvM+46Dzv2RVilV3JICq?=
 =?us-ascii?Q?gerhsOZ6eYEE3voeOg7T8HGi1KcjaaT25eeRF8nQl8GFprRh/KA4Po7C9Eit?=
 =?us-ascii?Q?sdRY2Fnl1oisvZj1wuPv/h9RkAi/H6tjt1MV9S/A89jaB5hicjHI4gVdZ0rG?=
 =?us-ascii?Q?zhEO9aKfhb/RcOBoBQZgO6ZKoa81HPMduewageupKaZWk6N/sz8btJgMRunu?=
 =?us-ascii?Q?2nZBl9RsjDY7+RLxO8+Ba6qHBwcUB7u5OigiqoiaFz1atcz6cnr/1UoNabl5?=
 =?us-ascii?Q?4iKlrc2DhAzHMdo1Ct72wrvHorYWJAnM+fzQTKVNTyc9UyY3i6ubpUubvNW7?=
 =?us-ascii?Q?6QiH4qswNbZACpDvpVCAAY2fSab9RoNXFVxd0cK3PcPgk8CWEABZbgyIYFxR?=
 =?us-ascii?Q?x4WdnoVMcCjIEsX/lGJBh1B/8bknhXG7CtGEBTuJlmCe8UtGn082++GTv6C0?=
 =?us-ascii?Q?6MkEY4acuPOOh9OaUM1KBGTk/6QdnNHrYw3o0x9QqTAGGZhzs2bubD71VQc6?=
 =?us-ascii?Q?lKEWNsK9vNgA1OL0vJyhtHAwoQYSnk/rBpRBiPiNGc85jv4Wzk6aGHaMWicX?=
 =?us-ascii?Q?2vwCcScKicBnR3rDOrEuqzaJfySzWuff9aD5YslMa7PlvWOhbHMj0VCepDNJ?=
 =?us-ascii?Q?eEi5755WDzXhtNEIZssxxj9MtnPX1UCp6rqdslh7F4Ht2eEBySfgDdsOlMoY?=
 =?us-ascii?Q?29f5t3jMhpYIbIvtrduwrBnVuPdFKOdZbqE5C8CCRDiCUDCzy3kI1rTuCaR3?=
 =?us-ascii?Q?zCKjjBbaqMM/DHF13BdLGFdwPRLGjAzT4ua5Gdx5fFkWxJimvX7s1oI62+st?=
 =?us-ascii?Q?KFcjDA/THiKVgPCMpPHFKfV0wT3CvZVxQjQmvO6vkN6nIHTR4X0Mx5B4vhjA?=
 =?us-ascii?Q?qQNe896TEg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a80b6a-96d0-4b10-0894-08de8a323757
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 05:49:01.6580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHIa7Q6fWzYAvpkTDaE8PkxrS9avy4vAheFqag3Zy2qPZBz2BR4q4qxaV0D7i+cm1SJqNe7ZN4P76CDRZtCriQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7721

Enable the Mali GPU node on the Khadas Edge 2L board. Assign the
corresponding regulator to the mali-supply property to ensure
proper power management and dynamic voltage scaling (DVFS).

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index 09cb0f0d6dcf..15676ba3b599 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -70,6 +70,11 @@ &cpu_b0 {
 	cpu-supply = <&vdd_cpu_big_s0>;
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
-- 
2.34.1

