Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790375;
	b=XJIZmceDQtoYriog72V+SK2Ig8JZF/xXYax2gjqZwLpUyVA6PPtuTJA4WvOiF+ii+tFQ
	 o8nwXot2P5uNfdgn2cyoKO2fAZFmQjvWPLIXB1LK3AhJdCqQOd5prBhY8Jb58iHo9XbA/
	 aepziU8KR0oc7OXOvKXhWdYyUtcgj3x1B0VArsuwcdr9OhsiwEj99YT3MgOqDriWD366v
	 894K/zDuOOPm8R8D3hrzlnD/l4Cq82Ha8AhtOHcYiryV6TzdnsNz8WmRkYxy614XPkWxE
	 Uz2m2walBqLhwoJCD59blz6dHHKx4Z31O74MarFDx3YL94Rd2PIZytu4zb7fE9lw/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
	b=Pyxqg2OSUutcFMysCM1hx9XdEv1drxXC5C9R5YIfaovOd9s8NPAwy+LBL2RM17s2zUZk
	 Qcsz71yX0yHb3t0zhHcKwOdl1unp2eQMuFn6gVTGanZ0vlhYl4d2O0CY9bTCdCJ+vEDFL
	 Sptbjg+tKYHBKBVxjbQbq0MRben0vuFHqv/29FXw1vdAY8SCqt2+XGRudJrcy0yO1ADgm
	 fJ43buJqFkLxZJcB24UKRx2QSovMTV0N15sPMJW+koJocaXv+WGIsBUfrRtFbsnfZPBQ2
	 jmhbzIt0v9hQzlFcI5jw9VCUTr2/0D4H2qaX91VPWQhGRNTLrl2ndX1HJ98pZEpvESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsJ2Mksd;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB793606A333
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB793606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsJ2Mksd
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-823e4047037so963392a34.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790374; x=1793395174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=TsJ2Mksd+js0Hy2jtlqtjZkj4UC0XYxvCsuEIwSxkHz6A9UU1Ml2mxwg53HUv54h0i
         iroMd1Gphyiz98XyRYKNzLMRFqYhPKHoJls/CVNd+cBMh6+uTXFFZKWpfShGNJmJbL/S
         MNLk4AwViT56JR2wHiC7IuVT4T/3NcBR68MhlA3Hp59mFYTJs91El7IXh3nxm/oIMH1p
         sZXRREkstDm3mvbSsQuqMIiknRgjK7GtTPAL0noIgUMjYy5oT6unLxYXYoN9nQTIDlml
         KZml4dxQzLwWOmjhajSEctOC0zDRs2z1J1ppGGh5KXS/DFNXpbGkJNjbYgndUhJA0ZdA
         GaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790374; x=1793395174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=GulAqSeib53Gj+wgS/gAN5yJMosrzqY8thLOBIMWzYMGZX+nefoyoOWYzMFxXxCDxt
         HVVIn2Oy2Jl7iwzLP8pVE++1u1LwD69kh+oOatB/UyRN0Qlltom+fMm+MP3SPefv1SbW
         2LwLiIGC1SwiKQoq+Soq+zXmrDJKOZLmt0Hb/S2pz21vWV4V7+y7xyF4FoTy8WC/w6k2
         3rLEJLWJ3T+ebFbityzzta6YP+HlfP3iqy83s2zMauqqxFeBcGmcB+r4a/dGJAZIcuhZ
         wm7JP4B3ho/li6PHUI3gSgEByRewsukEcUQDSLlwDzVtrQwgBb5DjojPSKNbPmFDAUed
         gLGg==
X-Forwarded-Encrypted: i=1; AKwUvByFJm5bEto+2LYiowV/WA7a+Wu6/vI/J4dk6XxPaGQ3lnsaYaAy3AxJiJm+Yst69C4UAq+dfPgO5YVd@vger.kernel.org
X-Gm-Message-State: AFq9FYKhZNciNC8hb01JQVH5kjH+I6xW6oestloVdUc83+2YiEc4vY6M
	qrEr6kyjDW16dm4tDfhFDns1p0dr6X9I0bLrTSczcl82AV/p/LT+Y1f2
X-Gm-Gg: AYBFou0yTB0Irj546qDOMPSLBD1FsfK4E44O4fVUIsqj3UWygQsYu24ogwiowyoc6iM
	0ML0c9/tlRF5J8BTD0qkM+9WbJI7rvi+MWWZ+w9PzS3/J1DjM4KXOwuRbUqb4igrQSPzigi8elZ
	+mYfdXirnwqZhGlfK8t7puCJgXX9TcwEfiIzVk9gcs3rmigX1KtgiRZGqIHMe3JHIhlSmqG11ab
	tHU721Dq6aXLI9vzesxLhBKqleB266FW9d24hj8SGc+mGE0qvQdhOhvzBlPbdDpwqvlB95lRliy
	d7nuHQ7RQ6l6DT2cLDq2ho23irbf63S9yZzKhpj2nrzG1/P9GlRjncXx1P8JNvW+n/cPyDoGusr
	bHLeW++LUHH3/bdbGC8oQw9CbZIucZS18vsuMPP982WcHd9u8Km/uMtrrAvggZwmh2D7HxCDyYT
	YR3Wydf2M8y2i7WYF2RYgx+uhirB8+k1c8H4NYn0OzMRrXc9zZoBxmcib0dlKnC01V0db5OvHM1
	dP95ZcB8Ju0u7cipvskuV/s2c+xtzmPZV3pCarZTrvJ2LjkFJCgcnGZr4oXVkqhtiKSMnM2pGKl
	/td3NKLp/4qUXycg0vMr6Z57oQPYzXSfEEYzARaqhKocNOBOIVy3G9fdVho8pXu1fSzXT2KnSM+
	FDcqx39Z8SbBrqIkAE9wlMNgt4ukmpckNkJ4xqnbxHRwKs8zaa2xFNvczeGNK8thizMjyuW3EYN
	u+3A==
X-Received: by 2002:a05:6830:927:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-850fb0769c4mr573277a34.4.1792790373894;
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:28 -0600
Subject: [PATCH v2 2/3] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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
DMA attachment also depends on a FIFO size being available during probe,
so these ports do not reach the existing 8250 DMA path.

Keep PORT_16550A and supply the FIFO size, transmit load and capabilities
when matching the H616 platform data. Provide receive-trigger callbacks
for the documented thresholds of 1, 64, 128 and 254 bytes. The normal
16550A half-full trigger selects 128 bytes on this integration. Serialize
trigger changes with termios and hold a runtime PM reference while
programming FCR, preserving the FIFO contents.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port.
Configure single-byte RX and TX bursts because the peripheral request can
correspond to just one character. The existing startup path requests the
firmware-described channels and falls back to PIO when they are unavailable
or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 87 +++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..b9f5cb61f2b6 100644
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
@@ -66,6 +67,11 @@ struct dw8250_platform_data {
 	unsigned int quirks;
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
@@ -630,6 +636,66 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static const u8 dw8250_h616_rxtrig_bytes[] = { 1, 64, 128, 254 };
+
+static int dw8250_h616_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_h616_rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_h616_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int i, ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < ARRAY_SIZE(dw8250_h616_rxtrig_bytes); i++)
+		if (bytes < dw8250_h616_rxtrig_bytes[i])
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	ret = pm_runtime_resume_and_get(p->dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(uart_port_lock_irqsave, p) {
+		up->fcr &= ~UART_FCR_TRIGGER_MASK;
+		up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+		/* Changing the trigger alone preserves the FIFO contents. */
+		serial_port_out(p, UART_FCR, up->fcr);
+	}
+	pm_runtime_put(p->dev);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_8250_port *up, struct dw8250_data *data)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = 256;
+	up->tx_loadsz = 256;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_h616_get_rxtrig;
+	p->set_rxtrig = dw8250_h616_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	/* A peripheral request can correspond to just one character. */
+	data->data.dma.rxconf.src_maxburst = 1;
+	data->data.dma.txconf.dst_maxburst = 1;
+	up->dma = &data->data.dma;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +831,18 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata == &dw8250_h616_data) {
+		dw8250_h616_setup(up, data);
+	} else {
+		if (!data->skip_autocfg)
+			dw8250_setup_port(p);
+
+		/* If we have a valid fifosize, try hooking up DMA */
+		if (p->fifosize) {
+			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+			up->dma = &data->data.dma;
+		}
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -904,6 +974,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

