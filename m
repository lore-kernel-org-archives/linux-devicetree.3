Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299661;
	b=vMz+Eltd2+M5SqgF12kjtTS5RjDuBSdaJ8u9FBf0n46zTGVgpvGGYd7YLq1wtfTrKVJ0
	 78m/1pDB1P++5O3bsKQYbJ0l13LBs5yf2IU3VSbu2629HSMPmZWngRDQBF+R0sNQnd6+e
	 s4JoVdprZFQONUn9rOxkl9blrJPo/vtLY3NGBsp26/wF4lkrX2GbcE6jX58eLRnhYoTGo
	 1OutRYnmgprnxR7VkYn+StAxvIf0aA9WeQI2tHEi4gAudZ5PwJOPW1mniW6Vc8OCqvF56
	 ripREzC58N4O7e3/1Rwgk9kPFHcCELBaNcVSYNyCFUN/jEe4DGowC7/ylJmoObyjvhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
	b=1tGdyJtwECCDlL6YRWCXSjeIF2ckgkdq9dNn2B/2iE5noUAl8Ocj1L4FATRZxqS2bhLc
	 ytnkY7tt4LHO+QvyUH3ZrHc7zwc3vkf8K5fpyOAdMweTY6lDXQX4FeAuBeD6frluV6yN3
	 I09zJr1Dw5Oryuql49tLH5wPE+E/pXnrE0xnHYRBYD0DpQJHw99mgR9pv6bE8at/APBEy
	 lqIHAGjfv3+uGlQcIjT9/xC/B5dq0MtcOxqHC4ewzm/iK0bskgpO2umvxhnxNsk+GiGG8
	 03VPHuT4R34upz8FPdoL7Su3wBCGhMUGvyOlZhIXAPsxa7SE7m1J95vfesLagnDobzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAJSstbL;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407F60A3814
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9407F60A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAJSstbL
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6e560e00a86so1881578eaf.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299660; x=1793904460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=YAJSstbLvrQs9uylpyI3HdZb1yZfuuCQa/k0Xb2TuXgPLTRxBU9BoEHNybbaPAAnQ6
         95qt6FhqfEdm6oTug2FM2bnS2sCHUaIjs1cCTf7l1Rm6KtVpzNb/55CrMj7qXDHF8xK4
         uYkQ5d1n65HPJSXS+K9EJ8Oh/4PPndGc1SIOkJ5XsgVu3hHHr/uTdwR/sESiOUW7nRor
         pajAQ53swTJOpM+dAEvpLA5uoUtef9PWwzfCTA4pjRHZpcsUVWlLGWQavDLCGyBeak5M
         nr9R9YVSz937p9VKOZyAspVgeGZJsDb+geY6aDW6hK24fuItk698Y+Pl9u90Fu3c3uFJ
         JdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299660; x=1793904460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=GytxmPpd9sDdwuO8/DHC2WgJNxdYHTxQ0XQrvWlbpu/r9zzjRQbx+bzE6UKbttud/2
         JuDo49tY2hActD+1/R3e9sdHa01bY4otmS9vKmCBW9d1k0iuSrsxEbDAkc7nFUu5JGt3
         Qyi7ZAxZ6iIb24Yyj6Ro5OwG1kklAio607DS6/Jsg0ee1/XQq5Jg76FKG9dniteE5rCy
         EG2Zd5FR/UZYgetwSNNlzy1wRcDDebvWt9G0iyOtHphHasZeM9kGm9zShtfQn09Sf5Sl
         jS0AuWJCnw16Z0tib+iNJwpgZ97OcxgTG04HhmDHN3P3Fs4cL1KcrAU573cGS0jkVq8w
         vQ6g==
X-Forwarded-Encrypted: i=1; AKwUvBy+DWun8Zknu5MCiNurm0w8tLoBBWERbUQjsq6ZaW7gHcE6b0oP6p8F9D+x9AkjNszYbv253tbc4OCn@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2DjDT68ZyhxP4DqGmtes7UgnCB30r7UC0nquw2jMpvZ5xdy4m
	EI0AVpFI+B6kDAnmZWPV7wArxI/umQCYKfRHEL3WU++/7ztv4ooVvpgO10Lbmg==
X-Gm-Gg: AYBFou2zdf5yMJ2v7xABpPr/BAv555KriGw43EIZRf7ucXF7zoSJL6p23hjjkeQRLs2
	szh+h3ua+v3k/WPv7mQrvIPHJcv8RB7Xs1gfMVC5wnWINY3TjJppxslqJGTQYHWTKbufWeM7Der
	/3diOAU66ZvAyKPgdaZMaplqEnl3tXvN2NmAU0dHBiUE/28hqUBoWuHHiUPKphHIgirVay3vW12
	yrUjwhvMC36jjrsipvCigeFRzd4xdhdEx55L4XF0sLb4m1qpAVKA/IvelCc/dHkcRCsehM8f5BU
	8V0tzWl2X0XnwojsTJQiumHYBO99OF3hBDWf+jYHfJQAV7N8fwfAVDAPXIAnfEG8Cs8K9z2yMUv
	7NVH4lzEjii+1+Z7QfJ/vQCIxcu1TyhFlp4nRkkhVa+Fq+O8ZYms+hbZh2SWiQtnr1YvfdJuie9
	nMJJt4+jDuV2JICkWkHS1TNaOKO9xtI1dgvpznzBo/aYxarndZLOouwFTW8ABqkCmpEOe3TMMVq
	HwLkUtaUl05+JrKv13RvZi+AzWjcIRAFbMKRdRBTHHKqBPf80TmkILrtCNTiim5A+0digdlYwNg
	FTQj9C0rDUj4XGuS9BZpkDuRc6S7ZE+rGuFzk1vM1UDvsCYDx6Rx/sirsDAxOHFM9Hzk1wvFWqf
	gM6FzRKK17y/n5FWk45nB2HuD218ByfmIo04it+bq+KkvT/VDo2j/xpCH0Pa+u9rzQ/QrVvOKTH
	l9S9eycUeCIh+3ShWOSL2tCqggGzqMQS/XD375q6GzS4/Lv77VmU4=
X-Received: by 2002:a05:6820:a65c:10b0:6e2:3d8b:a01c with SMTP id 006d021491bc7-714f24006f7mr112598eaf.19.1793299660372;
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:28 -0600
Subject: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Validate the depth before generating the RX trigger table or setting the
transmit load. The quarter-full threshold must be positive and the
FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
trigger API. Report an invalid depth and fail probe instead of generating
zero or truncated thresholds.

Select this setup for the A523 compatible. Derive the transmit load and
RX threshold table from the discovered depth using the common sunxi
helpers. This handles the different FIFO sizes with one compatible and
one receive-trigger mapping.

Like H616, this integration has Allwinner-specific debug-divisor and
RS485 registers overlapping the generic DesignWare feature probes. Use
the common sunxi PIO setup, BUSY-safe integer divisor programming and
software RS485 handling. Keep the APB clock gate enabled during termios
updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 3bc6735fc253..2ab91f479fc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -45,6 +46,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -64,6 +69,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed sunxi FIFO depth; zero selects discovery through FCC */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/* The RX trigger table must contain positive, byte-sized thresholds */
+	if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

