Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848583;
	b=0RNal0ucqIYl8KSdcdiKcPZyPIxkFAnzi7yDufYA0Nctz13JMwJOegvOentHhC1bHo+T
	 K2EkWz/eEtAsnFDCgmxKETEjnUoP+rnP/NrUyP7ZpEkOhI5MN5V0gN7A0eUldS/c6QCHt
	 nHcrN+bpHgBUoCuecDzKZy8hrU0crbn4D6ha3VleailsBpr8xLBvFIm2M30b7IFO9tgoO
	 l+nW/czkb2oJuuyWOfCkY+/CoCk6rsMsimRX+Pn6Qc1r/vC3xObDcS/h1bPjhUwiV+hqV
	 5RoH8iKdffH22WbbY9MIdRTVp8gyjeDPQkLlc7UbT2OUMfOwCidvz80Q69/AmrOwMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=;
	b=08nHqPaiUxosiY0cI2PqLWZ2IT4omeHFI0ZDIjpXoZSd/qTLBfyF8dY8x0nSz5Lae1sS
	 dPHrIxtwrUB7HeOeHjMTncoD8xe96sg6GJjr/si7BVhuupy/5cjmrUcyEPN/1TdQVFGi1
	 VEABllSYAjtZ9MhoDutzu0kRj0Cg0aeCKFYpn+qpvhAm7QmZ9TFZ12lZRdGwFuzvI6cX2
	 2c960LPUoDK7MF4absytIZX2fBj19frlYFOCm/7xXjeFjYoJ0fEGfLbNhUIti2VF5XBHz
	 MADiYvxcVEd5kH4Ft/9sLuWSyR4FwBNH2pU/I85U9/eZq4oOw4PozkmAB5DEfrE7YKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xu+uF1EC;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FA606A32A
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 06:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xu+uF1EC
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b5489c6b26so300813a91.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848581; x=1796453381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=;
        b=Xu+uF1ECdJuqK5e/C8egmQMVAYFO620qOsYsutPo75vA+GGPK+Cgm/dMtjoCPiE7N4
         eTqE7bKZj1r2FieWTLTwDawDXIftWymd+BIdihs9hZJruTAOxAK2L4Q2yQk7I2JjICs9
         1DJravvHFzf51g7AwnZE6CkbHd16Kd9VcEyWDn47abcYeiksP3sryX3CIcGVyfW4PKcB
         5AwXXJkPNPJ36019JlD5JOMvbpFGeHW1zP5fIfaKpBrFTJKaPVZq5YLPV4HvwtFQVeL8
         80P12rIX3xcXXJYt0gDXfAKohJOIlCFeEg9dfqJcOChMagRX+k8gkPrCZQCYAqcweE3U
         Vysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848581; x=1796453381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YAlAXhBa+PmydqxcAx6HQ5xcH/PcqJHReLdO4gxPARw=;
        b=cBaRV6WaHEysJMYWjE7/OVuKteArl2PwK9Eb0aggrxazfJwtvUjdkDoMn5xbX+itHY
         JoVRsHtx+jy2Vwz0n8d7sJVy04sCsoRtXn0l2B66PuvbUoiKY4P9y7gRkof8RjrjAkYE
         wK32Y7woLaKPYZIrgxf2sbkRHU7VRkkRBk4fMb/+QvuUhK+nd+vReNZGD8N2mcoE33VG
         veF/U36LqPuvkWPKVqSNDkFoUizXVr1Nd/lVBHm8YhbN2YryBnyyIyQUsID7u72CEtHN
         COg63TVF/3GA4kysrpNTvi5S+o5XjsPdhEpA3xN/M63U2/EJipPaL21NvuQUh2S/tyGY
         REXQ==
X-Forwarded-Encrypted: i=1; AL+hErHOI3pIPiOx+M9bRhnVBnK0qU3vK6i39eHe3MfZ9ZWIAdicfEsO3SgdS0IsiHccvbITe6Mv0jmDgu9A@vger.kernel.org
X-Gm-Message-State: APuU4Z+usiFtELbuQJRxZ/SNd18jgyTVopBruo8AndRMWDxLepRJwk5R
	b9YX0xWF4n/VDDND0D8PlDL/HiVez1L2djXmij89tLfBGDUzzum3sOXe
X-Gm-Gg: AZFdTZfVnNQQZlvPQRYem/zpU/IJo5+bxiDyYMVqqSFXiBQjduNnxZVb+CKKa07pivB
	4BsjR7XX06Q5qUan3r6Z71EToX8BSt0P8zMGH2cuHJy0s885uFf06/uIeMOZ4cVxtO6q6OCGGiT
	TeXiauXuiC40QWSr0UTt+/xMUhIT/ZQxLEgJOJIA5NiDA27i9XUUEHl0Ao7BdSncs1a4/fYZOAQ
	d7EMY8iUBf88esPaynUgEsJgFMCvNQDSDr+VIFiPDyC9+x6RNUuMLiksgkqjFwJuK1fe1+WXc7u
	Y2pLVNgYMhmi+IJe8eyuc00VtwzV1B3m0/YejBztPZdpV0yTNwKQQngiqAYcz0IRFE9hsiO85cP
	8GiDfeyM6eL7B8HjZzcRvwXD80gmSEy7dximSS3RtSPrQhhms2JAjiS1EJ3OVjgM9O7Rlf4hkaN
	+29IN6RRiRG5DxCeCyXoBFSIOzFx1YAv3BZbyiyBEGBDTjkk4c8SqCNA+IxMjCX+Vfk0WKe2CoO
	JDAjHhPsCl75d3IiNuebPa849dqsEL1lxdgfTKurNZbJ/fee+w787kMHaGXZK7QAPn3o92DegF8
	0DUWQXorscMIHoaluZEaycCHk64XJfrZXMhmJWpLLmknq8Ho9vgzSJFpJfDJPgJUK6TR2akJRhN
	t3kKxGlxDXobmt6tmlP3f3z8D0HcDJQu007Sv4XlQk9+xchT2MJtiYlgXZlbw8zSFZsUgQvc7/i
	eFRw==
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr26034655a91.1.1795848581098;
        Fri, 27 Nov 2026 22:49:41 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm19909406a91.0.2026.11.27.22.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:49:40 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2] ARM: dts: helios5: sort pins alphabetically
Date: Fri, 27 Nov 2026 22:49:38 -0800
Message-ID: <20261128064938.9951-1-rosenp@gmail.com>
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

Rename some pins to have helios prefixes for consistency.

Also use hyphens in fan pinctrl node names.

dtc W=1 warns about the underscores in the fan pinctrl group node
names:

  Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' not recommended in node name

Use hyphens like every other pin group in this file. The labels are
unchanged, so no references need updating.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: sort pins alphabetically instead of just fixing fan1 pins
 .../boot/dts/marvell/armada-388-helios4.dts   | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index d4ed47ae73c5..50a80ae659c4 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -164,7 +164,7 @@ expander0: gpio-expander@20 {
 					reg = <0x20>;
 					vcc-supply = <&reg_3p3v>;
 					pinctrl-names = "default";
-					pinctrl-0 = <&pca0_pins>;
+					pinctrl-0 = <&helios_pca0_pins>;
 					interrupt-parent = <&gpio0>;
 					interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 					interrupt-controller;
@@ -268,18 +268,32 @@ usb3@f8000 {
 			};
 
 			pinctrl@18000 {
-				pca0_pins: pca0-pins {
-					marvell,pins = "mpp23";
+				helios_fan1_pins: helios-fan1-pins {
+					marvell,pins = "mpp41", "mpp43";
 					marvell,function = "gpio";
 				};
-				microsom_phy0_int_pins: microsom-phy0-int-pins {
-					marvell,pins = "mpp18";
+				helios_fan2_pins: helios-fan2-pins {
+					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
 				helios_i2c1_pins: i2c1-pins {
 					marvell,pins = "mpp26", "mpp27";
 					marvell,function = "i2c1";
 				};
+				helios_io_led_pins: helios-io-led-pins {
+					marvell,pins = "mpp49", "mpp50",
+						       "mpp52", "mpp53",
+						       "mpp54";
+					marvell,function = "gpio";
+				};
+				helios_pca0_pins: pca0-pins {
+					marvell,pins = "mpp23";
+					marvell,function = "gpio";
+				};
+				helios_phy0_int_pins: microsom-phy0-int-pins {
+					marvell,pins = "mpp18";
+					marvell,function = "gpio";
+				};
 				helios_sdhci_cd_pins: helios-sdhci-cd-pins {
 					marvell,pins = "mpp20";
 					marvell,function = "gpio";
@@ -294,20 +308,6 @@ helios_system_led_pins: helios-system-led-pins {
 					marvell,pins = "mpp24", "mpp25";
 					marvell,function = "gpio";
 				};
-				helios_io_led_pins: helios-io-led-pins {
-					marvell,pins = "mpp49", "mpp50",
-						       "mpp52", "mpp53",
-						       "mpp54";
-					marvell,function = "gpio";
-				};
-				helios_fan1_pins: helios_fan1_pins {
-					marvell,pins = "mpp41", "mpp43";
-					marvell,function = "gpio";
-				};
-				helios_fan2_pins: helios_fan2_pins {
-					marvell,pins = "mpp48", "mpp55";
-					marvell,function = "gpio";
-				};
 			};
 		};
 	};
-- 
2.56.1

