Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280406;
	b=ntRLy841CehJocELyRiUvfTaIqH05Em2GdfeoyrKaTJO4aOA/FVP416GKwoXj6MYwyKO
	 mEE9+vAtnpLGOBD/VkxW42JKzwEVTW7nWnC/tiEp9ymCX8Zk9YFSkSK4RAKOodUEk9/vx
	 cD4c82os7bh/VdiI9Ma0XCCXmsdifAnWjt1RFsJ4prArMctZHAc1kzUBXgaO9kz8yQcfi
	 aCqkGUH4p0ycxjh9+1uA73+vKxea++bfWksq8fOFcUMAcB18rsztz/l1Sic2s17vA4/Rb
	 cGs4LAxQ6gO+rZhCw5ibXL+RDg3A7K7dq3LPVZCDoP1JQrEoxGAwl77ro0nOXYemdeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
	b=up35Sxb8hapBGlhQm5V4ASPo3oR7Gj1dqyNUg8mlsCfUidRbZrdYBYYOxjyrVdt9YK8B
	 rSrZSvNLt1gRc2AQjJA5kK8YZkol90n+3Udtj27I+oeBXhztuDulaFKOuoMPQ6n55Y232
	 0ZHTpikRMmFOVfH8DfFMjPh0Zb8IEdu0CWwODGoGhr3HvQWtCZzZj6YxiGiS/nkSGEjwY
	 m7o4nHb2VkPMVVZ6c2V4hrVL0BETv6Si9xz5ckQcr34Fx35j/0nyZ9/3/FB5ujIpyPn8T
	 9M+hUka2oDcP5gxmfb5bN4ojqPJIaGXSDtORLSuTLO+ErQbFzh8ldL+1XnKf6K4QIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsHgNnaD;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535260A5BFC
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3535260A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsHgNnaD
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f699fe49b3so1065769b6e.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280405; x=1794885205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=nsHgNnaD2HOBw7xy3XK+XyVqyXJd8qQ5zML/Lw2bZM2GRcXMg9fmedY74R/2tFK3le
         5wYelxRFo235aTFkzKSa/FRtfalRDF5R4meubBagm31YKAFt2FbnG/D9mps/JvBjttm+
         AihKGxeBi5te0mqgZk4ksGDTmH1wJpNcLZ8KbuMb+EyrXFmg4Q1QUuwpNpRoUBza1imY
         6ZjLI4znoJ2kp5LLvJh/+zhatpvJIud3xT8qnYI1YtNPEP2YwCOdoQ15CzeOpKSVH0re
         SEbQAdYz0VVyJhCDiPWb9oxzfXbaJDaS0ojda8IcmyNVL5J0fstmElKyLc0h3B1BitJ0
         01qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280405; x=1794885205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=vWGgYK+gKFDdAM9xSYIc077MeHU1Dkj97c40ue1A1RQJJVdiHoy/v7EU93vkmfnpx4
         1yoxuWwpbJYhP85uw9Dcq1NirEWOX/4zHUwtgKzuLDbU/dhMisr8s/WfBD4TwwwJsWr6
         YemwW6unjAQJ1pwDZlUoryOra8WpIkGvryXIZIeiVZvzwK7fxiqA5PfKBDqjaDKd3u8s
         y2m8ng3qW+Xjj/KzcTjh1lRLrG4dfuKaX/blsdeVSbs+leAW9keSBZ52oi0GGOxl6kOP
         OgdjSBcxS5cPocUW/Cah+WBpub6TALjxxtN8GGzVVOkW3B2DtEYaONffipMdBKGV3/Yq
         2rog==
X-Forwarded-Encrypted: i=1; AL+hErHNl7ZNDQCr96YiPlBzw40EFmO/TMOm7eJCkiKOKE0F3+NqyM3XUdZVX1/y4GkjNLc0QbZCGkYxoPQV@vger.kernel.org
X-Gm-Message-State: APuU4Z9eTHRI1ePzUwZzkE7LnyqkycT/h5Gm1fFxlICF944zmXr8S5Sq
	yONrqvPO8QElx7wGS5OVysXd94GIzojr2oi0qk/sZLoifzQKUGYCQ8dH
X-Gm-Gg: AYBFou15bemOgY6zDHCn1Dg9Y/R0tQoSTRYz+k8JdlsPjGijZMRvVwIsuf+y+gKNoXT
	EDkHhj8UZcNvsFbB177D5SrXHhlg1dY2ohepeLngWzF6g13rsoCCFZrrL4HXMNpTCy+6z65f74c
	LFfd0tCQN8JjYhb38+hjYnj3rBRtGhuFCDe1iCRLuktsYD2CtdYoED6ENYPJae+Ed+3mbNxc6O6
	Hw67excobtuWMUPfLF/2sENOdhy6muAjlcBv9mXZAFO/ONqTEbCRdvSSB/uHnKbeb4M5aouC8K0
	yURlLOlGlBwUHLz9JIp3k1Z6l0JnJvGQqGBcvngYVsRRhRehtBcqBqf6xcSOnhoZNwvPhknVNOW
	4eFUgEul7OkEQJQPbqCf5wTAmwMHNWUwh/v1n8qEEakJbXylwy0/X2EimcVGK7JiuluOu3J21q4
	AYlhwK3dc6c1EYDGkk4houjz/y+CaU7/hocT3UMvBiQLezMf1iL+sZHcyi4ZhtSNZjidO7o7k8c
	89WgAnt6/gebmC0Lng9OWBaBEIx+365GJRJqGVCf0lGotUj32B9FzV2T00hea5Dt57izzw9j5DZ
	DZRMjmTeArrk8NGnKg6JWAPfge8oAXQtfvoxx0F3uGfRQxC6uqtIAeVNEOIi58HnfkCl2fQ0DdS
	S4egkjbBtbzOs4sBkYQcZLB4YTZtc/gvHXk3CiM9n3pR2F7DyTTZ3yGvUbPY62u4dYRO1/433qo
	u1DfE3XZ8RX/1+iF6BoDjXasm76CoxUn38JH2X+DEakYXYwqHnwfQo
X-Received: by 2002:a05:6808:508e:b0:4d6:90f4:48ab with SMTP id 5614622812f47-5683cd1b07bmr1294602b6e.45.1794280405078;
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:59 -0700
Subject: [PATCH v9 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-10-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

