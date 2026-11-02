Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649218;
	b=uPyJusnEpBZ4ImB2bHx/LVBigsw/ZLyNd2Ohq6u/4ORT/0QXPX3JitBUstovKAYcFLUf
	 sjrXkuuWaTc7xWo96KT1mky9dx/Pwy0W3w8prynZiAU9XP6wFKPYbZvB+7Hp7BysrULW7
	 RBfEHCj4C2HWKn/GMgOZCo/FsXZweJ49oIbHom1PM+kJN5lcfwUi5F1Y8/KKIWeXo5fNM
	 5sB5CwZS7GxIXcGWcqhR09OBwb2WzdaKZ9sE8RDIhPFzmV+DHSiUWgIB1nk/nD8Co2YOd
	 wiGGEEwk2xStOTUxXGB0UGV66S8T9veEAUVXxDpM+u68H6NoGmk6ORkQ5FJmwWzZGgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
	b=4IA1NYY6IRiPQyxxg8sMT6A/ZqLb1omh5zbiYYjF+I61AZdrX5Ouxs5yb5h8wevES0qz
	 fFPgeY47IGzXDLEZr0Nd66TZ5uFqdYOlW37ft8R2/jz6w6cQtuqBTDZz+nwgZmEKQDnqY
	 UCGuqf2Snq4wEdDGGScisYjMJjC7NscBjVY7mPjNGxvROzTqYvex3WYh2T6y+euWMjBCL
	 BsuGQcf2g0DKQ7Jz6B8SH3hs/G1iojqdYAjiIWEi3ZqvSGzcSiIqZrDkLAZsqmL7/LcWt
	 Gn3vABbxvjAMuqTH0Z3gIYQDTxbxU4pXyiLct1pgKtb9NbTWKKM6zz2MzJT92LSNMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MWbw5Usb;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BE6606EE93
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BE6606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MWbw5Usb
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so35662325e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793649217; x=1794254017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=MWbw5Usb0cbBGRLJ92ZAJTrt0QFWs5YZyCyeW437/ftTQrr8PtGiFmnH6ZDDDeRgK+
         wDuPaD5LbUuySlWSjcZCPbDWmXxbLaK5YMEQFj3iGBQIAlM9MK5/agI/Q2qKTV/ajFAa
         Wdx7yFaqiGmQgySrAFn78nj7xAzevwiHYL97Gm9f790QUlegSW5XHaG3RQoglML5uErR
         0bddC7twe9dOkG0IcwatIXRokwYaWpss8ebERcFu7LpsOPKtw2F85pH/ZEFBiY+VQY5i
         l+truFJzXk6kXZKZ8/M6if1xbVRKYJL6r7LwwewjlJ36+VIuwtzLdqXPmWDsXIvsDeP+
         BSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649217; x=1794254017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgXqLTaB6oglxj40wRZgSM14LGgOyB0NNgDc9089WV0=;
        b=G9VzyBxMIbhGA4uur+hPAtBVAafdz0B1dRX0IlPCDxW0cV2QQpWcjzV1ePytRtpYNZ
         muJyd/63zZKwwziRmwbD5Qft4o4gx3QOg49xZ1RkY8JGu8hiO8mFpjT0haACBlLn7jnC
         49yrWYgYvGMD3zaP8WSB4G09Vo2kZcxYa9PYSJM1RN2asbyjg09htmOad/joQQ21YTqa
         LHgbu9bsAZByhumpfz2V/TOaNRT2J5LhVcIpT20jRBYVOEsl843SYhz5CUYqN2zKPHk5
         nkykN4oA/05GivN9HxsZn/hSGKAjdHE8X+WMzv91rlCM/INO4JiltF932Lt/J9kxSMSs
         0cOw==
X-Forwarded-Encrypted: i=1; AKwUvBzviP3f6qquQVots7Xnr1WY3qhSwfb7g44tIPB0Xzumd2boYzVaRLx/ykxXQr/uW2Ieb3FuqMbX6BVN@vger.kernel.org
X-Gm-Message-State: AFq9FYLEdptsTWYMRWOzzHh4vtjZNhIQGANMV1Pj9lvcz491jA9Kywnu
	xDeodviHN5G+OE8UZmDI+YqUD6xXc5z9MdKqRQoLkANSbk63iweYRTuCvJ4704mbJJY=
X-Gm-Gg: AYBFou1WLiqEFQo/AHOoxU3/lSf+Lgrje5QJcXOfpD3eGJ+kd3Rb/Bqe4RkNbQW0ybo
	Plx6o45Xj6ZCggS8UFXXStOLR+hpx+wCw76vs3dIwdBEfPIQJkJOsRrIdTinntfvxj5ioM23ZMH
	6p+iAixfvALIlzpS0UMz5jomIEAqaikZevr024ACb/CX3tiy4wqcHKAdt3P/YW78Doowx26nl7R
	MIHyQVcfvmnp3VhMPDQcg+SU5M7kFcIJKU+PzLga436lC7/aNbrVgPaIF03jHudBlOF3fnUkSvf
	CPQZJa+WpLk5kP+nK1g/50AAPqNQcI0eugYcEtRpdLzKAVzne18Fjf9JFEsmTFtZpAJr3khctn3
	5WKkU3FXSVL34WadJImYPvtKZyDEahE63CRfop0oLYiQBRMG3dIzh1De/cpq9E8wHlRRBtk6kHn
	eHj2FXQGxOOXFo2o+eIUrfxlVCQwzu9sWKv1nNP4QT6OB+vLy619DzHPrP2WcvlEn24tJUz5q3g
	/ZqyFr0CWetB4ylwPCurxLZblQ72S7SCD6jDi61mWvufLgOsczj58TC8cnZjUHZzC943EQYvd9L
	dmwDpc8ETi9+xBl5574s43RbHeN3x/1oiEkLkNXrvjeWt+bkh3V9cDkpwaQew+xtOJ45O+JfjsZ
	eN58PFwnYoDG/Fynwj0fF3QGWlXg2QxG5COVENwsrTvfVt9w=
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr271307785e9.17.1793649216650;
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm24039784f8f.7.2026.11.02.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:36 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Mon, 02 Nov 2026 20:52:52 +0100
Subject: [PATCH v3 6/9] ARM: dts: omap: dm816x: Update USB node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-patch-ektor5-dm8168-dts-v3-6-9bd6d1d128f2@linaro.org>
References: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
In-Reply-To: <20261102-patch-ektor5-dm8168-dts-v3-0-9bd6d1d128f2@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Paul Walmsley <paul@pwsan.com>, Russell King <linux@armlinux.org.uk>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793649208; l=2863;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=EJnKkiuemSceXMhSCbPdhy5GFuqZDHKo16lb5OWeVfM=;
 b=ESCjvnfz5BaaRmtGIY0BXm6cWwwqwJZz//AnUTjaN8AjdB+wYwYVBSVpHdY1qsQm/aRw6J459
 nTfcAhJhQm5APUGdpa6Zx677/Klogwl+XT/qmDwr+30RfMu+RVgFJIi
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.
Removing deprecated usb_otg_hs `ti,hwmods` property in DT node in favour
of ti-sysc implementation.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 40 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index 1e8d225dfb2c..314e5e580c8b 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -573,18 +573,26 @@ uart3: serial@48024000 {
 		};
 
 		/* NOTE: USB needs a transceiver driver for phys to work */
-		usb: usb_otg_hs@47401000 {
-			compatible = "ti,am33xx-usb";
-			reg = <0x47401000 0x400000>;
-			ranges;
+		usb: target-module@47400000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x47400000 0x4>,
+			      <0x47400010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_SMART>;
+			ti,sysc-delay-us = <2>;
+			clocks = <&default_clkctrl DM816_USB_OTG_HS_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ti,hwmods = "usb_otg_hs";
+			ranges = <0x0 0x47400000 0x8000>;
 
-			usb0: usb@47401000 {
+			usb0: usb@1400 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401400 0x400
-				       0x47401000 0x200>;
+				reg = <0x1400 0x400>,
+				      <0x1000 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <18>;
 				interrupt-names = "mc";
@@ -621,10 +629,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
 					"tx14", "tx15";
 			};
 
-			usb1: usb@47401800 {
+			usb1: usb@1c00 {
 				compatible = "ti,musb-dm816";
-				reg = <0x47401c00 0x400
-				       0x47401800 0x200>;
+				reg = <0x1c00 0x400>,
+				      <0x1800 0x200>;
 				reg-names = "mc", "control";
 				interrupts = <19>;
 				interrupt-names = "mc";
@@ -661,12 +669,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
 					"tx14", "tx15";
 			};
 
-			cppi41dma: dma-controller@47402000 {
+			cppi41dma: dma-controller@2000 {
 				compatible = "ti,am3359-cppi41";
-				reg = <0x47400000 0x1000>,
-				      <0x47402000 0x1000>,
-				      <0x47403000 0x1000>,
-				      <0x47404000 0x4000>;
+				reg =  <0x0000 0x1000>,
+				       <0x2000 0x1000>,
+				       <0x3000 0x1000>,
+				       <0x4000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";

-- 
2.56.0

