Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31735EDBD
	for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204503; cv=none; b=tTd9NVvzQzJ0ISirU3DInZg2aK5azpGt93Gu2g8I+v3PyvR+ABDZuFxHlkyrnndgojbcT8WOOd+vYSu0goQz53ZIW7pxYawoZJ8RDXkSLlURo1I+AIQrq1CcTbxr7Br8WNUO2J1KfOwX6ybAOhRxC2Ogvvpdc3ntxkBdiLGrSlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204503; c=relaxed/simple;
	bh=M2o/Qr31tdSVgMGK7MGptHsdQ8CYwaC7nU5G71DmAdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppRqoyQvxwrh3IIysu5OcWmP65WavYpf0nVlQfLf56FzrpUwRMYSVau1rx7Y6P1zpcfE8f+BYH1drOK/MO9mdiU38B9kNjm1bS7Ms47ZdSe7DBB/uE/tLLUnb7eLTj2pFu/E/3QI3b/IO2GLMlfqVPiAGaDkvusDqFi+/ChAwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDN6fr2B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDN6fr2B"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891f625344so80978475e9.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204500; x=1777809300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=nDN6fr2Bs7k3M83IXdUBSYByQ4KgknkpsTS4hZ0+208EKBQLuiTm698TktiCROuF/g
         l3JQY3LtkxpEwsAhVFWGVCNptEPE2gQsKTo2vYBpHUUkSnt1I0qLTtwygQXMptNVreDK
         +kQCf13AV/SIqXLonqLqrDvODZ56o/nkQMACcnmo/WLT3+JLMt3yfdKpuJyqJeBLlk+d
         eSifURGY0osCd6+T1xSQ0TdaQolKGk9tPTlA/68sP7i5XyTK16IiyTTBFs8/OwN3M6Px
         cuNuOvT1jnbXqjrdtoFm4Rgw/QPoZqLU5czzH5Pa6nz2pOakBDtYOxq+9Y/WUQuzLkn2
         7Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204500; x=1777809300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8a6WmnzhZriHz9vEWPuhbpYJDMw8zDZc78JguLRxNCc=;
        b=IHu3aLtzz32+NuLmiLbXlsFuhi83wqDKD7BDfOSp82AhyIbBmKnC/jUqOHMc2t4PrK
         wAkeZaa9nwmDir78dKcycI8u0rx9UJT7JEO6NygfTjVhZM3H4+I3mcUw511IYG1xFd8a
         HMkUxVQqdlzEw3ADn9LwHYiQCG1SSybM2ahTDuHii/0FTejxar2p2SML8/pcGXDvPtWK
         tUmswHx1kJrFZ8TXVEmg11mNMjfECCUKUTK/24nPOZMwjSQnNIxRJDCdim5hPyCpJwTN
         HlC10153cDFS2wmDKLgH1zMZZCXZKb8UJtyD8a22OByqmdHUqlzpGBuE150bNH50BjJk
         BOjA==
X-Forwarded-Encrypted: i=1; AFNElJ+L65RitJNZA9fhDnxNIt1LIg/KzO5sb+0o1CW6OsSQ8ODkvZiWhJyEfONkWv8loJZZ3pbyk0E7H+0t@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3B2HFqO0Gvq4A5hcXumzap8YOefNRWG5Wu7y6faZl3ZozaSI
	UbPccfJC7mjV1BRfUhndAOBZqO47fMkxs8WDrms0CBiQgzUESMFAdd6d
X-Gm-Gg: AeBDiesiI0TZe57BgAPCDlGB/U9UTcygcvcCsG4hsPWWDv87N27Cejp+PE60QG9tf/4
	n21r3Yx/b0styAe1zJPov/a7GtghzGfYDIcr+RnpBawRrzu8tB7FJfA9avE22+eH6GmDi4chHbP
	ux18tMZglzzyp3ktQF8EcdMHrLEqZX76+aQNOEDGSGDlYbSkOmteHXyZCMeMw6BwXtymZyCOOb3
	DdPwZdWO+VGB+XTdMdO/vYwqEDuIji2AGTMRfwpHtoB0ANSnvGRr17CwEwuTZC5GAZBIgUokP53
	gv6PKStlp60wY9j+YkldLmGEqXtJtyOsJsie1J4aHNGrxM81AVChdi4wdy4zq5elY7pZiLBIfNn
	GY16HBcaYvnLx2fhGP+yN120PxnaD4WGSMBHvvpqmDWEmoyt87/YNJxye2wRDXzjNXn3S2zR8BD
	tvJQGuK94mZXzKWRnCc9SQ4II19b/44GA85cTz71TB
X-Received: by 2002:a05:600c:3ba0:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488fb8b91a7mr505266375e9.12.1777204499997;
        Sun, 26 Apr 2026 04:54:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:54:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:16 +0300
Subject: [PATCH v6 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-3-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+JzGxmOauk8aKEVxmo6rh72jTY/V8V4KqY
 rsSLPEGRV6JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ21A/+PDdEZrFyDSxgwC3ikMTxEDtoXKJ21YF
 T4OgfXM5uzdBNtVEE2VXmoT8+onMkZ6FOHlCLXWOdi6tGbLpetAo6nyajSoscloMOPmDx6lDq6X
 NZIhU2RHcHS/AD09GyHqMtEGLfLMvphbRcDKIaiB6NNDLqnqidMr20pUDuZ5Pem3+0swtV/+o8x
 FnlitxZw8wAwtDKEvqr0/vzWmTLWUX2L8cf7EI9uTXmeDCYVLHgegg6v8QzxM/vnegDEuB1TVaV
 1yaVEyP/iZircjTa8uyt8CGGDcr0yJF2ikPhOEzJ8QC+GyeEqnyyykpbJ1r6kxCY8vEMcjGuPpQ
 liWg/2byZsoC6P+NQjfLd+ZFWSs5nV1TnNl05wdY8Vrz3srEYpV9TKmnHXi42R/riC1Qi/A1ark
 GFe/vhs+/1MWvXpYF1t+OSfKOFMlSO7xi3C8ecuhYbB2pDHPaFrjZNmK6eF4durdbCwguTDiKlI
 QlTBsIBIh2NqiAw0yqfYaTeCXJ9YmSOfXbBX7xqcaHaxVKobWvpBAixMWbb7G+1LF8Jong2SL5I
 2Q2HjehVhCFhqHEu6XiILZXXO/Bp4MA+ZZ6sx7A6UTDOF28td6/0oroVCFayKelST8ScOAU2c6L
 d/UKHI8icsM61yMF+feTpybi09g0e8+C7uMxKegPyWlWDNKSdApE=
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

