Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694829;
	b=KuioihAaD2CXEybYTYTUPBLv6HqAgtikx4JimKVrkMb++lK2uJkf7wRZoCXC3prvTMXi
	 ZshgEuNhwojbxI7KfjTUe6PtPEUUJIz4/Ngronf6k8PTdYvVp/I3VmIG/uQjKVp79hAJA
	 iu0fabuTvUdn05NHrgigucH9DHxNbplfb7iCVE0pVG13qSLP3kQxWSyST7F0fV3GRHEuu
	 rmla+DZSX3X8G+b9TW4FB7VFWv6bl7oQGFmHJvrBrZ7bs6VgTGogVi9oIUtpxBQyHguV9
	 3+zM6fY9+vPRYWfeZGcplcjwBX2Q9ubPX0PNpXXRJhN0s8VyTAcfo5mGFxa4tUZw8Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
	b=qA4l1ge9hImj3tuQ916nnKsiUncafjjTMovUrlpmpNIlJra1WugumA8S72hcnaw8UOec
	 taZFzUFVCJRJ+nGJ7IIYJwk4acZp7UErs9jDEQha/C0+idA6wKXFxDCfr33IZ2SiHAzWk
	 Abh05J6yTtTMzEhrkt4Qp0DlYqkvd2jfUF+RwDHAVq/aQSx1fwjd6aaxIVWJfHl3XwYyF
	 E2EsHwql8Ru/PnXi9KLkyctfNNrUNWUbFbnXH1MDSdziaYXQX8IPZV14IfOClx9WyFhMa
	 yixMoVSV0lcjri5OgQCYMp9kncKyG9Vl0cUCSypa/kVZDdFvT8QhsYO5/APoebu06/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="n7Quj/AH";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4C6076B93
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E4C6076B93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n7Quj/AH
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso232904a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694828; x=1794299628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=n7Quj/AHbVM1a7RMGssrs4u1o405qZMkK08mi2hx0bd5P82SfEAsds9sCZzfGODbr/
         5q6+0243aYdk4GyBOia86uhWzCr0DuUY2c408pKqwVcgTkjOzBbCWikn8E9zr/aqxc1I
         b9HTzlo+a/5RHDaSmzzgy5Ly89w2k0dPCQz2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694828; x=1794299628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EmoljQi0147YiLUFunyMlClRhQm9winwcBqrIvSVOGU=;
        b=kZDKxL29AT+zYNpebof+PQ7NZxEB0KKfGn8k9wYQyKycHB5OYUu1jnqpAdWhS/fL/P
         +l9lADkuhOacyVQORulKa7tYV4BIXE97eLOti8HFvxHbBNFdJ0V90N4XPOPJN6c7C3yH
         s9rTAzxQPvVQ1IoFaAVpadR88oHUgwM1zVAZcp1KIQ3xifK+X85mdAINB9wdEoK5suDc
         BJmFIRrfikuA0KaOvYJq0VIla+x8+7/2HmQBUD3059/8ksc8Lv4O7elpTV3KD0DQlRiO
         iH/dGEGJwpGceFPUFpZwxHQisLyE29fYo3H2sIFO+pV8oExeFhUTwQe0an54lAtSiGFK
         tjvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/itS85HhUX4E8TOokSex77lERXneMkUDFDJckQscLwIwwKaRCktZE/W9hY3mgm86MVxS2LoaarApG@vger.kernel.org
X-Gm-Message-State: APuU4Z/jI/ucOUyKeUW0gvdoGPtGWDL6E0bWw3lLj4m49r/VN9lCG8Ui
	j3yEUT7217lyRfhXajqwwk9Ni6VA2tC2a+X51zxAo6OUPTTuaFBmuvckb2wE4vS5Ig==
X-Gm-Gg: AYBFou2HlrFasQmeqVmUWumw9KqcUPoD5TDQOcJWsTmMK1T0syS4JJAx5/OBEXebIkL
	hype6fYZw0iKf5YYwWWkno91sC1VCzf7NqrTngXGTz3xRyXQlC2Bg0lK7xa50jEKOjO/4ZKDRCf
	BrKYqyvI5bnjLmRzAGyzN+QmYqLGJFTfqjf2ngB/IovAUOxA/hbMxKVuR7ngblGBEBQHCT06+Y4
	dNxsNxfIH6bCxHGpEB3CPedtPpoMikAOJj+cxmStm9q/OlJW889GSz4SPtroTdMOJkBicn0gZVV
	62TjyD2xcvngEDYF0PMRU51T4R3nsEzc1H8Hha2On5AfJTd/nYqLHv8MXApsxWhrl128rBZ59Ip
	9XgroPMdUX2rFcPMm7ok6BMTsB6hNe+i3ZcY/P27uH7yY+PlZ3aXaB2EjjF9lDWgeYzQBiOH7Io
	hBCjsnBSiZzuP2X9ddXxstqLvesBmVG9euomaAKN86z5z43QrXNkxupvvB+4LALiKCIVunPmxZy
	XXdHjIyQ1bBANB1n9BwbzUnIbMVsS09c/wD1tg+JilSMLe+5zEdQVgudnyxlEMz9NFO/zo6J3GI
	UPKDj8hya0B44qGy0XaNmN1egFDUZwIBQEKyk8gSUgG2KF+e14JrWp/q9tvnsn254ng/z13iTmG
	ZAyJP3R9nVOcnMO+EuieOXaT5o49OmIULOc4=
X-Received: by 2002:a17:90a:e7c5:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3ae89559886mr6852208a91.6.1793694827794;
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Tue,  3 Nov 2026 16:33:33 +0800
Message-ID: <20261103083335.2944847-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
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

"pins-usb-hub-3v3-en" listed in "usb1-default-pins" is actually the
enable pin for the USB hub's supply regulator.

Split it out as a separate pinmux node attached to the regulator
instead.

Fixes: 7982bf7ec2e3 ("arm64: dts: mediatek: add device-tree for Genio 700 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 821dbf9d3fc5..5f41d78df685 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -216,6 +216,8 @@ touch0_fixed_3v3: regulator-5 {
 
 	usb_hub_fixed_3v3: regulator-6 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_3v3_pins>;
 		regulator-name = "vhub_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -1256,16 +1258,18 @@ pins-vbus {
 
 	};
 
+	usb_hub_3v3_pins: usb-hub-3v3-pins {
+		pins-usb-hub-3v3-en {
+			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
+			output-high;
+		};
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pins-valid {
 			pinmux = <PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P>;
 			input-enable;
 		};
-
-		pins-usb-hub-3v3-en {
-			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
-			output-high;
-		};
 	};
 
 	usb2_default_pins: usb2-default-pins {
-- 
2.56.0.385.gac671c819a-goog

