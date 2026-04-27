Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5427E056;
	Mon, 27 Apr 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327066; cv=none; b=TzpMS9D4cFZ/z2crmN2GhH5kW3GwenFapgK/foYSpxKR3PImp9ZBNe3f6/bbs9ph0oHE9gns2X8Hkp3Cba8BLlFXLtmwak4Zqf7IhzXECPdrMKRa68y7Du7RM0c9+IF/6711K9+bJ0r0WNqC84P6EbK+wurzKhKejJB4Kpj6A/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327066; c=relaxed/simple;
	bh=jsP9HGoABouAJrSx9y3RVxvt/zIaKtzWEMQhaHCYUfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoVFbZozDJkafojF/VXMxXQtSzSg2n1h/p5/7mxaWsCDKQ6OIf8wN97FMWe7ftxsMrxxJNxP74OtOh4X6s02aytYfOHoPYhG5T2zidez0pZsT1YPm/8Xh8gfz8rBkZY7qtDfiotL+D92+rVy2gHVaO4CfjZwI6Pr7Pw8k6zRyc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DWXVOukJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DWXVOukJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327063;
	bh=jsP9HGoABouAJrSx9y3RVxvt/zIaKtzWEMQhaHCYUfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DWXVOukJZ3oEF3p1EXUMYrGtmD0EHvky0RHc5sAHnirTD6R2h23xVYTzrMUFlPoRY
	 VMoQ2qRoRINB65TY9KdLohW6LxECLnFQtI6xtt12P8jxDBk3H1feIOe/0DQkKpDhjE
	 ms68ITMQIx3wJYkcEustd/0iDPKdpPjcLu2oga4KQp7mlUGWhHPJqc4axtTOHhJD7b
	 AURzSdPb5b+oh163hfs2KMBeWQSZ9Wc+55/uhKgFR8idAURl+RbYcl9OLoKdKLvpBY
	 911T9rcSoTLYRn4JLhWpoAaqDuJ4haWlDu6Pn6T54KtI+y6oxlkIulw+1PkULPO5+x
	 wQpxDgpZt/ACw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A37C17E0ED6;
	Mon, 27 Apr 2026 23:57:43 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:19 +0300
Subject: [PATCH v2 01/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-1-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The following RK3576 boards expose a GPIO pin to control the voltage
bias on the HDMI data lines:

- rk3576-100ask-dshanpi-a1
- rk3576-armsom-sige5
- rk3576-evb1-v10
- rk3576-evb2-v10
- rk3576-nanopi-m5
- rk3576-roc-pc
- rk3576-rock-4d

The pin must be asserted when operating in HDMI 2.1 FRL mode and
deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts      | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts          | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts          | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts         | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts            | 9 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts           | 9 +++++++++
 7 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index b19f9b6be6bf..a9e3beb3ee5e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -278,6 +278,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -738,6 +741,12 @@ hp_det: hp-det {
 		};
 	};
 
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie {
 		pcie_reset: pcie-reset {
 			rockchip,pins = <1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 1c100ffd1518..c3e8966c09c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -304,6 +304,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -819,6 +822,12 @@ hp_det_l: hp-det-l {
 		};
 	};
 
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index fb0dd1bc5148..4c82980a9f63 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -370,6 +370,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -895,6 +898,12 @@ host_wake_bt: host-wake-bt {
 		};
 	};
 
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
index 98d5d00d63b5..dfc756d5ec5e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts
@@ -375,6 +375,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -832,6 +835,12 @@ image_pwren: image-pwren {
 		};
 	};
 
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 7406a4adf810..227fe6f3ec7c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -327,6 +327,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -813,6 +816,12 @@ gmac1_rst: gmac1-rst {
 		};
 	};
 
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index d0ab1d1e0e11..54de3a50571f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -283,6 +283,9 @@ &eth0m0_rgmii_bus
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -720,6 +723,12 @@ &sdmmc {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int_l: rtc-int-l {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 899a84b1fbf9..cc054c837317 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -289,6 +289,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -720,6 +723,12 @@ &pcie0 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi_tx_on_h: hdmi-tx-on-h {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

