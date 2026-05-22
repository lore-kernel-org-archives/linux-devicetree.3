Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF63A7F70;
	Fri, 22 May 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439124; cv=fail; b=hgVPSKZ8UIVwsXvhz4nVvcthyZGrtcRa1xQN+AoTDTADoVbaeQxrQHvgtOq00gOskj7a/7Y1pn/qoEcoFnoYfDZQLLPDhR7wwRzNq2m0yV6f+mmPGRHWxHs1zaGNzvI2KuWIBEajCmlQ8FZlZ5dxMnktFe0qwlX8Tmkw+LtYqco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439124; c=relaxed/simple;
	bh=QOvSR5Io4n3mMWjVfUlWBbQu1kqq0flS2o3tCNI0x7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RnJrAfeCk9EuFPcpvtWdN1G/tZtIuXe/8W+Woj7SooSrjl8Vm40mwjJ67ruO60miepMHqLd3Y3w7Q269sXLAmtkfg9Px3W5GUauiAnLt6/udoLdPY6GPsvyDXyWgHfNlgYEHssday3z+uXOV6XmY9lmLl5mHHh9187yv93gDFJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Kar05Fac; arc=fail smtp.client-ip=40.93.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Kar05Fac"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJW/igOilWYtF7Jy0CScqLoAAqJ1qPRqw7hvk/Br/AX5H8X25snY2t89BZijlCrROitciqZaBViAQymI3GB+YXdeHA97BMwDWp7y5fdS2SJ3GqkEz5tQ4lrANAHUGJRkZsLnLZewa3LPBAT2XIQVJL2/kDTlIHFHa0FxE0QF6n6bmtJ8eFCGduzERpTT2YgUhQDFqe7jhp6p/Qs7Ttlm/s2WY457Q7sTEYQo2M3xXzhkBpEL886E7Hx9FtQfumUcb+lYUWJ9DAPnQVUVtV5DLv+qiK4L6MkBMCKultSmlbDpH+jQ1WjTpB7cBOIccYLth8Cuk8Y/fSsKjiderGnmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ50/397HMhJ52RWLRaxvqLlQ+ed1KzAHQWhuNTItq0=;
 b=YOTo4dQpg4thmOLWZyGpzf49dsUTxOA031OWWj8XZqiMKu9KWuC7i39z0/83qTOpex+1/twChtr3lmkJJm4ZH4GxjD0VEOb62hxitqGJJrJ5FY2P+SCAMoXoYl1fuEVop8KCUbXo4hiaLMyRfXGbe2DlI4DNQPkF+ds/ROhfO7OPoLGUTExRzqXS4MgFGxEDQwfRgH7i8fgCLeVJNaoY3lBLqKnDBO4S/HEDRs0lw7CTf0yrnhgeHpPcjxbQKyidVTuK3/wZQq4zKpyQp92O3742FZ6tN9TkZrYWZttf4zULBfHRuvgGhEiLC1PaIq/0TnG9T0Chwo1sppq0kqrdzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ50/397HMhJ52RWLRaxvqLlQ+ed1KzAHQWhuNTItq0=;
 b=Kar05Fac0GFU60VcvATynDC2Mb6O3OS9R/B1n9QcfW5CE5nEW7V/McPaILXUbnrpjDGeK6Pc/GN1zhQZ7sC/s2ShxXJkoORmqwzxT4ax93O1/7wyDreZJ5I9N+h9/4MXV7vGwBvqv5dcacjIx5XJyvfLPTjtKOJhulFcHrqFChaMqfwsKe7QHXLpEb4xiVSjoqxCluFDbu2I4KfDvjgjHVquLiXY9bauLORS5A7IVxP5O7jbGBN3eG9UTwWTvlvCX1vUYowpdIF45loz2Ki4CBLB0n56zn3FXISp0XH3MUbJu2eR3sMw0N51nQMiIKRzqzsPny7R2VdJUxYiniOyaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 08:38:39 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 08:38:39 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Niravkumar L Rabara <nirav.rabara@altera.com>
Subject: [PATCH v2 2/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri, 22 May 2026 16:34:00 +0800
Message-ID: <770778e3e66aab0ccb24c9197f5e63050a7f73cd.1779438754.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
References: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4f89bd-f784-4002-1635-08deb7dd85a3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|55112099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	9Xx4X9N6uDgdrCZwcDhpZ1XT+jzQ+GBRgHFIXTVlORv0SHYhJBQwN4sySPaVaL0XxobDNlQWe7/pp72/OIRee2VmdWHMUNZ/fqWcyULDjM1Sgjt3a3428rU8aV+o/0bB9+bj9qfuiTDGGgPIwVv+PDvVgWFmawVwtZeSBUhzhxSRZmEgLjNYTJFTguRt535bn5dAc7VxDiP5WWZ8lbpak+eL70bnwkcSmimYPeW05gsEpqQfZ3lcRZ0FL1BJ1/r02Z1LrgQhU240hOYV+0SohlIYXbJrZA1VJvb2RsUDFO5ZYFE6gxC8p90C4cX6SFw9+I90lnIaG81W4oaMYrQOrdSOOasn5VKI+th4lwcXJ5r7N+P3cJQZi3bCBMjPILodovSlvF9fdap/93hRjyBjHl8n8VdhoSq+ls1v2U1WV9Hlt4wAOL/2PKnN036wryOMdvGAHy6yrSU8T9h9AzSWT9sF8WM+YVUGRM0DPqxd4CfwTmBgq+KoCrGep2+sTwX14UQy29HtcZt3wCQlDjexoyopOk/YzLzUbMntKNKOJzNOqGeGX7VZNZVFVlDhjtFE9nM4C1TYydjA41x4avtpfu4I31qXK2HmK1YOZMQbqZc6io186H+2fHLzjJB/xFTenncOgXTiAzU85Zp/OoBrEBwZbyuJRX+XiuqGs5vWGLD/J0TpI9W1G3us9ms4RLe7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(55112099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JtgzqTvlY6z5x4FKA+BepudjRJxS+6AsHpw50EqzhbKdP9Efll22j8/le6D9?=
 =?us-ascii?Q?DV7bcnEfNQ/HEJFoLY2d/RhijyGMCFes/aj85JWwNs3Aqit5tsbE8Su8A9Oz?=
 =?us-ascii?Q?jkjlb0yxtAB8lbnAzqjMnrP5CbKm5BNC9vs2QD5bBka2Brqg1+LozUWu1ujt?=
 =?us-ascii?Q?WV0RIHvb+jBlW4w+WA4E7GgC4DRlV5glXePu6LxGqekBE1u6eSCa/KgBzEXL?=
 =?us-ascii?Q?TASzuef3YOxOo8Lz/I8Wc8XQ2VONndWoy+THrPJa+1s5vyIIvn7wNP5jqrIz?=
 =?us-ascii?Q?t8jTpgwjzp20EEmNcCEeZd0QfxTWPLMV2pDPg/9pyEJOAaqcYYjpZajeM4gO?=
 =?us-ascii?Q?PHUCmPVJyLCCAXOdSMTwDEroetoqEUUUtZT5VeVqCQs9UQMtsG+Gv0hYF2HB?=
 =?us-ascii?Q?Wz4APPqzopgKEubLnU/eIWPvFxt+sUiBkDzt5wcpVHuN+i7b7eApKqjKZFub?=
 =?us-ascii?Q?S62uyRV5BDtMVau0nkUsds8d9x1d7Jzo1/B9aaRszwLBD3irFvq2fpyLyC+R?=
 =?us-ascii?Q?jyGyKZlwcMwU7ZTHWKwdw6wzz060KyUuehSK8EJg1DwAZ6yd1rNYFKfFdjGL?=
 =?us-ascii?Q?HtYyoTNJ/PlAVw+/z7cKLB5SMMawWF1aSePPUXcWFh5BSFt58iHo7kKjcinJ?=
 =?us-ascii?Q?BVEQnYHWVevbj2cJWyqexveaCvpLKYF/j3q/8+8cOk937P4BbJnQeLfNyXz0?=
 =?us-ascii?Q?x5AOQjhsOMLR/JkC6ZBNtBxj3rJCJZUM7rbB+K4y35XDemS/gMlwN+zWelhA?=
 =?us-ascii?Q?A/36Csb5C5I+bOQV3ZN1PPhUZSSWKbb/aPRWHwJKj1u8h2t8OB94HAGlWFWj?=
 =?us-ascii?Q?u1ZACcQNQF7J5gNpTEYGAOXr3UGM7AtSHKquFSK5PmBjBXmyZuOfg7WMiGhv?=
 =?us-ascii?Q?M7S9EmIxyoXX6zpFKDPuXXlRM/HGHKQiV2KdGEBB1rrsPjODSsvYVylc5uIk?=
 =?us-ascii?Q?xT2kHXbQAnG+rTdPz2lDWGSr0527VtzxkB/mDHCGYTwUWQ5l7af6afIDWvIe?=
 =?us-ascii?Q?ow0QnDtb5QYyntuEz72YJmlodBVpfukjCSQI0gMvZBQYzQEuTv5PkCEe0qgp?=
 =?us-ascii?Q?aAqQU/hL6iDHtyUXA0niXfmepA2iqKQERdulnAIhByWFU3tOTpo+W+BBxaCK?=
 =?us-ascii?Q?m309aWbCaG49XszD1yPP3PzDORpbz7A36UtsKraqRMfmoCnLhC+0Pgf/qEMl?=
 =?us-ascii?Q?OOTLhneRMmp2Xpf+pBkro1sMTbFdItJklvG9yT+qYOjcTEcnWgUeEBtCLutB?=
 =?us-ascii?Q?mMt3Zv0KtodcU2tDHw4Su7qecRniQzQU0So9oie4ppeA5N3LKfwsfAor/ktk?=
 =?us-ascii?Q?XKoBe7p3gmm3OjfJY+DSWx70UvQgowevKJ0GbFfOQ1OdYJJrPdaRlvzy752O?=
 =?us-ascii?Q?o6tg4hUelzBUqmQaXuRwVkSAUb6DLdkknNB+ToDWCaR/1aH5Oc34Bw0qf8EL?=
 =?us-ascii?Q?j4c7U7MeEaIVhzu+ap/tT5MZ4ifzE23RQt11KiNG1HyKT/nhu8ZpJ7Ng8wit?=
 =?us-ascii?Q?xv4XMaIgb1TPBi3zbjGMX3OeV/+AvXrwLs7wvCi0A6z7dcBoanh5f7852zw/?=
 =?us-ascii?Q?KuexbTRGFZY7Q7CNzpw+iQLxpOze84dmyAIAArVSecrEhlbjRsRNPXxWNkuK?=
 =?us-ascii?Q?P0YFq7No81+oLuFFMilEi/VZOwobimpMf8esH0/6S1BbhgreOSfWHh0GaoQY?=
 =?us-ascii?Q?RsUEfLd79iZO6qVfVMOlQj/gn4A1dDPnf6+XnUSs1Y9dWPG5RlAff13vVoY/?=
 =?us-ascii?Q?+ZuPCUFW3+qavf/UntqH7EyD4UYRl0c=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4f89bd-f784-4002-1635-08deb7dd85a3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:38:39.7313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEiw5oKsr4EOmGvP62MDO+0/q4h65NlwtVf+Yj7SF8aHp5RZDcurlfHRP6446CkNZIR+icLH6yH5Xx1f1iaNpR/peDtTVHL/w6WPOhkSlP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052

The debug daughter card replaces gmac2 with gmac0 for Ethernet, leaves
gpio0 unrouted, and adds a Microchip 25AA128 16 KByte SPI EEPROM on spi0.

Remove the dmas/dma-names properties from spi0: CONFIG_DW_AXI_DMAC is
not enabled in the platform defconfig, so retaining them would stall the
SPI driver in probe deferral.  Set spi-max-frequency to 500 kHz to match
the signal integrity constraints of this board.

Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 123 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 088a03b89c99..84982bf13ee5 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
+				socfpga_agilex5_socdk_debug.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
 				socfpga_agilex7m_socdk.dtb \
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
new file mode 100644
index 000000000000..e3fd2bf11688
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK - debug daughter card";
+	compatible = "intel,socfpga-agilex5-socdk-debug", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "hps_led0";
+			gpios = <&porta 11 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
+	phy-handle = <&emac0_phy0>;
+	max-frame-size = <9000>;
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		emac0_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
+&qspi {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,mt25qu02g", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		cdns,read-delay = <2>;
+		cdns,tshsl-ns = <50>;
+		cdns,tsd2d-ns = <50>;
+		cdns,tchsh-ns = <4>;
+		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			qspi_boot: partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x04200000>;
+			};
+
+			root: partition@4200000 {
+				label = "root";
+				reg = <0x04200000 0x0be00000>;
+			};
+		};
+	};
+};
+
+&spi0 {
+	status = "okay";
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+
+	eeprom@0 {
+		compatible = "atmel,at25";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+		size = <16384>;
+		pagesize = <64>;
+		address-width = <16>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
+&watchdog0 {
+	status = "okay";
+};
-- 
2.49.GIT

