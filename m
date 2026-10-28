Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195968;
	b=HWe7QcCJsY+uWbCeF47TxIMMIl3kOz8p8WIGvzJLYL7+Q2ijXMNrRkqH9/9PE34GGl6v
	 Ja1aKHH9YEitV8AXt81hHR/rDRwuFNdkYN7hku3iawT4/mws1bwHmnjmB6rGx/ZN25Gc8
	 Elzl4BTvsuyzlX6vt+Zm0DxmrIdOE5u8rAweNyJzRla1KW1ZxGvMP135V9Z93GNu14+7g
	 LwljgCUbIRcdzGFIIL6raC/JcQTdIzlpB+Oxii6A5BHTDW4IkEkGvocjIk5X+lnGmStOQ
	 MsI7eOIVt4bTmrmgsx4uIPLUvRA63U6llbXDfSYMasakOj+KrfrTx7Rutg8awc737uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
	b=Dc3uAEOjMmJYmPf2FqVHldQakzASgq9lk0TMcjbZMC+B6s4vTz6QZh8mA9A3C6DtH01l
	 e/1U4vyOH0oW0BJ8J10hI3xaBA242ZZ0+AV1/qLjQ/o473j2TZ+zyl7pwMKKG9L5iAnSh
	 T/iCgUntIcK1ZpD2/oRO/S1APLlvSto6Az8YsGOMaaO77neU6oWnJ6SVbCkYszPVAUmdw
	 Lxs5v9Zoii978Wa2u5798h8iMBaGqPwIZMmJdOn/ok+jLKMNO6/1/dRJgX7RXp3bEzOOm
	 MGebmr6GNT8IwRnV5kxzlQLel0Gama85gW9Ly2HyKkKfrv+2LKx6RyrsGrCgRxk8Zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=M8phV0dE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F760A2622
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603F760A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=M8phV0dE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8836845e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195967; x=1793800767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=M8phV0dEIHbg0lraYu/vhrhKgk0Viwg7m2DMDa1FP+Gj2/hEHkgKdLFXg5u2woCs/o
         uoIOp/MFcZPCFJXhKEeg0RTI0JS5yMahRkzN1AJS5hvu8e0mXzJ06G803nfSNSA5e8S2
         IZk7TZlCn0aplIIba1KEEfQ4asbz3p/KMhZfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195967; x=1793800767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJ2ssWlVcmkkQrirdzPI88gPKBfEyms+Ybe9tNYAWD0=;
        b=bxRf1CxfoOL748gLI7FlxKRPoocrWLE4NLu8gZBwDePlLwMHkpVV57ZH6penMc32e2
         DWxwighbT3SkkHxY5gMrA0zrvaXrCa/UcQrBRLuDzDqmH7/qHrzpSSbNMyVIr+OZjYvm
         FHu4rfyStHDx0CQI03ckgr85N1+X9oBY/HolVk2L8SK/MR9Sdxe6z8M4+y5TVGGXN3Ai
         8xWIA4yRvnpceAfS0EXYj6RJV9ho9p49kWWRfcLVEuO0CkkjSE85SnA+R6OCBQ/m35Vr
         EHBbR22jvRl1XYu7HMfdRp6Tfz5/Zeu8YY0tx/d+f4FW4bgYkdeUUdH+qINlQad1lzyD
         jAQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXlmUflA7twZs+7chK9BrvmrEx7m9/AZjQUurag/e8T+MFB2F27tLqk+QTOs4IW6uxzllGQ7WqVodm@vger.kernel.org
X-Gm-Message-State: AFq9FYK4cqvEPfec4RdQsrv5j95Kc4NYp25y5Z6RfaOOqJOZARuNyjQP
	3DikyOmZgLpeMxSx647FGiWEnWORTTPwlJRz6ZOkMPKEDBokw6jzMNXyKNKLd+ElgSiSjsn8kEE
	aYNzI
X-Gm-Gg: AYBFou2711+WF6ciYYccoFSEpipnLVpOp/YDS2a9GxOXdq2DSv53zZqR9yGPMdkIAmU
	PvPxyk/qZUjhykuTG2+F33PbzWQuukN+k8xfdTsWst4QJbWB3uCcb3dGxDXvDK+8Nrufl1QNZ9h
	63sfbYiVANvqqtdNQ+6jCkLc4YTytgCAu/K8l4anpo8VW4c4YXulLwyCVJZZH30ktZ7L3aoQtv4
	9SuTsd6y9wTdVghYZEo7j7oU1u3KtzQdbe+lvYUjEUC+v5DdPuAh/0nDqdrL1tTVQlRTtrlhyuJ
	RaQ02DyYSmt87E/x6aqQSlA5624BSr253y/EEuP28wJjvoKwzhq135o7fs/jJhNQAKStdgXvHEw
	YY/zGaUT8f9cTBBSjH38a+kk3zN/yrqGbPaNVSOj49FesqkLK9Ndzui/8PdUN8Pr39U7UBgQyRM
	fn+DdHs6pRtdUVSmdnmUesJvqSx0TjqHrafFHJfNLSi4xkS2b1o5ZuA6BoSfawSNBtBDxgmc8zu
	Zo5akgthMXM8/dq1+jO9WOKOTopggySRpdJFM/GgBBxD2TSYjOEszqB3UKZ6TbA1V+V3anM4iCa
	KYg74pa0hJ0u2iu5oLorRvEeYdq+gJk/yQmofJrfSNYIF7XTbuj9sHPA0OBSLpjw7pz4O5pTQm7
	cRH3EeNfey+EjbAy34Tz43I68NFkECUAgOrV3VEREhn1aBxpH0T9GsZFtVrmW2KaxRBJ0dw==
X-Received: by 2002:a05:600c:3512:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4a9665876a3mr51801145e9.17.1793195966837;
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 4/4] arm64: dts: st: select the Engicam RMM display pixel clock source
Date: Wed, 28 Oct 2026 14:59:08 +0100
Message-ID: <20261028135915.2665857-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
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

On STM32MP255/257 the LTDC pixel clock is selected by the SYSCFG
pixel clock mux, whose reset value is the LVDS PHY pixel clock. With
the RGB panel the LTDC is then clocked by the unused LVDS PHY, and every
commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Select the LTDC kernel clock as pixel clock source in the RGB panel
overlay and, for consistency, without relying on the reset value, the
LVDS PHY pixel clock in the LVDS panel overlay.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 ...57d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 3 +++
 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
index 7655c1bf56b1..b44e1d3ddb1b 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
@@ -32,6 +32,9 @@ &framebuffer {
 };
 
 &ltdc {
+	/* LVDS output: the pixel clock is the LVDS PHY one */
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&lvds>;
 	status = "okay";
 
 	port {
diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index 7be955be58ed..7855086c33c7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -38,6 +38,8 @@ touchscreen@38 {
 &ltdc {
 	/* RGB output: the pixel clock is the LTDC kernel clock */
 	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	assigned-clocks = <&syscfg>;
+	assigned-clock-parents = <&rcc CK_KER_LTDC>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0

