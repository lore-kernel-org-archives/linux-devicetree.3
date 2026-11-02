Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649327;
	b=zWahZ3x+5sPAmTq+v/LXNs+7K5CgzLL9bc6o1ggJi7u7+GN+Kj/WbqESOz1I2C2OMN4G
	 QxK2NZguACqpblCL5nx9LiW66huGhrrgQuLHTlZ3wL2DGZEq/3jAN2r/L5ATGXJPQNRzu
	 prMQw/p2xL38hsqioRCTm1pHb3LfM+K/f6OGW4FzS5DuaknXW4MpnXhmaHNNyoFNKtKWs
	 G7sNcqWtzvpvmYqMrNhyA4NHBuRHmjnUznGoGg0SoSGuz9bSy3uSBDuiZrTDU3Vez8lay
	 +BCcqCG59HzeQqNvjc1UDWPpg9lj0JgVTwtAHSilNaAFFJ/2FNpizO+qdgjP5z8v2PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
	b=s6FlHne6Ry0UQL/U4I7RUNNQCyi5EyY/Ld6tro8Qn9lPBNRL/Jagmq+nGwJKN9ftHGO+
	 7Xjeqa5a0Yh0Q0arwJ6PjmvVPWQJGOkSlvFih/caxs/tW1xkbXQ8q1RWs/moFq1LCauCb
	 lIQkyFn18rV7aGN58nXpt+WMrxswYIvyWqDM9qnYhCr8ZybfyUDN1sML+du3V6T+6zwYo
	 nPkCfAxuCr8qusukbeF/ajB0955jgJ6Dbti8617A0KqbDsx13VyEnggUVKW6YzeCeZBaX
	 sC2UgYYp0sYAXBh2krlTTDGulqrY8FphI3LS/PQD8wqzZGN74NjhcauQvl6mdxkGuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOAgGNl6;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC5606D817
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CC5606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOAgGNl6
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so669891fac.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649326; x=1794254126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=JOAgGNl6wg95HkqA44dVV7BxO0Xx+VwFpiL19IefEgDIMSylmz2Vvb9LVXwNp8uKKr
         4UC1K5OS1pnJHAzjA/iKkkPV21LRoNw7zJncz1423y60Tib0ff68MnSIocBxfaF+gE9v
         GHBoLfhmwZSCGs6rnTOi/4jMj8Fi4cM5YzJnNX45q4Cz9BRxFhUCmRQBTgYl6BHamnwo
         4aZdMmrnlXaqp82z8Iv8KgV8TKVRw+JPOq/D4WQ3dwDK3/gSO3O9RXgSNTwfODb3MNom
         GJRLV4gAA2g0YEZhDTzC+ZZrJp0mFVNJXYY/aefoOW/7HQZiCwZmqAUXHh0Leuecn/7R
         Hp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649326; x=1794254126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5hO5zwt5yc5AR2FI7Ugtcs42sAA+kCKb2Q1p1ofynk=;
        b=AiNdWfQwZC6LWlY7qdaHUWQxub5KwW600lTIzMMwp2uE1GQfjNCeO6C2XRqAB0x90E
         3ixa/k1XMFjRF4vB45A7q+zGLc62OxYs1Cvhqeo+/w9g4BpN+vT5t9nf0nIkK2b2elOr
         YC1IPQBEgiSDsNOSqvUuTE5390o6IN4WirCAh++mUFc/qpMCJNWxEe+AeQ7sB8xhYR/K
         pQt6y/OpI6GatIu1xZ7QokSCwdS3XWyv/iMS8QKEIN0V7xxd+tzIoRqlcB6dBL+Z1eH1
         yoqMThDe6/uQCsJXZJ8osrJQQKF9ZB6aYtuQEr+dUIFAKNOWn9T5S3lTHbo+Mm/T+Y3w
         kM/A==
X-Forwarded-Encrypted: i=1; AKwUvBzdtQGmSj+m+oelkZZchrC2rrqgcCiuzswEXGc226LV3M34sJvCn8ZVSqNRSyX+Y6YxjIfE7RTc5EV6@vger.kernel.org
X-Gm-Message-State: APuU4Z8m+n7d610UEgKPm2MsxCpiv8U8aXIrGbrFE5Q12bynuwdx3mUu
	wx0PZdCQf4FgAz7jk95rBXb2RMVyelIyviBQpUFb8VTmqCvS778YgGuE
X-Gm-Gg: AYBFou0cQEPHiYEzxRmseatmiEbnlr54I56/pd2hFw1p7Q61tdIz7XL8eN6bWVhqRLW
	e167febsftlNc5tR2RRLw0BzBSa34FQeLko/4/FJ5beAyVp/Wz1LlX+SrEfpcPDme/farA1FlDP
	WWqHcUkAy1P62KZaghVMkS4YoRmKz8dLli9UiPo0v8OMBAqhqIAAqqZP2EQzrexZ7o+G6dEV6KH
	UvdCO4VgVZMcuY4S3+wKoH55jJtX7eXNC4RautIuaGQ/72Qo685aESAuzxJcdb2j0ciPaW1tvef
	FMHZEJjyTTRxgagmMs7pLBxKTDX9pkroOkOYPZpRd6/FP2j6e5vwY1FXrwU0XU9Up7eGOaNSRz6
	0YZWvEadSSRuRYH5xao5I9ifBWgzJe6oZar4fZlMEAtm8J7cswkkifotp+V5NFDg0gIvSC+3g2Q
	xF/5tYq/7kDJZ3fQWyXAEMbsRUdyUbF6lAfpZsjgk36LkhLIZJbxiQIcuwerJYtJj0Fm1F7+GDq
	Vkfipi/SQfmmbaJ5ha1n0qHAd8+o2zh9SD2LKF3zOObqci4FirgswwDAyg1ZNCrNwYVbqZhwINV
	IkRIGUAd4CnhOV1zBlNLwkaPnc7svJrGNU5024ZFzdEq7Aw3LbuoFpzmSBZc/X0q5j3c9UHlCMM
	2y2jg8kJzfh0rqKEwJd43xYTQv44HF8+fQ/8aeVM6W+F2Fg1PEXLfKPrJoPUL4xwAEdRuukxPkU
	AjKHtaOlapFdlqyHG9Tw5gb+56eWFBGpHBSC/v3bdeTBg2TUqMchI=
X-Received: by 2002:a05:6870:ac96:b0:48f:e21e:1e7b with SMTP id 586e51a60fabf-4a9077e817fmr6538976fac.59.1793649325629;
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:16 -0700
Subject: [PATCH v6 1/8] serial: 8250_dw: select port setup through platform
 data
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-1-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

