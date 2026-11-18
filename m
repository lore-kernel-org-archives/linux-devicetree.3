Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028836;
	b=vTlxwgLucfMk0MOl1cFxNClxU3xOnZOlVoLW5kicmKcOk8Xble4c/PQeVtNmLvdScgt4
	 ZYqXfSNkvw0K3kZU92VObkn3lp8xWLsVb28k2/FxIjNdOjdOarx0xhWma8153O55f1ir2
	 zCuUQpNZfrvei4Q0gvgkLLXWbqCtG35PbIKLcomyncmyPDABefJ6tnIqz/6dCxF0WA+NQ
	 169lB3A6jLltDMm9+fDYN8FhEjYTLDLo+dkeSPqEobRhNm89njs7dQAtC2EXkVsajhfpo
	 ODFkPMDZbiZZdt9ZBTH3yxQ7kv9GkBm+YU6uxCzRoLqigOjILOT9in8vJWSxbEXo6WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028836;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CIZqhJlaDCpoXoZHyEdKoa7K0bUxmk13LWkz9x+o+Xg=;
	b=nmKl6BfJ/xzVTdLujxU382e2JhRvJ/ddgy8pomQV3U9FHA57NUvzj9P9xdU3wQjGf5JN
	 V8C6B0xtAS4atBERXuRj/5v/f0k0F7uDSO4kuBaQZTd8Hseq0+1YxOJG6aGXwVyrMgsw4
	 yc14DyuPukAM3F3RsH9JCglo6zFXvXyHUOqkoWdZRtmdmi02Ll6ykKxiaWnZfOlzrIy4Z
	 S29UCgANjVoIrSEh+mN8k4rDboPl+IxiyjkAF/bw3WR2eiW/5I+dzRYsnFNX5XLbjDVCa
	 KECA3AaoDIu86zsHMYWYclfAPavvaW2fSjp6pfNfx9S9xnjWbezh72kUAztw7OT1uow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgBpEDJM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD94606A33A;
	Wed, 18 Nov 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NgBpEDJM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028836;
	b=1TCqe6/GHysdGqQGC9kjv8hqtTg1oKE1TyySO2mLZcxnXjrqMSQYqrtt+mpwFPzGqYFV
	 tOMKiZfWa+BkGmA14q6jUrE+4gv4X5drx7zbzDS2Qle/z0zWLY9rdYzL2C0Kb9DBZI/Ls
	 o43ySnV8rbkIli/q5lAAr7M1U90BWIT4XxObXLJAQnRF64OC7vQxo1dMAG2T4GqXRO2p5
	 NCxt5fKgMOY02dOKA0Ke1O4svaWOEXeCZhQ9JlrSxmSdVOZfnept318ikxBkUbLJTtiE/
	 xO1ZZN4I1bMdjZNiR6SaSnBjQek9HSyyYKE0153ecjs+v2TA0AWD69C3Y+YvXjWhd6A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028836;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CIZqhJlaDCpoXoZHyEdKoa7K0bUxmk13LWkz9x+o+Xg=;
	b=ooQJuR00ggSpJpyrVxaEyPCpokTaWDPbRBJ632/SQe37O7hCjSM3Ycxi5JQrwcC/QpFY
	 EOMeQ0nxRSddUyvAs0xZ69o2GbayGcOCZ14L4SL32VrN4FdhrHuypMWbjxLUsV0c4zKmc
	 VRyrlaZ/kiTuHE/lMbulVdxLsqoKfh69fnTrrQFg+T99d+eq0imATRE4nJH+0sN1FA+r0
	 mqD+giKNMMp4lkMpHbKQnHcqZ21LKBweInSDRF/pfmFykqumJOma7ut9F8ZEy2YnlQWic
	 AHEN9sEba6VnZtUMYDn3gqTEHb2vQCiCprRDbMLP9kOqIhsVmu6o6HxQBZaNi3xdg/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8096E1F000C8;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028836;
	bh=CIZqhJlaDCpoXoZHyEdKoa7K0bUxmk13LWkz9x+o+Xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NgBpEDJMqFMDz2oL2HY4sw4/9f8ihWMN8DZ42MNKmYXKVft2a/S4vXRutTrL/rCV8
	 LTb0JhEFvxFLdJI/qCyQ4A1NxajkOqp0qVn3R9+xWo8maUu73iHZ1Hyt+Lj+mopLs+
	 AC8Pvdc+f9TjQxYWZiEOcdaDgEaqyKtAJmbGZ3TilRFGaaQwXznd1sJ682zoGWSVnW
	 af8pzVbcWL7q4KDJ6VIgIVQ7Jn9R93Y6454+NYAIVF2yZtFy5kcsR+ZFnaa0wmIkoK
	 +mazBwMITrAxa44BRDk4HgcXKte+zuapTuwPdxT/rM4g/6zU1fMWqB+7dg5F7RJatf
	 HxSYmf/qkrOHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0CFB84AF4A;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 20:07:15 +0100
Subject: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic
 DE25-Nano
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-de25-nano-v1-3-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
In-Reply-To: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=3047;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=NLTSseE90KgBZKd0dpEYRE0San+zR5ClCX05UXrqrLs=;
 b=DXrw8E5bWhUbGJAdeKAqWl1QOrVUyHuRRBfbjJGYN1ZHku7iTREUODI3fWrZ0Ica8Ilmd9Bmz
 0NSSSTszQoYBopln422YUNzyLpbf3brULRptbgrPkU2tOaOwFMskbGF
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com
Content-Transfer-Encoding: 8bit

From: Alexandra Østermark <alex.cramt@gmail.com>

The DE25-Nano is an Agilex 5 SoC FPGA board with gigabit Ethernet, a
microSD slot wired for 3.3 V only, USB and one HPS LED.

Based on Terasic's and Altera's vendor device trees for the board, which
describe the SD slot on an SDHCI node that upstream doesn't have; this
uses the upstream SD6HC sdmmc node instead.

Boot from microSD, gigabit Ethernet, USB, the LED and the watchdog were
tested on the board. The QSPI flash, the I2C buses and the SDM hardware
monitor are left out until they have been tested.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 .../boot/dts/altera/socfpga_agilex5_de25_nano.dts  | 91 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index d38fe88a1..29170f793 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk_multiqspi.dtb \
 				socfpga_agilex_socdk_nand.dtb \
 				socfpga_agilex3_socdk.dtb \
+				socfpga_agilex5_de25_nano.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
new file mode 100644
index 000000000..1617600e1
--- /dev/null
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5_de25_nano.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, Intel Corporation
+ * Copyright (C) 2026, Alexandra Østermark
+ */
+#include "socfpga_agilex5.dtsi"
+
+/ {
+	model = "Terasic DE25-Nano";
+	compatible = "terasic,de25-nano", "intel,socfpga-agilex5";
+
+	aliases {
+		serial0 = &uart1;
+		ethernet0 = &gmac0;
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
+			gpios = <&portb 17 GPIO_ACTIVE_LOW>;
+		};
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
+	/* TX/RX delays are on the PCB */
+	phy-mode = "rgmii";
+	phy-handle = <&emac0_phy0>;
+	max-frame-size = <9000>;
+
+	status = "okay";
+
+	mdio0 {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		emac0_phy0: ethernet-phy@1 {
+			reg = <1>;
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
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&smmu {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	disable-over-current;
+
+	status = "okay";
+};
+
+&watchdog0 {
+	status = "okay";
+};

-- 
2.56.0


