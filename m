Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D238839F
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919497; cv=none; b=TBXW8OaBupDCfh48v4XsdNJA+1etd0/ff0ZwdJEf2ezcUoVPlb5/+L3kwA8mp9eRFPH3ibGxNvJ8C5RGpPLe0knDKEdCywNHH9/50AkdKjAEoCXVy9543bNSE05kQdjf4bJDUMCQJ5y+0s1IJW2Oz4Zhi7+51E3vwz6slVbR58I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919497; c=relaxed/simple;
	bh=aDwPIUOhLISPNgSObRWxfYDDxExbNsQWmTRb2VnYogA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZuqUlA6DJcNXJjD5RJAnlGKAd4idsSdgi07PzwnSTVhqSEK7scZCFxGrU9Q8X2oEp/bmstYzQ91OjRh0WFHaYNBYr4X0C1f8VTy3KV78WgjG4uVwlC7Ds/i/fptHbMKqWSLwtjdJ86kfn7/Uifk23cgjrrOKeejuGyHEfNo3/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Z/7lIvS/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Z/7lIvS/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso29129875e9.3
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919491; x=1776524291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=Z/7lIvS/axBhXBQyTFdCqEJMsL7+PkhSehLZntTu6No8JT6Vvsz/uIpNYmURLJDIAg
         1RJhJ4jhmwzqwukG+cwsyrt+4G0DW3megYkd/zlQKF83os0VLoNK8OCRXVG0cvadtKj2
         x+0gsU3+xasIri2Hc67KObbllq6m6RWC/8X7YMFmSQQHjEnfM0EUiIFC8iEmJLX72wvO
         NEQ3FyNCGiravDlcs8+fzmGYt92B0M6AMnM6fz686Z0qHLkH5PSXxRozG2Med+jCmr6O
         qI9JP4z9rpoUIi+CPrvyZ7kXdG6ZYFL9muH3Nyv5S3zXMmJomLV6pQhy0QMK5pI1Vqo6
         RHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919491; x=1776524291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KrO2iFz4Z0GuSJeWJfHrEvIwriyj07FmYaMKOU66HDg=;
        b=r2tc+P9umxGSQ3CncgMmR7AYPXLSwgOS5jOvy1r7RLWPJ0Q4z0P8Iyvk6pXRPuEoA3
         NOlC45H1hmTWj5xutsZDdsGxYEXvuyxCcnqfyaS0o5z+TxTR0ozqk9t6v0EMrDW5NpLv
         DqQoqdMtMzM2h+mzzd4M2eJH4qnBBhuX6mPIsmlv7aG3/Zr0q6Y2Ah1FctfR8ExkphD5
         bEl7dh2eo96O3ILgGVWF1l4xRVI3EkmDoti19H0Uk5RQ/wXktUcmkmjIwXO45KEUep3a
         bCKz5VnmaxpoNYcOyh5zsheQKnRzsN7QLApi7hKLgPlP1DX/2scwVZ8UcYfN8izXCSk7
         BlNg==
X-Forwarded-Encrypted: i=1; AJvYcCUAM71WJyfqCOaGCHB4DT2TNRwSVKYfrvGi0E6e4BgpR6dxhMGIzCFwbyqQ39yKmSFE1wjvH0Q7IOKm@vger.kernel.org
X-Gm-Message-State: AOJu0YyRct85Pa968YCrIu1BLXCPfO13E+4YWTJfTQN3lxLucE9UqTJa
	G0LUEF6nhbvcw020QAmSb14HDnh1KMnflVPHxppSV1NMfK1f3dZDQ3imZq+eB565YnQ=
X-Gm-Gg: AeBDiesrj/IWEshxs9oS9bSt3sgHk8FNe4KrTdhsS5jiTZHXYdm0cI/6faZZn0piz3z
	axAteohfz2n9DDv+bN391G6LC+1qV34I9A4qbSBg11nx8f8AFnudN7YhtJgTXO/+UTLyM8Q2UqY
	bH89YwDUest0LPYIheZe7LoGn9GjFHJavWCG3LyD2Sv7GZpiJ4P1jG3EzeU/S7eqL2uzu7phFnr
	zTCojaHRPkK87sJZB5vTzoOW5vVO6hyi78ONLtZ1ognrWfuKx4qC61NLZvEi8n3BLRT9gdgekOO
	8ChKo5MJuCalaBcGDaxMajn3oE9ufD51cs2sSMIlaPhPZn7RaSk9w/vp17+AxTdNlKFB8ZkWgt0
	yZvfjh13jKTyyhTIRUBAOC6fx6pL1iDXrSBC1NIQ1QPWyAXq1jPSU43+KmQzZkI7HXCfEfzZ1Be
	aBNBzAyi90F5ybu8gN57Ev
X-Received: by 2002:a05:600c:4504:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488d6868606mr90101705e9.25.1775919491498;
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:35 +0200
Subject: [PATCH RFC v2 10/11] arm64: dts: amlogic: gx: add nodes for AUDIN
 decoder and FIFO
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-10-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3024; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=aDwPIUOhLISPNgSObRWxfYDDxExbNsQWmTRb2VnYogA=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkuEXh4QS9zvce7AJ4Hcul29fcbzhSO4T5RvKzsrM
 UfodUBCRykLgxgHg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACZiE83wT2fmrGSHy90/Kt8x
 uhU85PdLLk3fcb9K2IovhlG3WtlDjOG/u+fOMjMLrZVHfSOcDrluiVfOM6hi1fghOs9+w0Hhw2Y
 MAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Adding nodes for "amlogic,meson-gx-audin-decoder-i2s" and
"amlogic,meson-gx-audin-fifo". These provide support for I2S capture on
the GX platform.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 32 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 26 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb9b7758d8d12c230be13d4311e5e4..411b3e82f3ce1e535a23d9966ba82099d5be2282 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -331,6 +331,38 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin_decoder_i2s: audio-controller@a040 {
+				compatible = "amlogic,meson-gx-audin-decoder-i2s";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN I2S Decoder";
+				reg = <0x0 0xa040 0x0 0x4>;
+				status = "disabled";
+			};
+
+			audin_fifo0: audio-controller@a080 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO0";
+				reg = <0x0 0xa080 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo1: audio-controller@a0cc {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO1";
+				reg = <0x0 0xa0cc 0x0 0x1c>;
+				status = "disabled";
+			};
+
+			audin_fifo2: audio-controller@a114 {
+				compatible = "amlogic,meson-gx-audin-fifo";
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "AUDIN FIFO2";
+				reg = <0x0 0xa114 0x0 0x1c>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc6cd2875553fa9b0e3ef72a2f6478..71a47aa4c2fc72195386a11c905723b3c6f6943c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,32 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin_decoder_i2s {
+	compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
+		     "amlogic,meson-gx-audin-decoder-i2s";
+};
+
+&audin_fifo0 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo1 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
+&audin_fifo2 {
+	compatible = "amlogic,meson-gxbb-audin-fifo",
+		     "amlogic,meson-gx-audin-fifo";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	clock-names = "i2s_input_clk";
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";

-- 
2.39.5

