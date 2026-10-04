Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978353C10BE
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128758; cv=none; b=QXW8L2CBb1fcmANk845f9T4UxElwitiWm65VlMX4IQ0uBleWUKfvEF1GQ7+S2DmS5rapD4Mg3qpXxZ1SF5KWBdsWA5SOBlqPKz1/NA0gduJ0NOJIV7lYXj/G64y0AXUVcUfBw3cYeNPj1c+g3NQSiVrLe/mZIZTpPAho5RZQz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128758; c=relaxed/simple;
	bh=4rVQXffy4qy4VLMLrAAPlJmYPJn+K2yeUHCy6+V34G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0n5e115i0GajTLZuO9k8eIwXS5NJO6nUlrrGvoU+MJSm3xf1Mj47T626MxIpzuv+SSeH82zBRWJbCxBUiPn6edliangNW+/tUoUOuUTDOKFtJtbNeuWjoT0cjtE1r+ool6dHuzzqAngwur6VifpMfpRm0MXejSp0+To/gZbZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEI7w2gN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEI7w2gN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso8909335e9.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128746; x=1791733546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+PnIRHhhGSsiIqPCSETbWlKVzVd3kBCg/pSqcr87rU=;
        b=GEI7w2gNYTHBtudcZtqETuaKkDcNTnW4GathQ8tOTcPbbFRyfMWuw3BXju5f3ekrDp
         9ZF7ElZm+R+Dd29s/uNbCreInlJGbp2d+cgdqp2SLhzhdp1cJqIdvkG+NtdGdSX7dSIS
         8+XuMWDxlyhqqwKLpLB1R552BSxP+RnTfczv5icpPZSEgYGWzEAuTOFO7OS6OeYQKlqP
         +yF/oVUGopuyAFdXPzOsTYllgjJyzzymKEz7yuROPzHdMh4AA+v3JaJLmVg/CKmvsRXv
         07SYzgkAFImJoHIUFBUX2D/tbgNgytfuzyxL/P8Cksauc0eT5fZo/vO0pjD/clcMU9Bz
         X81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128746; x=1791733546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+PnIRHhhGSsiIqPCSETbWlKVzVd3kBCg/pSqcr87rU=;
        b=TKaJUstPf1PF8qDSTXIyxylvVQ3quD9upmD3q6CT/+Dyyo86WjMizSRy+DEAvtjpgY
         hxQf+z8V4Lv4QQc0Li5izgVA5EGHy2TbXF3RcsWdJCkSLF/uGkJcM9Zh2lgVXS6hEIn+
         Ta6W9Vwt8AtxnbYekA0+cgwxOvSjBmDNnN9boK7Skyc8P2x1BQcdQ/NUpy0nUxO22FMj
         IIEgUgrzPbbngRbMrlbv7TCycpgoPd/QzN9buc6z0rj5Nxa9IkbB1DJq7rbIZxU6Jwgl
         SVP+kdqtvYo7wXnThRNWS9rOn1X5hkR1warT3XaSOkeqwJVz/uGCixv9394da1J55BUh
         UARg==
X-Gm-Message-State: AFuF++kc5vDcKfCvC3QikRRHkGwmtX2jfyjmcT812uDEW1wvHo4/YhRi
	ugSAyfkRxfJcA7h9qCteN6nw8u8+6apeBOpa4ipxBu5LyARQ6mWeDbeA
X-Gm-Gg: AYBFou0dkyrUB5Eyoi/Ccj+XFOOMx0wlLDk5r/RnhejqLaaNFY0olBmrVqKDQOqobj3
	sdtyOCtyR7hebls2nzC8vQavOc8m3GGm66qeb8+uhrPc7ILCkuHbKfx6ikZ6IhKCNFKQiMcdp4L
	lsX+Zl2eyvkq9ug198w3jhyZrCgNKZSAagndRKUOcZr3rFzAQx7ReFTmGkNbBUoWC73r+0nQ3B4
	5OQjmXnNhW9cl9D17D6G+5tnEHxTvrYWl4pykNwwVZxlFyKF6raCjwU+GhLSixRsMZSFKGL5n1a
	zCSDdwnyzCUUVw87+AIjBc1VAS4wxJ+Vsa07veaQtu3iWvplOWP2TxahwIPo7d7fEIzGSTtjths
	1eKfxGepD6Ft29M7GxGjgW86lnbxEZNUbdzDtBNTHtI0PkqWwYH1jlLWr9hj4txnxUfiXz6FlJS
	DjGAVjlTThMHLtQD64sk6UcsIMfbuzoOti+KBF5keUioxeTOL2+WHlkmbBYDbn8GTLxPPReacst
	7H6Qf40MpdmJzSCH2s=
X-Received: by 2002:a05:600c:4e13:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a02754304fmr151529325e9.11.1791128745981;
        Sun, 04 Oct 2026 08:45:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] ARM: tegra: lg-x3: Add backlight LED controller node
Date: Sun,  4 Oct 2026 18:44:54 +0300
Message-ID: <20261004154456.145362-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for TI LM3533 LED controller used in this device for panel
backlight.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  2 ++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 24 ++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index f888987ce1340..3a5e66d869b1b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -155,6 +155,8 @@ panel@1 {
 				vdd-supply = <&vcc_3v0_lcd>;
 				vddio-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index bb20197bcdfff..0d56fd25ce178 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -179,6 +179,8 @@ panel@1 {
 				vcc-supply = <&vcc_3v0_lcd>;
 				iovcc-supply = <&iovcc_1v8_lcd>;
 
+				backlight = <&backlight>;
+
 				port {
 					panel_input: endpoint {
 						remote-endpoint = <&bridge_output>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 1f10f4bfb5f24..2dbef0185a0b8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1170,6 +1170,30 @@ rmi4-f11@11 {
 			};
 		};
 
+		led-controller@36 {
+			compatible = "ti,lm3533";
+			reg = <0x36>;
+
+			enable-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_HIGH>;
+			vin-supply = <&vdd_3v3_vbat>;
+
+			ti,boost-ovp-microvolt = <24000000>;
+			ti,boost-freq-hz = <500000>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			backlight: backlight@0 {
+				compatible = "ti,lm3533-backlight";
+				reg = <0>;
+
+				led-max-microamp = <23400>;
+				led-sources = <0 1>;
+
+				ti,linear-mapping-mode;
+			};
+		};
+
 		max14526: muic@44 {
 			compatible = "maxim,max14526";
 			reg = <0x44>;
-- 
2.53.0

