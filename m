Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101683;
	b=zSYXJCW0YqjTjB2zdFT/mlxRYnAm1KG23ZmUFrva5p9bSPLBtk73D/yUUsdqS08SLsHB
	 Lh7S5u+NK1dQpbltw8LADtIDeTWDQBWPkK69wPzewnfTXx0fJT1d5gq0CuVHV2jK1iKPo
	 X9ZZyDpUo8uyPCQGwMRpWZiWP8kj9SDr/sj4Dp3XwNaC4nsq/BoAMhM1vpmqRy+lJid2i
	 NlNr71pbCaH9O07yIFKICX5R5Td6hDP4XWGrDXSkE440qwpwZHQg428Ci/MjG+zFaxA+F
	 h/JWJm7z8A+J1vb8KpLDuyAC5pzTQASF+CFfmy76jhb1voF4Ms+2F87SJIeMyfRBVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101683;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+BMI6JJbtEPc14NSQH7+PKHWzfP93bpxfX8QAil2H3o=;
	b=Ar/pWonXRuM5wMA5ufW2fqCqdxQ73lZfgB7cfyd2FR2jtX4WyfQ81AU/JDQCGKV0z/+6
	 wZLbx0LW7jLv3WOh4HZTGobCEI0UbXkuYHsruUq2h+KJkYKA9LRr9Psq6zmKKhkQtdXvH
	 SKc95H2aM6UNhos4EX5qW31gKzIDt/LeYxx/JWjvummLsjGhwBJX1VrwrJ9NM69ZlbJVk
	 2uok1SB01rwh8PPHfY1mqLPHChzld/Y5Ipw5DcwamO5X/33mnp5m14n202/d1OMz4KgSm
	 jpjTuaVEoTyIQyHs3s9jhjhaf08uYqEmQ70rJQpXspQzQc22U1rqsGdCPgo2GFZpnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=OWm2mrXP;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eIdi7y7P;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9473606A32F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9473606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=OWm2mrXP;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=eIdi7y7P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=fe-e1b5cab7be; t=1795101682;
 bh=+BMI6JJbtEPc14NSQH7+PKHWzfP93bpxfX8QAil2H3o=;
 b=OWm2mrXPMIDZl5z1AezeUVV3gV3h20yquN5TR/+QktAXIAeMMZ7w3IGSYTqLSS7/pzeadozB6
 mEHEPVM0681PywdXsrlp4aT3yOTZ6CHThp+l0s06jRS4qlyOoRg4KWjzH7lP86Ba8TDgi0+6K7E
 RV7YhrJ1y++xBcs4u07Plgx2Kq6/kS21NNev2bqEWeDWfvlUI2+64mk/hmZmYxBNoDko7dgX2rt
 6Ig4RKUK3TryVMKCReVmvN0ZU5D1hirnlMs/6kR311r/5hpM+ZrczvXaalZMwyW7X7VKKMQ1/Qy
 fvGdapob8LxfEUl69ArLAdzgXznwzszKPEYPrqxz432A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID;
 q=dns/txt; s=default; t=1795101682;
 bh=+BMI6JJbtEPc14NSQH7+PKHWzfP93bpxfX8QAil2H3o=;
 b=eIdi7y7PUar5yB8DADe2NF9xU2nESoAsjfMm3gcT9tXP5Twx9XxdLXyQRnNyJ2cz/CbKE5fMN
 JpVcDKoWfZamy0rzP5zLxWWbDdAYKEsZ1tU8WnQzeZMor+4q/UwtWtcUc45JV7dqpBlgNEX+XoS
 BOFXcSronEKlx8oI7YZMqUo=
CFBL-Feedback-ID: 6aff13ef83f3cb488062bad2:efb0545eef45a9e10f36c57d020a1bc7
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13ef83f3cb488062bad2
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
Subject: [PATCH 6/8] ARM: dts: rockchip: Add Luckfox Lyra Ultra board
Date: Thu, 19 Nov 2026 15:20:49 +0000
Message-ID: <20261119152055.556266-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119152055.556266-1-jonas@kwiboo.se>
References: <20261119152055.556266-1-jonas@kwiboo.se>
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
As mentioned in cover letter, unclear if this should use
rockchip,rk3506b instead of rockchip,rk3506.
---
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 ++++++
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 ++++++++++++++++++
 3 files changed, 133 insertions(+), 1 deletion(-)
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
index 000000000000..c422053c1262
--- /dev/null
+++ b/arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
@@ -0,0 +1,100 @@
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
+		/omit-if-no-ref/
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

