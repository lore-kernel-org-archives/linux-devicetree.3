Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5214135B632
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723907; cv=none; b=qMzI2XtsbRuoJgShI8JPSc5ZmxKGBN7fwYJplHQT9pvZBHLBCNsNwKYwVnHHyz4prr1h4imhAX8sKHlkxdE6DJj8603MFxXcB2Ed+DlOnjGSlfn/Yc/j5UgIqZ8EPotFA+UPgpaYdD0e9UaidKWhY/6jBoApBJgH9BBAT0lavCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723907; c=relaxed/simple;
	bh=khwFYCbDm41zThLw4yGVJ4PMQb1Rnc2eS+6YWJp9oUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgWUQ6l4Wq1ILXYK/7Fj/XXJaWWfnHQ3vwlPUtV7B+54egl5qOb2KfzW+dzT/5HrygQdW8ru3iRYC5xkEextOFkjEg6o3nr2fF+NbcA0aoNjVUZNt+g5fmLkbuxAkUmV8dEBRPTeipp+I3Z2QSPWTpxyGSSOa103WZIgkxd0rCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etgFg7M4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etgFg7M4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c76bc3e8de3so333380a12.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775723905; x=1776328705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12mp4IHDHsUCxnWm4E8gVc3KRHRuPdJHhZVSMmkST8Q=;
        b=etgFg7M4MK7XAl077fX4AQZ4CxOhhYsOoalMnbYJCkMzOvTc708cnK72gqm3lYYT2W
         9WKWPa4GO9yB9uL9hoQnXj3a2PCsA0sxULQIFHfgP4n/02VExARSnCUmQpqOJsJdtjMN
         NYFIt5tGWE+Ec656u3+cjiWbUc01DqYVCMfktRvb0YVBeta1W+NDvzMjU20XeVGZDIow
         heSmU5v6111m5nFClxnU5aabaBEfNSbRsN58dEIFfrSq37aRS0kkgiw9j98yf3Tg0ifM
         /LSmfZKRtaifSeusGuDh0i6WTjUj8Y92ZLDHIan3vScYSoCZahAAunLqWCNhaqh5mKxo
         Z+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723905; x=1776328705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12mp4IHDHsUCxnWm4E8gVc3KRHRuPdJHhZVSMmkST8Q=;
        b=FvhMA5s2WNsjbneohH1Ly76ZilW++dk9ztYgmjuZPtZE9AvFpU0ZXUgnWjvDexpfS/
         4v3WiogopKCcUEaWheMB1ZnaB+heuPLhQKLG7hqdYB8TvqEzpUsC7UTyJJ2O621if79Z
         Svo6jxlWSohQXYT3rD1WAITG6tFPVUN4/83V5GTgRfMZ/IURsRJHSvdq+kULV6aspW+n
         C8HuZSxQBdpdRS6NBnTpeTH5LjrI/dYv+fwu5RJLXh01adIhD/pdkS8lmMA6HMO8diGw
         wYqhRKqcDE5dVdfk0UrV0vNIm0XIWMxJEnlNh1nnDzxpImN3cuuPYqZdj3M4XPjMCBma
         gcqg==
X-Forwarded-Encrypted: i=1; AJvYcCXjec+8jcjLbtGtkFqPuWt/h5RQPxMcO+jS5jOdK9tCcTD1ZKSi3ak5xE+d6WTBbTZr8lf8N44fVu3n@vger.kernel.org
X-Gm-Message-State: AOJu0YwheObsWYImwKbEJL8jrnMZSrB8h56zNQkGCotETChpIWUvZPE9
	ZKj8y7csG4jVvouEQ+J78ZiBz0Ufk2sPq6vJo/6u9dxiLZ4inuLYYVz21COD5J/C
X-Gm-Gg: AeBDievr6FuwYhVVJXcmO5cYq2Lysf5ZKY4jaLSxmuCluuxXJcLMUStQ64Z7YJ+0jJI
	skJnRCgrJnRh4/4veEdBk7uolsWHwxrNuZ8S14coQ4shSVeG7q/Z5vTXiaY7nwVarr6W5MzxBJk
	btAM33me8A+9zYU4Ca58cXPq30yVxWCKx7+nRSJNwsAommBtX4pkW5QKBJ9jEEW0VZzhM+A86av
	2N5vw21SXRQe+F6VUSDbzLMGkBY3ygxxSAELGQPzFiLglVutwyv1dfxW7nQhjjgCcO9nGLJVjsy
	upQONiU42WpN3ECIIPPATmYxV/iL3FUmCeBGHzK8eOzGhg2Xyk1prD+Ie2GLkk7dd9geJmVFe9+
	xKZMpmSEGQ1tF7BFiwmMHUx6lr+1qJjvkZ1Vlh980bA4EX5MOMJ11f67K0HF9eXq3W7rHaZ2nSB
	P+SWSIHgouS5dsYmKDZ4k6mynReNWOj77RGg8dIABl2yDiJXkG8XyXO/vphZSYeDGqzcI0
X-Received: by 2002:a17:902:f611:b0:2b0:5cb4:d894 with SMTP id d9443c01a7336-2b28173fe0amr278347925ad.13.1775723904538;
        Thu, 09 Apr 2026 01:38:24 -0700 (PDT)
Received: from tomriddle.lan ([2406:2d40:64ea:4810:73c1:d012:263a:f41f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm224497585ad.52.2026.04.09.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:38:24 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 webcam
Date: Thu,  9 Apr 2026 20:36:09 +1200
Message-ID: <20260409083609.75341-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up the front-facing OV02C10 camera on Microsoft Romulus by enabling
CAMSS, CCI1 and CSIPHY4, adding the sensor node and its endpoint, and
describing the PM8010 regulator rails and pinctrl states required by the
camera module.

With these DT nodes in place the webcam can be probed and used through
the upstream OV02C10 driver.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 14b5663a4d48..9e910813fa48 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -857,6 +857,57 @@ vreg_l3j: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j>;
+		vdd-l3-l4-supply = <&vreg_s4c>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {
@@ -867,6 +918,66 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
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
+		avdd-supply = <&vreg_l5m_2p8>;
+		dvdd-supply = <&vreg_l1m_1p2>;
+		dovdd-supply = <&vreg_l3m_1p8>;
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
+	vdda-0p8-supply = <&vreg_l2c>;
+	vdda-1p2-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 
@@ -1441,6 +1552,22 @@ wcn_sw_en: wcn-sw-en-state {
 		bias-disable;
 	};
 
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
 	cam_indicator_en: cam-indicator-en-state {
 		pins = "gpio225";
 		function = "gpio";
-- 
2.51.0
