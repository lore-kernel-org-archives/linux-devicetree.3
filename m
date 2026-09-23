Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45092497B8B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162418; cv=none; b=isjKboPi2lsEpaNBBaf66NcSNYVkOOIY9Q9BGf6fkMkU5GUIu96pGPeSiJuILVP2o3uy27Y5OGHMSO+i0tVbp7Hi4ltfSGWweVcji/LNAK5R/ZUBfuboNAirUEf/3Y5Qqs4f/fCBop0FvR6hsMk+sL1DirYkW3hO+oYbBBdfk9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162418; c=relaxed/simple;
	bh=YxlYoLJdY1t6MwHb37LAUcoCx0jXwJZlN+NJ9mENu6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWXqAXMM6lxpKOQ21T91SsZAeJpkjii0EmbKmwhJeOQSQFraD3w22K0AumBgu4BcqAYkFOsF7448pM6toRkqWGaWveW/1OBEgK3R01OcwqwiPG8kGH/EqvYz+mQFusou8mx7l8YLu1v4EX7DVgnGwX2/K/3AG8Ml7ibesb5Lask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXhM0JgP; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXhM0JgP"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so604032e87.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162413; x=1790767213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=ZXhM0JgP+Kf+Xeube0oZhVR9/zKczxkkmyccdUEZyzyVtou2QJ72IG2uYmb47qVGTK
         hzloUB1iFlsscp01qN82+9ZrtVGQEPL+OCFDGjwc9MJ6p1pXONvA45y59+W5o7oI3IW6
         OiHaRP3vXVNILza0zL06wg2MMfaortp0JqqnZwGueTKMyHstAlpD8jHjiTzvcr63l74D
         EN9Yv45SjdB5UN1ymPAumCTYvCAfpASuRZM8koUeiI2mWKEjZaOWACEyC9vWXWZEZi6T
         hipIKxRk9HyLuDQLO3xF9j7DeG908uUtGKeU7MEMN2ArtrtQ71N6pM6YzNMHA4EQCSTF
         lZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162413; x=1790767213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRDlTP7hsAZWXJ/hltAMOaBzG6ysfKykEYUSygKYXcs=;
        b=r0VhosWjJlAq22uWqg6gJV2kDER+drBEwqT05WBu0h0tqcVZ57PG7qJdrdsUMyVZ70
         upGPy/tKzLOH0sRac1lkje54uZeO8BKOkxbVuImOg0yi9RibaTsTchlIrOzp3Dm/Gt06
         eNSPZYswWMJfNKrTvLIlV+HhrZOHAxe/iPkbnw2U7fLr1bFqEIEeqGffblOsYbOMdMQE
         wSoQbJTb6p00wxy395xFeH1ohJVecxUb9Z9wKLd7htdtmhEseCOWn3c1a7+gOxmr2lVN
         IVXfSUgA1dZe/DXXLESL9plVS1UCUWvQTg+QG8kWskT4DJ0kT2RdZMZJEGWY1iwV4DY0
         zWHA==
X-Forwarded-Encrypted: i=1; AKwUvBw8cIf6S1blhzouzPEYP0ZL4e7kGkZsJh5Nrj2bgtNoCpFnuBFnGUEMpzzsxyHcbCo4s5gkd85H54WT@vger.kernel.org
X-Gm-Message-State: AFuF++lKvfNWucCxNsIvMxA7/yyQOGaZz0yBsVGhO+NmscvCmi1SrD6/
	/TkdmKDfdfCtyPDiVl7ilhA8aSJE7TcpnecEIqrW2QB1L2CCR7AxeV42
X-Gm-Gg: AYBFou3Bk7MEUwGpVPg9iZQ7CrIlA9TOvm+5hGfkGmzQg2z2HMBrqGcQl0tHUsQFgoN
	hqXJHNnp5cOvSKKiPLzrX4sGrJdpsoWAfjuUhdB9iZFz7RPlTsgmXoYbHln49/+3AaIQKaOdAnd
	4XtEakF2LwDBnl6YutswoWQRy6KXZnB6nF6wnDzzsuMEw+jtNuoE3ChhyuhNwROWW5u1FrE8Ith
	MNLND7vxBloPKABH3LplmWoNCoNOeAujfhcJRkkoaJnCh2VrPQORVxkC8jAyDvV4m2v6VIbrFZy
	z7S3rkXV8dNadbNFk0pFkLibAIKBQ+0g5e+eSZVVOBZhkM34kJ3WhUPOyNXyZsJmuVrYKE5Dmjc
	q6iDGt6rTbIX+F1vaKjjv3dKEDR4UJ/LtKkqe2leJ5cnf9yKjWzFwZEqZBI5QLZAEJ76HwO+Qtb
	nxP38CGIBvM0ysdpIfWki4QInvMoPsSinplrFRLTg53zfWA4Ve+xhZMHvSLgVsD9HU8InRE3UgJ
	Y91sX218/y6bbbfCazTS4YmOy31cw==
X-Received: by 2002:a05:6512:2252:b0:5b7:55ba:1914 with SMTP id 2adb3069b0e04-5b8d8967ac3mr763907e87.28.1790162413121;
        Wed, 23 Sep 2026 04:20:13 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8595cb6sm516505e87.82.2026.09.23.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:20:12 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:20:08 +0500
Message-ID: <20260923112009.1062-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923112009.1062-1-anykey196@gmail.com>
References: <20260923112009.1062-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18) and
gates the RTC 32 kHz fanout clock (PG10), with the 3.3 V and 1.8 V supplies.

The pwrseq clock must be named "ext_clock" (what mmc-pwrseq-simple requests)
and its output pin must be muxed to the clock function, as done for the other
H616/H618 boards.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index ff9b40352a5..39f580af15b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,45 @@ &usbphy {
 	usb1_vbus-supply = <&reg_vcc5v>;
 	status = "okay";
 };
+
+/ {
+	reg_vcc33_wifi: vcc33-wifi {
+		/* Always-on 3.3V regulator for WiFi and BT */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc33-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_vcc_wifi_io: vcc-wifi-io {
+		/* Always-on 1.8V regulator for WiFi and BT IO */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi-io";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc33_wifi>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-names = "default";
+		pinctrl-0 = <&x32clk_fanout_pin>;
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>;	/* PG18 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc33_wifi>;
+	vqmmc-supply = <&reg_vcc_wifi_io>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
-- 
2.55.0.windows.3

