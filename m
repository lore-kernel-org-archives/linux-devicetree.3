Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700787;
	b=E+0ixNYG3tLt8lxpN8W1Wc15jpA2yUmeSKBNp1bQOmc5pN0Adgpz37TiFTP9SXB2P/+T
	 DLDUXUfSM5GtovB5AoEynmim2DwtZhe/tFRknWRerWCVtGQU80dKjZZA6d3h2FBVBvq7v
	 dxKwaRkhbEBXWGGtfxOSlaMXpK7VFOsprsyzfzo8aa2P0JGEtjpFgSsbZhzvlw78JjoA+
	 2M5mY/f2X8YRkOG7bUEcMgh79Nhcf3DkyOz9gjMl+zDdo+SqrcFJTUP/p2t8o9Iem2kM6
	 bIzIVf3UFoAFoFu8Ah0GqrHY7W2df/btSsdR2VOXRlmG55+0RR5fO9JagsTbJoUmqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700787;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hyA/riIo5Dv1kgHEaVEVBBe3mVUlw+lvFWP4IpryqBc=;
	b=ZbdZdrC4GjQZ+rydxBtTNzEoS2iOFHs4eBEXIN61W3rLrzEq7LmwTeGw1cPIaSTo6AyN
	 w2qLtDdS4vGYH1bEoY9V7sbmdus01HM17zFKQPiCm6hEGuNxetmUVwVzZJ01F0uYEtx49
	 yjfmT27zlyRk8cn42KxQdiw/QtCsgqMZhGXgAoX/SVo4mT5E+/OQ8pPA9Rbi4OjL9VFLu
	 ScKfODF0ixup8bHb9WGdc/dC/9EV7HDmqC1DqqnnzK+GHS9CONb4HZmtw36I7xMthhhXZ
	 VR1uUIDFVrvjtNdI/M24HRNKtxvdWoOpXpjU8SfP2Kwl0UnpnIA5mVucvN83sfJGoJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SclfHFcH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423A606A31C;
	Thu, 26 Nov 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SclfHFcH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B741F000C0;
	Thu, 26 Nov 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700786;
	bh=hyA/riIo5Dv1kgHEaVEVBBe3mVUlw+lvFWP4IpryqBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SclfHFcHry8wg60OLVtC5midh1mJqR5vBxg/2+Q9fOZZ8cDMELJUJWTp8YO5z2xhr
	 XaXAUf8oxJSLA0/Iape1uacd1uQVecwPAPwgGIfDVkVHEToPkG8IeiZw306BPmDw4t
	 XVRtJMpHwWl73nxhAgjRb4X4Gnb5YPsOEmNr4qDsV4tHSa2gIsnXkEsVzhTXmMMzCT
	 R91N1SqR/Zi/MemimbREwOMPDOzjT/fFCi+fqGqNqFGZHWDvezpd8IOnuN287Plx/X
	 FPRuYuvDTyU/nUQhELG3LsUWz1djxeZBy6SOIKkcvLepdWbxofilRDS76HVf/mVelL
	 rq2P2tf+D59sA==
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
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 10/10] arm64: dts: qcom: qcm6490-idp: Describe the panel bias enable GPIO
Date: Thu, 26 Nov 2026 15:45:08 +0200
Message-ID: <20261126134508.320700-11-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index ca5c868be495..644fa8f68342 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -50,17 +50,6 @@ chosen {
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
 
@@ -652,14 +641,16 @@ panel@0 {
 		compatible = "novatek,nt36672e";
 		reg = <0>;
 
+		enable-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
 
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

