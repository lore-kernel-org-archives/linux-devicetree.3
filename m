Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838A33ADB94
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161087; cv=none; b=JUy0Qk1gTQvpHhDRYkhXnexAd8HHRGgggSan/Clj+TH+kPGtCNYAb2EbNe6Wtar7koknk1UYlaeQ2BoGFupIh5O3D4hEHlu6H4m7fXAQ0YfGXMDRCUqrZn+Zja1XRJsE6M1eVDWv+3cMLZ+gmJLE/yt8A37H3l4P177Nco8EeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161087; c=relaxed/simple;
	bh=VkwdKB+MXQWKmoYFPDHYwms7Ci1KdIZEugREExK9jsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmZQWJzxL92nAvefMqZWXV5Eeq1Ugdf4sGo1CCG2SsV6DQbXVlVyuVArtwByjy1iUcILtVV2qTKh4ZaPBZxPoMe667Jb65Zcwdg9a50anwwXrE9PuRx8Fa5nYXixNt8ZN/jDwf6Y8PJyr9aXn2XTGrnsfa/fKtpqfFvgcU0x8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r05/6MNS; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r05/6MNS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso605936e87.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161077; x=1790765877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=r05/6MNSgAH0yuLglMIxpWaNzJiZ5I1r3Y8/A0AMZJkVYBAGFRnEyoFn8i19vj/V47
         w1VTzBOpJeatNr3wfg83Nx1KLoY8GGR9W1BnxN/raUaeSmaXKj6JeZd5ArCeusPeYsLT
         XMIDxY53T2CaldayjBQAkVlJAtG1TB8ypF4Cyz3wdjxdTEk+L/7hV1cZZ/4nTA0bGr8M
         7C/pLKGR1e5vggREhuHgBFJ8zAjsl2z5TyMEB1NYruTcLoZLGjG0kklqbksOknuSL4tH
         qolk0yZ7yckRbCuvx5qVzvwxuenG163kaOijAfEZcJhty185iyKa29xYls1ELpKT6tCw
         4jvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161077; x=1790765877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw6Jfgol+yDjTzgndHSV7uyj9H85igiM05o9ZsjDnik=;
        b=PXZ1X2gwc2cWWyTnv0y+K23QryTyvtPsRDYjaKNBgCAEhELsELqXwkWfPvlUKuBxy3
         8tj+xv1+aKGQ9LMgkEvtOweV7Xh6jminWVSr5122lhXne5YGvJR3Xm78/XqdcvzyLZRY
         0IC2Ngtkdc2UdaordXOwi93p14HisKbiJfeE2Yt+5upS68QuiC9R4YhaoyfnxpS1pHKD
         hHTkZENPukxstPElXfRQgLhIIM9rMgUvH5a//qlbUa05AoN43NGChGQZpssdvk5z+Van
         H/r+J6MfF7AhIZk7ikl84vjeLmnMFSQ0h7z2C+xjlOqDnX5hUP30STc1J5Y8VXsiV9WL
         xTdg==
X-Forwarded-Encrypted: i=1; AKwUvBxkXkWT5FU9+uQp1E0JCzF3hBVB84s3C61QsN34Pi9AFlZmVfMjw3G4xmwPTD5nM0EguHRwRNpeoUlS@vger.kernel.org
X-Gm-Message-State: AFuF++kR4re528CCGhoDc0X800AaQ37UWUaO4nbuujqnRRipV4xpulAf
	Uqe99pTsOMc5c7s52xeR28pY+iwJ3xifFQsJYm5NFq3B0MfRL6nfMhZd
X-Gm-Gg: AYBFou2CGeb6NhZQHS70iA5GTzh2U7PaEjTfw3tGT6PU0Yn9hSKYTY9ValdFHy0OdoB
	nnq6FcFL/5fETr1ToSSEG78Gyaeiz3za5JBRo5EHTNo1BDgSjXHnBbPvP7i33PAAVx4VQS0EK7V
	nUcoAOM1GGgWKwJhdNR2cwALc1+huvVevyzCKR+JnLFVKcAJM12jrlQinbgx701IBozyOr/1781
	gjkT2WPBbkfaoKSUEMBm/E9lH0csN1snGKpVfPGb7HiVWOCH9SBVtUiDkd+0tVe2reP+dFaP5pI
	s/4aWGRiuE5SvmGQ0mDaa9o+V57iOeybw9f1AQVbsMYe6rGN5c8LvZeT3Wn/ZmkXmS6I5ZNpuk8
	F2QrC1IfTB0YuH9dl7uU0n6MVE4JqiBAWMOrdJgoSvvpEwmc4ZYfp0WlK+LJs4VJInvBzEdfB3q
	dt3/NGFldNtKvv+3FB9eRdUtQw6Dkw05aVBh6XYeIpt0PFz5eQCYdj69jfcfzIgSa4CV2W7NhY5
	dmkUT/4Sc3R8EfRjCc=
X-Received: by 2002:ac2:5696:0:b0:5b6:1a7c:59db with SMTP id 2adb3069b0e04-5b8d89c2a3dmr808727e87.53.1790161077408;
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm506392e87.17.2026.09.23.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:57:57 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 15:57:51 +0500
Message-ID: <20260923105751.435-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923105751.435-1-anykey196@gmail.com>
References: <20260923105751.435-1-anykey196@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SDIO bus (mmc1) and power the on-board AW859A (UWE5622)
WiFi/BT combo through an mmc-pwrseq-simple that resets WL_REG_ON (PG18), with
the 3.3 V and 1.8 V supplies and the RTC 32 kHz clock.

Tested on: OrangePi Zero 2W (Allwinner H618) with the out-of-tree uwe5622 driver.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 .../allwinner/sun50i-h618-orangepi-zero2w.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
index 1b690e3cd..3ec060228 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -218,3 +218,43 @@ button-1600 {
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
2.53.0

