Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9593DA7C2
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040749; cv=none; b=KaUb6eRjmANAz7zSX5x++xWv64hh0iWeoV3Xd+2PS/L26RA4S4fYrnP4l1R6ZoqVhVwCy2v3SdmtpEr+NacrPTjoY/3747AaJWcFLbB3r7VTD4UDxT+R0ESGGbfAN3X6HoPUvuesMx0B8PMfgLRCEO8PRn6DwVGdwd7g9F0h6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040749; c=relaxed/simple;
	bh=B4aH+4KVEOwhZxypLMourPUyt/cQ+ptjIMdAxFJZySc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b3chqFX1c7nZTRrUwZYOVmxvoEnTbds1e8ZiiXmLTOafhjOZfwpB2sI4VhQukAj/bD3oahXxOUNwfj9KRF9c7zVGJZsRxzeJOVbjLCrpjfDSqv5Z0VIqd98+uHnP+XZLDDtL/U0ohFjJzJ5aZRr55xBZs6eZ/HnkwU9kwDgpWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=nMiW5T9K; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="nMiW5T9K"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso54455015e9.2
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1777040746; x=1777645546; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=573CRmgB6fq5PrzKy/43avbctK1Ja6gf0rG0MtvqmBo=;
        b=nMiW5T9KJghjaqFe1iLyAxX6iz4fgetqWjXX8d9gfiBIuqw4HJVdW0Jov5UwZ6OhPM
         Ci7wgnOZE+bh3kWHCCXfslDrY0QsHIAoW+4x6uQe0WhTTupVVU4DUFFyYr+/PntS4rPj
         JNEXpznWnQaVWDdPtt3FPg6Ac+10Ms6bPFZwO4QKgTHiVsE4qfjRJYPVsrux9QlhL7qd
         9WdpKQNMrYpUE2RU1mjhjMwth21LljNjNKBO+pR9bEyKLZFWsRgTrG2B89kpnxe+WWzK
         Fa6vZf3GWiU9slOhua66iHhctB5m8a33Y/682bBHillHoRiyqlsTc9HV2ffvhEEaO/QQ
         jCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777040746; x=1777645546;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=573CRmgB6fq5PrzKy/43avbctK1Ja6gf0rG0MtvqmBo=;
        b=hl4THb28R9KNXm1eePZUxMocMC0CpfVqLfle6CCIpyuIxYLlpInHwxlfddQzIX7oaW
         LX83Z/lVhoh486l4bogIf738Lv1JPAhxMhwYcV+SprJyB2t76M0s6ld0IQcozcndnIVd
         ntV67Or/OKCsybotvDW5nk+J047B0IRHP/gBj5Oe1azZAa5PvjM1861oq2N/JhmsU8WO
         SsZbW5aXDXa3G1UrOY84xRhVqWISoKI+nJDOiTAIkBJt/28kd10XWGWTli8BIjAWG0sg
         JNzuToZUJhAapKFyaXVOxv2C1gCAew8c9viNf+i8+dgbutX4MYXr7DXSOQItLnZibt1i
         PIUg==
X-Gm-Message-State: AOJu0Yw/PKDWn1uNgYuVvzHudoD11aF0s5wurIxYOFJ6hcmGV281I4DA
	xUqxsvRaS75Ntey5RUJKQZlJtCaQzOgD+Jyc26UVhMZM73WzTt42IrTKll9k14L33H8=
X-Gm-Gg: AeBDiethiPNwqH1OpmXhmaBUX+qmvSvGUsDs0PmCBE/htA4nfepoNcuDNekyL8Y5VG1
	Jz6eQHSWAwHoEBN9zNxRO1vzrrpv6ZGLqxAm+dKRXdRQnc2Fn0MMWbyko7MbuAfH2NRlmhzprX5
	Jj+CmZL5cCMR97jtU5GzAh7d+nbTm+1d54QhVZDOC+C2zLZbb9KvTt+Np0XhiHgcShvVqCaDt3Q
	bTkIxW/pHXCQey6PoAYr14J7ZU+GDhWUINylX8HetGGME8QSfMTTsq7jhhlvdtB/MqVDMnbkV7Q
	B31GblzcXLRnP5n4lMOdHbZqf0fPnPIFY7IjMczwleE636G/0xXQvIe5xc/0rzKDc8dCtTkNUHk
	4h0mu5hj/uLks0hiLhgvREg17Nt0r7UKx0v+Jo4E+A4Shs9Q/1yzc643/uxiq6nCcnDjl4x5g4U
	hCYitUYd9M0ZT0y0yMFc6Pq9e4t0Q+lk43LDSumJ1rauRxASKpY2HU3BP34+64va6BsWhHSjEfG
	r+PSCE4dGgKDH9yzw/kImbmdhE=
X-Received: by 2002:a05:600c:450c:b0:487:55c:e0c1 with SMTP id 5b1f17b1804b1-488fb768816mr443435725e9.14.1777040746211;
        Fri, 24 Apr 2026 07:25:46 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm378066605e9.12.2026.04.24.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 07:25:45 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 24 Apr 2026 18:25:40 +0400
Subject: [PATCH] arm64: dts: rockchip: Add DT overlay to use Sige5 SD slot
 for SPI flashing
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-sige5-flasher-v1-1-0a147ebaec7b@flipper.net>
X-B4-Tracking: v=1; b=H4sIAGN962kC/x3MTQqAIBBA4avErBNs0P6uEi0sRx2ICgciiO6et
 PwW7z0glJkExuqBTBcLH3tBU1ewJrdHUuyLATW22qBRwpGsCpuTRFlRZyz2iAMuHkpzZgp8/79
 pft8PxGwWFV8AAAA=
X-Change-ID: 20260424-sige5-flasher-e745282292bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5155; i=alchark@flipper.net;
 h=from:subject:message-id; bh=B4aH+4KVEOwhZxypLMourPUyt/cQ+ptjIMdAxFJZySc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS+rk1zP2Ls0hTsc4Jl4n3LWTP+9DewPWa4WTBR7cNMz
 ZW7q/5rdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVu2MZGWZp1fSZSVi/2an6suTDN9XjogXCYf91WAWu7L6if6ZvtiHDf8fduo0
 P/9yZdOP9u/5t35adUr3PGl5y53dCQOFZyQVhmYwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

ArmSoM Sige5, just as most RK3576 based boards, has its SD card pins
multiplexed with the FSPI1 controller, allowing for high-speed SPI access
to flash chips. If one has a microSD breakout board, a voltage regulator
to provide the necessary 1.8V power, a 6x5mm flash socket, and some jumper
wires, it's possible to use this to flash SPI chips directly from the
Sige5 with full hardware acceleration.

Add a DT overlay to set up the necessary pinmux and enable the FSPI1
controller for this purpose. This is specifically targeted at 1.8V flash
chips, and relies on an external regulator or power supply to provide the
necessary 1.8V power to the flash chip.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../rk3576-armsom-sige5-fspi1-flasher.dtso         | 80 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index cb55c6b70d0e..ece5bdb387bc 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-100ask-dshanpi-a1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-fspi1-flasher.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtbo
@@ -289,6 +290,10 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
 	rk3568-wolfvision-pf5-io-expander.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-fspi1-flasher.dtb
+rk3576-armsom-sige5-fspi1-flasher-dtbs := rk3576-armsom-sige5.dtb \
+	rk3576-armsom-sige5-fspi1-flasher.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtb
 rk3576-armsom-sige5-v1.2-wifibt-dtbs := rk3576-armsom-sige5.dtb \
 	rk3576-armsom-sige5-v1.2-wifibt.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso
new file mode 100644
index 000000000000..b2ed735a43fc
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-fspi1-flasher.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * DT-overlay to use the SD card slot on the Sige5 for flashing SPI chips via
+ * the hardware FSPI1 controller.
+ *
+ * This is specifically targeted at 1.8V SPI flash chips, and requires an
+ * external regulator or power supply to provide the power to the flash chip,
+ * as the one on Sige5 is fixed at 3.3V.
+ *
+ * Here's an example circuit:
+ * -----------------------------------------------------------------
+ * SD card slot                    SPI flash chip (e.g. MX25U12832F)
+ * (Pin 1)    DAT2 <----------------------------> WP/SIO2    (Pin 3)
+ * (Pin 2) CD/DAT3 <----------------------------> RESET/SIO3 (Pin 7)
+ * (Pin 3)     CMD <----------------------------> CS#        (Pin 1)
+ * (Pin 5)     CLK <----------------------------> SCLK       (Pin 6)
+ * (Pin 7)    DAT0 <----------------------------> SI/SIO0    (Pin 5)
+ * (Pin 8)    DAT1 <----------------------------> SO/SIO1    (Pin 2)
+ *                           +-------+
+ * (Pin 4) 3V3 VDD <-> VIN 3 |MCP1700| 2 VOUT <-> 1V8 VCC    (Pin 8)
+ *                           +-------+
+ *                             1 GND
+ *                               |
+ * (Pin 6)     VSS <-------------+--------------> GND        (Pin 4)
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	vcc3v3_sd_s0: regulator-vcc-3v3-sd {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&sdmmc0_pwren>;
+		pinctrl-names = "default";
+		regulator-name = "vcc3v3_sd_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&pinctrl {
+	sd {
+		sdmmc0_pwren: sdmmc0-pwren {
+			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&sfc1 {
+	pinctrl-0 = <&fspi1m0_csn0>, <&fspi1m0_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc3v3_sd_s0>; /* Need a discrete LDO!!! */
+	};
+};
+
+&sdmmc {
+	status = "disabled";
+};
+
+&vccio_sd_s0 {
+	regulator-max-microvolt = <1800000>;
+};

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260424-sige5-flasher-e745282292bd

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

