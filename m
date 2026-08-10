Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6953803D7
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343215; cv=none; b=Peunu3nuejBuWISGrVHBBP8aAn8rpwNy0Xkm/QybYwYdBLsnn9WE52qNfDhZJgsevZk9Rh2HzUTGYPPn5NgJ7JsBpA0a12fKTlRyJqGELcQS854XfuoQy1LF91EPnu4uOTUz5E3rneA3xmojNjoSUvLWlHOYqetODvqPbCdOjWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343215; c=relaxed/simple;
	bh=kRrtrrpvePVbIOrdQv/XCZUG1O7W4sPdKWhYuBPfgDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVtfk7xuOVi7AIHFzowebPyrGfCf/4B0KDXYSp+CulF2T/qsIOH+2dIygIpETOWsWldAkGYIHHPRUbmysnf3FgOZD43YPOdDRO3i6XRbV3JAJvzuQ6HvTxg64ovku+UAsJugHoEigImp+mlHwzlQRh2S8hieCf0DTl2x0fmPA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwtJ8JoL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwtJ8JoL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1464903a91.3
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343213; x=1786948013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XW7zVNksQuGLw3m1ipcozoM64brr/gJX+tqNumdacU=;
        b=HwtJ8JoLyynZH7K3lmtYpM68O9lFG0bgZnsC9sFdMlYMSLE0BBofyB96MJsT+bVKal
         Zy3KAMJdkKWEPiaDsK0peKUh5c8vpteB3IxKBLf/Bvt8L0uSHYeehtY/IJthMOv1+eWk
         zNudrnzc20JZPJ9qUW7HE8snTNtQGlSF3fH8oxtfLnics9Ksh5wZYp5RXQI/tSYtL95H
         V3WtUDo46KCDOXhVbkKAYomc2J2x8egUYTygqp6Y3B2XxCFhfbHhxNoa4wEr+u/LD/x8
         6SIo8Kq2Br92uTekGcrYP2t8TrDv2ySHNsDls0CHWltfRw8mtIiLYMIpnMQyyyPTaRBb
         ALHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343213; x=1786948013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XW7zVNksQuGLw3m1ipcozoM64brr/gJX+tqNumdacU=;
        b=YPX29mXfzU7ViBcrA2ftFLFPmUZHV5HpKWnnC5RVU+JbnCx3gV04H00+bLyx4p+ioB
         CY8VrbEYf5qeTHpVWl+wL8hHm4rC5pVQQjZ0g4oRpONY0QwiwSyzE+7WdpQQeJKbW8q9
         GRau/fxRav6FUB+zchdLaUMGcqJYiL8hHuqocxCAwtNTIudxaRqUBihb+5NkQavUFCIY
         cj8BI2ZWo53OqcnUWroDQgAKeCg6+8lWftT/aMHf3SsIA0WXhjPwC9lnlp2hBG5aREzk
         XY7t+qTj29Dde2fjuENzq7Ky1uWaHXt0kYaW/rlGAlBcm6inbLPu6iVVih+pnthkc+3m
         2E/w==
X-Forwarded-Encrypted: i=1; AHgh+RpN3eUDf3dqq+D1aTErb4JzlQpUThGOU1GYZ9t7aAHoUnx15MNANrjf9RGvkBFhbaXJCmCn/51YCDJY@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYK/kcCVkGaAKvVJUVNnrkPkeKkxW3j/tdiiII1w70H3ISO2n
	Ys7kPt5gvTfgvi2loRZWV7RDQzNp2Ysxr68ZRlINesO08wvJI7txZz0y
X-Gm-Gg: AR+sD10/ya29unbMLdATE2ZostnhwaqSjDRjozC/aAxaDJu4Yk0NgrDt9f1c9ylv6sx
	jRwbcaczJbwS0vBXYLs1FC9LPPUUXFrQt6wcTP/Py5DFBoA5cy02eCpIKl+FbwvFgCqIZ/Ma2C+
	2Zs+nv6Yrd33ynEj4+j9Wnd5IMy+PSVJXd4ovaTRo7x0wAVh2sTHRN85aymThZncppZkJmzrmGK
	hgFPmUmF1lh04kg6kKb2DRkmnW0f1k3HvNmPCGmVxpvfUM62IvfbdKcaJBydJd98DRb2Pmn3vkl
	eGILZ8LhPUn8cGOQkorXgeLTg7N0pequTuKJT1bTVQtiHBuJkkRjbZ2N45KN526oM0SH0fLxHV1
	qWuMusOZhlZjn/N0NCbTiHq6aIit3LF8EC90+JTnPMW+u2GG3siXtqlkFAjrOjqr2bMsv2AUrjH
	Py5FnR8FqgGTssraQ6NFrIyf/NRFvcLBmRmiIp7oLSBU4ltSP8YcYEg6LnFdTi
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr36471872a91.5.1786343213083;
        Sun, 09 Aug 2026 23:26:53 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:3516:bc05:bd3c:bdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fa4fc7fsm11138390a91.0.2026.08.09.23.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:26:52 -0700 (PDT)
From: kyufie <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kyufie <imkyufie@gmail.com>
Subject: [PATCH] arm64: dts: qcom: Add notification LED, vibrator, and UART support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 13:26:12 +0700
Message-ID: <20260810062611.735673-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for:
- Controlling the notification LED.
- Controlling the haptic vibrator.
- Communicating through serial port exposed as test points at the front and
  rear side of the phone's PCB.

Signed-off-by: kyufie <imkyufie@gmail.com>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..e74433f89 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -13,6 +14,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -23,6 +28,37 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
 };
 
 &blsp2_i2c1 {

base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.55.0

