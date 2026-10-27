Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142351;
	b=UAt0KyLUAr8WZc7uySvgeIip5NH4bOdER3RMUr0wGWv6I4ksY/GYvAqr1pzjFhJURNBh
	 6Ow1jysG+qbQJVlvotOwetbN+u/sTVmVqy04Uhn4QhYnKP4Xne6gVZGOSpx9gn7RnmvA+
	 eV6nBeTxhflmzK7gANKyA6sRh0aqmIV6gYzFwbWFI8PEMWcx2UNbYjTuwJ5TH8JfQQSZE
	 2k7CQXenxdEYRCQxMjf83QD5BBtsXkMX93latUOPjrQ2XeAGNQH54JVS0nv/XbbBNwMM7
	 ShpHXGtLDsPkuqj6ff5vkKCNaWfXjkodoG2VMCedS0xyKTBIg564vekQ2w52Vo02aNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
	b=Vc5DOzB/jU8JVMcx+w/3FOIbGGp0o8yLMIgshuFo41T8dHs/cbPbfiLfndg5dk9vrZuV
	 gb+yExTHFP/EksA0hZKR50LVNOBgNp5GzlsQonHDjAzzfv45a6lDtoEFbLNOOVsLzN3ro
	 +9Nq7EE/K47OX4bSYPeCJP3IcBqqGXtcQMyJMeN9vpRIhwrzjZQrB87IvR6bgL1MNi2RV
	 B+yEjjfL57ADcmTAQptWWQz1s2oLNBaMMBgJnEIZDVD0cTZOR5qsgb6xaIjN/3PZjCfFB
	 xbr1Lh/yulODFHFu9XhxQ5f3GeofvJwJ18ugsglRUeMFk0DzpmLfAebIoYem+jMoosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jH0Anj5v;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3B606A330
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F3B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jH0Anj5v
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-844a8bf7e25so256206a34.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142350; x=1793747150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=jH0Anj5vpG/+N7uEVrALtU1SH429Ij4E9och+9rgOZG7k+wjtLiLEIDeUWCl4KYp42
         DDEtUpc67OB4GmoWNAoBTy8p8wY8xAOPCgn2aScWseKdYkZPdcnmoDKFg9OkR4iSnZmm
         eoOGCLNzIkYRYwTvviEteJti9rLn6iXEBDy5tIrnZa6G7AL8s1GDhY4kSM3NTO9EzRD8
         qHYmJ/1v41sZBgdXDlmRJLPLhrWsFbPa96faHEX8iStLta0+AAsHLsIXYvEekNA4C692
         DjmzlzRhMzA6hqnNZduntNFcCeoQNgDJyFrFWc52sf59zrbegdZOTpUIBJYchmJNXFIm
         qdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142350; x=1793747150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NibLrfxDRIfDtcYggv4vzVM4Oy227j/MGOoa1wBvs8c=;
        b=IjnrZtrv9edGtHY9Tc1iyIF6iHcPKXhoW0zoPMYJq0ZPP/DMa7fNT7oymro/s2gUkU
         ZjULPQaodnuxrbuDybsrtxmZn4NLFcLFwYD0TAcB2u2lhGsXghmBsEylhM02XbYIcrF3
         RDY92LA9ZYAa+YPEJFf7md7vF00OULtzUfBhLwTEFToV4Ghxc7IHxQlTjBYZpofqfWZT
         H+1OAl8bvN1/JBrJpIo7+O9kv/ul6FN99HEqBefK6W0o1n5ma/hCkoHyV3kI4W9TRYsO
         hGQDHLY2u2kBxX5kXiAXgh9deXGuaVmKtYBaI/u2XAXT265fPUywR0ZxJU72aqlS82tD
         8MOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqJlNNWTqhnFtuBeXHqBgTCJqim+VQFf5WLw4FG4T3eEZF92vm/hQ3+pYaI4OdeMhabs4wEitK6Xz7@vger.kernel.org
X-Gm-Message-State: AFq9FYLY9omyIfPBfesW/iRt8dhRNPnY6X5xqxohGrsMRNDoY72T8Nr3
	MYhEp4VhDP5qSLI3MzI2J6wnYxR05E3v6ZUT5ALF8eJMKcUgbfUXb4xK
X-Gm-Gg: AYBFou0d6B3k3FD0+5M1YX/vpQZb58BO7UY4Vrb3OJjXHk140TCs4Ov24znvepKpxWQ
	SMVg2Wj9Yio7IGjuOIOHGjvjD4Fb0ZFSP8gLJuUH0JjZJCt24ZEMqxZiU/WdxQRh7UDu/h0YnsP
	YCGYRirbSVqelxO44IBWKI0Y0Kq9pRhjQjoLSutfhJbNHrSAQZvQahStaUOFBFiNF3UEy/OyPw7
	56hW7b1Xz2NLnxuXFrg+IVawht1YX/8Ex0aPYMbw31KbWkDjrs0CK+kCcS4L3y1fRSKBdDNfw4f
	66IBviYN97zS1U4KUK6PD0BCJiSATO3ZSqBRSuJv4Od6npmlbFt6Fap7+92jcB2U9LiPgr6h+eG
	0d9N5FIRiRBBETskJ7kav0o9ixXSx+8uIGPzPpx6y16DTI5R2+DO3rA5H1lHamGkZ+q8jRe4kTK
	VNYwMT+KXFqPRqS4jw7bkfqOpgv6YhApUb0/73WfakWP4LkwhkWeybL3IC02qK6xJZaP+JpHIJe
	oj9SCpN+SjJT4PwbyFh6ksONEQeE41tL+a4cTHOwDuMNSNO2qXckqp/Qa1w5dxK07/bc2fGorcu
	mQat1qJx3ujoPFNl/gaJv2yQrm5q5r/UHf2Ky0jhGYQYWB8gSLpiTnYtMeBx5SXfJkFUFjo15Nb
	ehy+pshMMh1Vf4m+9jbs/ivt7c5kjrbkafeGKYFPASBMeKBiIEWLHy5d4E2iO4eZXvf8UbJhska
	h9i+4AtABF1kaWKG4DtnwpnC8=
X-Received: by 2002:a05:6830:6412:b0:845:8d86:9f88 with SMTP id 46e09a7af769-85abd032c43mr884141a34.15.1793142350443;
        Tue, 27 Oct 2026 16:05:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:32 -0600
Subject: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Build the threshold table during setup and use the shared 8250 conversion
helper to select the nearest lower threshold for sysfs writes.

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
 drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1351523f0c47..2f156c01c5a1 100644
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
 	void (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked, unshifted FCR receive trigger field. */
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
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table. */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++)
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, i << UART_FCR_R_TRIG_SHIFT);
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static void dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
+
+	/* Use software RS485 with the Allwinner register layout. */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

