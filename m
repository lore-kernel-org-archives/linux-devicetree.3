Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30622F8E90
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687656; cv=none; b=Kg3sF+oV9gKfw0S1DANwWXWKK2bzIqdPffUOZboxvwVnJzV8VwkyDIbqF9G2Z2LOa7yIl+MOiBo1hKdk2PZluLob7xZLlwU7ABqY5sargxbM/XKttNA0ju1c2CXyZoBLYuvVj6jNdGPzrTeIR4Ho+bXLL7PFGxk6xZ3xy+eJVN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687656; c=relaxed/simple;
	bh=gfzQySmyxR4zsn5JgrqEnK4WXKFeGgtwZZcH3DkW71g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWAq1YcjafuiD+6vRCRWDYkZPFHb4PnVrSMql8hfxWOuEii46N+3Z/iTnnZ0Nc+Is3dji2DaBMVb8LQ7z/5teeyqOmX05+YpBqgeGPi+HM2ywlgWrTBvC3JCtzH6uSdtiADKiQJfE682DwkUQHxlStPc3IZqa/SBJPzg7N7cRKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmq2PWcm; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmq2PWcm"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1384ebe7a10so5148251c88.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782687652; x=1783292452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxbKV8/skOsXsZRqmSrDPZIzaZs8hTaFDlWnRA4ZiJM=;
        b=Tmq2PWcmV8xXA/F2B4f9rho0NuyhTXnnjKBNPs6Cw41Q1PqFLeWRNUk0V2RSPrXqgv
         HNn2OqsKkf9QQUqsiE9XvmM7iSWqZiWrE06pp9DICaTwcULzCrjy8h0YEfSegFY1wmiv
         NYMF8DEyMWot8ENMF5tdEHs5Hw5vTyLuo+fhyDZLXosP3d/2MxigtbmMw1RV1R38Glae
         PnZlrVto77NogMeNnkbpGz9qILbg+7XtzbA9ujE66I9O/K4iRFb2OcPT87YsYCb1jXX6
         ToJVET5lztpt8LwlOhpVOJbfkTJ5JLjgQpKgxYaV0U9rhf//+BfNruQMor3jU3tubUZb
         ByDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687652; x=1783292452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SxbKV8/skOsXsZRqmSrDPZIzaZs8hTaFDlWnRA4ZiJM=;
        b=PK4dYL9LOY43YCh/9JsNQiB4KMQ2aZA8zp6ZLlpxNMvnnm1u9XINscDyY/b00ocVyF
         nEJcdAD2Vub6FQKVU7VclV5c5JS75HgF2UVLuDxc78I+OgUhkkhvMJgtX/YUBju/vti0
         cEWxWgGBtIBAFVY0WCFUT2f3mwRDpIY67ukrDi7iVovM5jKlMw427bXRZnMDM6rXseJX
         TiL2wSNSu1Mw0bfuiYwrtliisZ9172Q3eQ0qFonQZYdFqFktAaXFSh8jN78dbKURv7cr
         u9e/9sYCLMSG3TG0d0FTzPkDWlfQa4UJh4Ibc43AoT1iYhO8N/Y2F978LE5M8YadzLGx
         aCiA==
X-Gm-Message-State: AOJu0YxhTdSYPEuMe3n73MaT/4d0fXVXY6UZzT3DILdUQ130Fspby3QQ
	wv3uisakqavZeda9ZGPtS9HkiHkSZM7LbSOjXcT3L+Sm1U2hew4OQJbkwno9aA==
X-Gm-Gg: AfdE7cnb5CpXDRsxIn82UkZnSsyiWLxJNZftMrEz7k0ijywTR90t/qAbnIjCAr2weD5
	RV8NAMlej4oiD5hizQkiEO1pWzGCCzXEP/3MxlH5J3p13hZClzrIM24JqMmZAMJsV0jwnvST6c6
	bDLk9YVB642sFu0j/rjIf6bosoL/ggvCnqf8l5EkkXhegomtWsqsu1Nfmdqc0tlVjndugopAnrY
	uELuOc8Lu+yGsCf/B71lPGMtWVTxvuRlDtCV1VDVtVd0tgNRnumoAsrsuwzUd9p1kcCbmZ5wJEb
	rG3IKmzkJEknQSfVKY1BBQIXvAG1waq/mHQIcHU6Z8z/2htZzJ8cLxpuwHdZB8GGj4wP62TwY/F
	yzqBmdrhsDZ+R2SSua0WSaKw2F50/Eb1Gdss9dOrtsPmrhXFREsriZo5gvr0NBfP33aJjVuadeg
	Fh+k1NP//sYxlaEuER5zFAgsnEYH4CWeSXXZlGxOK8J4PF9/gzw06xHpFvfJVIz/NlGY+wibfcg
	8dIog4dtTB+rpCVTSGJ
X-Received: by 2002:a05:7022:79a:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-139dbb6ab18mr12709829c88.28.1782687651819;
        Sun, 28 Jun 2026 16:00:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm41359030c88.3.2026.06.28.16.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:00:51 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] ARM: dts: helios4: wire LM75 into a thermal zone with fan cooling
Date: Sun, 28 Jun 2026 16:00:42 -0700
Message-ID: <20260628230042.1204293-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628230042.1204293-1-rosenp@gmail.com>
References: <20260628230042.1204293-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LM75 temperature sensor on i2c0 creates a hwmon interface but was
not referenced by any thermal zone, producing:
  hwmon hwmon0: temp1_input not attached to any thermal zone

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..6e0452217265 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -8,6 +8,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/thermal/thermal.h>
 #include "armada-388.dtsi"
 #include "armada-38x-solidrun-microsom.dtsi"
 
@@ -68,6 +69,35 @@ reg_5p0v_usb: regulator-5v-usb {
 		vin-supply = <&reg_12v>;
 	};
 
+	thermal-zones {
+		board-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <10000>;
+			thermal-sensors = <&temp_sensor>;
+
+			trips {
+				board_alert: board-alert {
+					temperature = <55000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+				board_crit: board-crit {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&board_alert>;
+					cooling-device = <&fan1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&fan2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	system-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -129,6 +159,7 @@ fan1: j10-pwm {
 		pwms = <&gpio1 9 40000>;	/* Target freq:25 kHz */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan1_pins>;
+		#cooling-cells = <2>;
 	};
 
 	fan2: j17-pwm {
@@ -136,6 +167,7 @@ fan2: j17-pwm {
 		pwms = <&gpio1 23 40000>;	/* Target freq:25 kHz */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan2_pins>;
+		#cooling-cells = <2>;
 	};
 
 	usb2_phy: usb2-phy {
@@ -201,6 +233,7 @@ temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
 					vcc-supply = <&reg_3p3v>;
+					#thermal-sensor-cells = <0>;
 				};
 
 				eeprom@53 {
-- 
2.54.0

