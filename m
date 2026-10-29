Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299659;
	b=gVjYhDFJm57KAhXpfzzcHWLCxK2nMSqulbQb3qa0Ux++qk/qODUu3RMeAUcPzsuoQy/6
	 mtZ2fKKifNRdDJQ4004R4OfHq7mAUV/p8shYzNkADgmA6ttlCF+O+buP6jyKE7U6z1a/a
	 5gWa2tubDoOM8BQ+0X8YkZ4PXTc3FpqKP3sGROYcTYjpN7xeYbEUYirwxTrSCAISh/tK0
	 SbC3aR7o57HVWcuOHfc+ims0/mWkw5hMd9eOzvzo8ILg/jPK1TjN8G4vwIJV0+RHWse8X
	 xqVPIRoN3//wkjjYzYkzFovv6k2aOhOeGfS6SQo5jdejyfWL7pYnJ2F/7Er+ti3NdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
	b=JhLbTjQEnZj3a023EzL5AyGLSe+2M71WvdCWjFxR1jueqg50+uRJRFnCxrM70zMBqYvT
	 2douBADQYWpJcdG7iKhklwN+x9Xw5AbPhzN9bVRapVCLp9tvFhTPceTCqt6YXn+9dm5C9
	 p+sciKoNO4fYO7eOOexEFDPco4m8kYmxStOPLxCgv8VS+9EyzXzxP/v/FKFMjQW5+0vpN
	 a0RDUy7Gx4eNI4Tt8eA5hI8t7b5xJcKmqrnQmuKWQKV3I+Y6W+0aU1WTdqqJDpQSiF/a7
	 dCleaKvznv9NDJMh88RyRRePhHwX1bWgiNhK/HGKFWJSXJOr6WUU2rwSMsf1/sdQEsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhJLO02K;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106560A2612
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1106560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhJLO02K
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-854b6e2e41fso1285935a34.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299657; x=1793904457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=RhJLO02KqAq2X4C+m2jKQTW33sGYMCaxn2ckksSM0194F+NsdzbuN04bMKwNTmRtky
         W5E06i/k9Ejsq+UNS8ns0tIMumknZyKU15TbyeKcNcONNVLwnhY2W+HyFog/UdAuI81M
         ILi/TOwoFkcYaOhC3XVKjHCeIfAFwRPpXAayq2CLUmy0F1UrCy+pq9gvDNfN/q3hJQaX
         +FGfhBP0pCWr18WMM+Z4Y0r/owudGS2775USQJzdXY768Uj/W0bCfWENdClTGhQ2Pi5x
         IkW4t35DNsBSdkmowancdsa2mkAGc5CHRSU9lo5PwWPaYTJjIhrFXaXTxYE4g+Y5j/31
         E9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299657; x=1793904457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=sEL16t9OeuPHN5jdJGdR014DzYazLJ67ccOcN33i0Idz0pC6RO8RBjolZx3XN1U5ru
         SAV/IPBa7F4gNl9MvPPkr5g8idldAYOMMUZimzrzovM7MlQUNQYKMWq0Cdd5RNkdPLxK
         U9DhGcNRKQqjuS39ZGoEY5PMHMF+eHJJh9Q1hkNRdtvJSrU5fi4DVtPjf3kC5bXj+ay2
         Vc2qjB5YcbV9xTi2xrM91yRgW2gmWZnAczBv4TcyBmwe+IC/x6RuB3yKDBdQ5HsQRfiR
         ZpKYmcO79EokpwSfrYJh8lyIsfnuTWTXlwxbo9cqxXwinwg1oN5a+mw6wRVK00bGkFG3
         9bxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9K3aXcQa6FF0D2di7MdEiQv4kD/TqbwPAsYg5GP3ioUPnb5a1Al1AgTlzwLXZP4wmqhiW10XilZzr@vger.kernel.org
X-Gm-Message-State: AFq9FYJO2immd69HlT2KQ9LXUFO8SmFfgdb46IKa9xyFmdlGetRbOR/3
	4Gbe+INgVT5XaypTIx/gCM0NHHTr9Ka+O2ifqgZ6mur0ahhOaVHbg0nR
X-Gm-Gg: AYBFou1O/02Ku1su+nTv/QlQuEGF9lCTQYv4QQgVheiwWSDjALbJ0bcnx6fhK8XcWWx
	bLr/4Zzn5VmdDK67oWqlBfWYCcx+XySoMg+UU+rDYHXYMjeo+UUuTFPq6qd0je52/RlnlcfYn5R
	1nCSDmPBC6IhcaButQA7ws9pxFPFmwYO4/7saadC7Vc9w9/onhfUEXb3Ku6sAa/mrz2Sf4K+Y4y
	35zfxdA86x0Uy3wq5FXB8YkWXteuN9aad35jeqwOKq51bX4z4C+q+iYemy4JKxLG0z7kNpE6eY5
	Le2so/MueHID3zgiB0YRpdY8f/0ReffdTrL5ovlcm3tVb9GIunkiSK6oums0EYqA5B0XM3bn1LN
	0SKQYf8W05Yh82W+PlD/8D4k3o1gzkoBzzUvl+rqvNcpRrh4por6a2MIAGPXy2hEYi5RrLGh/Wz
	nNKO51vPkifQp1eidFVCqWabYZKPDG1SRUDQJ5QitCxO8HfA8GOXvaQ2f64yWG6PEmEgre/IqGa
	4T0yQcPTbP0twQA4iwCnYJHIRuBEOxjdDIY4QgWgNzVTOChjLoX3ZOcJxxnkwR1/zFwlB2MI/Bt
	YdF3XYz8F49DlCJ56oTD/+3Bg8HGmRQHf+PhFhggrKStj2IFB0yo/vjEHKXRLjBcayXH4epn2G7
	yGfnkY/3xZlriMjuhT35dNjkcDCYEdsedICGumbjXlv4TCByn4nNnmXvgPaCXZrh9mrG3B/+B2S
	XidjUxXO3Z3rYkDgSVqai0rH0depnGceZjnsRcmFt09574TWuNtrA=
X-Received: by 2002:a05:6830:719f:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-85d3652e99fmr29175a34.14.1793299656954;
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:25 -0600
Subject: [PATCH v5 4/8] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
data. Use common Allwinner setup helpers to configure the transmit load
and receive trigger table from that depth.

Derive the receive thresholds from the documented 1-byte, quarter-full,
half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Allwinner encodes these thresholds as fractions of the FIFO depth rather
than fixed byte counts. Building a per-port table from that depth keeps
the mapping in one place for integrations with different FIFO sizes,
including those that report their depth through FCC. It also lets the
shared 8250 conversion helper select the nearest lower threshold for sysfs
writes using the same table as the read callback.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a546cf2de7b6..3bc6735fc253 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -63,6 +64,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -652,6 +655,93 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / 4;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
+	if (fcr < 0)
+		return fcr;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= fcr;
+	/* Changing the trigger alone preserves the FIFO contents */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
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
@@ -875,6 +965,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -926,6 +1023,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

