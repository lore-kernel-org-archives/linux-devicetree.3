Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4333655E6;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787474151; cv=none; b=lZYLkhSGHL559id2Z4c4UOVO4BtDU1aZz9p5w/VT64gwRusHOCXtLVXzYHvXZjIMKqAbfeRlOErzOigz8o9cz7zLtWNJyrEg1XTmybJ//KHzTo2Z7W1/OW8XmNEqGlUItAgOtB2+CGLxFn4O07J9Oh6q7jqUTjIQnw3QPXzze74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787474151; c=relaxed/simple;
	bh=FSFoCK6IHrRjmW5HyaObQ6LDcPClFVEMEOre0yaXIkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXPiDBoUVoZqcazHCCMqRRjTcwEwvLDG0C4nqXQFEfwgMSZ77mwDfULaORUJHo/fKPORKwk3AaEHNWO6JK6unOeCYgwJx5o/P9Mw0XKyPE3uuXhUL2xU8uQ31cSChCrzCriY3w47N88iuAYL8XzL9H2epG0qTq4J50ZNHdNbJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS7YrKqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS7YrKqC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19705C2BCC7;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787474151;
	bh=FSFoCK6IHrRjmW5HyaObQ6LDcPClFVEMEOre0yaXIkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cS7YrKqCIzovtMAzJrMmuk9xO6kJdNBaSaZNr2leWTWFxaT4vJidCAGDhJiCuHxpQ
	 O621ZIlDJ5kKjhxvEK/GtizokalTpAlgv/jNqn4jKRS7ZdBpiKC0HRUpmpsfV8GvE7
	 c5/LlK3XweobHYwqYxCoQKlOJ0roAqaimtRGmmJig1nRtuyJWlpmMQJ+HLbXi+ZXnX
	 q8m6aYmgTaje7iSdjMKaSw/Rc7loV9pyx5dgctmYCR9gHbQrfLD9TbR7iYfmSBmtRw
	 3mMM8A+/R2H0IEEhJrzbrHew/16LITfFGdtBC5VjyAUy4oOlusohcA8LgtnyBfijrx
	 qqFuLprEr5qbw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E773FC5DF81;
	Sun, 23 Aug 2026 08:35:50 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 23 Aug 2026 10:35:28 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: enable
 DisplayPort audio
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
In-Reply-To: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787474149; l=5573;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=32rGsJ0/lgmsGUI4MsIonhCViNoJkotGVHvYJscYBpo=;
 b=IhYtoCQwM8xR2VJWBBhq9Q3iLMStKQEBR2KoBO39aWk5E+uI2y9BauTVy+sj7fRtv9GFQAcTc
 8V19dos4uDbByTPztWu+bgII5FoNzl0AjOkFh+HVpUuDSULjt7Z1HHc
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Windows Dev Kit 2023 has no built-in speakers, microphones or
headphone jack. Likewise the device with the same mainboard, Surface
Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
was therefore non-functional.

Replace the unused codec nodes, SoundWire controllers, LPASS macros
and related pinctrl with DisplayPort DAI links (DP0/DP1/DP2) so that
audio is available over the DP connectors. Add the required
sound-name-prefix properties and update the card model name to the
conventional SC8280XP-MICROSOFT-BLACKROCK form.

[1]: https://support.microsoft.com/en-us/surface/models/surface-pro-9-features-and-specs

Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023")
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 134 +++------------------
 1 file changed, 20 insertions(+), 114 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 4f4b5f4285ec2..a94141d670f62 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -28,32 +28,6 @@ aliases {
 		serial1 = &uart2;
 	};
 
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9380-codec";
-
-		pinctrl-0 = <&wcd_default>;
-		pinctrl-names = "default";
-
-		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
-
-		vdd-buck-supply = <&vreg_s10b>;
-		vdd-rxtx-supply = <&vreg_s10b>;
-		vdd-io-supply = <&vreg_s10b>;
-		vdd-mic-bias-supply = <&vreg_bob>;
-
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-
-		#sound-dai-cells = <1>;
-	};
-
 	dp3_connector: connector {
 		compatible = "dp-connector";
 		label = "DP-3";
@@ -585,6 +559,7 @@ &mdss0 {
 };
 
 &mdss0_dp0 {
+	sound-name-prefix = "DisplayPort0";
 	status = "okay";
 };
 
@@ -594,6 +569,7 @@ &mdss0_dp0_out {
 };
 
 &mdss0_dp1 {
+	sound-name-prefix = "DisplayPort1";
 	status = "okay";
 };
 
@@ -603,6 +579,7 @@ &mdss0_dp1_out {
 };
 
 &mdss0_dp2 {
+	sound-name-prefix = "DisplayPort2";
 	compatible = "qcom,sc8280xp-dp";
 
 	data-lanes = <0 1 2 3>;
@@ -858,17 +835,17 @@ &rxmacro {
 
 &sound {
 	compatible = "qcom,sc8280xp-sndcard";
-	model = "microsoft/blackrock";
+	model = "SC8280XP-MICROSOFT-BLACKROCK";
 
-	wcd-playback-dai-link {
-		link-name = "WCD Playback";
+	dp0-dai-link {
+		link-name = "DP0 Playback";
 
-		cpu {
-			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+		codec {
+			sound-dai = <&mdss0_dp0>;
 		};
 
-		codec {
-			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
 		};
 
 		platform {
@@ -876,15 +853,15 @@ platform {
 		};
 	};
 
-	wcd-capture-dai-link {
-		link-name = "WCD Capture";
+	dp1-dai-link {
+		link-name = "DP1 Playback";
 
-		cpu {
-			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+		codec {
+			sound-dai = <&mdss0_dp1>;
 		};
 
-		codec {
-			sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
 		};
 
 		platform {
@@ -892,67 +869,23 @@ platform {
 		};
 	};
 
-	wsa-dai-link {
-		link-name = "WSA Playback";
-
-		cpu {
-			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-		};
+	dp2-dai-link {
+		link-name = "DP2 Playback";
 
 		codec {
-			sound-dai = <&swr0 0>, <&wsamacro 0>;
-		};
-
-		platform {
-			sound-dai = <&q6apm>;
+			sound-dai = <&mdss0_dp2>;
 		};
-	};
-
-	va-dai-link {
-		link-name = "VA Capture";
 
 		cpu {
-			sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
 		};
 
 		platform {
 			sound-dai = <&q6apm>;
 		};
-
-		codec {
-			sound-dai = <&vamacro 0>;
-		};
-	};
-};
-
-&swr0 {
-	status = "okay";
-};
-
-&swr1 {
-	status = "okay";
-
-	wcd_rx: wcd9380-rx@0,4 {
-		compatible = "sdw20217010d00";
-		reg = <0 4>;
-		qcom,rx-port-mapping = <1 2 3 4 5>;
-	};
-};
-
-&swr2 {
-	status = "okay";
-
-	wcd_tx: wcd9380-tx@0,3 {
-		compatible = "sdw20217010d00";
-		reg = <0 3>;
-		qcom,tx-port-mapping = <1 1 2 3>;
 	};
 };
 
-&txmacro {
-	status = "okay";
-};
-
 &uart2 {
 	pinctrl-0 = <&uart2_default>;
 	pinctrl-names = "default";
@@ -1076,31 +1009,12 @@ &usb_2_qmpphy0 {
 	status = "okay";
 };
 
-&vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&vreg_s10b>;
-
-	qcom,dmic-sample-rate = <4800000>;
-
-	status = "okay";
-};
-
-&wsamacro {
-	status = "okay";
-};
-
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
 
 /* PINCTRL */
 
-&lpass_tlmm {
-	status = "okay";
-};
-
 &pmc8280_1_gpios {
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio1";
@@ -1302,14 +1216,6 @@ usb2_en_state: usb2-en-state {
 		output-low;
 	};
 
-	wcd_default: wcd-default-state {
-		reset-pins {
-			pins = "gpio106";
-			function = "gpio";
-			bias-disable;
-		};
-	};
-
 	wlan_en: wlan-en-state {
 		pins = "gpio134";
 		function = "gpio";

-- 
2.53.0


