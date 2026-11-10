Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280404;
	b=INO59ttlhWM1nebUKBlHtSNUFKlnP+8SBFHF3jYjKaVhIs4k4E/96LYacfFGf0vMLG+a
	 xXoUELTQM9VacW8tWbzA3wPLCaN1FRZPiWP8fbdzF2AssZcyi90Rf+jsxti1Wv+I7j7LD
	 hvcgUjhnvO4H3ridXbSW6ZJdmBhdBWTQ+hfdnTN8pYjGeClQskgL5YzolLKp0V8kaC9MQ
	 SeI8lM8Dr+7YWJrwdlkW7RcAjLncXrA5NazSOs9K1LvSLbQjHFoNA5nhBBs3/zCZHqwPc
	 2E9dGnPrI+2bf0kWxKoqwlHbIfjGLVNuElQK/ZXhi3FgPm7mK8TeN/qVZfIxliaHZ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=U53bqOd03gwua+VnAdxNuAmzeK1ivOBmEWDdR+n4o9tAUkK619bqoN4Bgwb7kThmqWry
	 sxysG+aD9zS34ONYVk1Tqwzy38GTMIKsk48p9JooUnLxQR9lKDUPBHUm8rkuP7AFJ8JcG
	 0ypE/NhW8EdzmONRfU4wqJ+OCuYs1f+TYfYlxZgjM2+/E8xicmErctAvUG01Z8m+6rUZs
	 t26TDA8+ysxdihrLUZuRABeVXFJS6z83zAAvb2eNGG1bhQNo1ymcf2Ah/XzT8gBFdY3Ql
	 fliKIX3w8T0MMX9RXDkTa8Y9P8zcTNDGe+yF+j8bsal3xWj2/zwx44L0jQoTzE/a6Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCOnKty6;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2634660A5BC7
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2634660A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCOnKty6
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so1022790fac.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280402; x=1794885202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=yCOnKty6hdBhf+bKkL5BUk4AeE71P+hLnnxhgDgjhgbzFZt1gNESxsxF0nHlGGB5dn
         fwLKAI2QtUQP17yDt/KGUt7s7VbScV/AInTMYFfamgja3mxDzBw4Mz0GoH8+tDY6TFru
         RiWX4RG3was+y4F+Vy44Y/uKO+aRvuR774odk3nPYGOVQBGPotesJqBJl5EDSuw2Jx00
         BDkzibbNnNo8XdEnMh8+V3AOcuXQQ5LbxA72tBgvXsrEwSRxUzLLcQVhUAvEDXLHgbUS
         A3/euxvttq5fY6aU76WwRrOFNVQ5d8VK3iNn/apW+lZXHtbCgOeoWdiy8BuvMCUXVvAb
         bQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280402; x=1794885202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=rGO5mRetDIKJ3zNbCTaHkjfTmuWWEOSWn7ibi9xWKRBBo+tI5aTKNy1ckuJFNLcLHU
         3ooiC9mw6BA3ok9NLcRFevczxNVaCAR3wEMXC9Jl1Il2N/fg63bAQNKUDOXSfUmytB69
         c6f5WU7X6EbzGBuwTWg387m8G8I0RhRsne3QKjO2ShH1M9+jaIRhZiRX2wsqgTJHzrZj
         +6fh0H0wnfH27S32SL5mLgZHsDXn5z6W2qaCkWF1ceXeAzvk+Hmr4U2i6C2kaC1HS/OJ
         0VDvMhhAnby0zkPRIBYjAQxAPDVZY46wYJ2e1iHxrCDO5DprV5bJnrIputjJJqPIDbhx
         HG7Q==
X-Forwarded-Encrypted: i=1; AL+hErFd5sn6Jy7NkVquBpbN2dnDdnn0X2f9Tvc6bWvoPpGwtq9JmRH1M/9BxcLlVC24owOBAB/b9LENdGRU@vger.kernel.org
X-Gm-Message-State: APuU4Z/HSABLwF5esO5dVD7WqZ5py8ZDgvQTPA7kU7JTuU9Umq+ChPdp
	2eKKVV/PsZS8cB1SFjfhDi1Blkmr4KJOBZDs3Ad01t++FmdrlXFmDJ/5
X-Gm-Gg: AYBFou3IIQufVaHu+9TJGQclacP5E2ivsF6DjQvVS+o8yI+IDK/W18bu7vdlU7WOj8K
	QaKvwP6JC8CycEtlO4HsLILXnQyZtOY0dPUaUcUKCvN+VUKJDT7jmZJ0ujVmXKnk9ynSDtSAGvg
	DIigm00WAiAjP+TpCa1sbuBBMmdZP7/11g3d4OSQlvCrHKmcC8AHJIGB6d3vDC+BtkgMkHSmGwl
	P9rdkKoAhUVx79vQxCeuF2XI2SP4GJT8jJQifAwdO/yCtW8aMRV9RaYncvVTi08uBpZkczKj4se
	RY/21f1RntWlP2FbrnJ8sZmnCeQpuMsVuRU5AT/vvSKP7dUhW0K04GJ5BvUZ1HyJVsJWNojmt7S
	PqHKO4k3Vs7Iq7OynMYr264QMde39DW8YnP5LgVEyuGV568H+axDzM9Neu8a5THT77hqLAwVVmd
	S7Cwl4A2Adqo6UIhRi8RuoILYkgH0ostgVA3dBIsbP5n2BVxrfOjmpH/fB+9mibl+35WD+Jc3cV
	jNOK8PZJ7S1aSLuu6f0e2f0UholeGReVIsH+Rpk+mb6kdXwWG3FjUVjniILC5yClWh+vpbvIoYi
	OZYoAP518KE26oFex08ilGfbPGp23fgYtyyojgQwfnSaL7+BSRGgWtzJ1ZOSaF6YYzyI4WPbsJG
	iAzAAPGwWHFKs3e8fcAJixhli7i1NNspohp0RQoVkooUS6btQgCFKdtTpv2AY0cSPE58Kh4HXvF
	hMuEVEmyN7r/f/7ngLhV45s/PmHm0AsPkHYvQU3IjZ7t90oO4NzA7hWhNfv3PjIRlYq0BJQm6D1
	Q==
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1088933b6e.19.1794280402120;
        Mon, 09 Nov 2026 19:13:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:57 -0700
Subject: [PATCH v9 08/11] serial: 8250_dw: configure the Allwinner H616
 UART
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-8-3f03961dae8a@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

