Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859153DA7D9
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520842; cv=none; b=ci+gwAXD0x/V50pOAeB2oOzVpfbNO+1HbEKSQ0QvyAryT0N/9kBXg/Jpcd4KmBBX6UXB8KIoeMvKRkZiF2Cd2gZB8ImWZOo/5k08a2XxdrmQmv498+NiF1oGeKIH3nZEseDuznJdTMlvOEeMh+NzaaQGELJizdjUeLsgfP38GWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520842; c=relaxed/simple;
	bh=1cdZ5ckho7K/P2hgujNxjQln6hrw8pKd1IgFOQYkyio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfyu7z7nlBbp/gRiaXBsPtIcppmUabc352jrRCWfiYMyFw7sNbAz8puxEktEP066t9us5KBcVhq/FK4M4L372sqng9nenhuSvficxSUp0lFEIvle6mCXxuPZnUrfYvBydR5qhaSs6iiWMQnX7r35Qqs1MEQ8Wk7BGhPL1b5LYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fO479Dln; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fO479Dln"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso762758f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520839; x=1775125639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOHEOXpE/JbN5rqywKSUMyGsAxjLPdyOxtsFRAvj1uM=;
        b=fO479Dln+/vcerrNITN1yQZSIzKK75fjboQvMnVt6CfqnhUN3kb7XD8rwvW0cfalkS
         IwQrfUCaIiE+VnoKyuPW6rENO1OrIffPg8RuTC2ru8LRPVdt2o6klRVKVrGnOiiVTqlK
         /v9f7Ulnjms4OZWK+727YTUdiPliS6SfonPhOIuKTyYzloIx/K7N1b6RgYxOawmW/w5n
         SEbv4ToxRt35CACPE/M9ZXUIH1DTqd0YrqHDO4g9XMH5qgj0RGYDAUEWEVk7T4PCCd0J
         Q5iMu4TsSh6DwlivCb/v2m+JIJynOUbqy2nPWCIpXFVIFBabY0IoXK1ur5gmulTrWw+7
         kruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520839; x=1775125639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOHEOXpE/JbN5rqywKSUMyGsAxjLPdyOxtsFRAvj1uM=;
        b=UJp4sJfqhHQW09F+gJLlH15AHDAeIOk5zZl0BJNSzOgYZZ3rBvOgeP2OX3SDgw+prw
         AGJowXJ7FFI9rzYUAqC5qz9FbFlskkms6Bkj1GCxXFNW6JXpX9DI1/A14M4NTf/wuCz5
         pg58p07z6D6cOX/UdC2+9afOyeyJzL11dpVJnyFJKOFAVYrBefe30rV2EvMwDaY4pZAF
         2I0Aw8nuVm3U9ljrD2D4RxC/QGUbiLUj8TUCvRHYmS3FSA/idNqXztXA5Gjxs0vyj2aG
         84Q7+ehQ72vA1I82TMqyqPIZFmDn3qwyUVOnQV2kOlGSUbgWBlBdt0N09/B58egfpbmx
         3eww==
X-Forwarded-Encrypted: i=1; AJvYcCWP/VObtQRKVyupr4fpIo3aOO7EoBTwlNrNVFvKpNJ9prEQHZEKhcga8HeJPudIFzOOHNGZ7/0dStZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFyRHIbdKVjAICsSjXhuzR/m6ikl9mtUzw9ON54cBCId5l297
	6Gfil2LVwNIv8cPj0RucmZnTzXPMHEKovE48zNEj9eL6DKHwnZJJLrKkHcEJA7rJLfQ=
X-Gm-Gg: ATEYQzwGzLt9HJThrivJFZGtjGSb8IF8s/NYNe0l2on0XhiOo1utdQpeVFprhPz3pHd
	CfXCaLtAUprcTjCn97pFoI17ZZUHatRapLDAUT0TH9PAZaeI/8G1MArY7UA52bqW5RIo6nEMd5Z
	pBytHKABOmgeCyjOhWRr+sRhw9NNyMOGsty/kHHJo54rJ/emTS3o/Hc5FkKWpY+XwOV1sajyZuE
	7IdSzhue06oBGVnyxQ+HY4+Pq4Skejm2GXJcwV9nzg9W772db5PIYtd8F5veVlInLCVlbLNQlUG
	XZN77C1zaOa2eyykOATFJg986gktTadQbTjTZuRBOlhJPlsukVe/ALhPi76slkUmZ63MdrEknr1
	N59XS9GSEdSLOZByWj/wW+qsLpQbCEdmzHFyyWjhEIXslKnxpKyVJLCyj46Chtfdv2WM3JqV+ip
	O6Wv7kCug89VlaKbRLgyR666SPjzcod5F34g==
X-Received: by 2002:a05:6000:220b:b0:43b:6a55:e26a with SMTP id ffacd0b85a97d-43b88a367c8mr10721798f8f.51.1774520838767;
        Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:44 +0000
Subject: [PATCH v3 07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=1cdZ5ckho7K/P2hgujNxjQln6hrw8pKd1IgFOQYkyio=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocnga/cd23U4ct1Fknu7cyX1L1BOo7Nntdc
 CfuC9XOQPSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Ou45D/9uZAax/XEye7Ix/vX6jOnDCMFJAwiScCFV+81gBQZXZFYQ/JnpiuL7PkQJBJsRhwrCEqq
 TqWsS8IQktcD6d9x+491mPmrFW4JoVyw98h8rAWU+yGc81hjixYofLKaOOpKuiDjL3r6O8BS3mN
 CLjqIi/ijdFTNymNiAG4pCC6ed9dqH3CuEKU/XkmvPnQvZ9HYvQqOQ+Ggaheb2NEb3xMXZ31MWu
 Tvfrgg8jQFxr5akAeOqqrHYuKpoAWXFKOMDmIo+/XxD28a6sujZjDvqbnC3XKANi/N/tJFuj1L2
 Fd7YSwCZh4JKHjo2l3WYGbGifu0tYEco41hRYsnxPFsAXF3wnK8qweSPIfihn04NLBquRT/RJpg
 bdxthHLqeSiWryrWGKvm8O1igzc3Q8JyJ/xOZz7vATJ4LkKW1ioUofenGaK08je2YsHwZd7io+h
 TVnSdabREZoSt1hemQnZGN8xu4HR8eQWwArDbMs9tSX1BiCe1pc1esyOvVJogguwDD+s8KjiPpL
 C/BX3qlDwkgAdtUssO97pSG92G2Y+lD8xyRfvF1hRE4e+jnwBSQLFKMl4+srK1qsPRDUVzC+6PL
 CVKW26cwCxlI8r2u0Uz2Dn+MEjzQW6weFedbH0oINxQXFkNffrla/y3B1+5JVrbg+XvLFbSDf4T
 TTvtnOSceryXtVQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ee49785c9d005..799c29483e893 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
 
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1508,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.52.0

