Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682F647535E
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160752; cv=none; b=bRBHk4d3mu7JC42IGO9Sjc95M5U65NU7HzRb3cyOPx5o60g7NzzEDKpNV+tE8LnxdaLh757BQx3AxerRT1VGEa+IVgIlbCayb3qCE5lAZhwIHhmz5cfBzRUnHigSk9sRmqORFazpfxyDJAu13LW1kqGxOcqRSsLQbbwLli2E+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160752; c=relaxed/simple;
	bh=+KflBh12ZZZI8QcMSmdzFFhMsVPlKrJGgBcYyD3jgy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5rJYgGJ4kxhP7/RZfIIKUuXrWyV2H48uVs2/84kMEG2mu3FLxwfP9FSUFhSc/YkxFrGakG7s+uiEJ3kEWxqvgxaWRyav8Uho7o3+mst7kJFY9BnUes8x0EuUto6o8msK+UkTlb6R7yWKgmR++gjEsJCctm1V3dQ94IiIi5Yv4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOEOrcQj; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOEOrcQj"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so570705e87.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160735; x=1790765535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=tOEOrcQj1Ym0hjwELmRiERS9SspR2um+3xzGQ2NnwIZh4Rui8AgKH6LF6aRH6iHoxN
         jfXYFW+NMNYT2Q35x8dIyDR0Z04RUx3gcZ3/Q/5MDQJZhb72DLAQeo97grtHoMZGYeQW
         TGCMQSV5ySlxOB3oyKQInYoyqtgwXEESdFaFaReGWkCoi14+W1u+LJOFPwzvq0HZrJwy
         4fyvGChaKqBAhc62lGURcMeSeNGXAuZ5/XeAeZBhk5fD+yEZXEAyDyqDdM5NJWpVhAZi
         2QD2R1gJgYEJeFnU38HkoK5YQh3pypWPjG53snQz46WkuH56Alx13I4UZj8nAT9WT7PL
         xnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160735; x=1790765535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=te0jTNRuKHVovCSM6AumUlGdx32zhFv1qUdk3kswgDc=;
        b=Ye2shW8NbEQIThjehib8iLgUcf4iLlDwHYFxZNTxmpSHTWGFMDeoUFH8WLLyS51bby
         kSBN/kjU51Zqop2TYbmeJU1wkUFhs38kPwBJ6KfLVgnkmyd95pwk3sr16LcKpPbNvRvE
         8NOatPWUXUhjs9GoSpj7duQ3x23PMoLg1lpO00rqmQgDSSk/hwhUzbyNh2ml5OiGwD20
         QfNVErvptTEhBoz+R+dSbr4h47GFIYhnQeZum/GVxK+4zd8g5LOVwEXmNRZqVRC8vPDE
         U+V0F0ay+3dwLiFVwDWKqGJiQHsj28rml1MD0/b2MO/bChbfRK/bPqeuqT2vjRDSslR2
         YfTg==
X-Forwarded-Encrypted: i=1; AKwUvBxYMflUtWmWkAldkVSKsDg6HzOhBTP1uJa2Ht7js0cwJ1iSHVViEllHQi0dYLKJRlrscla8J1KYabS8@vger.kernel.org
X-Gm-Message-State: AFuF++n8RHQxLLuzlk4fnVb9n5sA0mjgEThoPJL9yB7pu3GQ35n2FX3t
	+Xmccr+XdSMtoo8JVyPtPt5YDqV1iF8N8vLR2/C5QdGAWY8iX/XlRZI8
X-Gm-Gg: AYBFou3M0jS5bex2+UZIDGLEh7zkhmrnw7c7/pLhkPTFymYfeSMTlxo4622D+YdGGfn
	wO354hiNAM/KJep4yop2Yl/4Z1Wt86GgCcE7MHaB+JPB7SWFijKN7wKnHov61qNLOi/cs4xZMk5
	PC6Lm0mU+fd1sXH64lVI/mEg/h1C26OTXXPSjTrek8X3XH2WQko4HUg0XuBUUOE/L4U7VWFBafE
	C8WS0eyPDdk7Pj9Yzqmb34nFUu7ubR7pDqCkqP0IXC76UUSacw59xns3ietyKSoM/Y6AuVK+zMU
	vtqHRun3IEyAUDffZvHEueK6axIst+YH3NWVGK4GSMlcB9d5/DL/iwdCowcvspQrkC4mB2y0vN6
	V+Q0aBHOP/BpCUdXFghBiVAHcgqV/8Coh4aKyzVFpH1L6HLoTB62zAokOTa14LBOdAu9QxPGFL9
	2jIT5K7OTkTjG+ikZltoLsj/Nbr3jDXidWSln0CLu/Z9420f/6AJDxs9EaesArS8JfPfoK91Fnc
	XXXQrjoxJqoEnRM3i6wKa2mlb5VDA==
X-Received: by 2002:a05:6512:a344:b0:5b6:183b:d214 with SMTP id 2adb3069b0e04-5b8d89cf47bmr634761e87.59.1790160734896;
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552dafsm497428e87.7.2026.09.23.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:14 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:52:08 +0500
Message-ID: <20260923105208.198-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105208.198-1-anykey196@gmail.com>
References: <20260923105208.198-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladnwx <vladnwx@users.noreply.github.com>

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@
 &ir {
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
+		clocks = <&rtc 1>;
+		clock-names = "osc32k-out";
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
2.45.0
