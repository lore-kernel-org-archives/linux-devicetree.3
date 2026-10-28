Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181161;
	b=cuwtuJuTK+4dT+YPXGZ29PMrQd1W3UCml+hFW87LWd9WNlXxhAlMURBSigQ5YEWkX5ZG
	 YOBXxRsRa4Oq50mxJGPk2LXH6ZsvjzEfY7PF+aHwTzz6HOYQc15XYN3uuxi0+dRYXcjDx
	 uH+4msjQpI8tBWztRPM2f8+kJX0gsw7l21vamYJQ+G6FYKdp8Hdr8z4uBWskITFLc3z4B
	 R12ps9uLvJigYmHwgD7gebIAfZPwhHfW36neCnz/UnyMQcj+beSu2lBlRNKkT2G7cxXGa
	 PygHERhWpiZuL02LbMbEC9Bb+zmAX5HBObHCvTiyUdfY6QJnDz9Kku3erSweYlJFalg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181161;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HjrIAyJJFe+6a0dza+cAUoe0VKgjH+kUdZDN0GgbES8=;
	b=OxkD2TL13hyomQywa3uZFeQCHNUrHyPG7ycKPREUwMYpfrtMCxdhFE2axL1yaiyTLuI/
	 OJ3TWcRE8E3AeVzLN3IUHhMQQEFVYVRFdlZ1CSMZn8bzgwYAkg5Ok++dbGBpOlLshJfOQ
	 vBZ/CdahMtvydHO9S2VBBfRfhyThpPyOJfAOtaAlktDmahq7blnglNYna2jIHEErZqXYx
	 ojYyuqDNE4i+NOhgG2QWESVVCWYZ9XKcL5w7Ie+pmWGzlCRX60e71QYV6ITXI3TWuP7ww
	 BQaAjq7mneVsSNCgTOv/+4QqLzWnNgloX1L9PlwNphu74Rzh+vAiK73D8wxvdyHyO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0gZ2rkh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F26606A320;
	Wed, 28 Oct 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0gZ2rkh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8562F1F01825;
	Wed, 28 Oct 2026 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181161;
	bh=HjrIAyJJFe+6a0dza+cAUoe0VKgjH+kUdZDN0GgbES8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C0gZ2rkhtTRpPCHOsNuQz5RR/ra/DUYkw1wrPBdhtWrNz9gZPMPOewd0tBOo49TL6
	 +ZZfaCIYI13zvh0OnjpoOCNoEKErT3YjKgPfUNAEmh5Z7IPpC1uX4vOGKvhRMxUeVj
	 Ra6+Fgiz2dcFBBl0NNT8fDmPA1ADmBHRqzN0+hMhqmJX8EPUu0VTo5aJ8hrt7xvpJy
	 ZV2tNX9RUDZG6WHMEFYcOFOi/nOZgc9m36s9gNOryYjROixGCfA0KxT9wIEC1S+jiG
	 WGK+L3vZfn37D3PmnvtvGrSXRvy7LzwMisxqzjcRNbqEPJlI1rcEUGyFVyaWYWVSyz
	 L71CFMZxKL4Cg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 8/8] arm64: dts: qcom: qcm6490-idp: Describe the panel bias enable GPIO
Date: Wed, 28 Oct 2026 11:51:51 +0200
Message-ID: <20261028095151.1682096-9-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028095151.1682096-1-vz@kernel.org>
References: <20261028095151.1682096-1-vz@kernel.org>
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

The positive and negative bias supplies of the NT36672E panel on the
QCM6490 IDP board are switched on by the PM7250B GPIO2 bias enable
signal, which is described as a single fixed regulator supplying both
AVDD and AVEE bias supplies of the panel. The fixed regulator does not
describe the hardware, it can not supply a positive and a negative
voltage at the same time, and apparently bias supplies are generated
right on the display panel module.

Since the panel binding supports the bias enable GPIO, describe the
signal as such, and remove the oddly described and used fixed regulator.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index af7821e02fdb..98bbe662bd3b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -51,17 +51,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	lcd_disp_bias: regulator-lcd-disp-bias {
-		compatible = "regulator-fixed";
-		regulator-name = "lcd_disp_bias";
-		regulator-min-microvolt = <5500000>;
-		regulator-max-microvolt = <5500000>;
-		gpio = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		pinctrl-0 = <&lcd_disp_bias_en>;
-		pinctrl-names = "default";
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -653,14 +642,16 @@ panel@0 {
 		compatible = "novatek,nt36672e";
 		reg = <0>;
 
+		enable-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
 
 		vddi-supply = <&vreg_l8c_1p62>;
-		avdd-supply = <&lcd_disp_bias>;
-		avee-supply = <&lcd_disp_bias>;
 
 		backlight = <&pm8350c_pwm_backlight>;
 
+		pinctrl-0 = <&lcd_disp_bias_en>;
+		pinctrl-names = "default";
+
 		port {
 			panel0_in: endpoint {
 				remote-endpoint = <&mdss_dsi0_out>;
-- 
2.51.0

