Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090493;
	b=pbkWbf44AFmsK31wuzKBh6iwTiw3ULAaJuFcOkH+LmEbV8uTeFtvKl/MhyAFKPFDTc9Q
	 4DoA2Ylhaok8WVI+SaE4jgYDWHQXPDUI30p9n8ncXchjnrSyQpmPLk7AjICzBNQ4ZeW4g
	 KEjoiiTwCSOvERM6+nDnESFD0b8inLRBfVi2eA/9t47QuwjCMK+qa0yPuCx6/J1jO1WX4
	 G0VBODbFe12aSgOKXuH0znFtmzTIfGYgpWq7Ial1hPR/RcAX0bHKWzeu+kRtAl5UaUY3B
	 ilz0eSUKclYcebTNGO2bEDnfPeQ9gLn5yCdhgCPB3ZMLECfyAxuPgNNSoZehJAUjUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090493;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=;
	b=r8ixtFsk9LCqSOBeWvgsKbPOJCol4Pp+Nwl8Akt6N2DONyaW0uZJwYGM0/KTI/X9GFDE
	 VYtV/hB9Yn0CCwVTNpoyk9ux9IqHdaT9kdfyS4HIeoXLLNJTZddsAuKdv0ji3CCAWM10a
	 gGZftrw/NhJQXgk8/r7buhLA9ZZIJnXaayvwPZjdpuz6pzOVlDfo7oxXVtVjJVSDJ2L1q
	 cyT96TSTG3Y4Xj+IJOvOFrVeSaO/U9RaveB7scZvd7JpneK70n8rR4pJd1zdRoZuSbdoD
	 Ku6lNYr2ZUv/6wnXkEreX8eIPqZQCzen4UwjQ57iQJhb7LgZQkh2VWfkTMmTGzvK5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=gj9rEn0+;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="N/wSa4CA";
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA13606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA13606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=gj9rEn0+;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=N/wSa4CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795090491;
 bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=;
 b=gj9rEn0+DYpHTyhOSuqLED9G0yNAULwoy9ekmDO9bQ+aFyM2CK5Sn1OWLq/cnChQoi0GoKWd4
 a2CuHGIEnvJEBT3tBFGwjf5+QD4T95ymcfRvKc2Dcf5vLjuDxJRtPP/CmYyOWM9a8bFbWULsmdO
 QPn63z/4lWpuIh+mzoVdn8RAk+qW9mk/u+oxn/RuTDHllPiIBfkakkfCqOq1ocKw9DynOi/X/W0
 NuNrguwmRSWZ6U4HsYdRhy8mta/40P1O2PyoWSzrM9QBZbBsImUZdk+4vJMeBb36mHHpbABZrm8
 9QfsRJ+3hWhGscrK+clVgFpZG0EqFEvCjHeB7hMltNUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795090491;
 bh=enTEOHvfW4nekSyq09ifSasy3xLT4hReQ5Lq4FUBa4Q=;
 b=N/wSa4CAntTw7I4qtTWyy/M0atxlnLYc/0FBHkBD4tVAnasvHjwoibfOCzttEy5TU7aGPTmt2
 to+pXdi5wzR71SxwvNd75C+zV9+a9O6CxyjW3FuFwnV5fs/XRSxZ/X6RGs6OM8bfJN3Fz07AbG0
 ogRfnYcVMx2lYpc+Om1oc3I=
CFBL-Feedback-ID: 6afee839d37bc4966df1610c:2b3daeb54761424bc43b799f7a8619b6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6afee839d37bc4966df1610c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi NEO3 Plus board
Date: Thu, 19 Nov 2026 12:14:32 +0000
Message-ID: <20261119121433.550704-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119121433.550704-1-jonas@kwiboo.se>
References: <20261119121433.550704-1-jonas@kwiboo.se>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FriendlyElec NanoPi NEO3 Plus is a compact headless SBC based on the
Rockchip RK3528A SoC. It shares most of its design with the NanoPi R28S
and NanoPi Zero2 boards.

Specification:
- Rockchip RK3528A
- 1GB/2GB LPDDR4/LPDDR4X RAM
- eMMC module socket
- MicroSD slot
- Gigabit Ethernet with Realtek RTL8211F PHY
- 1x USB 3.0 Type-A host port
- 1x USB 2.0 Type-C device port
- 26-pin FPC GPIO connector
- 2x LEDs (SYS, LED1)
- HYM8563TS RTC with battery connector
- Fan and speaker connectors
- Debug UART and buttons
- 5V/2A power via USB-C (non-PD) or 2.54mm header

Link: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO3_Plus
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../dts/rockchip/rk3528-nanopi-neo3-plus.dts  | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 3df63c35b4bf..bfb1a232e414 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-mangopi-m28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-neo3-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts
new file mode 100644
index 000000000000..26f7aa4fe1ae
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-neo3-plus.dts
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3528-nanopi.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi NEO3 Plus";
+	compatible = "friendlyarm,nanopi-neo3-plus", "rockchip,rk3528";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio4_b2_usr_btn>;
+
+		button-user {
+			debounce-interval = <50>;
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
+	vcc0v6_ddr: regulator-0v6-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0v6_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <600000>;
+		regulator-max-microvolt = <600000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	usb_host_5v: regulator-5v0-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+		regulator-name = "usb_host_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&led1 {
+	default-state = "on";
+	function = LED_FUNCTION_STATUS;
+	linux,default-trigger = "default-on";
+};
+
+&pinctrl {
+	gpio-keys {
+		gpio4_b2_usr_btn: gpio4-b2-usr-btn {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	phy-supply = <&usb_host_5v>;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.56.1

