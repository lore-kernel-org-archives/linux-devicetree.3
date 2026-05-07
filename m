Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023089.outbound.protection.outlook.com [52.101.127.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7464A8C;
	Thu,  7 May 2026 03:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124978; cv=fail; b=lJvOGBXespmqyxTe9a9xnpjYGaij7DC6YwAZMG69wFtPMagpL4pB9jbPx88DyCcz4NU98aSp02bsKYBT5ZpV46kkpUXP/ZwzVXu09sUwh0sxF1T1TbdCeG/Ycq9ftoE9iB7jTC/xiD5t6C8VthPqPFVvSZIdJV3V7Etg26qwS8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124978; c=relaxed/simple;
	bh=nsy6BwhbHopUcnOVAoyy2WtPSpgtTfC7rXQlZnXCQpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GqydeIKedaUwP+8CJkzxyvtKJLl13tEda/g0SoCxG6ylc8KR5ZbFb3fQ5h1KNEQ1gT8tyXC1ZthXh+itEn9QlwtYvKCT/nSZsHJ15Z25hwrsOX/M7nvTGZ1196TP/9EiFx5q7M4HmJf5H+STZCl81/XH8FySKOqmJoAP4TjHHBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.127.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPsiFUE9RJTggc0C3U+7qlkzuZD5QNTm+dehmy79Oh/7lxvz10PloascyviHcdvEu2hDVkvMMiAPyMPpEapuzSBDE0F6SArA6HIbFcwpVdu9MwWjrv0tjcS16UCeoH3Ket9XFrvG1JaXMxcmk1pJoJT4JGKdtzApZG+DwIksX2loQKpdVvxTBOe0bSo0WigtHTj5/AnpfscH1bdtqv1CRyEwZDC6rfhe0xvOfk3/bndfU/ZyxjVn+D1LwL9vbIykOksdcMnHmIjukdctmBTQ3kWc5wR1L2ZpV3vg43SwUwd2QmSrzOcDCP8r9ycU3DcvsAuVb0l+BXh3jNt0mv63fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaDEvY7CtBkjnU1O403PtQPfC8vuRs3yWPgETSHhXFs=;
 b=iJpwxhyk3vH/7IuXrmp/nLTu6M04l96PUmvaBDP1kqu3FjEQFB2vut3x5bm5/lAV9imMcIu4XyjltT8TGM3dHoQeZpefoMfUTnJSUeOc+lAQmme60N+F0JgAtXDlZwWCIA5eAcjVrix0eOXCauiim1wBG1uX+p+QcQRD2ZfSMYZKnWUlMuX77aMagUyizMjhKFVVHYlV3CUUHC7wIbsbhpWQ79F7lb83xaOsrV/g2Qo5d8MSVRrFBippvdcwI+dVW+iV6V0tqGoMlrkoiE/eQTU4de7kYhD+kAUt+0GZpnhD9WiZcxczsujQQ7jpdHvBbVM2iFiIx22+zwIIz1EpXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
 by SE3PR03MB9965.apcprd03.prod.outlook.com (2603:1096:101:32d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.12; Thu, 7 May
 2026 03:36:15 +0000
Received: from JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7]) by JH0PR03MB8617.apcprd03.prod.outlook.com
 ([fe80::28d:6503:f51c:11b7%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 03:36:15 +0000
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
Subject: [PATCH v3 1/2] arm64: dts: rockchip: Enable USB for Khadas Edge 2L
Date: Thu,  7 May 2026 11:35:40 +0800
Message-Id: <20260507033541.2576335-2-gray.huang@wesion.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507033541.2576335-1-gray.huang@wesion.com>
References: <20260507033541.2576335-1-gray.huang@wesion.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0028.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::8)
 To JH0PR03MB8617.apcprd03.prod.outlook.com (2603:1096:990:91::14)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB8617:EE_|SE3PR03MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 2931dcf5-808e-41e1-275e-08deabe9caf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|22082099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	kt0E8GFqAIevYDpx8IFD7/xAQa3jnE4HMKXAUrMpAJXeMBigIfsSylKt/mvdOp6C46EPcrBhlhkyqm5ikhN0PJ2yiA4YOXmksJNlJZ9fIUc4X/7idEwuNj4We0xfO3AuH+yHpgpgp2TcL0xNycY4lUR9zZpOiFPFVHfnBrdZoged2a/SzzybFE0JxiqCMAJsSrmWT9KG0MrlEkbb7Q674CDzaZbTuCZlAv4nT0qpAxzjO73/FW8RuOcw84MGSZHlOuLvAUHfcypEultzdV1pgxDEgam6K5mQbiHp5Q7n3obHC/p5fa42xddalAPHlUFqnrR5LUGBTirm6/GBQX04uvIR6NZT9X0Ue56K1hQFhjueVGuNdYzPEsy6rR30Za/DUgJHk7YVx5VL3mrFd9eF4yxfIgzpEtA5VgjHz1djh790xoNsaDWbxQVQnhLxahkdVix+vynchMiLBsAhuHLphPetMt96SPK0kKx8QvRLVsZLNVm+VV6T5n4l/XBWtnSq1jcStTAYDSPVwrnKkcXbMuVgNKyeLC/PLI9U94iLwDzfliuAS3C+/qEK0hwzPerfBDqllkCrt0DnsGStILDPjEbTEZKhNq4qwwIHBNm7rkte6EEVebFknE5TD2I3/Tng1o2b+wvnM2bb/KpjQfOsyAJACTy2hPwPO+m0HTVPpE4aBUj4e7GSOsINntKGIkQ4iB/nmyWZhoN1rzvilH754x4Fs0TiWKAJ57TqKZqjHeD7w4S54huJdVPF3f2w7p2n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8617.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(22082099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zu6jifABNRPi6BvM/oaUeC3oGZ1aV9mfPnowlaXjHHIm9HGpIpRzehCiKvTC?=
 =?us-ascii?Q?qgaTCKlvdp4+wORknLyIKnWV7b0+VhEPMOuNFiXOp8CymbyBL6IWy6yye4Uc?=
 =?us-ascii?Q?5RqyBPwTk5FBE2pYq+aiyeDkgkqAhfaKVASPY/EJ3oKMqDFUNS6lwebP7K6n?=
 =?us-ascii?Q?0QJmZoNr6P6T498C5N2QblCi9j+SgS+QdQkkp0duL2ENvP83wgSYO3H73Psd?=
 =?us-ascii?Q?fcYqszzAxLogdk14Mun9Qq5YV4N+nsh4mQngOh0tS4MZCFQ5nfDtFMbfbOUN?=
 =?us-ascii?Q?eOsaqenbey74+fOZ/6cZQ9r1vOEADpN0q76oWoUPYkGIQJLOYAMHxgw1y3aA?=
 =?us-ascii?Q?n3V7PAq/Tw8SPQFAQIO12PeEz9EdSHdsoTCCCSNGiWscvwBX4RpHRsSBrdFc?=
 =?us-ascii?Q?iy7lY4uc2a1Ij2RpstVD3NEF+ilzw/tSmjgVpcM65kvCllXR/4oNGKFYdSVO?=
 =?us-ascii?Q?okV1A5A1NVmnszCzVsOV0maUKu11KfPJIOKCXQwD9QQlUC7OLEYmKIEAMYy7?=
 =?us-ascii?Q?zQHabpMujItPHqyOHiaXC+S+9AMSB9cpYdf3gJ4c6mh8qcbzP/wp5uaQ02VI?=
 =?us-ascii?Q?Vc7XV+NFTMqUkS243uFFiVF6pyHwdPBelp8DYh2KHw5z4aY4sv3H6CzDLK2o?=
 =?us-ascii?Q?Lcwn5tevW9G30ItGTDdfnIMhgMhvMSVARRlHtOw0KTSIFz/h0e+zODkXbmfq?=
 =?us-ascii?Q?o5g4E4F9l8T3JwsLFq5DiAMhlxXBswwoZ5l5YOmD37zXSN3Pdpu0YIYwkjso?=
 =?us-ascii?Q?zLXa86PldOyJg5hNv15AwzunY5ly7UhCnkzyxRBT/9D0XGMOHQtM8vKv9KUn?=
 =?us-ascii?Q?Yq57hdgmjsW8VtfAT2/oy1tmtPI3pEjKGFaqTC/2cS9COdhbiUkV4YJ2qfbO?=
 =?us-ascii?Q?sfqU4aWRsMC/5dXZAc01WDiZ52BalrLW10ilIzoT+M+2dla1r4ODbAdeYSo0?=
 =?us-ascii?Q?ap1jEj9vYMe2etJtZsRl9JCujRzQHvfwUNF7qb9XqPaMI2Znh9crxdKWXQPT?=
 =?us-ascii?Q?oARzMwUuytToDF8WvwA2ciVF/h9TS/+kTEG//37xw0icWRgtbVzQzXyugRyy?=
 =?us-ascii?Q?TPTaBw8vJQCk5W4RP5Repv9fJNm29Af7COZFQ/HajtZETCphhEIlW6zATHH3?=
 =?us-ascii?Q?nYRVhxxUDSaURCX+qGBznPUqSswSri970MkrBnWR4bslM955hZC31FonjcJX?=
 =?us-ascii?Q?MhCI7etFzKad8baVRmyXvNw3MchlaqSfEZd1YX+LgBvu/sOypIXRGKh/v78W?=
 =?us-ascii?Q?SNI3Alm+byo0hpz+lgBVAXwJSxxo7p4kZcgWDE3eqwlZP6P2CwTDIPd4J6fI?=
 =?us-ascii?Q?/o9nvkMO2f7jaMj8rLpywgFfF4tJ0NC+gDPLWAYDa2zSDyMqM59Cr6qA203O?=
 =?us-ascii?Q?HfjIpICc7URwewoSKUtrcCfSCs4NwSEjqCILtLE2JQK4PYEA8Ung9qlnTwCl?=
 =?us-ascii?Q?IGW+Pf3QZxXagnbI9HPFDFKj+Gt4SgwurX17QzaQz8OgmRXcMPPH1JHjWQpo?=
 =?us-ascii?Q?SBj20ssjllKb/CFNbvm49K4fYtb+SU58qiqYMGNLS3HBb8dlXjrEV5O2QxJX?=
 =?us-ascii?Q?cgI/CCmStKWgubHharn3mLufOGoIen8/HA4NBBl39g3fcAyiPv27fkyQIpO9?=
 =?us-ascii?Q?o3/nsbx0MWfihfXmD/BF955tej7NBX9xeFrXy4livPL2sbBvptZGeoRPzpyI?=
 =?us-ascii?Q?Wqop+u7XJG0q38LKhS7ntVMb8onnOgRTUFWMoY6JKQ4MKzRiI1ycN/a8uDre?=
 =?us-ascii?Q?Q3W4UtcByg=3D=3D?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2931dcf5-808e-41e1-275e-08deabe9caf5
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8617.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 03:36:15.6499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBZdwYrUlkSo7rMV2k+pve1iICibziYYozXbM4sWhwMZTXfAUNkqIeA/yBPXIaP45ZpYFzD1fhEJubZd23lw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9965

The Khadas Edge 2L board provides one USB 3.0 Host port and
one USB 2.0 port (connected via an internal hub). Enable the
corresponding DWC3 controllers and PHYs.

Signed-off-by: Gray Huang <gray.huang@wesion.com>
---
 .../dts/rockchip/rk3576-khadas-edge-2l.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
index e7fe22eb31a3..0c55ff5331ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-khadas-edge-2l.dts
@@ -30,6 +30,29 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	vcc5v0_device: regulator-vcc5v0-device {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_device";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_host: regulator-vcc5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc5v0_device>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+
 	vcc_sys: regulator-vcc5v0-sys {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_sys";
@@ -78,6 +101,10 @@ &combphy0_ps {
 	status = "okay";
 };
 
+&combphy1_psu {
+	status = "okay";
+};
+
 &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
@@ -531,6 +558,12 @@ pcie0_rst: pcie0-rst {
 		};
 	};
 
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wifi {
 		wifi_reg_on: wifi-reg-on {
 			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -552,10 +585,24 @@ &sdhci {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.34.1

