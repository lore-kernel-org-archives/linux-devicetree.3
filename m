Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328F3B841F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267903; cv=none; b=Tp5ttl9cPVThe9i2+8VTwuBxxxcYl8zHbpr2QNFiU/Q0qIQu3kQgzHMO9eF/9K9aEx/ABOAc/xoGCXaL4jxg/3t09qcBkHxL6PbAoEl1qRSwZXzHGXFGAoT+xl04s/PN45owcH/nbAgZgKindrT9zDdV90dgnP9P5CdNgxzzGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267903; c=relaxed/simple;
	bh=3kap1OQlb8KQEJvsMqcMvJJGQFNmK8fFj0hKxy0nSPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8ohhEh23PRTh6PqEW4Gd1xCqyVkl7LfXdh7gvHf0gvkh+C1olF+N817jkwnJTa8EJQTAP7WbTSigDD5oLueqipwVrKvIEYlG3MsTEa6BPu8cfexSwzYhnJzvqJjjm4QO1RV0gq+9PgTt16wVO9orv1WGJs0Du1FpsgLkA4yBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DvZuZVzb; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DvZuZVzb"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb9b427da2so987892a34.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267899; x=1785872699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ky4p9c619YcdUCwOZ0Klq8fyqRaFRsS6gRFyDHER/1A=;
        b=DvZuZVzb9TL6nPXoV828jSZMeqyWyWhFRjXMqq33DVCma/yLI5cnrKqcEaE37Kdp1e
         qv0kZBj1+8ZKOaAPTM87tBBa1dLm2FnBpLygAsLgEq3QA2RRltkWvpfUyT5WBi0aOZhk
         ii1sfUv3FpWS/BNACB5NYVq479fSxof7O5Us0gQ4xoAJWgWEbYXuu/T3DNCZC4tZ7qFU
         hVhmTjPK6Tw0xJ63adcdIxSGagxE8eVvkTbUXtW3IdTRLOhoopdlvM0e6jtN6HH+nlPn
         N7yAgep0LlE2kqRJZeZ3H8liqdKYoM937uKK4gHeaD8yuJ40v4E5pzyxPRBJwp0eqfhX
         kLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267899; x=1785872699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ky4p9c619YcdUCwOZ0Klq8fyqRaFRsS6gRFyDHER/1A=;
        b=R7GTuLT5tSvvM2QPn4qRcpOtbZnaNpnN2vQ0LrWoqBNfQRFq7HHTJ51+6Gs2+HJqM9
         Z9Ydpmms97kCaMpiZ2KRWSKcdPjOfbBofhV0PkaW57deF/+pHbZUb4638fAgEwVLmEEI
         3z1wOJy0SJ3WP47UzbOKnRJGzgqfY1ocju7c/VFpXC9Unkrpua86jNDvk5HsEYuVyZel
         ZnDz2FrA680jgLF41P3g7alCYwYPnm2mIHWqn/+OmcNjvmJT6U1/2mAWhppSaubns/u8
         OJJCSpdGjaoUw1Aonai6yUx7bquVGUyUiVTkGtI+BilpzyacOl7fgCtoTQo5SkdKS58t
         m5pw==
X-Forwarded-Encrypted: i=1; AHgh+RpGq7nFJPLTDQ9FvqSKn7W7X9KKNfO4y9PYts1kkWw42uFlpKAMtKLyFJVAV3AHGS0BaS1rwYZMUwK2@vger.kernel.org
X-Gm-Message-State: AOJu0YymAl9o1njXDvThS6WDnYI3ywdaCLUNq9wZZfR+uz+a7VQhEkyk
	nj1UtQzoULcWeQRFoql3I7CP37ZqtGxbB9Tmzd75/exZXaQkBECFIgs7ujpav2dHT3I=
X-Gm-Gg: AR+sD12xhkeqW6BKMK38ifRJNLfv7tA+TzUHwGty3XqXENWhzb2vbQaUnJkAoHt17gd
	HPqgux1Lew1kyWl1KkaqljjU4sLshtEN0vZ16LWhNWbaMlVFxTx+4bmcJ5V3odz7e9STLfMjqHK
	Ydn4edNj5p92mGi845CIf0JB1sIVp1Q2yJ2qrfeAJequmZ95Cjw8fh40jh1XpWinTiiCoftoopf
	0Y06wwAFeLlYD1qPyhZgBgvsM8l7fxMd8QpL0ysw/DpRrXnQHKi4g/eJSC5vzvQ/bgxk5e6FZVG
	IslSeMwXWqPNtZy6Y6SKlglFrczSS0ECo5cQKByUuLmrBncfPgEDcKyyh+cDIP9YVnE28z0gTmz
	xCUn2lh1i/9mYXt8l2jYlWztHBldxq+BSf4Gk0pViV5ziAwsJgypncUUtG1xS9Q81OBEODcTg5P
	BJ0p+x7I8=
X-Received: by 2002:a05:6820:2d06:b0:6a1:64df:7324 with SMTP id 006d021491bc7-6ac969e9b7amr1667291eaf.7.1785267899457;
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Tue, 28 Jul 2026 14:44:36 -0500
Subject: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3kap1OQlb8KQEJvsMqcMvJJGQFNmK8fFj0hKxy0nSPA=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGppBq3IR2kx9BEyEAIpkrtzVhoxGf6F4nTEAwH5xCRvnCWdV
 YkBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJqaQatAAoJEMLMIAH/AY/A7J4IAKJF
 rz9iDXeqootTZWb0TQ1maNwTTKROj5YPp2cA3V4dt+ISwxNdRnSobLrtm9T6moyGBJYomYsT7lq
 5wZ4DXMWCD79PwinGdZNP2220sn5bippcoLZ7xrM7uo7OWFVUsULiTAzRDz3lJoyns23MxwQdv1
 xp8IY+DIOi3pze9ztgdm5vZlToaPZbKWOCDjm+BFA3JzYGdrsj3PWIvJaIyK5MBuQQtFDyzqznP
 qFp1MleNbPkzwtfUs7YcuKEkQuB810p4To/nT8Qrt5IsjQYGkW26aCyDnM911fgPAgFJDrKqLxD
 dV/dMgYBsWcPtlJWf+A2QSbMS4I0clxQdWLcAkg=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add pinctrl-single,gpio-range properties to the BeagleY-AI .dts so that
GPIOs get the correct pin mux when requested.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..599d576f694f 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -149,6 +149,19 @@ led-1 {
 };
 
 &main_pmx0 {
+	pinctrl-single,gpio-range =
+		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 72 17 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 101 25 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 137 5 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 143 3 PIN_GPIO_RANGE_IOPAD>,
+		<&main_pmx0_range 149 2 PIN_GPIO_RANGE_IOPAD>;
+
+	main_pmx0_range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
+
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D23) I2C0_SCL */
@@ -267,6 +280,15 @@ &main_uart0 {
 };
 
 &mcu_pmx0 {
+	pinctrl-single,gpio-range =
+		<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
+		<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
+		<&mcu_pmx_range 32 2 PIN_GPIO_RANGE_IOPAD>;
+
+	mcu_pmx_range: gpio-range {
+		#pinctrl-single,gpio-range-cells = <3>;
+	};
+
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_MCU_IOPAD(0x02c, PIN_INPUT, 0)	/* (C7) WKUP_UART0_CTSn */

-- 
2.43.0

