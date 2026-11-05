Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911940;
	b=hyTGyjMoOHaATn9ooeBkJjVx9eU3QHSHFgt/evZKRNwBZHk+pFOCitMejY2AEeoI6giA
	 4yTQmz2uvultBhNi9tz1eKIktcFGITwEu4TP5qVUjf4G71crW3MF20ADeOdYd1hnZrWwR
	 jLi30eaebetAiM1N6DfBMV3gq2+JvbsVvOb3LSaI1F7l65EizcEeHbIPJtJzRsCRf4MBa
	 vWEsgCUCB0wPVM3hM6qKbjEES9LJ5LZuHjTbj8qxWEs6pEdSLHqbMzaglQaiLByb39ALs
	 MLKjmLHwxIGBpDueRg253bZkkM1giQvcbiX+bbJcwGwtvy2bnErzwUBm/uRFHBScfuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=rFpxwk0dxGA3YrLnVXCniBzge7OD2rLy9cBhY5J3vFc4T9TO43FfBgodY7/WUaYEMNZl
	 oYvUQa+XoICxSScG+dcumNVMQ6I4/ABRc4ZMBEvVqGFGuFlNFSOL2AWd7J/7dEzp1tawo
	 WSOhuHAFhcE1G/oYJKVFzEjcG30US26Y/spOVPebrHniMji+WqssDcOwucRTZcLaICTGc
	 I5GfHos6AtFERh1WA8WJbeQAG70PMp+7w4AS7yz7ypxs2uCq+J5rvqblRAa54A9J82IJA
	 xsZbri3ZPmjn0tJXddDI1qYBqsy/iCjvKLlW4HPHe0ZuYcCkuxgLsuAEil2P56sMNFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7siVKY;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A7606A33B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550A7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mc7siVKY
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8451a619da7so6657a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911938; x=1794516738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=Mc7siVKYA2Mp0wkrwtv02WP1UWanxUpCYF4fxsFjFGzJahcflsslfo0UWJCM8QCTIQ
         biAKPN/fjADxtxNNA1XMHp/q93eet3+F0XItruAUIJQxhw1rriJAdO4bqZZoBtR97tV1
         e4dAn4fMRsIKdRN8bYG9fcaq4fOzHO7GlYIw7qM8Q9Dz2M3xkfltDH+I8Qj+mxNmvxlU
         CLt7qlv13XZt1dueypdComgv1ZhQgVhoCYacHlY26tX9NW8BVzZp/HAOZKN+reAN2gMl
         +WCmzClTZ371cX3ykK7e8eWwKNgoYCFsRdUO6lBKEsD4GFfKosj3hEFGu5DSvoSXpkKa
         vgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911938; x=1794516738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=SxB+Y2pYukqUthlAlpOgkyLxZOtHXI9R1F6T4rH3xf4R9DnbTXNkWhqnKpKcw5prdZ
         8pelNiEkKcTEElqseEgdRuhoRy8jcAS3kowVJ4lE5EnF5VsYqDxfXeifh3JMV7g2u+wU
         Q0uhTWKseAjeK4/SjX49SWYGpMOQfjPjv8FTAPD3uZPDQmLG58Fk2Fb9k4tVD9PVTLpl
         DYw6Ebp8BZA6y7QT050k3P7MgouaV3CTKLFGB/49XPIi3kTQt5g3f9kOQez4Zwru8fjJ
         tolHfQExpxN1kGJOy36YimcfgvnQEFA/2zzOkzKu/s9t3YUKjUwptiVYRz+KQxWBrjNg
         3arA==
X-Forwarded-Encrypted: i=1; AKwUvBxp9ASPShM1wVZO8X43CLZpbGf70UHt6F/o/zf5w5GXzTiP2g9TD2QRjB9vRfbMnMn31zXNWsap14qb@vger.kernel.org
X-Gm-Message-State: APuU4Z9EgzVGCtXBU7y5eTmzONgf33e7tfD3dWnJgRWkYuBtcxIK7z6U
	qZmV7oHL4LrpaxoRbOU0jSkRN8njS7TR/FDfdLso76AawkK9NAIMas77
X-Gm-Gg: AYBFou3FNrbGi3Y1weNiR5x9EN/A8XDEcIQHWZhZrhd2xrF0Cbne5fvE4UrLZ1kQpoC
	SllXw0m/9bU1UYMpVq7HSJdNkMTTxG/eQ6FtMNQGRa793d/w6JfqVWCAVdIWEjof6aQuqi5y0ct
	K2qjT1gebg+/f9GxhuSio2IijvllNp4zRm62Df5mB7ffJePF/69dckAqCWOCBBYY2iJh2Me1y0u
	4dk5zVHZhAP3DcbJhdfoLLdbDLExrvVi06UpuMe6OotImL5EHZlpcFqX5mLdqwMVA//5+AQQfSk
	d9lYACwq2bDaHktVjgL2zRuFAP7o94ysOIlo7bej7yoj8LKJVKM/cCMF6IyAwoN3B0dlSp7MAH/
	NThkkv4Xg8FIrxy62oXy7B/q/528WLA5xmv5TlAwp0LoMdRvEGz69hjxS5rWZBwS45O4RuEvUX+
	SLQufNdL5mN11ccgzaixL/jRCS7vmMu+vyjsenn5PsCrFxM2YIhtL0VoENozRFYoHGO6LCFx/5S
	OABV++vJo+NNaq1l68yFqSR//J/SFXkppu5i6b0Yvy9ChGaodctOfGDjOMT2V6TqRE3n0fAT5mX
	3qdgrKvfeZnutI7Jo53x1ivN6UEMcamAxXzDmsrEq7N7oO4m8upJYly0dl88wbEKLifUf9kFICX
	c9xMxfTdOCIjj7EAE3pPpPiGN7x6O8gj7hiTcFVbfCKqEjRqISjU+jybfFjVEpohuk3IHFkD/cK
	Vw4hhMbbt+Rir4wREQHkc+PdiaPUNzQM9b8gnTruiMLXEsb4ypzeU+ifc7+BieR+VXs47W9aWU
X-Received: by 2002:a05:6830:2317:b0:85d:6045:52c6 with SMTP id 46e09a7af769-85f1d086f53mr580936a34.24.1793911938304;
        Thu, 05 Nov 2026 12:52:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:04 -0700
Subject: [PATCH v8 03/11] serial: 8250: widen RX trigger byte counts to 16
 bits
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-3-14024d2b184b@gmail.com>
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

DesignWare UARTs can have 2048-byte FIFOs, with receive thresholds as
large as 2046 bytes. The byte-sized threshold tables, setter argument and
sysfs parser cannot represent these values.

Use u16 for the threshold tables and byte counts throughout the 8250
conversion and sysfs paths, including the uart_port callback interface.
Keep the FCR encoding byte-sized and preserve the existing threshold
selection. The Moxa setter continues to validate against its 128-byte
FIFO before writing the byte-sized trigger register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h        |  2 +-
 drivers/tty/serial/8250/8250_mxpcie.c |  2 +-
 drivers/tty/serial/8250/8250_port.c   | 12 ++++++------
 include/linux/serial_core.h           |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..939b7d4209f1 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -69,7 +69,7 @@ struct serial8250_config {
 	unsigned short	fifo_size;
 	unsigned short	tx_loadsz;
 	unsigned char	fcr;
-	unsigned char	rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
+	u16		rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 	unsigned int	flags;
 };
 
diff --git a/drivers/tty/serial/8250/8250_mxpcie.c b/drivers/tty/serial/8250/8250_mxpcie.c
index 4935a5d1c1a3..4f0b881b4f83 100644
--- a/drivers/tty/serial/8250/8250_mxpcie.c
+++ b/drivers/tty/serial/8250/8250_mxpcie.c
@@ -257,7 +257,7 @@ static int mxpcie8250_get_rxtrig(struct uart_port *port)
 	return serial_port_in(port, MOXA_PUART_RTL);
 }
 
-static int mxpcie8250_set_rxtrig(struct uart_port *port, unsigned char bytes)
+static int mxpcie8250_set_rxtrig(struct uart_port *port, u16 bytes)
 {
 	struct mxpcie8250 *priv = dev_get_drvdata(port->dev);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..452851815ffc 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3008,14 +3008,14 @@ static int serial8250_request_port(struct uart_port *port)
 static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	unsigned char bytes;
+	u16 bytes;
 
 	bytes = conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
 
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
@@ -3073,7 +3073,7 @@ static ssize_t rx_trig_bytes_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", rxtrig_bytes);
 }
 
-static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
@@ -3094,7 +3094,7 @@ static int do_set_rxtrig(struct tty_port *port, unsigned char bytes)
 	return 0;
 }
 
-static int do_serial8250_set_rxtrig(struct tty_port *port, unsigned char bytes)
+static int do_serial8250_set_rxtrig(struct tty_port *port, u16 bytes)
 {
 	int ret;
 
@@ -3111,13 +3111,13 @@ static ssize_t rx_trig_bytes_store(struct device *dev,
 	struct tty_port *port = dev_get_drvdata(dev);
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = state->uart_port;
-	unsigned char bytes;
+	u16 bytes;
 	int ret;
 
 	if (!count)
 		return -EINVAL;
 
-	ret = kstrtou8(buf, 10, &bytes);
+	ret = kstrtou16(buf, 10, &bytes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..97301ef66af0 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -461,7 +461,7 @@ struct uart_port {
 					       unsigned int quot,
 					       unsigned int quot_frac);
 	int			(*get_rxtrig)(struct uart_port *port);
-	int			(*set_rxtrig)(struct uart_port *port, unsigned char bytes);
+	int			(*set_rxtrig)(struct uart_port *port, u16 bytes);
 	int			(*startup)(struct uart_port *port);
 	void			(*shutdown)(struct uart_port *port);
 	void			(*throttle)(struct uart_port *port);

-- 
2.53.0

