Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D6E544D5B
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080656; cv=none; b=LdhWLPvWadEhrdX57yxrAoSLyFsilo1o81vg2rDVtEIv1z2LIyepbDA/EI3A23HfGBdmggzGGJW6fRAGpzmiJHe82WEXbq5hIgml8qc6sCCTvUI9JAFxBgbi68O9B2oGp0vQ1ERssqUdFvEGCPdiV46Da8rSeAfGXfHsDIt3nF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080656; c=relaxed/simple;
	bh=PrM8pp9pqa3kAa/lLlxnGnh0it0M1I0jBihLWySwtmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRwfoWp7CRI8rVsZNxU5U7t5xluonSrEAHG8+ldBeofmOiMz1h0HKQ/e5FYSzFTloGlNK9BOduZq3nqjDE/jgNWTbUKS4E+lG6Hxx6rrz67wUQfFwLO1Z6L0MaTnETChFhfmIvWhQ8cYztcXnzuZ4tDjvpHbo6QWHidtLrWEM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdukucQ/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdukucQ/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so3585716b3a.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080652; x=1790685452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=kdukucQ/WE5jcc2MuYkyRspuJ9s/f0TkiC3yypw4n2+QnZFLQSWIE+7A6IEpuJpkNJ
         IOhWHmUul2fNj+H8Srfv5JCUB76zQDd1g+8GOWAKiKtcSuXCr4bY637GV1WZkn74nvNQ
         eqEDoDekaESB1CmM1lZ1/FoecKZQxWAGQoMYCSsDhe+wBWpkWvjEkkop8dMuIRsrqbqu
         g+Z6Ecbe4Y5+HuIAQEPE2rvw0uGxq0tDM4oqsSG9V05v5PyvLBYG2DYJUKKf8/xSOko4
         3nEW3TLAjVXfJvGVDt6dbW5F4FWNFj1ESvTkoCmFqf0Pc6e6gWov4Ns2uuC5z/SV+MJR
         IO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080652; x=1790685452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7irEIIBgzty36UKE5fbvUb/seFCiEiq/bxnIonis9JA=;
        b=Z4EEobb2TJ05019DyG28vLOtaYy2kcBwMPh/3Jq8gmVDVs93qBibvNAy3KWfDXDY1s
         HPd5bXqNIvy6QL6Ugmc9p7Qec14VmRoY6U7rNiR7loXR9DHP0/EX81H1UqjVyNYcyoC4
         FbszceFudoDJN265adsvYFhVGquF5aLoSE5nf9wW6nn89sDfw4Ri8a1KQnLfJuRSMnbO
         ZirwLK3nik5yarJRsTDfh61V14DcAl7U9ed8nMB7e0mTjl91caZXusZf4Mjx8UlK54fa
         34O5YZWW4jgWZEp/oiNteeNX6kf5JOVVZ84U5exI9drBLFW6eByGpsA0OAPxylD9dyVg
         wUHA==
X-Forwarded-Encrypted: i=1; AKwUvBwf+SsBH8ZKrQ11MiSaaJWwlzM0zVVgjB6Qn+Ksr9c6JtpoiiN3dqDOQnGUQr0m/QFgCpIQgt+/5SEG@vger.kernel.org
X-Gm-Message-State: AFuF++l8feVDno3wYhuOox7gyhjWijq5DMw9u/kYxr/GcDpQZKK0m919
	KkGZf2/yB5cmqfTOGl+ZRHrP9IHML2bjGiKqulrP49MQbkAIeaUKGMawl1fZuQ==
X-Gm-Gg: AYBFou2QP8wma311lQhv8EMz2BXMjb+IZiEVVteF33ldH5udX5g5PCGZOKhT0PblnDj
	vzlFrnzM+JsqvIsEzEEbWCWvU+lLNbzt+9bFHFjPsbW86lC7HtUWRqXdp/BESDauTbKEZjr5hLM
	g+130t4bWXuKChR4kxdcolXpJjp1CrxneDqP9T7sp4HkzEUlV4RuNOd5HNFqUG62zN+SZEADCOo
	QhcFPcd5HKNd0zdO9ITA7dvdGYaZZAJ0JLbF4OYfoxutKpJnVd6GxVwT5pDvCDpdbzvlAWK/8Jk
	Rr9Qq3zXYhba41SdlmjvoNMC4UNworLUqdr2N0ymCITXq+NQaSZnEYj4mlZTPzzdnDZHU1paRxg
	WJYa20r1ZiGd/e9K+JFEmnVq+0Wpu2ijFx09Oiq2fjY7ae+VTPkhBvN3FbCmYWvWx+dlZEONBEu
	hUASXwWxXx+IlwNTZnNfMZvlIRk7chRdfdsieEqqQoiKP4WYGZyhp0mUuOlsqr3xP835Jaw1Ac4
	IcVLRm1VkAH81ymosbRrad1VSQ=
X-Received: by 2002:a05:6a20:e290:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3ddec87d5f9mr1250509637.64.1790080651785;
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612ccd46sm6453922eec.18.2026.09.22.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:37:31 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au
Cc: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	andrew@lunn.ch,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 22 Sep 2026 18:05:00 +0530
Message-ID: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..a4e384588a54
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+	model = "ASRock Rack B650D4U BMC";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		gfx_memory: framebuffer {
+			compatible = "shared-dma-pool";
+			alignment = <0x01000000>;
+			reusable;
+			size = <0x01000000>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		m25p,fast-read;
+
+		status = "okay";
+
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gfx {
+	memory-region = <&gfx_memory>;
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P7 */	"button-reset-n","control-reset-n",
+		"button-power-n","control-power-n",
+		"button-nmi-n","control-nmi-n",
+		"","",
+		/* Q0-Q7 */	"","","","","","","","",
+		/* R0-R7 */	"","","","","","","","",
+		/* S0-S7 */	"","","","","","","","",
+		/* T0-T7 */	"","","","","","","","",
+		/* U0-U7 */	"","","","","","","","",
+		/* V0-V7 */	"","","","","","","","",
+		/* W0-W7 */	"","","","","","","","",
+		/* X0-X7 */	"","","","","","","","",
+		/* Y0-Y7 */	"","","","","","","","",
+		/* Z0-Z7 */	"","","","","","","","";
+};
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
+
+&mac0 {
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3

