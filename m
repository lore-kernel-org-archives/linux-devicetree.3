Received: from mail-lr2-f22.google.com (mail-lr2-f22.google.com [74.125.230.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C94419FCC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161667; cv=none; b=hgqhEMiUXEb2YLT8LfZN2tFsTWZ4AYW37fW8lP66gHSmyHpWaGcU0QhvFjE3sRVYP9Q5E1mp6tv+r3IasDlDwrapRnEZPf5t+uxLZjDr8pc5gKUWH+kG0dcGuHTxmMomnWF8v8r1T6FmaqDdGJOx86rrNV1l/y5wrKv/59huyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161667; c=relaxed/simple;
	bh=xtOAejtWejOvGymCLEMJYwRbC9yecCdHVku2MEZH2vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poHKeVh8RZDkT5UdcWYrXbjOvp/TSkaR/1h0YY48Eifod1DE7qA84/FP4LAJAbMMWKWrVdPztPLavIkk9nf0DSTuDFKMcZbFoX1Mk85dCMEoLKht4vEZUTxa5s4Ly4rWjVQ++cSO5YEeNQrDejcHcsdpF0LKvsYCBygEPZOjEds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRCgAOaw; arc=none smtp.client-ip=74.125.230.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRCgAOaw"
Received: by mail-lr2-f22.google.com with SMTP id 38308e7fff4ca-3a2ff04155bso6645701fa.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161663; x=1790766463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=KRCgAOawLyRlabCI6oOGo/eViRBO32bFTjLxMPq48jvHkqNs3bYglM2hwLZbNLlkyp
         uslxN9R0KQjXFDBRom3g6BeDvbaVPRHcoxEC9IyukVUZolKu8PCKO0NzlEnfbosz0tTw
         zZ4VljP/ynOnphOiolC586b2yv1KnSZjtDIUxHbr7L9V5yuLcfw9u07jFHq8dILeYK3i
         sg0BY7wl4zpJ8xAPa59Sp22nRQQFcCgFUOqV0ojrr/1k7jfd4k8qgAFDEuz/Tz75tXlK
         yQUd5ECn+kHQQ1N5PNfgmiqCRb0zqDwUe/uvJsRbq6j41kB5VKhHDVpUiMuJ1A25QSva
         KnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161663; x=1790766463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGzrQTM25YzeF6Zl6z9UWlYe4efLXilZQQjl4hlshtg=;
        b=D8obW8ozAhUbcdj8xl7K/Jnyk66lOz19L3cceoxWf17eAUA0NhdSa5cSFGs4OuydH4
         Z1HB7D1ggRlKRPl9QsyTYC9sfIZxbVwUNCHG7oAT9rq7gldm9+wVpvKBXxGuOXT1XdJZ
         VME2/9pg+Yye9yTuyg2+UlLOqoZn7g952VAgvFqKBD00Olg0RA26zVFaQbJr8ECc280p
         DqreQCbckesXWvBhXJLY9/Q4iRJ1z103fUAq8zJ7qECLJMHTLKIzWlYLPQu/s2ZIXwVN
         GmgbC6Yn29JYOOv8+JiPhl2x4jPM4guHybVbJM+4ShvMW2NPHjR8h1ib/HTb6hUvMiLE
         eGRA==
X-Forwarded-Encrypted: i=1; AKwUvBxG7qlvcYS2aqP9EGUaHxtCfMdfAHb03ebokM47D4O5Ao2njdXRYoVddpWJizYNeO4GMApiXbXfXGlU@vger.kernel.org
X-Gm-Message-State: AFuF++khapqyZeE7hEup4gr6FYoLrEb/xjANhm67A5rOyFzc7N6ZS+1v
	lwsyqvjZKqA7O1LVRsiM/QBBFYoCQvw+wTAVdVJHbuIRph8WkfBAySGm
X-Gm-Gg: AYBFou178fSH/15lcEpu+pjymdlnsA4Q4cTSMCeQV1p/K0GcLdgjvxBTPbx5tnMZlQ9
	saUZ7RXp9QUrvTk5luXICfTD4cd4QQfsisOIxlXgWvJa8DRRUd9nhjgvAdphuvtwccfF1bCKGw3
	gIHj/OQAfT80FvhTmQ521YLUhDps6oGBi6lXHn7ThF0Ujj31vM4P4sqlity3o8qU3TwbQPy1GQE
	fd+shDEyHwdPu3a6Nc0ukkzg08Th2WD+sbyW3PIPcpdKGujpb0zQLuD0OcgwYRZAD598CCXtqBT
	l4AZkX1igiysNlTR9vqp1XoviwyqH7GTzxg8oKFhfwzlxmjOqvPCuyqt1PtIDYRbW4qm36Fov/x
	rpm5JVc1M37ZJVVWXkI/rU4UgjsI4FowkH7kvh7UpLH3UBKex6ZrMylXLcHuaHqVlGDA78YYse9
	kPa88YxvLLlcpaLNGtF1rEwh9M9kNETAWB1I7q+O6zdwsXSSboZ5OC2/rLnFxok+kB41IrPATId
	vBqvBy02t4SU8AQ8asA5j+eySlIqw==
X-Received: by 2002:a05:651c:4ca:b0:3a5:b0f1:7d56 with SMTP id 38308e7fff4ca-3a63050057cmr5356761fa.0.1790161661320;
        Wed, 23 Sep 2026 04:07:41 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f2f4sm521750e87.65.2026.09.23.04.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:40 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h616: orangepi-zero2w: add SDIO WiFi/BT (AW859A)
Date: Wed, 23 Sep 2026 16:07:36 +0500
Message-ID: <20260923110736.10-2-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260923110736.10-1-anykey196@gmail.com>
References: <20260923110736.10-1-anykey196@gmail.com>
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
index ff9b40352a5..7d473274c06 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
@@ -189,3 +189,43 @@ &usbphy {
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
2.55.0.windows.3

