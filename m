Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFD471408
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323389; cv=none; b=u3rDo0GUOLWW2qcLjwN8Pv6sD7wI2ydzoo39r6+xAj/tcI/mTVRA7GH8hDeVlzrxBx4Ze1lbfVEu44gdHiTbem5Qc7h43kXdDgPx+mlNp6HBLV/gr+lp2BaC084R+zQ7IR5w3dpu0hXsBXmDeWA2ik7Faax4aMiPIQEXmmsgdqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323389; c=relaxed/simple;
	bh=qKZo5yQyb0YP2yGgvVyQGZG4AiJC+P6OblCY5kxQjgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh5WGzhepE+0xwP3uQHYK4GyK1XO22+TJVJUJlsFPtp8EY6/vQDt4+M6LvSLi34+fHyWbTg/eizVmQbVwQffFa+oUI3DU7vIv3W+fRYXLbyxd4EVJOi3pd8qhelSThDk9mV26nqaqsZhEKufsNR9UsGob9Z9ExM6t/7t2Rd++xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=LV8vBRWN; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="LV8vBRWN"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso68734466b.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790323386; x=1790928186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U46+/TQQC41hUZlX1Jqyf2quyZyNvdapr8jATlMb4/s=;
        b=LV8vBRWNyw4R7cKqXHB5GT0Hk6r59eq6iyZQrGKLDOs/jsrgwM8o76AgYWrJvdfnfA
         5gRDOatsFWqnT3YaT5E62JU4d45aq9fBSdueCCkk/4SQWEGNw6XF2134B9xNDU6pKnqv
         9pFJRbr2w+TkJLNF5aimra1tC6WeKOqu8vvRc+5HJ0bttfeLqkHSTes/9fSBWBuPUo6N
         81jlKG34zqrZBHk/Dpz4QSInP9c5kCzQVeemsHqatR2fgRV28VApuXNAm6zDVjrF/4mj
         aDHgwfjtatCBGKCVsVHlpN9JHkc0RcQJksbQznqmszUjrMMEY7uEjqr8q9nJ2s0xJdIZ
         naLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323386; x=1790928186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U46+/TQQC41hUZlX1Jqyf2quyZyNvdapr8jATlMb4/s=;
        b=eRHKFh+iKyMcQh416EfCRUWbO0/9n/T1b4XP3GJec5+XVytNazDqJ2MdIo9vrA6aaq
         9T2+NuzAAp0p6/uv+nUndVao/Uv8D7DyXLbtlUUVei/gTExGBUD3djdrSRCkXzU6VEzs
         IRYK9ez9LowtiPNJ5NY2PEdkKMLe9zdO91SkDILMBWArZOSkOlBNSUpWo/nxirtVgVRw
         weEVL3slJErfog7Bb7TGA0gejKW/5lhwTokJ0Xyc4ruNK+Xg8/1y9/Zhkao+7wEvTSo2
         YR/gXQiGRogJvGDkfK5lC/1jomSMi1FRIlGvwLKzlQ3CG0Y5lu8fN6x4Gz0ok/pIXOgU
         UKJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4Q5rNDggo0mo+KZED0EQEhjC43CXZTb8drUNrcIjM/4CVjwIizvSGWbDH/GegklYmmQr1MI5ZzK01@vger.kernel.org
X-Gm-Message-State: AFuF++nJcs+2VyLRIL+XlECoIT+TDst7xBDp0WwNKMj9rFVoF7A4BGG0
	yVUHYtmHoi/VHwIiGaXyVa1Q1ZGkb062m247YUlyLeIORjPi0cOGfTBhc8Fj/YtvShU=
X-Gm-Gg: AYBFou15gTk/r1+uMKMQdU9dyFb0Of5BFfHugw0sgOT1ovdCFLL1lFzXWcXgGSwTVUF
	c8l+0KyksGcGt03tyxgtQq4tqaOCshmHdmSeLOZvk5HVb2Wpwo5cKgG6xPmEGitlnvGghQs16in
	aIdDQyEub5RBVQtiqA43tsx69mpXm620PxsguIPY6tCS6pyqMnv0lobv2iLpSb3plpyIT6JPBuU
	75f+lJ6LX6ZLCSkwJANRfdXaDTvgPOd69q3lv+UqIdW1EgG/QrP/U/I5EqB5fUbbPWP9pHm2i6N
	kO0gHB2chnZ6Nz/D4xKaM93WtvTyvC+TpgxbbZrij7klwNopuANz4Hb+FeWrERNNDDXMyhVyIfJ
	UxsFC8YwgRsrytvVFVvBZaUQmrs+Kn3sXXuC8XWMML0klpgVcSy0bgcU8XBZyOE6uCFjWHQkEyx
	cDfLtxOscn3I12OMO6ShhXfBo+MBWBG0luoqHGrbvvXHxvZ3M8IXzdtNqoDl3ZewKWeSW087nl/
	+e2V6p8SKrb5fXSoGgq6jiSX0jiD1SH6MXPKeNmW/Zr1VM=
X-Received: by 2002:a17:907:c08c:b0:c29:3aef:f2e2 with SMTP id a640c23a62f3a-c2ac25f2abemr418331766b.40.1790323386232;
        Fri, 25 Sep 2026 01:03:06 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm76976966b.33.2026.09.25.01.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:03:05 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add WWAN overlay for Radxa ROCK 3B
Date: Fri, 25 Sep 2026 10:02:58 +0200
Message-ID: <20260925080258.46489-3-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925080258.46489-1-adam@wermuth.pl>
References: <20260925080258.46489-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 B-key slot on the ROCK 3B is intended for 4G/5G modules and
is not always populated. Add a device tree overlay which enables the
slot when a module is fitted:

 - The USB 2.0 data lines of the slot are routed to USB2_HOST3, served
   by usb_host1_ehci/ohci through the host port of usb2phy1. The slot
   has no VBUS, so no supply is attached to the PHY port.
 - GPIO0_C6 (4G_PWREN_H) enables the 3.3V supply of the slot, which is
   generated from vcc5v0_sys by a dedicated buck converter.
 - GPIO0_D6 (4G_RESET) drives RESET# and GPIO1_B0 (4G_DISABLE) drives
   W_DISABLE1# of the slot. Both are hogged in their inactive state.

Tested with a SIMCom SIM7600G-H module.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  5 ++
 .../dts/rockchip/rk3568-rock-3b-wwan.dtso     | 65 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index b677914cd3f1..8a1f24ccaa32 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -165,6 +165,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b-wwan.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
@@ -300,6 +301,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433-pcb-12-10.dtb
 rk3568-qnap-ts433-pcb-12-10-dtbs := rk3568-qnap-ts433.dtb \
 	rk3568-qnap-ts433-pcb-12-10.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b-wwan.dtb
+rk3568-rock-3b-wwan-dtbs := rk3568-rock-3b.dtb \
+	rk3568-rock-3b-wwan.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso
new file mode 100644
index 000000000000..73a19408d61c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b-wwan.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for a WWAN module in the M.2 B-key slot
+ * of the Radxa ROCK 3B.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	vcc3v3_wwan: regulator-3v3-vcc-wwan {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wwan_pwren_h>;
+		regulator-name = "vcc3v3_wwan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&gpio0 {
+	wwan-reset-hog {
+		gpio-hog;
+		gpios = <RK_PD6 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-reset";
+	};
+};
+
+&gpio1 {
+	wwan-disable-hog {
+		gpio-hog;
+		gpios = <RK_PB0 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "wwan-w-disable";
+	};
+};
+
+&pinctrl {
+	wwan {
+		wwan_pwren_h: wwan-pwren-h {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	status = "okay";
+};
-- 
2.43.0

