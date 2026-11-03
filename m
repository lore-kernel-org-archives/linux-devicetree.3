Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742008;
	b=aqkEdtgkYPMlnoMWkGnASjWpwonu3A57hoe57AXFrrV+QmXa0RcbP33O44AIzT2VfECv
	 YtO2jkjbjNhTk/ZHC1Nrb/Sj2JSZHhynqOsqWUecHsy6uMcDF6X1afhFWrE0STT8M97nl
	 3xv5Yss/ZZv5iQciniQhVgYz1rQCWvrs7G4QcorEN1Im6jU2pd2FnIwOA2SBJA8fDchOt
	 Z4t7NRut1ZepJKXqi8kiPsaGoldmGuEutZfY3uEy96RNuREQtgJy8q2a+pUIirSq9huao
	 kOOHhs+XcZqol3ueICnJFXgT6ilnmuoipSYoQ15Z4GUYv9X6Z5bAe5W5/rNaSWzRpsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=O8jrDwVq1txVLUiI/TfC8NtB0B4ZACyBLCw3sbzJTX2r/fYVwao+f3a4MMSk8lRbsYpI
	 eGp8HzkK1XKGhmciotKux3b7x/3ponAW9OSbyitHN5sysiIZVwC5xudLz3rYIw0zx2BNn
	 JA1ovwiiiTZm1mQxBO7RoDxecf7yeN0+BLcMPOWMziepufCywA/zP2ORntQL4Nz6bg8bp
	 XAR0e4x/kCRfWKmW3Ld3I70iZ2WfPzJq/iUQtWBw8RF36cQ02PAZxV5NimzJJbXEmOomN
	 87MyboQ+3yvHtB9RCAOrwpVDNFhoCFmopRGE737Eys0Bg0ZfgTKDTxAzMmSRfvCXw0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9kUYWq2;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D1606A335
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 244D1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z9kUYWq2
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4c5d8c7f326so32058b6e.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742007; x=1794346807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=Z9kUYWq2J1PQrrBHzOjE+jvFKjYRag4wfA7A+PcWa/4v0oOJGNIKUmnvDk93En0OY6
         gexWUVLAG1L5tf42hcd1yZlnbAbNAhl2ICgu5/SRlS/kSUt1DxDDzVNnKheSiFW1zmK0
         oKhMySDWNQ17VxIIyCDKizJ1gI5fML2pxNwvlliER5V+1SsgDtjQ4r3T94XhMSaZ8hxK
         UTxs25vpgWD7cSm2Kw8CuJ184I4IR2TOdr8kwa634b33vn+g04Lu/YN1voZVP4KrjY9O
         wICQM3st+DwWeDrrlmYGBq5yIKXa1e0YyuRxurB4TTSIZ76PxJBwZUKljk8FXfzhYfd2
         DsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742007; x=1794346807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=mkocbIP1Mn/ZmiUY8xWWKKMX/Oz7zRAGl7joZRdE7yV6H+KZ+aCR00O6GVo4eWjKBp
         ptzoL8NjqXWEc8Rw1AE9zGxuQo/rdatUAd0gffGJkYT3Lbq60MrG+NWAwJBw13QtSDec
         19xGWwcJOJuaEsvoetRfgyI6RXtUFW/AcBWA8sX/6Kqkhu/amuPWmlTXQGWfpxMvloN/
         ppO1xbhbHwUxTvhEz1RE/ONE6Oxmh7KL/b7tsMIr9p/ouMqU8iIJO/5Bh7OB3pd27fj8
         orRWsa29ZSY/F0p+lDJNEeL0Ob7DeDiqXisI5nIGYlWppv/hvfjQtS9fwUVBQBaisnnH
         shPA==
X-Forwarded-Encrypted: i=1; AKwUvBw1enXAU4fj8rgOmJCYZl7oS0dfnXPBZNs6vBuL80y/ckN8EwKNE+G16CBDJDN0BeRUd5zdnSNj0Nom@vger.kernel.org
X-Gm-Message-State: APuU4Z+M7uAWltbOJvS7GsbcQ9c8YafcZNd+2AmNjhG2IbVkmLJrov4Y
	JK+I6eIrMwZbH+3jrCmfDIjkQ7V4NQZeGv9+5um9bXDaDhEn7tlslwU2
X-Gm-Gg: AYBFou0sFcOXpXZHwyzceqbTIm0BB3+PGqKkv0K0uN8AQi4XhSQ0WPo8mmn7tJ1JRFH
	f8g9aAwgfmIwJqlQ71hLNBO0g+ObuhxxK8/u4Jp38VA4cMhSgs8wtpWHkXa9vaQgHY+jC4jU02l
	WWuBuCB8/y7wxfrebTAESFAQHTjtbOOcaO6WxwXRRiGm+zCcerwx918FIrfxXSCcDmhFq2NdeiC
	os03f6St/KyM1U/CcOVMP5VX5WFRHtGS1ZSwSjvEJJnq21ZVhZwuvxT2MZEZoiI2KAF9nwPu/nj
	HjlsXJ119Si/MuYOF+5PLwUCK/lJ0yKM5q5AGBB9j2A/YDNn3m94avtbq/ggHTkA1AuZHGLvGuj
	ugdxzEfR5hEVTZxmZpHCU6nd4zlc6wDo50ifeUIfEPjd1By359viPu4zoa2Zu+OWnTSyxNMPGjf
	e+beA5yjYT4H6sWhpcPHnRJgDVBKzL1UBQYKXUT9/qchWvYu8ga3YXtPkIHbe2XM70xS0ro4ntL
	NLmloyNcv3Xt+qIPmRDjTTdBp3Pb9GhNzytvXXLNb/UFxCw3GAY8nAtoH7+LlPwwcas2FTo4ZCa
	XKVoileewJEWvKxO03NPkadvthsn6QV/+f8FvODXVJ4gBiihv7lBTzRmSt0OomMmL1g7/Sjid9y
	Mkeipwl61kUY1V4GpxCovp4Adn2JHrfj8l/TDUVGsmoj4qU6hTouvAK6lxaHxVLmoF55jYClPEQ
	JQCPMrzucWW4sXHpC3eY/JaLl7zhNnbXusvltGs0ifJ70ilDMjnfVq
X-Received: by 2002:a05:6808:11c9:b0:4ec:d580:2440 with SMTP id 5614622812f47-5640de5a472mr9799943b6e.54.1793742007017;
        Tue, 03 Nov 2026 13:40:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:55 -0700
Subject: [PATCH v7 02/12] serial: 8250: widen RX trigger byte counts to 16
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-2-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

