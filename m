Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925298;
	b=3mGowaFcbA8P99FHugDg58E+i1lkzI5+dYs0/UCNSjGz3oLbWLtEkt3T6fnOd/xXa9TT
	 BwEeXrb4nZ4v4miOLBQvN6i9xVB3pvyclNFggBuFuRwuv2kFIKZ0/g/aQO/+JYbWaNBTg
	 aRzX9IAOaHbi480O+8RksYjZ3IyMjvUJ03iyuOn5P284DWD56SvlC8sc7hZm9RJjSX0UT
	 C2DdAyJLJUZwHXQERCD/Flakz0YaSxWko/ccVPzttE9D+Tk/UEEznKqTbwZ/vxAYD1PnE
	 7MqmTKPApRas9PrPfoZgJ9/dLBZGWpw8SYPtUu/n3XQ4ZxeeU4LHX9SP7AirUHrYtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
	b=bH21Xg8mwzvz0T6vVSdn1calDmDR/rIpdJ1WKsg+4xe9gIDVuAYrz805Awoq6WtBU01s
	 33/kjBSpUfqT3uXNkT7buLqotKDUqBFuDGHdz/oc2fVAWgsAkiEvw+8RUsbi+R7fbquiT
	 y+dUNgwi0SG9Yu8KW14gsbRDibYICYesuvZvi1okIJ5p4/iFGAAjQWE97pM6NFn7lGqm8
	 H+lgSiMWCwrAW0MtAZtCakBZxWRnh7mICSV60XGAXigb6+iz66zJlcECTVmARCV4FJRzT
	 Zri7hE0ZmiNt81RACiASkE7w960KTJKsIQpo8Z1c9YEaApeZOjV459AOs+M9Xhl788A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vf3Hjv9E;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C0E606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 14:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77C0E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vf3Hjv9E
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so6977360eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925296; x=1795530096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=vf3Hjv9EeZL0XwPDoPToH9V1fcVk607RISk0iwl0VPUOXZbNujcs9J0zuN1HMjtHCC
         U9LPx5IlJCwKxka70rvcRCr/e7FncDuFTMeBRCnYmPmDjDtCt81QLbHDQkjqrQSL+9BO
         Bo7mTZr6ZmpUhiLTus+0K+4fUl40u+9MvqQDY1sHR2ENvNI5upRpX/HCIIuAiqN3UiV/
         tbSBPT3HBqCSDpLdSXkp7klgDU4ZVD3EUg/Ygn/8ByY6upIsHf5YjHbI4nSNs7YGso2f
         Mqfji1Q10OVjc9IoBKLbpSx7M6+CJFpB+wzy7m35c7NOPlzqw81eoZcIS9OEqzEK6Le3
         bmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925296; x=1795530096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHww8Xe65qt/2LoVxnXWkn4bOLdKbZqwOjujT9tpZqM=;
        b=yelNnZps0X9ywDEDiO5qMt+tgmLxzHPECMwKA5471W2OlaqUOGFMF0HNfHFZJkJ+lf
         AZTWz2fJzOkKDoXpsBHmjVFTzSDVimxnHizlfSrx+uwUHDQWBM5OX/cVAb0WQfx+cDU3
         /iQl+zqQf1J9kblURnM+ZbkDblkJslB9Q1dRq+YP6sLWGK0tVkw2+LaWzJZnoZYIeeDy
         tDiEEtKt76mQKEfgo2GGj0CFAUNzPQb16zQt1JL3ltvzADgpniSqcrV25WxdJb2yO7BY
         ZmbNrJqD1XZIg1qzd54xNky0+SzxLiWT3I+aOS6fsKFDEXdMiElVrZWvsRNELSSzpbts
         IZJQ==
X-Forwarded-Encrypted: i=1; AL+hErH+K4lHoLEuX22kYBKXlpE3YpV0iSslS1RIh+H7Z5g61ZsPzK+JYo+r0xoygr4aAQ0y1D9JOrmE8u7y@vger.kernel.org
X-Gm-Message-State: APuU4Z8nU1ZGQwpPWB4rzzqSpIO7t2dxCffgDPq0bBVqFsuc/Crf5n0o
	XjUiaEeqHnEAXbwcb9IqAXHlB+rM3xZZ+Yh87rDw9KCkvNPFRoHphyGA
X-Gm-Gg: AZFdTZdk66k59Dx2QKzHU8ZI6dqtNIvC/5aXMVG9nZ3mq596+zWR3npxcqhVduRwxmM
	2S1qavq7wgrH0OU4auVQseK4PN4YN0gy04EvVKKRnGvI8GmyId/nv+fOUS6e99IGMIHL65+B4Px
	c3R5inQnUIKyoAyenNIcY+6VYk5oFmCvjWrHuXhE4ASX6Ic+2E6GVSjQZ1k/2u6a7gNw+yvOA4P
	vTv6udBRh5aNleMKRCVM3U3ZNmo2+PzPWCqxvtnJ5vvGN81BcVsPf8bU28Dp10ccoSiyDqLxkA7
	9XOwDFVCtfJJbpIYMRQSHambKq+snI86vuXhLRICp2RkPPXfpCXHEWHV9npZh5ukxeaAxlMTHv0
	+4tvXXd2xLWrzT2AsHEesDPtQFWs69V6EyvofGkT6oNFqTaxPcMI79NbObJZMJXVTOjoUbPcbvb
	No+MOeLtlymo4fODoec+8sNYR0tWPkWszZS27l07/AOXswkbj1jb6PRxCdHORqm0u3ZgMcc7kkk
	THx0SJQ+EnG2bbanhvojCHtx8R8vGyOJfsDjIhjRZnsBP4ykh3lznttRi898x21G3lbrE8rvkQ1
	fk+0IJSdlbRKf37iB58GlL45ZJCNJUrKX7Q1O+Y=
X-Received: by 2002:a05:693c:41cf:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-37967506841mr13477392eec.29.1794925296009;
        Tue, 17 Nov 2026 06:21:36 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm43828258eec.3.2026.11.17.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:21:35 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
Date: Tue, 17 Nov 2026 22:21:21 +0800
Message-ID: <20261117142122.246986-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
integrated into the co-packaged AC200 of the Allwinner H6 SoC.

The AC200 derives its 24 MHz reference clock from PWM1, so enable the
PWM controller and the pwm-clock node that supplies it. Also enable
I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
package on the EMAC MDIO bus, with the EMAC operating in RMII mode.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

---
The AC200 MFD and EPHY drivers/bindings and the sun50i-h6.dtsi AC200
description this depends on are already merged in sunxi/dt-for-7.5.
---
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
index 225f42bd3b9e..9b192caeecb2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
 
 	aliases {
+		ethernet0 = &emac;
 		ethernet1 = &sdio_wifi;
 		serial0 = &uart0;
 	};
@@ -87,6 +88,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
@@ -107,6 +112,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdcc>;
 	status = "okay";
@@ -123,6 +136,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_aldo2>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
@@ -173,6 +209,10 @@ &pio {
 	vcc-pg-supply = <&reg_bldo3>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.56.1

