Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5E410D13;
	Thu,  4 Jun 2026 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571948; cv=none; b=RbQl++N/wI0TrqeIEceBwOGtiy2gtQdL/6C14SejLynJ9SRqa+4mWbHAtOyTJArmtSgRROnFrUD1tbrdCCp7IcwgKKubQWRNSoQgloPjmrw4GbXU1erZOAqeCmLCflrZCzTJYHSeteUM12BtzXiXWF+5n76le21y/J9sPzWAWYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571948; c=relaxed/simple;
	bh=WWZXFHOe1zHIKiwWpfp5Ack469/wvslYeTJVH83HCeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apFGJCD2bxmA8Bp7NoY2oUmYSatsONHCZLEVBRIviewAd4LcxcPZuP0pHG3ngpveD7iQfviAGeeF6OoYXpobRPaNesEvppjTgcHPZhSAlKm3wiohXLj8qSNMRU8ME+Jj7gvwJWjqIsNKQ7VhOOU5f13wFl9l3H96CtIeBcmqMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=HKOdra+G; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="HKOdra+G"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 654BIM070299936, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780571902; bh=AyhrgWDIug9AoQBuogx+uuVQlmm7DjfRSlnDmW0s7jY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HKOdra+Gm5katShwCxqIlUQ9mucRuISJWDFyFqinwDqmai8wzifimb6T7/uBTj085
	 bhkuPbeBG7aR4o4ljzyEQa19ShzBoemF0uQH1aNgopcKIFsPPMlwJfDRV8APFDZP6C
	 Gkie12/evrzPhF/+9u9gP2Ukk8SRHncJk57ucOhHmwYjG6AcuvKCCFZ7uqL42jLzeV
	 EjH3WICYTj7W73RQhN/sYDmfz2dPh+hag1c6xLdhmwqZt2RdlahqXvReJhYHR2BDYc
	 nnUvR8awiZVq7ryUV0SsALfbRfBtuE+bQ9LgOS7gsJnhOjpduVvcY2GvRZ8reQjgMo
	 IEXMCEyv7W+1g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 654BIM070299936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:22 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Jun 2026 19:18:22 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 4 Jun 2026 19:18:21 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tychang@realtek.com>
CC: <eleanor.lin@realtek.com>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <james.tai@realtek.com>, <afaerber@suse.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [PATCH 3/3] arm64: dts: realtek: Add I/O level detector
Date: Thu, 4 Jun 2026 19:18:20 +0800
Message-ID: <20260604111821.975624-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260604111821.975624-1-eleanor.lin@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add io-level-detector node with pinctrl configurations for 1.8V/3.3V
voltage selection on RGMII, SDIO, CSI, SD, UART1, AIO, and eMMC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
This patch depends on this pinctrl node patch [1].
[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=50d92732d10e
---
 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi | 108 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  28 +++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi

diff --git a/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
new file mode 100644
index 000000000000..ec7e33034b96
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/kent-pinctrl.dtsi
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (c) 2022-2026 Realtek Semiconductor Corp.
+ */
+
+&iso_pinctrl {
+	aio_vsel_1v8_pins: aio-vsel-1v8-pins {
+		pins = "gpio_98", "gpio_99", "gpio_100", "gpio_101", "gpio_102", "gpio_103",
+		       "gpio_104", "gpio_105", "gpio_106", "gpio_107", "gpio_108", "gpio_109",
+		       "gpio_110", "gpio_111", "gpio_112";
+		power-source = <0>;
+		input-threshold-voltage-microvolt = <1800000>;
+	};
+
+	aio_vsel_3v3_pins: aio-vsel-3v3-pins {
+		pins = "gpio_98", "gpio_99", "gpio_100", "gpio_101", "gpio_102", "gpio_103",
+		       "gpio_104", "gpio_105", "gpio_106", "gpio_107", "gpio_108", "gpio_109",
+		       "gpio_110", "gpio_111", "gpio_112";
+		power-source = <1>;
+		input-threshold-voltage-microvolt = <3300000>;
+	};
+
+	csi_vsel_1v8_pins: csi-vsel-1v8-pins {
+		pins = "csi_vdsel";
+		function = "csi_1v8";
+	};
+
+	csi_vsel_3v3_pins: csi-vsel-3v3-pins {
+		pins = "csi_vdsel";
+		function = "csi_3v3";
+	};
+
+	rgmii_vsel_1v8_pins: rgmii-vsel-1v8-pins {
+		pins = "rgmii_vdsel";
+		function = "rgmii_1v8";
+	};
+
+	rgmii_vsel_3v3_pins: rgmii-vsel-3v3-pins {
+		pins = "rgmii_vdsel";
+		function = "rgmii_3v3";
+	};
+
+	sdio_vsel_1v8_pins: sdio-vsel-1v8-pins {
+		pins = "gpio_45", "gpio_46", "gpio_47", "gpio_48", "gpio_49", "gpio_50";
+		power-source = <0>;
+	};
+
+	sdio_vsel_3v3_pins: sdio-vsel-3v3-pins {
+		pins = "gpio_45", "gpio_46", "gpio_47", "gpio_48", "gpio_49", "gpio_50";
+		power-source = <1>;
+	};
+
+	uart1_vsel_1v8_pins: uart1-vsel-1v8-pins {
+		pins = "gpio_8", "gpio_9", "gpio_10", "gpio_11";
+		power-source = <0>;
+		input-threshold-voltage-microvolt = <1800000>;
+	};
+
+	uart1_vsel_3v3_pins: uart1-vsel-3v3-pins {
+		pins = "gpio_8", "gpio_9", "gpio_10", "gpio_11";
+		power-source = <1>;
+		input-threshold-voltage-microvolt = <3300000>;
+	};
+};
+
+&main2_pinctrl {
+	emmc_vsel_1v8_pins: emmc-vsel-1v8-pins {
+		pins = "emmc_rst_n",
+			"emmc_dd_sb",
+			"emmc_clk",
+			"emmc_cmd",
+			"emmc_data_0",
+			"emmc_data_1",
+			"emmc_data_2",
+			"emmc_data_3",
+			"emmc_data_4",
+			"emmc_data_5",
+			"emmc_data_6",
+			"emmc_data_7";
+		power-source = <0>;
+	};
+
+	emmc_vsel_3v3_pins: emmc-vsel-3v3-pins {
+		pins = "emmc_rst_n",
+			"emmc_dd_sb",
+			"emmc_clk",
+			"emmc_cmd",
+			"emmc_data_0",
+			"emmc_data_1",
+			"emmc_data_2",
+			"emmc_data_3",
+			"emmc_data_4",
+			"emmc_data_5",
+			"emmc_data_6",
+			"emmc_data_7";
+		power-source = <1>;
+	};
+
+	sd_vsel_1v8_pins: sd-vsel-1v8-pins {
+		pins = "gpio_40", "gpio_41", "hif_clk", "hif_data", "hif_en", "hif_rdy";
+		power-source = <0>;
+	};
+
+	sd_vsel_3v3_pins: sd-vsel-3v3-pins {
+		pins = "gpio_40", "gpio_41", "hif_clk", "hif_data", "hif_en", "hif_rdy";
+		power-source = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..f18b975c3593 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -125,6 +125,32 @@ psci: psci {
 		method = "smc";
 	};
 
+	io_level_detector: io-level-detector {
+		compatible = "realtek,rtd1625-io-detect";
+		pinctrl-names = "rgmii_1v8", "rgmii_3v3",
+				"sdio_1v8", "sdio_3v3",
+				"csi_1v8", "csi_3v3",
+				"sd_1v8", "sd_3v3",
+				"uart1_1v8", "uart1_3v3",
+				"aio_1v8", "aio_3v3",
+				"emmc_1v8", "emmc_3v3";
+		pinctrl-0 = <&rgmii_vsel_1v8_pins>;
+		pinctrl-1 = <&rgmii_vsel_3v3_pins>;
+		pinctrl-2 = <&sdio_vsel_1v8_pins>;
+		pinctrl-3 = <&sdio_vsel_3v3_pins>;
+		pinctrl-4 = <&csi_vsel_1v8_pins>;
+		pinctrl-5 = <&csi_vsel_3v3_pins>;
+		pinctrl-6 = <&sd_vsel_1v8_pins>;
+		pinctrl-7 = <&sd_vsel_3v3_pins>;
+		pinctrl-8 = <&uart1_vsel_1v8_pins>;
+		pinctrl-9 = <&uart1_vsel_3v3_pins>;
+		pinctrl-10 = <&aio_vsel_1v8_pins>;
+		pinctrl-11 = <&aio_vsel_3v3_pins>;
+		pinctrl-12 = <&emmc_vsel_1v8_pins>;
+		pinctrl-13 = <&emmc_vsel_3v3_pins>;
+		realtek,iso-pinctrl = <&iso_pinctrl>;
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x40000>, /* boot code */
@@ -184,3 +210,5 @@ gic: interrupt-controller@ff100000 {
 		};
 	};
 };
+
+#include "kent-pinctrl.dtsi"
-- 
2.43.0

