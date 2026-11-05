Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911956;
	b=hY5ghJH7dDWocupls8oYetTeRRYDZMWjUL+SNhS7cOHYVP3/Ehd6VagKghsOT+0BCm1W
	 Jehb274HLG38I2gj9GuLqvoyizDBZ6vzb6Q9wDTKUqmYYI7uiMAjm8vP50xEb3R4k7Ree
	 OG0OTxOWWG3te+ybbRnqErw7T+elTLEN6tZK6qs1/9cE24d+V6R8AbMqwRy04sjU/Xkhd
	 ejbflHPfuT2QaWx+RWP3SsCHG8reZAw/GVG8Vc3Y6qDF4DFNuOUPBzC3HtFkcnSLQHA50
	 33xpdbq87SvD13JnVgmQ+ZdB2f6oQZzROv18dTq4v2sq/q9pNCq9CbRbjXN8bEzhlyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=ILAjZemXMwPBzdd56r7XMMs+VkZNkW3CaLAC3xRF5lM8AUot+M101vLftFcELme95sBU
	 leBEL+y3DK5DSzjhb671jX/c6NyA1yB913WdkQpQdmNVYsT8XlRjrL/MquQjBEjO6qzMY
	 /3jX04cZyC6HBmhC+18+FbRQ9RS+sslYpWahNQxUF/+b9T0h8IFTDkYDiT1SFSn0qb4/n
	 T8aE+i6+Lf0umxLe56cSxR6me3a9hjTTjwLEI9a2QXRZw9pISuE2i2XsWC4WIDW5vyaYV
	 4PJMx8EzOwDOfhOIB5u6aTKvs1ZxHPhm6Zuv2zzwQ8aTBtyChV6Ko5IOM9nLhlHr4Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckMnUrqB;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D6606D833
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6D6606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckMnUrqB
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6cedd5so666790eaf.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911955; x=1794516755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=ckMnUrqBF5YjkYWNzJKEtt3h3QNjhP9PJbZXBV/J6bRVKXTyR151+RSJ9U+eER71Ap
         EZldnj1ydj2XTvzN/QAd1lAaKdYRiMolKOMghRHOUoMDS8SQjujfcwgIdq4WmgNcysKa
         hHmECxLq77xxeGRIIheOWSmb+8PthutqlN1Kr+E6rrLvE6em77b1DstgthhRi85GkJrT
         rzNjQLqLPOD+kwi1iBLCztr3zLJfqCJgTAVJLbCpu02QbAeJWQFO5qFx/w4NDJW3snyr
         MaNBywJAxiISvEsiIYk2F5ADkqXMYIHKfuCmxKCo7+3xCHSpKtdd/b/xbQhBTkU0nDs5
         JgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911955; x=1794516755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=E6QXDizB/xQ/9i1kbho4bL6P+fHBysdVVN4P/TPQy19lxoWXsDVWCQXkCv7ZaLAbcA
         AjGrUF0e4WyF9GOIImpiO6Z7w2vlWeGWdMQm5HDaX7bdZSg9yXauFUFbcw+w/eXVGu+K
         XKAMQTn+yzNOIc4iwkJBwwpMmZf8UwQK/nbT6hl5Y6BQLnjqwsSh9mf07hPG9Ih2D58H
         VEvJ7msNO11b/A4XoJy6MhY7YCJMliIDvTdqkdt3xVmM3V2/KItnCU6eJmzowbhSXxQH
         lFTLqLAern0qBZMGmVlfCr4UJ5kgKTcwZT9oI1xtxEoLhkEHX22kY02W5QOfZczF5gdu
         EPhA==
X-Forwarded-Encrypted: i=1; AKwUvBwfj6bdazcFzkD3IV2B0kYPzZpDr37qPO45/NoGcZUtG17QQpg3kGMSbDR4jy+MrmIlB9XnDmYl7RkZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/UtQgT7etP6dWXB3HMWl/71CaKO8jB0j6LunPe8A+hXEahu0XO
	elSPaE4/Z6v9WuaAb/gqfypN0OtqQNSuxmVtoxJK9zyP8J7yKo9VhDPL
X-Gm-Gg: AYBFou1GH5pq4K0GpQzUZZbbIvkPj+PEwhvN5A5Wtj4wOISdxN5UVp8fejFEuv1HIE4
	6Fw7Lkb1O/sv6FqYNdS05zkNmlXiwsTjH9C6iM50kw/qeoAYHojZicAyZHnadZ+lRrGTxOnM4UB
	EjuXSeTAe+MpLbpsJRiJsFY3uXcg7pOi1rD1ulkIk/AnMx2EQshdX/ywbB1Ht7J9huBJLTcAyPB
	CGjD69qTl7IXJJmp6+h1jPHnKpCSol+lyM9WTZHcHkwN1P8W1rRTVyC6hxGA3rA/RPHqPXD91G7
	8K2YKn7CrPeLzVMU8dYFgTVxoOfHEMewvrR5WDFJJ3HSCMteS+xcNn4/siiprpuscvlnPjpljai
	MgVDbM2WppA3+AnbZiu9T/5X31NVsk3k/fU8JpHjc0sL2t+IlbP8pE38YvbzkIDDGPC1OACxjdf
	OYIBKsu8a4Y1Xn+/AP1UzV9u+DA22OL70DjhBgJpibPlfuA9SaJrV4eV2zf7en4ABL2r1Lox34+
	sQg/MiYlIRjCBgAmmCa5i2t/pVvGsqCNBH0Z5kEi186r8aCMVDRsscAJaxKYaGhiQf/Ou5KFrXW
	0wPRgm2TzFQNG2ZgP4soVgl3muQ+SueJm7S+hOSy4lYfY8qgAZwJ3zjrqdf3RC4eaHUo6uBZL8H
	4/39p8vTyABBS42f63qK5Tkyrsqw0Y6f08gvXlXENpV9yj2AQcsIlXM1AruYYNQeB7Qd15X2A3s
	8XSk8uB4Q+3AQjRAyyH0N27I3UiZY8hLSnnF+Hn3kjzKJv0vUJX6FBs2d2o38TW5p733VhyqIC
X-Received: by 2002:a05:6820:995:b0:6dd:c600:ec2e with SMTP id 006d021491bc7-716d20ba2a8mr2263018eaf.19.1793911954642;
        Thu, 05 Nov 2026 12:52:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:12 -0700
Subject: [PATCH v8 11/11] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-11-14024d2b184b@gmail.com>
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

