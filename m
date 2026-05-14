Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0043B27DB
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753594; cv=none; b=s4Ob6+KBWJ+5DtzvbGrqDQJkwYan4jeSyoI5TIxHaS39qEiOkmWExGw5G6e/BWnqDrXv5/pqD1t60c7ETe/COAqvu1gPWGeBGgYPbfnCqwKMfvCojtfHEpIB1iaWB4BqJdWMuxplnPMN+pub1EYpRPiiq9edwLbIV7CDi+EId+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753594; c=relaxed/simple;
	bh=ZOKJ35jfYNu1aCxNHaNZtd3gBg//Hbr1duEd4BZC1do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj9Ho02S889B14GqKgorScIqL6YYhZ7iW8hp9v/wFZfRpq96hHaS6x/JOBOM9whCzvb/zg4Q3f0zwybmG3DiNPA3nMI3zF2sEWYhM+VjhXvjFITniKJRkTF5RBPlHKPMYLHeNdl8jS4bdJbGP04lbwVyn/vUKCeNzqVu8C0E2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I/Dcrpxq; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I/Dcrpxq"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82faf871346so5756937b3a.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753592; x=1779358392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=I/DcrpxqrZWHFq6xlz2warqShRpU/mTL9FfVILnbuqHa9HRSgzlCKJADfSTabg5SmZ
         mYqsFhOlwJ2jggx7CqGAe+bKaHaQHZOJZiCZhBo3/UYhxQETNZ96PakArmYWvjU1mk08
         192owHo/S6FYGh7g136IbbYpbH974xHwoD4Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753592; x=1779358392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6ywYk7FLqn3ZWRTSSAPnaG63s5r8m9iMZ44l9N16Yg=;
        b=ilSgDRVU1fJUHupwmIB5DiXDUeIAoZsJWhf7/c3XYH35AAri3a/BM4u4IaMhkmKg2N
         M+X1EPqxutd6CJVjydVJSAva6T1D1bccnQv1Ei+uZ7R8WgneBJqAhgPGcXCEQOIVsSBj
         JD0jRDx6md8JkOklxEsa9sEncdc+sMCaY4SGE2VMFa09iaxhN/5HMmbooSp5yN17ji1I
         oFfseHLRXT87R5b3oG62c7N7c6nqrPo3FI7G/0ZcScI/CPAO+l/8h45NtiMQuAF8bXxz
         vm5USXN8fMO05RZTrAs8hb0JJtltqPrTrVWItgKyqQoUM5RpCcS40IBJ6bYwOIzoDrOq
         n7vg==
X-Forwarded-Encrypted: i=1; AFNElJ+jQK0UKzqR5d4ZLaopnqC/ej/MLrwC9RNPflNpmq2470wOFHBdBMe5DriWEIPeaL06POdJ6Kj0Fv+/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw52dIpQMj/JZcAjAC/DQgk9/MSPIVgk3e3zkaIZzqHtDvHZUcQ
	nEUzH/T6XPFslBZFSAidseVCO0iUW5tX4q1EK/ewX4ZnaeUTbXkv5vbKAX7rEgbU3A==
X-Gm-Gg: Acq92OG7Y8i8WB6FIXNWqCdek1Jn6NOVf0eskldrepAvncM3r9F/Z4NaQXjv88p2urk
	XFsvIIkqmhfoxoa/v95tz5zQncTQm37YJ7FfsgC8Jz50xcVA3q1OaAwtB4qnpkCCfnzbSTbHKue
	C/VsrQD6Sgyztg6LNXt1ksrPjJNBrergrW34Sc6D1y+bgOQMd4JUVFYpEkuoHNitne6JBYTNDw6
	f+jUQL/j6gyuTwT+XdefsIHvdNn12jA/f06KoToVN7JL8tJWeUY8B5rTNyhuKNjoPgtzncA03IJ
	kO7FlLt/38vb6xHOphallnCAerxeocmHzK/J40VLBlB7UOgkPURgf3pHERFR2v4lPGd3mhVQLED
	COkbgLP59jDNP33s/mB16ZCo+flSVBVM0Dh5zr68Ld82LPMQi0023+Vd9DuIU3Ldil0KKbOeng0
	PBco7C6DcQlpiYfNpTraLozFCLXa7Oz/WOWXIHm9lvH5OIEDrkkTx2gTcCYGnYCKLiEgJTnbqlI
	UD56eQJIQt0TruRPmg=
X-Received: by 2002:a05:6a00:439b:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83f03fcc5afmr7790644b3a.18.1778753591788;
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
Date: Thu, 14 May 2026 18:12:52 +0800
Message-ID: <20260514101254.2749300-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermistor device nodes were added before the vbus regulator and
reserved memory nodes, when they should be after them, based on
alphabetical order of the device node _name_.

Move them to the correct position. No functional changes intended.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 94 +++++++++----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 538c46ada32b..ef7afc436aef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -149,6 +149,53 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-boot-on;
 	};
 
+	usb_vbus: regulator-5v0-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		enable-active-high;
+		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xd80000>;
+			no-map;
+		};
+
+		afe_mem: memory@60d80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60d80000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_device_mem: memory@60e80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60e80000 0 0x280000>;
+			no-map;
+		};
+	};
+
+	spk_amplifier: rt1019p {
+		compatible = "realtek,rt1019p";
+		label = "rt1019p";
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt1019p_pins_default>;
+		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* Murata NCP03WF104F05RL */
 	tboard_thermistor1: thermal-sensor-t1 {
 		compatible = "generic-adc-thermal";
@@ -219,53 +266,6 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
-
-	usb_vbus: regulator-5v0-usb-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb-vbus";
-		enable-active-high;
-		regulator-always-on;
-		vin-supply = <&pp5000_s5>;
-	};
-
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		scp_mem: memory@50000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x50000000 0 0x2900000>;
-			no-map;
-		};
-
-		adsp_mem: memory@60000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0xd80000>;
-			no-map;
-		};
-
-		afe_mem: memory@60d80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60d80000 0 0x100000>;
-			no-map;
-		};
-
-		adsp_device_mem: memory@60e80000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x60e80000 0 0x280000>;
-			no-map;
-		};
-	};
-
-	spk_amplifier: rt1019p {
-		compatible = "realtek,rt1019p";
-		label = "rt1019p";
-		#sound-dai-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&rt1019p_pins_default>;
-		sdb-gpios = <&pio 100 GPIO_ACTIVE_HIGH>;
-	};
 };
 
 &adsp {
-- 
2.54.0.563.g4f69b47b94-goog

