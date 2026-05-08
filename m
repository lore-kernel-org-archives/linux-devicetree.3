Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCB37AA9A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240680; cv=none; b=J6iOJdQBo7kAM1Y8E8Xim0lRb2FtfsKEn72kZElgvlEVgYSGXYDRMZyj4z+bWLMo/MOodxNjpKuibfyPBer5glXaRJd8wWQMJ6GzW6IIvbe7PQM+4+JHEkgwmtbbwLNKUfGgkTih4nlUtKTLcQMj4diSvbpQ8MGG83x6nmjTOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240680; c=relaxed/simple;
	bh=yE7UXydnGV+TCsvBA4xH/TqHmFApYe6F012/0U1LjEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYinSrUnP5pvu/gPIevazW+iKhnl7RRZnlnmctlw9Cb21RruRVvxRBFm1hgD7gbIhFjW93kxBd3Jvkgj4MSMgjpOQxJ7g2/ZxgcCH1Nomp88LVka1bywi4HkYGvINX21glKr7lyl326b3oSAnxha1JkWzHAlO9nTz49cWIzPK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-130b2295ed0so5601759c88.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240677; x=1778845477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3QTpGGqX4AyMp5PIUh+gEtcvVB1vqrLPaWjuq2hLAc=;
        b=mgXRbO0e/ysyYBx3XRSONOePJx7xGEmcmjfu8V69asMFiSwktHOzO6G+Z4xYDGawkd
         t/WLdiaG+zo97QpPZDYkbW39EJvFJDKm5SmT0Jwvf8Q2TjSWdn9HpCCHGlAhM+58HtOp
         gaZUKJjLnLrHMNuXjSWwOkYNTDO53qubq3Hy+UirJKLgUYik0XifV7Ap5uuwmlnK4kNQ
         n1QryCC/XHDft+lBxvExhc2MENd4l3d0rbFILnAk0aQD1EYC2hj9RIbPgLzj/5GlrAnx
         HIfIffyDD6orYeV38GRZjQUbSbyJc2/tYtu3R/1PbtwR0isMKBlJX/aue+kQpp7TBXbq
         IKtg==
X-Forwarded-Encrypted: i=1; AFNElJ/sWEE0B0a4lnb95JL+nqdeyd63IUiu02h8kh/RbJ1hMFDwDUnsdw9xzfGaUSGPrJpVCN4XUpAubRJd@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGQds9KBOH756vh02SRn807b0rChC7Z4vTTZ1u1KnNMLJVWXo
	77l4uL3wFtet5mSi6Puukj01nPEMJ5qMMwAocXuqjU/96U/LOrrdtetb
X-Gm-Gg: AeBDiet7tZMg67zax1mPJb01Se2VKO/ypft5q6RXAl114srkcYCLUhibWFODpI7Mik6
	rQlQGyNBhncbG71DCd7UpfoGJ7mCkMb14W0sJWU4B8FYazaDtlBSWwomUTzheRqRPeNIlet1Llf
	UWdq24aONDrGcZfk47dkafR3cdes0xPv2KCK079hMiuG43onPYA9VzXt7dv0oMhjFKYaDm176js
	yqMsSGyd/s+J6R8H7l8Y49UA2k+/flD+g3O7gs475SRHunXFwgWF0FwxRTCVCAZ15NsQOOGoxE3
	3fhjvorG+xu7FGw8z2DkzTuq8ELAEL/MV+kzyoV6EmubLo4QULQ++5Pn1NlgbSxOCbwgLdAoh9E
	hLoQzPS7xDefjXF5BCCgrYmgTIVIH93DWfkl2Zto949Cq+HB1sAC+mH1lN+waI5tY11Ba3csA7g
	1WUr7ErCiO0g==
X-Received: by 2002:a05:7022:6712:b0:12a:949b:b9b with SMTP id a92af1059eb24-1318e9173d4mr5838723c88.23.1778240676971;
        Fri, 08 May 2026 04:44:36 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:36 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Date: Fri, 08 May 2026 19:44:14 +0800
Subject: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=i@leak.moe;
 h=from:subject:message-id; bh=yE7UXydnGV+TCsvBA4xH/TqHmFApYe6F012/0U1LjEI=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyYGIFrfNNvNUNKznNnMhIryykYfUSNoAv5V
 6PfXcZZhtaJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MmAAKCRDSEJKs904I
 kD6CB/4jEXm4AG/cQ4Tn1MTjwxG+UXZxKpKJ0R8THM0lfooLHcPJTHw8EMJBHKQ78zfSjjpR33n
 poOrSREmAT8np7hZKzS6m2nuRAgy1lMML1g1plhj9T/GVG+nAQje7ks13wghR9BaGVfAKR9iy24
 Y1pxSEEMyU2gFWVhghCNu2XBL2lJeSrjRHdrT6w4+UiunNW3FsaSMnYfRIFgo7b0St1WulSr57E
 zMAd27sXRQXUak686RMizW76zksnRbxvP6NBpDyWr3kfXaLLCWlkom42v/1fdVs7DJhZkVa3i8D
 J7dnm0LozTcTI1Qlt21dozwq9RASC0CC2586Dgh4n/97D9cr
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890

The Lichee Pi 4A has an RTL8723DS WiFi module connected to the TH1520
SDIO1 controller. The module reset line is driven through a PCA9557 GPIO
expander on the I2C1 bus.

Enable I2C1 for the GPIO expander and configure SDIO1 as a non-removable
4-bit SDIO bus using an mmc-pwrseq-simple reset sequence so the WiFi
device can be powered and enumerated.

Signed-off-by: MoeLeak <i@leak.moe>
---
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 7cb7d28683bc..af6f25ebbf60 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -4,6 +4,7 @@
  */
 
 #include "th1520-lichee-module-4a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Sipeed Lichee Pi 4A";
@@ -40,6 +41,12 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+	};
+
 	thermal-zones {
 		cpu-thermal {
 			polling-delay = <1000>;
@@ -96,6 +103,20 @@ fan: pwm-fan {
 
 };
 
+&padctrl1_apsys {
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pins = "I2C1_SCL", "I2C1_SDA";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	fan_pins: fan-0 {
 		pwm1-pins {
@@ -132,6 +153,32 @@ rx-pins {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	ioexp2: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sdio1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	status = "okay";
+};
+
 &dpu {
 	status = "okay";
 };

-- 
2.53.0

