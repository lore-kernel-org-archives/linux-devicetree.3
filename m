Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911941;
	b=5R5WWFgWueYUtD6DnoD0VBYMt2K+jGH6A+couyJX/NOrvLlRNk7mqvPIILEZX8L+hCWW
	 AbPJMEpCx53jWdwcViMS29aawxUzOqh/gF88xWLa0cXHu/DVObFjB8h+2cFat0Vku1LFt
	 PZBTOeL3arUMjEQI1pgR83nIoIWhVUQJHKBT3nRx9BbTiiSTyDsLy7DVhEKxedjXZAVaW
	 vcLXLtBtgofyFEJPHXB0D0RfsfkgRoc3C+iS09I6ZDNPxre9M1HEi0s0C2SzOxrOEWYud
	 Qllpc+DLwIppu+LVYkAusAuUe+D9matNC9rJ/sJ6oyvUTAOiuAtF1SFaqo6M+thg5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=jLv4TZOgRbApyj5GTZcynm5C4dWQPxsI1u6y1LzFFOyNvy0uwOsyvbymJUqhlP0bvWUM
	 jj78Anv0HU+lr1DwqcWLPLx5UDpEc7xmFiS4nAakUKSNbvFOEBiCyOMXfQhO4vr8WBXPO
	 tZdaDBESkPItT2OswSBYB4bJ+DrNL+GPhCaPoPgfJ6kBBGjDUNLg0AreRjtmYuuJHNk36
	 ht4DIX8cHi68+UGlYHi/hTiCktOdXEvcp5CFaRnc+EJGfJ2Gev+zzp/C1fLFDpqaZXzmJ
	 J+FDgIXycno7amqmayyBk+MHTZ7YWX5Qh4qEAFfFGTasg1Y3xwi9RCpVl1sAZqKGbfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukmSREQg;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659D0606D814
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659D0606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukmSREQg
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843b6f8e2c7so4929a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911940; x=1794516740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=ukmSREQgwBeIB4js+IejMccaKW/ADB9+k31VP81/WzScU/Ks2yx08Im3dIzzmsk/hx
         ngQ7p0W3A5VlL1l28OrlDL2Tj+q6rn1XKOsKjzPc/zc6m1EwFLivcf2ufEcpzQ4n0iPS
         IEYyIrbn66qxNauprZNZpIScS5DXmiNfiun1AkfBvNby4neG/xD2eDxozI3zYbSBF6aa
         /oG4SYj4fn/QGbVVQ+Vtt1jbyMEMA6pJwcYuaYG/y226B9rFOWbk1k+fPDcygTwvPMum
         oFH5BOdZHW3MPXyFp4avVZpSWjHC/67XCCbFMf2rOjllbxqgg9j5jY/6BcnMFWXL1fSC
         k8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911940; x=1794516740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=t9dxR5hb6IFJzkCPdT5uGKtKF2B48DwT1eVf+yRQglTC5YhXn+b8X5GJIuhOsLb/O4
         Tw2TKOnuT9M3nfbHqPIyFncKwhxdobBL1GSPZRlk4woBTptYNR+Jip5ovys++S7tEtTS
         5/r+K62TV06s5jK0uW6PxynBxdsY7u3o1Msuflu2Y4FnfwnEel029OzEGMv/q/OFffrB
         xs9M84t3msk+n+CKJIe8GN6E1QDbj8j+j7EjQk/oyJmLyDSWmTdO8jD09tR+eFXzI9Tk
         Bqv6ydAJFp/OJ8hJakoSJTyvAQix5LKhQoeCXqKY9ooJ1Mjx8QEWRLYl0wATV1F+vRZp
         Ot9g==
X-Forwarded-Encrypted: i=1; AKwUvByvA9zNjU1kL2iM3dmC6ndq4BGiQwDfuZq6FjXCu0art+uiy4eNe8sJjTFVvEi3qNw7fY/rNj+mZL8N@vger.kernel.org
X-Gm-Message-State: APuU4Z+9g5r7or6qIENJcwyyTAgLS/cWMw7K5xFU2T5DnUztTPFrtq9J
	vUSXAUp+uYN7ndks2B+0Z8HevJ2ZJmcJdhGWsLvT5ruXRrNgRenNRQ3r
X-Gm-Gg: AYBFou2w0ckrRNBiaI1+BcWB3oHWua51Mr7kJnuD33Kwn4287h9GAuFGiOvEfsku+al
	8JfsQ2d1x1PrIvGko8L4n271w2mwLFMs3Vr2Q0QKxemYHgWi20aePmmX2ThAMW4JVUtYlSOAWa8
	1IUZVb9MS8Kgp8dP+TVXTJGdCkjiDwJVkBpAyQ0A4McxMFkYe4vB0IOQ1B6IDhbIY2NQtIAiYvA
	7nlTgiJ33dt6bcg/l8yaj6FOV23UzBb9sWgo/d3BWkeOKJZ/VsVyoRfweaqwmW6pIL/w8t0o+CE
	E76OMJPt2fwtNnpYEBdEAjbVhBu9osyLhCbWVyOt3/n5FlltyWZE107wrPwEaDZVybs+FfHesRg
	T+27Su5DekOT4QPAdG6/He2/7ikKumey8OudmldZ1R4I5kOHR4gMOCL0IwaaaIKLDDNo2BPSjst
	+6kHliSmedMg2UAyt2dREi8OBipem7Yzr8Ns4DpxBNUXM+Yx0lG56YyQ/y3T9eIXp0R0uZwDPIK
	Kd+kEQD9DmU2kNRDW5rDVUkO95uy5yWx/yTzRIRiEVI8ytHNhhCDVwFDv7Hdr5v5SGD9jPlYrV/
	pmT4ui9YNHBd40VDqTjcpgE6Yc4qH0IdNkg2RzO6Pj36YkRvvA5fx+qgtPi2diV7ccRH2ynvbsW
	DgpiPGN6ECC7f+zolq8WbeB05Lzr69eJbklTqzYGvJ0eGQ6whdu4QkMmHjv5eE5EwY1IRXanXIj
	DqyqGUm3IDr7+p28F+B8cWdHq1Gi6E2e5VRnRbmJ12LIoFqtNmyGM=
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr708163a34.25.1793911940392;
        Thu, 05 Nov 2026 12:52:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:05 -0700
Subject: [PATCH v8 04/11] serial: 8250: share the RX trigger conversion
 helper
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-4-14024d2b184b@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

