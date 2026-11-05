Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911953;
	b=Pqgh3bUfppBWqSqv+QiMguAvrNmvG+365tI0BYa020geAJfH8yrLbV6OR7sHsrFzMrwy
	 SO7M6u1R/mzcW9Fwsh+cr4Ku7YMig3TF+z9RTisjKuoECukTZUpQkjqCmhz8T4Mh1quci
	 zoFTNF/HhveLYuCc0IUlzW/d6LV3eaQlYS8Dc+iRtjByLYtu9fGoAzEx6Q53rL9PH2amO
	 lhcHu4G/fRfSmeRvwAKMwCXLy4zemP0qJuItcVQgSZLyRWCzLHEkbjhzrjknD6GtzGL8h
	 iUXviTLmV8LaUHAh7i8QivZHte0z+wwJA6ILRE+toQ491rOiafn66Jqhhmc3fnZ5YJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
	b=jroNlfGamkYAlUqu8t+V0meH9H/BMMgca+sGjUiun4nd5NhOZol+xDWd1Mf0Kid4D9tt
	 jZF890Cg3OezYvKpZQF3Ga5kbh3PDggsk9Nn/CVqQb+Tfk6sRDTLA4vZCvdorujN8zZO0
	 F6jjxF074tdbXSOD4Yxl0AH807qAtsB5Yj7DCmqPshMHIivZnbcHo2MjLgyAapfan7faA
	 FfUQKAExj+QpKJtDUkz25KacGenbyjAOLYGajxZc6EmcyyOPclpNo//ZEPbhJcaXTn52H
	 wdyOgCEs/QwQaOJGMNCRiT4BNwNBYjRkQgLZRezIQr1iobTSxrV16tuCPChHsWdsO0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Letfruwh;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94877606A335
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94877606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Letfruwh
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-844a8bf7e25so7003a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911952; x=1794516752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=LetfruwhS4YlTwXvm6EyMPRn+7ZIu8V9uUY8FALMNLMbBgzqhYflrjUAppi9betmI4
         lT31apnNFBiEmMmb2m+soWVbyQ0NQH/lqrKcQNeMT/Be7BsXbEezyvN3VwpYoDcqJBzh
         P0xiksynz51UJwRbTCrAvW2VRrLuaYEg6eI2aPT83oqHHvKNXpO/cnPwk3r6S23pDQg9
         WeRQK5xBTdXKpYxKO8cMzre/prmnrlvRYOs22wvHcxp+M+BT4/1GJXi2Q0hjPSJhMj6L
         g3R8ZLvOP4n8JUa5m0TFktxv8RzaJoiOB9iZcb1NO08hk/qniZ941hoMc5YDhh+ccqrL
         HA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911952; x=1794516752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=c1XMSp3XtgNawRfRkerhIRO3Twj+WQWwqliIRMTt/C/V07RvlMxZGwQa1W57/cWbZK
         fD9KOYhWn4ed21XWDbuVmZtYCW7C37rAT7sBxGJx94YuIg/X3T2wLUa4Qdi/sYvXxkdL
         +QyD89c/hKaoSVp0zen/55eFe9XZAqqd+C5haQzghwzoG6PYy+E+iHc3Pvvf7NpmGLJy
         aWJbsYIli/9UApmpuIIKXdA0F/wWk1utzjRO+h6OTvu8oYZwx79wMmXb7Vim7espV+KP
         4LxMeicx97WwZSr7UlT5mWPq3QKU/6BPBvEkrxHCaJkjV+uxB+c8Q1qS2xyBrLBkTHMW
         IEqg==
X-Forwarded-Encrypted: i=1; AKwUvByWIX/AKTMjkxkVCPb9VJJAensyTK1P4UJFPsSe64fGScZD+BU7A7JLwnMcm86B9gmdML/w/IzhN5us@vger.kernel.org
X-Gm-Message-State: APuU4Z+E52blcBvu/govjJLMtHQZfag/dFQOVP0ZCKhlDM3gQLuiSZGP
	20rsB13KDwS7vxiLXnlDgs4R/HLrV9O4luEo5BZd+/srd936oMScJ/pY
X-Gm-Gg: AYBFou1Xo3+pD2+VSQdZzUew3xZt3hM9ipvcpM8PulWHd6r7SyAF2et2rfOMMINjyh0
	1623mYsLdaDrBdS4lco00YPRHg5ueSMh7xR1YsIpZ3ofYKWBi13W6uR5kECb0pgd7Dxp2FHwHON
	zUpWExLNRSxL1BG8Gew0AvPSWiglO6734pIAjftH2WmAFM6+F57RGEXcxA+HyR/qu4xPBiKKL71
	LjIzTk3uHWjePP8FV+FoPwJkYl4KDTuKJDUXWWQFQ/LzV3iJPzjYfegXDQQSxBOmO2EMNZy15jx
	cjVeIg/civyVdE2TAyzyT6XbbrfGyPwfz8JuA9Xrp4JtFFTvu/k8QWE6R9JaHlfvg2ACpdPBt87
	Z3eIYAioGrlBKDLsJ3E4267/32sPcmP65OTOYtshGlhOtoyuUPhwpraJ7HJIU4fWqSDHYmt8t7u
	t4uSJpmTPU29ACeJsCBPTCzQgUrb3YYeuYRdGj/znNIToY/PKWe9Fbxv+zA2di680Eoi68+pAMW
	fFiA9TkCXXXE4+AiEkATI4+gJwZBjiH8qSh+tADbQLIZYjDQxP6O6IyWKcWpVy01jRKJE2Vij8g
	ntQ9KkJAhwDqpz0wgDd+DUvaq4rLLxqva3VsQgBWlFVKJGuy532eYvbD3KNkpY61ii99LI40tQK
	uCi/VCqXxWbIe0N7uBryvdU7rgdJe8N+MokvenUg0gGLz6Vs8HT1SZyfDlTlj3+WIPwTyZgYqEX
	PNs6ouWK4XuAyLp3JaeG7tq5jCuPDZN8MIPmJN00kVhySLGG5BW30=
X-Received: by 2002:a05:6830:43a2:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-85f1cfe1eddmr529135a34.14.1793911952656;
        Thu, 05 Nov 2026 12:52:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:11 -0700
Subject: [PATCH v8 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-10-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Use the shared DesignWare trigger setup to validate the depth and build
the FIFO-relative threshold table. Invalid depths fail probe before
registration instead of producing zero or truncated thresholds. The 8250
core derives the transmit load from the discovered depth.

Select this setup for the A523 compatible. Like H616, this integration
has Allwinner-specific debug-divisor and RS485 registers overlapping the
generic DesignWare feature probes. Use the common sunxi PIO setup,
BUSY-safe integer divisor programming and software RS485 handling. Keep
the APB clock gate enabled during termios updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a55f60330a51..257baab5a3ed 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -44,6 +44,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +67,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -666,7 +671,15 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+
+	/* Apply given FIFO size or try to autodetect it */
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
@@ -913,6 +926,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -965,6 +984,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

