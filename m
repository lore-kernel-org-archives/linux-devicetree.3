Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5C3E0240
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780500287; cv=none; b=INVxzeRlUri5MmS6IATuzQFwe1GmHbCkVD5Iul+1qvmTQaF4Pm2JxBQfubK0z5E0hl5W4Np04AgnANNwFhiQqb60NNQ1Yw8fdXewHkAbwvsKCz3PCq92XS+KdLX1bNCz/ug68DRr/HjAqCtrUjjSWQjAAQ392b//ZjVbNtS1y8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780500287; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIB9yWMJZhfX3o9fWAOS1iTdT7I2UqeMfI4xRm90x8k/y7Cl2neX4geIzyVDIswSbnIinicLmwV9xD5GH7FoFRyoEMv4pxFIuVRVD9Hu8h1I152vNwHbEQ3VNRLIQzkRlKBApkxU4A7bikPLtQAwKM/tmCIEc1GatUKX9Tk01K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SKMcKD79; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SKMcKD79"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so129913905e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780500283; x=1781105083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=SKMcKD79kKsplaImXWSljuoFk26lfBdoU25DlYGEsC9+fm3BKwzdYPqDRwTw8yd3U1
         Fvj9SPZUGjupaU5FcchcO8i4Mi/9ps23oAHxStsDm8lkNAXh4m3yTYBqOHBrnq0NRjmY
         7tfDZaA2jUJamDc3nQeqvE3x10p1gzjoU6VRk37+JqN49Qv3XJcPAjf9z7142sD7yG/j
         gk1RbgYX9Ng3zonqH7EfH2qL5NPcqoG/ER+11y+Ri/hOtehxhpbTNJ2WnJrjOS0APYFp
         22A+Dr4jv0YUZNG/e5GZt/L914f5XLFWQbp8HH4V1F1YzwDVEt8WeaInVujVrTHk/hez
         HFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500283; x=1781105083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=VMdeABvLsf3NjIWCtEos5ewOLXfCLJvF+LrDA9GMr5eReV/X19Ygr8jtQKycQOgeZD
         91U/ZolT+pfg/GSQiLhPanH9vI6YmuAu7GR/JPhBMPfyss6raA8EOBQIT6BnNaDgQC/D
         BNTPNBFZ8/aKNUKBsve3YI5dDo8g+fsRXjUtK6MyLRDg5WShWjS5wJlXCSC2QeZ04V4N
         sS+CGsaTTYZ00ZBQjOeg2OW29uwVsCq0rOdpzhGtKqwNsCV8ecnEuplMEmTWDY65G72p
         2mIweChwD7SJcZFchb2YIZwxF/NqSUmSThCKdD7irrFYe3/A5VIM/M5qGxl8Y5tWbuM0
         jobg==
X-Forwarded-Encrypted: i=1; AFNElJ+UUwqtQuYlH4q55aFxCALVYZ7K1VyL0FR+PsDnnd2//E2xZGT8Dnf9iX7p4FncBUtvbQpHDdu/ebwU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+drtgAck1ZWF9lZ47CVwoYT5VcIlFm+i3k81IvS4jVppVUm0
	Kn2IM4iRTVslepKDkY8NoKiyKTNOQPP48ThCU+tZgvms2x65khjJW2BHZ8lj7ro4sww=
X-Gm-Gg: Acq92OFfWxI9JcEzpB+i5iYr5uqpLTfOZHR/8DsUId7BQ8bGKkuQ+sW8KX1IQ8mn0JS
	r1lrz5ELW2XcJYkDd20aAYblq9tSpnovOwzEPdn1O/z3rCLues+T7B9wZ8PYcKvqAvmMxvL1xjC
	JaZ/ZPSbEXBJ1dPgxYmZBZaSPd4eOsT4SoD9j6bv1jg/D2kEg/IGkBq5Jm5kFRWlSzVQjW3w/gc
	BvxsGw46CbictJlHXL74+9TsWYcq5Zw2D4Cz5D8bJpWBCRHlgx0ukDUHsxaZyoA+avirDJ3z4d8
	jFUF19vtORXNGhcy9qDZou1fQRUEQ6LZ61EXKZmkw/pMcJc821z9D7Ii+H91bVmM2A2hAVyFHAo
	CVWwVwHOhmCgxptwcieugyj8ooHhC9I8TxDK9ILLfOFxa7LUpv/dRtyX/cO8WPwcHImFcQ8V3ZU
	t6rS0DkW0sqnIShyIGQ6sIVBUbGiZXg0m/HaFNQiGeDnk=
X-Received: by 2002:a05:600c:8b01:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490b5d36863mr63918565e9.10.1780500283560;
        Wed, 03 Jun 2026 08:24:43 -0700 (PDT)
Received: from localhost ([82.192.120.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b725fb1bsm63329125e9.8.2026.06.03.08.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:24:43 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v4 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Wed,  3 Jun 2026 17:27:46 +0200
Message-ID: <3328baef11e5cf57391c2679d810922807f26a7a.1780498640.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780498640.git.andrea.porta@suse.com>
References: <cover.1780498640.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3

