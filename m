Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280394;
	b=tLQBEkfTkC18pbFIKZ4rOVh01M1i1B607q3XPInVDn1TtfRdOzr4mRVr73tsJcXXW0KI
	 ybFnA1Yjw0TedETtgVEX8YcM/g3G7YWsCPeBbs7GXgmthVxHYsjqPeWUQ581TjDvrqXku
	 YUWIvFC7+hUgU/Cw8BrjGAag8krz5rhlHbXW3isUHbd9CCfbscg3FRzEtM7PCaZD8x93E
	 FxIjawfdANfBtvDOqLjcEJoQz0Fx/ZhOU5IKffulmb4cmJIw5/b60OJ1FT1pbajYKxGWr
	 vwkCqHAyRISJTmpex58jaV3nJStO7rXzrB8bntp+dhtuWGM1rcJZ0HZZFaBB8HaXlmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
	b=dPfAqT/6Kxeh0dl/hWdjsTTWzM1Wa6TapacaJZD21976ZCk+DcrfIGKOGbTFjoPC32BB
	 724Lqm1ArBJrBp/Wz51OFKCfliRkK9NcQMg7UBP+2l7lcoXmXZIDrZfTSxBaZtIdep/mt
	 HYGpqNXC/ZAJj6TndMLruSrks3pd1U8yXp5D8FJyzjxgd4hH5WlkxjBsmfnRcyZfawi10
	 wD8tystUB4lb97Pjo+A/3eeqPMaGxW0bYBclLglYWcmb2AXWP5TuuC1Ksl9xrRgLmCR79
	 7mzg4kqMSJbKPtIAj1GdRd288soVfaF9L8RK5Zn6pYJKtRnPcYSfnwGqrvgF6iT8V2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKcvETLe;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C58606A33F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C58606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKcvETLe
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-51f2e9e6987so941785b6e.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280393; x=1794885193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=TKcvETLeC6xPYlP4w6XWNuQkLC3mMyxIu21UmG3PlogpK0vckIq+hJO0JL3E1rsxQj
         Qtpflds+Wz6GD2FKnKMbNTITSPDQrxHnQOqUZrIi7Ohzv923YlM3sDm9fgj4hdOEodST
         glafdD3NEtBZAOgTv1m+d56tF9TvdgPB1w99fMUGkMAJcjU7YIDpx0AT2Grk8HycnfYT
         K5PQTgq3SBY6KQfUAPNZfIammSuBJZlOfCOQWFL3f1e2aFL3yU4UYxQAWyyT29dhisVh
         On2RDgnWyRx93m1S2LT2CeKGsydFcuiGzjY8Z4eceCijd/ppDPUuLAW1+I1Qm/KzKFdr
         yBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280393; x=1794885193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=JpVYnLm84WYNfR3SDR6UWN56icpa8BDwRozxg2XeAVwWuc7UQtmRFANqTQgzMMLuN4
         oW/hdLvDl6QVC7sK4WetpCtRXNPIi6qGVCKXb+vOVFbO4E5gyo/QAt8LyMDeQjtJO3qk
         pKA87jqdXbajX0jhlNrtJLAFqmr2vgf7v73zjWk55evJ9tdLrl7AfhHDvDwKkda9q5Wi
         cj6S1/oAX3UekUKWFqtcrpa8elE7iuPJlWaUTL4VEBC6q1uBXwo+6KEnM/CHlFOzMDgQ
         dZL1X9W/Qxp2kPRuw9K+TlrZ76DE4YI0roGfeXcMs4i1tw5KUh8/iDxZ1IWapZgnPD5Q
         /9/g==
X-Forwarded-Encrypted: i=1; AL+hErGhOFd6Qp9gPHELH90vd0ebOHVDYv3jNZ6Ea8qbawUFjUEbWg1zksYhFILVy10jeRfFsj92JwR+jnLl@vger.kernel.org
X-Gm-Message-State: APuU4Z86xjrJddaeFQMon5YDGNwIYuepcNgtlgDgmvYHpjAOD2o/FM1N
	3QVvuoZm3RNOq+m/KoMMxjD9LcKtM6iAt76/3yp1/gVnrtcwZ2wOoQuw
X-Gm-Gg: AYBFou0/VjyXyrTNLsbhNn43ObuGpQq+CEaR895vu5/Zi3vXpJKSC0L7G2BBL/8lTaH
	sJgG3dKyWn7CGVUqPn7Iiz5SDk0icwhRRrqKIYYzKAf8q7B87UwVVQQLHkiPntbDa5Q59wngNeG
	hMXFZJeVyLsDIHLMT73fEKVyXQ3i4uSeYUlhiIEyrcyuEEYylm9Q8s65KAJjDoOqljWL/qpffaY
	8+8cHoq39IErOeAR6fWKvTCULBTCb3er7ZxSRlUGoF27+ddjKZWpPWA08rEWtm/vXFlM/THTn36
	McZynyYhXef2r/TLpTvr/XfLQoWBm2Dz9lZTRj2qFrBXMkhnOQ+cUogQprvOD2o3dO8u6y0ZuSD
	vwL8raZtIEYtiVroax3QcBCGBXcRwrLfF9iD9pvT9ZQbSunRm+6XAKaW5i2ep68eArtdD69TgKF
	A1ShwuG7XSjkqDLcAhNE1z1WrqJdiUuEolI63YAw1oHuyJQgkkh7Wv89qoPx21Hw2lud2l7ioe0
	C1tfdY9l7ZfPL6B1X1jNPUMad4kbDwJIkEELTDy5dAYzlSTeslOm+BerSX44SKXOydOBrAqSgpc
	zBpMgdqEUiPJry/LTjE9lsbES1LqWnm46UjnPLnulMkafVknuZxy0MEzrTI6McaYa/zFLZ9tmAM
	8hmlu/In4aBqMH7FOnB8RKwXPCr7TtEDEIWqWkqsvpMHumfKgN29dx9FFOKhoDoNVkQn+yzVWV2
	RLfC29S+3mWoyOBJUVn3QuS9CkA0lNP8/kJ7tDS7BCaI9VOv+AGRQo
X-Received: by 2002:a05:6808:11c8:b0:568:195a:3bb0 with SMTP id 5614622812f47-568812d0fa4mr697292b6e.23.1794280392814;
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:50 -0700
Subject: [PATCH v9 01/11] serial: 8250_dw: allow port setup to report
 errors
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-1-3f03961dae8a@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 +++-
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..8fffb1f9ab0d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -766,7 +766,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	dw8250_setup_dma_filter(p, data);
 
 	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+		err = dw8250_setup_port(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0

