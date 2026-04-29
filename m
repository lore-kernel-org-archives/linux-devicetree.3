Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5837537F001
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490065; cv=none; b=spQJq07WOs24Dts8eDrXynIIoX8nxI46czCiLL6o9H0FkRSmynUcvFkEhqg1/ckrH04a7WDByVocBp0X3u1KkgNJETxpGtV1RizgggAYEr6t9qja5uDOtuIkqon7rptjp3M5Yp2xdP35g6xL7MiznwX0e52/rgxo5Gy93gK2TmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490065; c=relaxed/simple;
	bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gyw/12LO46GVZPDusHWpt2C62m6JXkGjdFIgpiOwfi9zVEau5iuK0/Q0zc7YVKpu9Uqqda7kKW5y35m5xHKQ1CGTNz8xoZgirMnt0J5ZVe18FcRhGXnZy6LW0KLIfrIl8Xk4sGC9zAUKfCfVMMmMSAtlA+6uEhistQdgLKU7MXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0Rtm46n; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0Rtm46n"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so1181055e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490062; x=1778094862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=A0Rtm46ni4w/Ru5gDjXHtP1tn3O1nTf5+Kk9fA11Nv6zpFfI+OYuBE51MT+p72Vdm9
         xGqo2J9Pxhd1KasKV6D42koZjj25O2a+0jmylgX/kgan14pdNB+M3BxEbXJDP6gg6AfP
         og5H2Pv1+25MXPYHrwKf/7fa1l56Z6BwW/vYoxZIGx7FuKZLhQzsH5Yt61mdrv9i4gAT
         OInD0Tlv22PxQl4DXmnzDqljn3bqdmUriuN7+QcvN80ma8dZeC+TArF5KJ2kjDxaYBsG
         /UXWOOMvSSb6G8TwK1zbCQcVHTQZ2rX2ojPe0aqOuUa/sL/cnCKFmVoEUVrR0BmMe0xL
         7cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490062; x=1778094862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=IDlHXPD/dBjiayjP3wCzPkgqEUz9QM8du5e7Cyq0mxZoh7vmpP2wVaaCYou1G9YrKr
         Nuz4gG0uf3xkbe40/UzYjMBEzwrYXGBRPObYIeGQzKRiB0MQtTLWBh8FP2x9BaC7iDjj
         jXo98u4cqP5xt8QROGgbY5ZISToSajupCE8G1hVMoaRGkIZXEv0DXC5FxJFafaMREi8A
         Z3HNo2mmi0VFSO/5pHhun/vz4mYGnvCfJwnGpxyKZCmHYxTt5fybFF9ou1Qi+Js4Z0CA
         mBnuATz/F3yWkbiTJ1wgsucrsXze9yhg0bKbRNpT4be1CH0MtcNXBMu/Cmv93DezBqaH
         dq+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MlkiuAz3h2XSx14R0Mn5zt81oziVkDalX3pOTG5hvuyfiKKn/No335plz5Fr9xWxxGRSQv2W1elkA@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0MGU2oO9CThNW8zAiXwHCVIZr8PNWwXISfTDa1l871gMN03g
	M2SFtyuKGL08Ftb5y1lltuGiQjS53/LBxeTofDFWVckdBhy7ic8d1Bbi
X-Gm-Gg: AeBDievTYpCSuJ981mJLkuyZ8eb2wpCthstAVrT9Y/38+G3K7/7fuym3REhgDDCObVb
	QHRQ7bBHOngGaXHxOtdPOLrgJ76R6R08wrpBYTbYK+UZvmsXAx0is9h0jMRmuDdg6pcIQ3Fn3V1
	FAzDASMxuYqkFtqgwhYo9F169SECKSXP20490cAlLrnGAO7oHnVTMoZhXUINwIF8PweT9XMckUK
	/tCKZrdgv0dnDTr8EhLiOtoj96241HbUH1rAHz/iswVPSyrcYI1HGqhDUT1dG7WV8CadwX2J8H2
	xoAXYPsGxlx7KSg0S8+waF3syHsLvI/Gbt4gJ0KZ7tZ2mZ7LTOjpTTIWygogYx01iiFS6gEnwco
	veQ0L5z32mtS5V6pchtAAuFTgrkiawoTBWxg6zJOEyGIGYuaDHKPYwd62lfdtf5MlHBhuDHQj96
	/fivG4eiw8g7Is/+g+0hQ1np83cNouq0JB+9NQaEWlDqg0bcukkQ6Ueg==
X-Received: by 2002:a05:600c:3d90:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-48a77b1781cmr145135425e9.17.1777490061506;
        Wed, 29 Apr 2026 12:14:21 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:20 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:14 +0300
Subject: [PATCH v7 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-3-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1uHld2kPX/8v2HJbRvy3ZwFQDa0OSTcuv+
 3Kf5aBkmCiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLcqA/6ApdrD8oX5RPE4JAHnJAWFBos5HFL/o2
 XpNBXS+K9DRL+91EY4to310L+6z8TQUfVqrk6vT7uP51Htp4rLo/uARsSbhPjQy1cNh3ao1SJDE
 QSKaiv7L6V28sOG3uZuFOr8tv0vpjoIeYnquTU0Gatryy6thQB8C/MkegTMkAnAC6cxYcHt8OD/
 b5r0sKjrMOJW5th8V6XCxmGEM284cWRjPuVCrhHf7+hBLRzu6eyMJITtCVq/PwWc6ORnu01LuEP
 tFBEjZcpB2AbeDG+Jadntjmrnnlw8UYCHth1SgL2z6Dp+HIqj4xUPu+cLoZiY/QpDHqW5bNyipa
 IrwZqC5FWMt+sSEHGAeTOaLIlgvbGgFrVX00vAk0llThQglR2tPjYi7LxhoF9w2OOc7DhaGD2uB
 vVM2bxL0GQxUB+O1ksEb4lW/cuySwq9iTj1xmwTncmyq/YtwpXrLybTkrMx6/Qg4ThWwsZqNnn6
 irosXvwUcEXciS1mNGEz8hhwrVmFo4y8q/vyn+TV2GMeLIH+lqeg+v2aC1JlY6mgqvR3y9LGLxB
 huWQ2AZwCam0n0gUIZj7xS+yXFhQTxgjPGbMsjhGqVh5leaw4Rvft7M/rnjjBbQOy3ALyM8WkJy
 8A116eIV8pRrCb6eTl0JrllUjOb02B99OzBB0OidNpqj3+C9ANvw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 366f162e147d..98d8a5a60048 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1331,6 +1331,16 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
+	config DEBUG_ZTE_ZX
+		bool "Kernel low-level debugging via zx29 UART"
+		select DEBUG_UART_PL01X
+		depends on ARCH_ZTE
+		help
+		  Say Y here if you are enabling ZTE zx297520v3 SOC and need
+		  debug UART support. This UART is a PL011 with different
+		  register addresses. The UART for boot messages on zx29 boards
+		  is usually UART1 and is operating at 921600 8N1.
+
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1545,6 +1555,7 @@ config DEBUG_UART_8250
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
+	default 0x01408000 if DEBUG_ZTE_ZX
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
 	default 0x01d0c000 if DEBUG_DAVINCI_DA8XX_UART1
@@ -1701,6 +1712,7 @@ config DEBUG_UART_VIRT
 	default 0xf31004c0 if DEBUG_MESON_UARTAO
 	default 0xf4090000 if DEBUG_LPC32XX
 	default 0xf4200000 if DEBUG_GEMINI
+	default 0xf4708000 if DEBUG_ZTE_ZX
 	default 0xf6200000 if DEBUG_PXA_UART1
 	default 0xf7000000 if DEBUG_SUN9I_UART0
 	default 0xf7000000 if DEBUG_S3C64XX_UART && DEBUG_S3C_UART0
diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index c7e02d0628bf..0c7bfa4c10db 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,13 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#define UART01x_DR     0x04
+#define UART01x_FR     0x14
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0

