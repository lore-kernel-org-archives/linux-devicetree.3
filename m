Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280396;
	b=jb2JNOEN/zYG8YS5mbNyiqcjph5MjDMWZBwIVhQwJs/u9cQYyeHbo2R9zA50WWs2VMxH
	 zezu9oY5vcp2nu28wSy6qTwnRwbSpSM3CerxrI5socxGWNkk1JbVauyGMrPl9Rfk7R2HO
	 QH3VOdejoQRC8EjI7YvnU4qHCt2mr7QAq5G6iIv0myEPyrBEt0l02nYU8Ertmsxgz8YBu
	 4NlFTHlb3HoMAz2Gde4VAnr3bctU/Hzf1bzV57RxUBMJ0RSMOPt8loIJSKL8D8sRlTuR5
	 Nke+F63WfhuoumyESt8JHnTQAs8QgQTJYxlBRgHd4M9Y19jap66MT0sX8vJGzJrmTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
	b=lRIsac7Oris549y1ez9t1MOuDb/Shm5JjgvmMSlA0LXFiNrIsorIPho6dbsDvwvOJBKA
	 gJ9ufNq2FRyaodnNeRXsWXewr+S+6PjJNYJZolAsUGq1QhMUBJZOO4v70l1iu8sSIIrTX
	 tO9b0OGCU1ybe8pPoR6LASXu6VCKFKE1jza41zEiMpKPSAy/negzKg9c2W5c1TWf0YsOL
	 hJ6w4hEHAiD37//MDmlmLXiTcpX6xQXk7a3zIPAVQ9PdFVxldPBIUsQ3uQhT0cCRpBZsE
	 8TSmC6ARFm970/hSMtecoD5YZL6HhID2MsFAJWK1qSmy/dKfspq4MRXLOYxNrLZkMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7KB5Ro;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1760A2625
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB1760A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7KB5Ro
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a76f63b243so1161891fac.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280395; x=1794885195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=TS7KB5Rocmq2cqLp4Prtr0rleuF6YNd1tUgIf+aulTXpKjuB2JVHvPoWOuh6PwH8i2
         mmT/yHxIToZnG0fOK+HCYlzOkFYrhVEMOV2IUM3t1OgHjEdS0ZoFfx/MHhPY3w1CVD9L
         +i2OAG/g4wWPvDakwcyvELwmiNfoeeSmYgS3PADTYpyXi5tachAttJ0qzEXSWCKxrVUx
         htTkZZFq1cSE+2GQpoYAZeBXwf1R1cv2hsufgkz05fFSSd3shjr0tkGyGwztHML71eky
         CDa9He1vkzMLXXGo4fp8kAEeuFuUorLtv2ygxOA6hJ8FqianjI93elExZ107nKfKtRRV
         XIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280395; x=1794885195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9UoBDBjwLLwDb4WmV28avfpsh+5/w/6UybGFvQ6fZk=;
        b=OPYvICDvEDcIeFczC0eaWdaJAZ5K6bxpEFNJ73qz6HsKArb2H898ixYUuJ2qsJEluY
         p0kISkOyQ6C5X16VW/LgppVY54CSUXtDJBQGiCuvf2cRwBYV8hm8Keu7cdtX/uoLxWuI
         CHxkg8Um83qlA76ypCu8zhN3dq+4YJLH8SZyyiShdM1IhpWBJXXCMTSEa0TSGG6ucmXg
         hSDMqP7U/exPXa4YC47KAvUIAMFD+1KKxYfyQwhchabNbT/umvJll5JnOK8mdDXu1Mkh
         VwxUV+MP1pkjUYeBRgvzXWkr+4MUmKMrbrwlnnXtiJuGfDU1hnPgwW7xC+7EdwpGZgaT
         sqaA==
X-Forwarded-Encrypted: i=1; AL+hErGYVNLX5WWKPbztvcKqGDoqRIumRpepMAXOCsVsNCXEZ3e72684XQrp18XXmMe44xs0ghXHcYmZYVQ8@vger.kernel.org
X-Gm-Message-State: APuU4Z8cUWhpqbUcXxdNn/5mXNOczZ7lxKWXN4xsZqQKS7B144XmyD8U
	U55aTc+/cV4CH9w7iPk+WEGujLEUQj4JIn0fsACW4YBMdtLtNPrwsJon
X-Gm-Gg: AYBFou3ozWXYGdUuIOka6QhM2scufzRcwwix4Q25yUX8N5rSFPTJBoBFt/qCVQdqJPt
	1QBSkIhBr++pRfCJ8ICYmQa6f0zubeW9qppG40EmYQLCI53dAmqC640Inqmp41RqqUdvAoJCuIi
	QCH+RLhrlX+J6YV7i0GTCt13+GSpeqPcbohT4hARNZvEKx5VyLgu89Vfdmh35urBMm1e8SfW0K9
	h7eoZGFzxhTIUl6RIHc63gj1vw+MyWp3PXbxifstsGY3QI/vTk0vo65p7G7GgeD0HiFTrmNjZPO
	IfMXcLo94gv9jfVTn0pr6K+4skr+eEL88iKQ4QwWfNYr4Fj1JLUhZ5YODYUS8qSBWcgFTuukCia
	7jG+Vil/fe3HAYHCLZHyTayIulqMn0MX6GCm0Ni3i2ddgQpZ1voO/b9nFT01JcXvBe4MF7SsBjb
	dQhrZNHOHeHUMz44iMBkNQOD9EYClh4jyUGuSpJxva7qcG1CuZbApU9XL1sW+neKr9yz6fYa7OE
	+4UPMOWM/ixWyg4xKPkbKGeKpDC71iRsPwDgF49yRBXdsspqA5qOOc3kOv4jw3u/+CUh7ZyjzsA
	fkaZjak+WdsuMsVvz9LKtPA5r2/jGsAD6LY7QYx1llcrueMCDYt2rjao51DF84ePW1c13GEBbbH
	xXFEzP0GAPZx8Ybgug5LAM1Hs8oXKMKO5hGjW/sHe405p0Iq05PNYSlL9AKHnQAV3GSSaB5xumx
	Q6IJ4dHETCQ3JtN3BaQdEfwOmxyZAU9/UFGAm9DSBRl+gUZ/zVDRDEky5kU4L4DzDjhI4dn1utl
	g==
X-Received: by 2002:a05:6808:3089:b0:4fb:c2dd:c7a5 with SMTP id 5614622812f47-5688127ca80mr655733b6e.31.1794280395471;
        Mon, 09 Nov 2026 19:13:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:52 -0700
Subject: [PATCH v9 03/11] serial: 8250: widen RX trigger byte counts to 16
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-3-3f03961dae8a@gmail.com>
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

