Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49943F08D;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587100; cv=none; b=XJIuWawAxEZk0GIZ3kqFHBmqXVIE8RuzUtL/09vO5xg80YUssCTagsjuFrTrB/cHwCbfIiDgUjauxrqedyEV5Rwj7jR4SLarQdtPihotBsRCYWDc5t44PhtiCTZElU/O13cODGSEzlEpg7bSarP7FkolnG10aSCjscgOPUD7s6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587100; c=relaxed/simple;
	bh=m+fAoTrznB0MdI3WUA5lHdRRd1kdAp3djMI11/p04iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HuIdHaY4alDcH4Xlx+V2N4oqSUKWf72GjikvXPvgHoqJWhMCW9qN1+tmnLikWLJl4/r/zUexQTM0+Jqmf2uT9b+snHdrXLVQ9PkEhNtju0YIlDOVxb7MPmTMo4Q1YW/mysB+p+0hrspr5RpVQpkOWYXZ10SQpPdxOyPI590CcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7c1WwbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7c1WwbT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E19EC4AF0D;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787587100;
	bh=m+fAoTrznB0MdI3WUA5lHdRRd1kdAp3djMI11/p04iY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R7c1WwbTeeOG0qOqwTuaYXPoqw23G89qnA+hBHle1W6XCpjK9tv6Esu+OKFb25bYL
	 3WTH/Xl41NxiDtC8tblajVJLnwYlb5PKgDuifUnQFwQeVVWU54+p8pJInMbqOgnj8f
	 ciy7OzUgCT6Z1AkGfnG1vIaCOA3cFEHsV/9BR2OsH2w151dyXIet8fpGl+pYRcmZ0r
	 poq2IZHzoIFfVG0aph0xPs96HiwgWEgsn0lcQ2B2dfIJo1O4+SAM8+gS+vKNVboo2R
	 EnTlRHO13H2uOl7rVQa6u5p9u2krIQrtVkXVIPzS6sKpWdAWg9f0A/6dKPBVI03sZb
	 mnFnMvmH1cxeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542B4C61DB6;
	Mon, 24 Aug 2026 15:58:20 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Mon, 24 Aug 2026 22:58:22 +0700
Subject: [PATCH v6 4/4] arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add the
 lower DSI panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-pocketds-v6-4-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
In-Reply-To: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787587098; l=4952;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=awleFrCmpPFN90BPSQOiVC+g+5SKQU6evS103lfDdww=;
 b=EzxjVbypyuklUc/NKIYnzEHclEtqVACsFpTGizN9DW6MKINpX5L8YQIuKIL0Lzsof4/BZpckT
 O6DEllO5b6QBE5w9TeaTyAFFMrimkc2/YsFfgQRzTxwyUzY5Oi74d8r
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

The Pocket DS drives two panels. The lower one is a 768x1024 IPS LCD on
a Sitronix ST7703 DDIC hanging off mdss_dsi1, and all of the pieces it
needs have now landed: the ayaneo,pocket-ds-lower-panel compatible in
the ST7703 binding, the SGMicro SGM3804 dual-rail charge pump driver and
the Silergy SY7758 backlight driver.

The SGM3804 on i2c0 supplies the panel bias. Its two rails are enabled
by separate GPIOs and both are programmed to 5.2 V; that figure is the
vendor register configuration (0x00 = 0x0c, 0x01 = 0x0c), which lands on
5.2 V in the driver's 4.0 V + 100 mV linear range. tlmm 152 enables the
positive rail and tlmm 153 the negative one. Only the positive rail has
a consumer, because the ST7703 binding models a single vcc-supply, so
the negative rail is marked regulator-always-on to keep AVEE up while
the panel is on; a better modelling of the pair is welcome.

The SY7758 backlight sits on the same bus. Its enable line was
determined on the device: driving tlmm 42 low makes the chip stop
acknowledging on i2c while the TCA6408 on the same segment keeps
responding, so tlmm 42 gates the SY7758 alone rather than the bus.

The TCA6408 expander supplies the rest: line 0 gates the panel IOVCC
rail, modelled as a fixed regulator, and line 2 is the panel reset.

sde_dsi1_active keeps its output-high because tlmm 137 has no GPIO
consumer anywhere in the tree; pinctrl is the only thing asserting it.

The upper panel is not added here. Its Chipone ICNA3512 binding makes
disp-supply and blvdd-supply mandatory, and this board has no separately
controllable rail for either; the vendor device tree drives the upper
panel purely through a platform enable GPIO and points the panel node at
the simulator supply list. It will follow once that wiring is confirmed.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
 .../boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts     | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
index 09b1c86cc3d3..72c81667c085 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocket-ds.dts
@@ -314,6 +314,17 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 		pinctrl-names = "default";
 	};
 
+	vreg_panel1_iovcc: panel1-iovcc-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "panel1_iovcc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpios = <&tca6408 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vdd_fan_5v0: vdd-fan-5v0-regulator {
 		compatible = "regulator-fixed";
 
@@ -829,6 +840,38 @@ tca6408: gpio@20 {
 
 		vcc-supply = <&tca6424_vcc>;
 	};
+
+	backlight: backlight@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+	};
+
+	sgm3804: regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel1_avdd";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+
+			enable-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel1_avee";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+
+			enable-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
+
+			regulator-always-on;
+		};
+	};
 };
 
 &i2c2 {
@@ -960,6 +1003,45 @@ &mdss_dp0_out {
 	data-lanes = <0 1 2 3>;
 };
 
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "ayaneo,pocket-ds-lower-panel";
+		reg = <0>;
+
+		vcc-supply = <&sgm3804_pos>;
+		iovcc-supply = <&vreg_panel1_iovcc>;
+
+		reset-gpios = <&tca6408 2 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+		rotation = <270>;
+
+		pinctrl-0 = <&sde_dsi1_active>;
+		pinctrl-1 = <&sde_dsi1_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel1_in: endpoint {
+				remote-endpoint = <&mdss_dsi1_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel1_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1558,6 +1640,21 @@ ts2_irq: ts2-irq-state {
 		bias-disable;
 	};
 
+	sde_dsi1_active: sde-dsi1-active-state {
+		pins = "gpio137";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	sde_dsi1_suspend: sde-dsi1-suspend-state {
+		pins = "gpio137";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	ts2_reset: ts2-reset-state {
 		pins = "gpio38";
 		function = "gpio";

-- 
2.55.0


