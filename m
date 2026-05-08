Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AA315D43;
	Fri,  8 May 2026 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238125; cv=fail; b=uAhEjS8XLDfKb/8v2cTN82OziTX/rdf3t6I35ogIxZzG+NeN10t4BffWTH37G2iZnGnXJD73hdpAnN2uoBGocbJFguD5D6EVePYCLN+dsL+0tuQFBFgags4aNSKIH6MPllE5CaHAierOikd9+Sahg8YMS0TuXcEPFXZwBhXc0dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238125; c=relaxed/simple;
	bh=U8oZyxbipamvUiT0i/j67QQhXtzsG1v9uj6omc4s3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H83W89CbwTWufRBEX5y56XeV64ogs0IEsQaxF9jqwOZV0agaULrjkL3ZK8KvCGVkBDBf+ierEhclyFZOh6cTsi+ykxS3kZV1nfwVEyT9Bs407zv9SVVhKkowtjM2ipxvBbXUPAGiPG4QhDhCIFvkfvedDT8L5GYsoffPRwSO5Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VOz1vfLI; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VOz1vfLI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvrLFipYtXZ/WnsSan45p9NL0foNmhGReRXjuoI+c1CLENrngWr6x+qYKvHu0Xf/AxiMU6wQLBSxYscA7fTPJGDRM6sMClTlLt/SFQqwAqRjF0CkAuSVHEX/0gCHwKnSsNGaKYQFz+/ZYjwDmPCfQO3Bw+Vq77/Vfro4coS0uMso7xZ8b9Wq+rQc7rgwIdDBHBkG1H+gNczrKKYKrf+laB86kUbQLZCZBTRpvM6wqyOS7w/gUaLpe5TRpV2kxmqpZe5I543yVukyuRGaWB41YLOwSr/H+7F/3bPO3KLddWrDJgo/UOSUa+KOEGLJ2zign+Asy2mQm106mF0luq6o6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+c/GYaHfxE0UnrJeSqXKZ09Ds8r/NgbybPCwKO+R6s=;
 b=ApXDTibwuUFdqouTLKB/46Lf0nf1v7dEZiBpF7zbod2gnkYx0ZMoKRsUKebJaWtBDNTmKupTSNfr8qveTBYtGpBEnjY1SIkoJFscihZ1JzEOjPjaqDr15FmAO/6ImxqcT6CTihj7BQBFlsClUuyB1Reg89LhIQo6Z9vRyJ3IEslxEPvHSuSyFsjd2SKrKzuMAnw3m2wL2eb2WRYIyUd6vQMVmhUGK9TDAhq28TRuo9kcVPdiDhlYGLL5cDSSatFqgKM8mK509kiEsRSHeFdJ1yEJHQkpUNHtoGyELRoyOmUmn4bbTGqHFFPpjM8r42/SxdcxBMB2TEu1etIztG9F+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+c/GYaHfxE0UnrJeSqXKZ09Ds8r/NgbybPCwKO+R6s=;
 b=VOz1vfLIfLW3htGseZXyKjpoi/Qc0MMolOsHi64wMOGt0w793u77WdmLjTPBJ6J+iV44dq8viXvn+0gVydQSHYtqvC8fMLaqgHwSeBIXErZaEue0gkj/jKHb896bGj/3xj1F+VmMt87xv2TnFC6pVedrJGE+lytyc+MpIXZSdXYyieL4d8w1KepX+Tr8Z8gqpQyUSDNxDVXRvqoOVQi3vMFcnUetXZmzkXYBxorHdCqWoNsVKhvrV8ZwM6GmDn7f+Qx1+xjYpGZx0QBJZT3RYSS6EHtIObPjlrwg5MIWM7NiBsbQbKeGWl3VT6YPm9FumrcfzK7ceoqFj65gJM4Q9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5713.namprd03.prod.outlook.com (2603:10b6:303:6f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.20; Fri, 8 May 2026 11:02:02 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Fri, 8 May 2026
 11:02:02 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Niravkumar L Rabara <nirav.rabara@altera.com>
Subject: [PATCH 2/2] arm64: dts: agilex5: add support for debug daughter card
Date: Fri,  8 May 2026 18:57:48 +0800
Message-ID: <a42751b4c7eb9b4d58f2ef1db3591ff68385a562.1778237639.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
References: <cover.1778237639.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef22f29-7647-4b1a-edf1-08deacf13bcb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	tN/5pbM+h18nHcHuHhkoxK0Jf8i9xraM123alWDoT9cBBRsyRJUn1HuqFmk9n/iicEG3B8h0p6J8T3ANPqzd2zVSr5biSXt9zXHi24EmTA0Jlhkja/se0Eni+IY2Mp4ltp6nYx61zjlxOyyNKc1n8b3WR//qOahbZc1i7uYxEmiRTF2oQd/txBc/sRs4PPWUFWqZ24hS0cFoQtYZvdfdzeO1JGCNkpNCiGiZjF8jcBXy/a9lisBAh0o6z7HjIVIsXeC2mGnRIuWw8TPzixKWhz9kO/FJblomFCIi4FeIFBByV3xBIi+TThbbvqhIeaYhREXB9uzbq44CNFPBI8CqAMTB9xcoUeo3HZNNs1KkGL8gZmcd4/GxYH2aTXXSQrU/htUUunmLZKhomibXKy9zhZ/s3QDghEjWMhXvG9mEiPT74myoFW7p2KEFfgDsE0mgTtTnqRWm5VQXkmKmGqWbqeWq7gK09dw/cwHCUzzF3dXCRaaz1y9QEXo7itd1+8rqZIZYAIF/6rTCXtVlI6N9FDL/8yAMPrRYdGvuDdSyBdnULK5U2/L/045QUn+MyYq0cybV4gw0Dkoqkmf+8sCpMGl5yFVcHUS0MKseuIe4cyfS7HR9f/Qi4NH7ejoaHKyhOpPJrcSPwMMMdu815FaRMzejc0R5TzPUB+n54qAuPQYDjZqgos5iOAtGmdEClgLX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YySXTc97tmD2yp/oJNu+wuq9zDc3lml3Ky0r/x22p7KUlklwxq7+LMO958dw?=
 =?us-ascii?Q?ZPuqU+J5y4vC6pw6q78unihlaqv/4rOYQtfp3oiKKBe4DsC3EgNKkQA6Skip?=
 =?us-ascii?Q?HgwMnr34if/cPe6xUIwNGZefx3FX54x/tcV9ewFSSjm16DxcR08c1nqzGYMo?=
 =?us-ascii?Q?JL7o6g7KVyyefFf+Q/sP3nnuRUPxgVyvgNC5EvUttCqTwKLpjImpPGSplkQ+?=
 =?us-ascii?Q?cIiUmI7FPskr6olsW6ABrBl2GJ3At67Nbyoh2/uHdofVqnR+eMrEhBHOeQsp?=
 =?us-ascii?Q?1XSrr6xCuki4wBJC9fXZhLvcYWHGzGgqJTZQz4tv3zTvLGkQtqn2RAewz1kI?=
 =?us-ascii?Q?FCfaYjbl5UvorHrREihHy0V94jAGXY7xj8rMSy2hmT6CQDhRVIQTynWOBR0u?=
 =?us-ascii?Q?C1iqo9bN/DKgkIURit7VrOjPbVb+RcwezlxhbU/SGcjsC5hOOUEYzlbkc/ZB?=
 =?us-ascii?Q?WKl4pJ9bUZ6ipReT892CPirSVrv4eQpoyrW3H1C0u+fwWw85LYdrwp+bJ6vD?=
 =?us-ascii?Q?I/TpyYvEdqsKgPA9FyN0ncstolh4BbgtdrjlLLHuwJG4rAwpxcKcPzAZba8H?=
 =?us-ascii?Q?Ttmrd6gEvzkGlGonGCxf40Vc4w0fBEacQM+VlEbCi9vmQTgOVw5w8slL46dL?=
 =?us-ascii?Q?RmiYuEftsLEmrXcndOjmh+JyXXwORD3P0WFZSqHtI4A/B2kLVUh/9tFxuQpE?=
 =?us-ascii?Q?WdC/qIAv+w0g+O3RohVgaqWXz/xXwGeENbdkGI4qvkMNBYWvRrsdODD1yQAD?=
 =?us-ascii?Q?VhYx1FhKsA9hNTgaqvrQJsLjE7NLERdIhEiJBWf8mQ8KCKxtDcBkEU+j/AEA?=
 =?us-ascii?Q?W/IHsYbNxyW/eLmDzNyoq8rxSjm7woXajq4M2QQAWHzHeAspY2VhN5yGg6a/?=
 =?us-ascii?Q?7n5AR5SI47QGHshoLqF3jXGuMWlpOpMO9LBGZlaDry5ePH3f07X5kIfXxY5h?=
 =?us-ascii?Q?ARZGB3UB1SEX/eowM7O236xpbybPryD+fhy/DUzsA7llI+3VooRPN3ZZ2xBL?=
 =?us-ascii?Q?DzwJ+BAVzm9eo9t3A9E0G4eAmRwIqgrHA05XRSH6m72F+hlWEDMJaxwWPsC9?=
 =?us-ascii?Q?UqhXSmCHJDtejaGPrU6IK6Xv0KvJBOQm55k5V+yf+jjP93EA+1rrhDAvjQaw?=
 =?us-ascii?Q?Bk4tgH6rAHOnZFBp/lMu0Rd0TM7tBexNs44PhCfQCf52lLNRAX+W4WQkEA9+?=
 =?us-ascii?Q?g7cO25bTz2Bt2DEGqzsa5a2VBX43WhCjxe5R5Tga0YN++WaqWG5LrkOwLsEk?=
 =?us-ascii?Q?PM0m5D+gsYIyaG/Zfkk0ezUDxl46IW7KXvLZKJ/FSGmAgBEniQqDAM5jM4wZ?=
 =?us-ascii?Q?Typ/rqsCWDc0v+NBDczJlWG9EnV/Y+uOXU2UTUfjDwagXJttMzUIzV21iVqu?=
 =?us-ascii?Q?wcHKGFG6XggL6/OqQWvW16F+wrYV2OsIhcJDhcC4OLiAYd/ZFP8UDSJqLxZh?=
 =?us-ascii?Q?Z+wcOWGoghowF3MaW2C2IX06ciCI/P2G/LjXRRX5H64WPd1WEdi2+C3JYJm7?=
 =?us-ascii?Q?tCkpZ0pkOUzpQy6IjJcmcHnZIcQR0XF68oSvF92ShUiU6q+NJVKcUPSEEjAR?=
 =?us-ascii?Q?geOArA9la9IbIcRJR6SRrxkQ6B4kxseilZwsVTZXLB98d3yd55+UmG2DILS9?=
 =?us-ascii?Q?KLX0FoRfmc3501egfQ9JzncQVuL9gSvdzIiPfysBIHBtpmQWRW5uck+n9c+h?=
 =?us-ascii?Q?VPgDN+dY/brEPaL4UXypIkM8og0sOtSE4fpAu/8t37aeMS5y5A5LZ102cjeT?=
 =?us-ascii?Q?kIRr83+G39x28CAzeyR6Y9+0wZRh4GI=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef22f29-7647-4b1a-edf1-08deacf13bcb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:02:02.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMjh8JOxIRs2TCxXYlNSdYud4ETL0TMas0xpHOJIDU80jb7HjS6tO2kHjdbLDAWnygPidXZly9MuQwAVSMs6gUNPJMCZVVidAKLlnqAbmcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5713

Add a new dts for the Agilex 5 SoCDK when fitted with the debug daughter
card where several peripherals such as gpio0 and gmac2 are disabled while
gmac0 and spi0 are enabled hence requiring a separate device tree.

Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |  1 +
 .../dts/intel/socfpga_agilex5_socdk_debug.dts | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
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
index 000000000000..3981a9e876b0
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier:     GPL-2.0
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex5_socdk.dts"
+
+/ {
+	model = "SoCFPGA Agilex5 SoCDK - debug daughter card";
+	compatible = "intel,socfpga-agilex5-socdk-debug", "intel,socfpga-agilex5";
+
+	leds {
+		led-0 {
+			gpios = <&portb 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&gmac0 {
+	status = "okay";
+	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
+	phy-handle = <&emac0_phy0>;
+
+	max-frame-size = <9000>;
+
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
+&gmac2 {
+	status = "disabled";
+};
+
+&gpio0 {
+	status = "disabled";
+};
+
+&spi0 {
+	status = "okay";
+	spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <10000000>;
+	};
+};
-- 
2.49.GIT

