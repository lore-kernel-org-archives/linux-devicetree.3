Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F53368A7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096053; cv=none; b=GkRqEGV3C15r4HL6dm3CJ3vUc+u1ph/9Qfm+S9+vAjTqFOm0yCgbyNL1TIi5VUwjjNqiq4o4irFQq+SvrliuihL7V1tT4Mh0K10+gKGcwwYHBIOHRTWaSVSXSOEh0ax9OyaRrj4LGpb5Mo17V39gG7Hssw9ykDmz+Au9/X/26sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096053; c=relaxed/simple;
	bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUanRY4RVKW8aUcGfuXtbLOcQ2cScuX0Ik8dX1iljlKqeConaQZ3vJT9AOcDKgFGDAAOFK9pChohQgdwiJ56NQacn2yURfn7/yYKNGdTPspAQSQyysPljBRBofFfY7VegF9+fwtRNDmwd7muzsAODwoMtjWfvR16YW3xLmHbRdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKKjWVgZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKKjWVgZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f6092eso46296f8f.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096046; x=1778700846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=LKKjWVgZgIjPuIEvU+thxJDZmQLzWhTsBA+LUk8k6orVYqIOJiL5rqNKi4iEoAtftH
         9xJaCK0qfa2pGQwCGhB6wcri0Jv5ys5z/EeQ5/qaJ4b75xwAFFDkH7LCU8hgZvK4xZMe
         ZDfxEyY/zkpCwKDlP99vlJPuqx7XiKzvDqyODYhCzwdDqnfkUM6fL+mFILbh5JPN7Aen
         0H3jT7YoxnXtUqN3LH1gLU9vIHQLC3acWST3nwZ+xzhSrkftzFkMNK8Vu5vjrTqvphSq
         N2j8gBzQKLg3LYR1VXJP6NcbVOQ0kTcx4Xlbdwp0HdfJosWzlLzbPxl0tNjJvpujvhx/
         6AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096046; x=1778700846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilUL26n1rjGYeNrOGQ28D9s1uztNCB3AEwbB2W2pXWM=;
        b=Y59egjQ/As3qpsbBu8hQpuYbkQrw2k21ubbsAZ9TYlS7YzLF8Ew2WSt1yf5tbTbp33
         n+8NWeof+kOn0xyy/51Sb+5WwVsAPwoENArc+N2YHrkTat43L/PBTmXmCNy8dm8jK2Dy
         jtG3JoGkeu1Zt9AZ8orqjBm5hKK8HuJsPmtPeK7XsodheDmKRTGddccnt0bzfeZE3P5X
         AiMb4TYzsjM7BqRTz4h9+DKiunAcWL7o4uoZgtXzUOmdNWZzsHJYM+/TTQODG7CIl/Px
         3gKN+kBS5ptMEf+SRVJh7Y0rEaFTcg+duVowbtlw9nokHzNK13lPTXwHQvA9W1zF+Ifp
         MXHg==
X-Forwarded-Encrypted: i=1; AFNElJ9pwWGKIEz2nUW26QJdNEKS1IDqpiojlCPdGo3WJ8N68IOq1Cnq8gt4V2vZAqqIaXc4GyKjKvRCXXwJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwS7VXMz7Bx5QxwW9T5wkk7JDId/0bCFeQlXqc/aH3UT+w6+N29
	y4YsgFZmhMBEnSPBvPa7+b58ZWVDv9OP7UAuBdGo5WZ5V8Cip/QeYmoU
X-Gm-Gg: AeBDietnn9pG9GDd9PPbeaSmMWbqG57fcutwsyRPHl96w53MfG0AoJ9AppEWO605D5k
	3dB+n4uUitvSvA7reS7LbUW/6VPfBZFfetXDSU08iqsBbuGvmrkxXnT+YTUA3fT0WVB5dcg9h3e
	Qq1kioOh+64tGPkTF/wN48mSoHcpF9ofglfbL2nN2UZcodTaxhAi07yJvwGn5NcUu4R7viEJu4m
	5hEuspIuv5BHDitH1T2Qt12+8PxXeWeKxXwJmhRrl5dOtcP8+hyEEK2JSS+LsiBFHL9eXkGkF+N
	F9cc8Lg7Oq2gpyR1OG0gJVacCkZu/BLOHpc/HpchuQcTSClz9Ff/3AWLExJmTrokxbQauUJRlX4
	DGUmcb9PEVc/qS+hgo7dZLPjGgp4qcZ7yoj4o4Hjey1f4pLsLzwc11D8BGma1XIPbFG72W6YWa4
	+b/LUaGZADOSK1wEiK2LcV6gJGAp0h01kxVIo8b0C5/Bk=
X-Received: by 2002:a05:6000:290c:b0:43b:4982:fc73 with SMTP id ffacd0b85a97d-4515c57465amr8159966f8f.25.1778096045780;
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:05 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:20 +0300
Subject: [PATCH v8 3/6] ARM: zte: Add support for zx29 low level debug
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-3-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=fcg5dGJNBAQyU4b2cL0nA3wqgVJTqz/EfkeGsaL9qZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWHMnqBAGLcyW54UYM1CAyGLQMWIHuikrQl
 y0IeI0wWVCJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKoNg//WNV3zil9essnB/1w2NGojHfI3ct0p7k
 s7kK2TKGuBVgMsUetJH7xCF8c94Nm2AUnnEPsAnWf2ORenjfzAdvqtuDTw7JbVtCCtEoMnm8JwF
 GepqzU6j4p4z9t1hiNP615EHi0cY+N435sJnmOvXK/+WPKwThqx7rCFaakJlr4TdvuxULALOOXx
 pdqSI0dvr8DzynlLLQyc6nPmm0dGtNAZ31NkyoavEiDa6CnoZJtovW4U5OPyp4RS+NNHj+Et3ln
 Yw1qcLBkhYr3KpmzA/qxpFUtgrP1XOxuJweDcPJT0RB9I3UBl/1HpTYmt4uNEIB6QuwDaV1yjI3
 XWPKMwZ4NjPb1uuM2Y+ioJTzAxewvaXU0R1WTmsnnOU3U1qnvqfIpnIcHhP1c6kQi+IXnNyAAnh
 /TBWYv4ajE5JdtAAr0B12Ordg/FiOMm9DfDnhQnlNUaM564a93xn1iMFnH7df8Rk99mIL3kwiEf
 p01lGtGtq+w6+I0gBaDGzzgur+b5yxijspBSodKyeddnGLtUiT05+yWRkvPSJ5fUeasctGdRBQm
 O8+Dx/rgTRRYlBL+rOf5UeDw1v01Jd9dz0HokUTWomjidhZBzCYQCQjeWHWw0e1zxzPPJgugrwD
 ZHx/OHabjruoyJ6LFV/e9OCJiEfpbi+049Ae3I/wZKG+qjcNqHbc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on the removed zx29 code. A separate (more complicated)
patch will re-add the register map to the pl011 serial driver.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:
v8: Adjust UART01x_FR_BUSY to match the different ZX UART registers
(Sashiko). I am unsure about UART01x_FR_TXFF and my boards do not expose
flow control pins to allow me to test if it works.

I am unsure about the virtual address. It doesn't seem to matter, as
long as it is a valid address. This address is based on the old removed
code. Is there a rule-of-thumb physical to virtual mapping I can use to
give a sensible default value?
---
 arch/arm/Kconfig.debug         | 12 ++++++++++++
 arch/arm/include/debug/pl01x.S |  9 +++++++++
 2 files changed, 21 insertions(+)

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
index c7e02d0628bf..9dcdeed2357d 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -8,6 +8,15 @@
 */
 #include <linux/amba/serial.h>
 
+#ifdef CONFIG_DEBUG_ZTE_ZX
+#undef UART01x_DR
+#undef UART01x_FR
+#undef UART01x_FR_BUSY
+#define UART01x_DR		0x04
+#define UART01x_FR		0x14
+#define UART01x_FR_BUSY		(1<<8)
+#endif
+
 #ifdef CONFIG_DEBUG_UART_PHYS
 		.macro	addruart, rp, rv, tmp
 		ldr	\rp, =CONFIG_DEBUG_UART_PHYS

-- 
2.53.0

