Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B73FC5BE
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821157; cv=none; b=UsgoKQjL0UwOTPBv1VJ9kYcs99XqdukurjHaafNOMGVDKqVlaZA76yNy4X9ZuDjTbR8B6Bm3e+MwdRY9W7D21uDFrLCeVGle8O9r1LF8BxUwvSlQVswmslpPMfNHU+wpwGfw3SFbURBmrmVT927IhpOJOv3QWHJCm+atqaDmSf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821157; c=relaxed/simple;
	bh=zzhlf4+jUfBlJNrGaKzSC1O9BLhDPiELfCIr+nFD0lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MQUGfxahloXapV0izfMSVpXaTbFZfVoMjdQqaJ3zuzNWYegCs74jLFb/l0uCJxcXQxtM6IifLo14GMZpJytehdKVI7GnQ8kRNQEYu37nIWDhOZvvwOm8WiHuXNakDkTugQUQKwDUnEIxEj0Hr3Oo38sNaCaVntHPj2uY2BY18mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sF0RIPC4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sF0RIPC4"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2469570a91.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821155; x=1788425955; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6FJk5sSpUYCZaCWQu6q12Fb7frJaBEAwqRpT4oETPJs=;
        b=sF0RIPC4mcPn2qj8IL2weVY04NHW54bQB7t/H5RbrRmGejHTzf+cv37O3YbwnqeRNL
         eyRSumL5fd/bo3Kz8O3IfoZFR5nrEn2rQROhFUIA5NtL1ogvgKBLDxkgGnfN1b4IWFQ7
         wwXMsT5MiQPPMgcBkGsu/6PBRXGq4pRLm/ah8JfN+LHFYLfoHjwsgBE1I6j9Nhpi/CLd
         8s2pAQq1sncm4XcjItR9XmTxC66kV00ZQWSq7MT/NfmsbHru041dnJwwXsatM9/Sh77y
         NJJH73J1vns+76B0THcpvQEz7arU03FcFPDnzye5XlsaUMn1b1se9Is7GM0zhLcShoAY
         wjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821155; x=1788425955;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6FJk5sSpUYCZaCWQu6q12Fb7frJaBEAwqRpT4oETPJs=;
        b=gNMXoRh6rHCet7JmPVs0vgauJPH7s6QP7bUr7PnO5l+IyGywBZF38HvLpQi7mvlhn/
         VI8XZU8h05/4mjyKKCPViMsljl8jt0LFVOJiyX2lawC4/OvcG3nsGpQPdMbcipzCt52e
         sV6XgZv7TUeTGo7clDmDWvYcAIbSuh9Gl+/TaGlE0yG8e9Wl6ufzqoTBuER94QRPN6fB
         TBkbpT27eFSqeZcBwtbVsQToidDuLrSgJuREaYH+Mb87BacYQ/0JpoRHLel5E0pVCsh8
         eazXd8gT/oa1/ArQcJ6PfU9YQ3BYrH5Xl5UVL51/55pkv+Sjid7uAEVeXIQHRk2EWZkf
         o9oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxvbTKiTYjMBbKQLN4uHU4f1zxkUVWwWzMApOSHbo4rYsPZ3CBY0MIjjjc9s9Tr5qrh5X6xPo/13eG@vger.kernel.org
X-Gm-Message-State: AFuF++l+xszY8TnLkuc2I/qzelqMNmlvMOt6q2ezbJws0x3Du/rco4Dj
	6Sy3uGqDR0nhC4NJs+zIiSm3etFsCZdBu6/MhwbIguJA1Bg+OdzLdu8i
X-Gm-Gg: AR+sD10clF0bx0wmKJ7oEE/RO1YpUEs9qQ1WDe1cgLBUbx2BwqCHMkGSsTInk2jZg6b
	iwVr3rXxYgHu3PoLEtwKJdZt+aW95MaJRNy8ASIjyqV6oMnxMAaypySATnJgdwJdSQOlQE7WXmG
	1d9LkvCxjcdtuxHH93uwr8QdCm9/yIZ7iozi+rRHM+BwFybjQRBfFK2RYdkuKRD80bw/YmZmF3D
	qb7Q0Xqz9gfxO6sYdJ58jd76xXHWyEwPDlvE9d5C1/ntqZmkvEXWPnsHkQYutD6dJx5flZYPago
	bs14441jvjqywC49V0UOAqTqrxzntLjG6P6ecpfOurYe8iAd36dcjQDmk62dEIEYp7XMcUqiVFO
	Ej85o4Dfql6EX3a2+9yhYHHmQy6pjt6cyxgDbNx9zp+OmLc1asfWbyYj7YkpQsj0giNHI5XeJp5
	MjVKXacypltp9ByO/O7GpGqITkzjDFi/roQGe+51+mgmgeWkwJgSzk+Sx772PTXwIUKbF/
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr28117709a91.3.1787821155094;
        Thu, 27 Aug 2026 01:59:15 -0700 (PDT)
Received: from [127.0.1.1] ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm15803800c88.14.2026.08.27.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:59:14 -0700 (PDT)
From: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Date: Thu, 27 Aug 2026 14:28:55 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch
 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE78j2oC/x3MQQqEMAxA0atI1hOIgZEyVxlclDbVgNjSqIyId
 5/i8i3+v8Ckqhh8uguqHGqa14b+1UGY/ToJamwGJh7I8YCbX7JhLYpb3sOMUa0s/sTEyYW3Iya
 K0OpSJenvOX/H+/4DqSw21WkAAAA=
X-Change-ID: 20260826-talos-rpi-touch-display-f2f8c580200d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abhishek Thomas Varghese <tessolveupstream@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787821151; l=4503;
 i=tessolveupstream@gmail.com; s=20260826; h=from:subject:message-id;
 bh=zzhlf4+jUfBlJNrGaKzSC1O9BLhDPiELfCIr+nFD0lk=;
 b=zZrsrfeGCvIijlJeCCkhXO9zu84SitzdNAruwO36FyuxgItAEkZM1VWQUiP6P6v10ujzVP8y9
 Vu6aBxfq5sXCS1ywkh68ryTzt4n5AYQyfHYkwLWSM0it6TmHXJd0hOi
X-Developer-Key: i=tessolveupstream@gmail.com; a=ed25519;
 pk=0KMY9Olg1jw9bWLd5hZXnm7zZLgGk5yq+WqoY7YLkzY=

Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.

The overlay describes the display controller, panel, touch
controller, power supplies, and backlight. Disable the ADV7511
bridge to avoid a conflicting device on DSI virtual channel 0.

Display output, touch input, backlight control, and concurrent
DisplayPort operation have been tested.

Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
---
This single-patch series adds support for the Raspberry Pi Touch
Display 2 5-inch panel on the Qualcomm IQ615/QCS615 Talos EVK.

The overlay describes the ILI9881C-based panel, Goodix GT911
touchscreen, display controller, power supplies, and backlight.
It also disables the ADV7511 bridge to avoid a conflicting device
on DSI virtual channel 0.

The following functionality has been tested:
 - Display output at 720x1280.
 - Touch input.
 - Backlight control.
 - Concurrent DisplayPort operation.

Please consider this series for the Qualcomm Device Tree branch.
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55d539f5292816ce06c9a46bd4904c..7fbf79f65ecb8283e572554838c044d24298d360 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -421,6 +421,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-evk-rpi-display-2-5in-dtbs	:= \
+	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..35de7643026e3b5282bd990f7ede6e410603404e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-rpi-display-2-5in.dtso
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hdmi_bridge: bridge@3d {
+		reg = <0x3d>;
+		status = "disabled";
+	};
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "raspberrypi,dsi-5inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_display>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260826-talos-rpi-touch-display-f2f8c580200d

Best regards,
-- 
Abhishek Thomas Varghese <tessolveupstream@gmail.com>

