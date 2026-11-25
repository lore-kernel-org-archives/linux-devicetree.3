Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643101;
	b=iEbMxDijLxtIr8z3pxp8queaixxPfwFL8JWD4NX05DA3512raHiaQE0nuX5ZEezat40v
	 +x300KiRsxTVAqMfR+077aau+MM9iDIPgW9PnBIfWo2dt2uL2IeKCxszufZnbkBMnVA4N
	 qImx3PBVWJ19GODsuC0x/TN1mpIvi1nllI5anQ9/w3H+OMAJnR5J2G9QU2hJhF9MS+gBn
	 ul/k0w2qNQ3wX854H6LR5Dwm9xuI0H/3XQ5nGVnbM9oTOqsN39QWvvcXfDcIlo9RLKChk
	 xU0Xh1nYZcvOhBsc++Lc3YLspzJONUBzY4+iuKtqmg3MCQreYfYKVLGogqapPQ0t4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643101;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
	b=cElwq5zKOimZ18INCcC4/tW4hRTU6EpvN+BXpl6gl49fy1TBmbZlW5wkyhxS2j9tA7WI
	 N2vyU0or/Cy54iVQwA2GNXv0zISBtToRhSo9sTy/x3vMM0y/dHFe3bkXIrybgtLz5+S2X
	 7OgjV6Lmws4LsjTf9gZe9cl7939t7WSYhuvlVv+NU2N4cQ92bumg0ZC5vXFxu8OqWpkmq
	 cpcFHB1W4WYqGqNtAwj8fCr4nC/2n04CrJqYlPXzwRH/JAPj1dph81kdKkOiWjHKgz2e/
	 R2ZRBLO/nefZ7ZnuAVXXWh7+wQyPs/peC9PnuRhWi7B8gGiAySaOOZEqtKKoK/GYC+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=PhGz17g2;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=U34CsAFS;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E59606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=PhGz17g2;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=U34CsAFS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795643094;
 bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
 b=PhGz17g26mBA81hRZ3koZtj4iLsPpgLFhuXWdzgzvtQdRc8jya0Lqkm2vxGkEPCv6v08npYi6
 OAKcsK7fVVmJbTs5HDGkmm1IBHD6Roa16yuHCM25egMIe0/2WJ4jRNQqIcNUdENbXzueL/wBClF
 cfohAWStJUZ4AlIgyaeK2thmKgt8WkR63cZ+dx13pNLQkgqFwB26rhSM8aJxcnbHt/JQm04pRbU
 eO08v1UYE9R+tbLQdv3JbQNSN1ee18oTzJfX4I5DR41WeAzQERTQNMlTwRyIctz6sR/7hDlh/z0
 0pcwyQoMn/Lv+k9SyCnr2/Mzze0X6bdKD/31QqK5FzYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795643094;
 bh=+cUG8gA9hiKJyOSsgiNcUCH0QMEPPWjPVr18k4rmwCs=;
 b=U34CsAFSVKGJpnRkhxO4/uJYHJ0DZJCcqELoxJnHPyBAOyi/uEOv5zkNWYFZoid9NXGBDZxrG
 nAcl2xow7hiB0u/9USzoG9esZVZ+Zn377K/uOd8tFq7nc1HDGGQ4NP3NQjaWT6Yx5JR82o5+X20
 +uL2xcdvFUPMLSVRjKBuMlI=
CFBL-Feedback-ID: 6b0756c9f930f38bf754f9cc:8e331a1fcfe7d174c8ba0dfb4bdda1e6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756c9f930f38bf754f9cc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.39
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
Subject: [PATCH v3 5/6] ARM: dts: rockchip: Add Luckfox Lyra Ultra board
Date: Wed, 25 Nov 2026 21:44:17 +0000
Message-ID: <20261125214421.1580359-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125214421.1580359-1-jonas@kwiboo.se>
References: <20261125214421.1580359-1-jonas@kwiboo.se>
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

Luckfox Lyra Ultra is powered by the Rockchip RK3506B SoC, which
integrates three Cortex-A7 cores and one Cortex-M0 core. It includes
512 MB of DDR3 memory, 8 GB of eMMC storage, MIPI DSI, Ethernet, and
IO expansion interfaces.

Link: https://wiki.luckfox.com/Luckfox-Lyra/Luckfox-Lyra-Ultra
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- Drop unnecessary /omit-if-no-ref/ on led1
Changes in v2:
- No change
---
 arch/arm/boot/dts/rockchip/Makefile           |  3 +-
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   | 31 ++++++
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 99 +++++++++++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi

diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
index df620116bb2d..9a699bb8fc5a 100644
--- a/arch/arm/boot/dts/rockchip/Makefile
+++ b/arch/arm/boot/dts/rockchip/Makefile
@@ -47,4 +47,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-veyron-tiger.dtb \
 	rk3288-vyasa.dtb \
 	rk3506-luckfox-lyra-plus.dtb \
-	rk3506-luckfox-lyra.dtb
+	rk3506-luckfox-lyra.dtb \
+	rk3506b-luckfox-lyra-ultra.dtb
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
new file mode 100644
index 000000000000..5a3eb35eb70e
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include "rk3506b-luckfox-lyra.dtsi"
+
+/ {
+	model = "Luckfox Lyra Ultra";
+	compatible = "luckfox,lyra-ultra", "rockchip,rk3506";
+
+	aliases {
+		ethernet0 = &gmac1;
+	};
+};
+
+&gmac1 {
+	assigned-clocks = <&cru CLK_MAC1>;
+	assigned-clock-rates = <50000000>;
+	phy-handle = <&rmii_phy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
+		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
+	clock_in_out = "output";
+	status = "okay";
+};
+
+&mdio1 {
+	rmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
new file mode 100644
index 000000000000..bf19b1da110e
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3506.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdmmc;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			press-threshold-microvolt = <0>;
+			linux,code = <KEY_VENDOR>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&led1>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+};
+
+&pinctrl {
+	leds {
+		led1: led1 {
+			rockchip,pins = <1 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	no-sdio;
+	vmmc-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.56.1

