Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911935;
	b=bfvrOc3eZKAWhRNoT591w7j6umdI58S06h2/YLcEN6SLr6PQt+srx60C0JjcRY84eppJ
	 keSitYp0cJnLxOHRrdeaMYWiN5y/Mf7jaF7vSBfpR66DN7ElFutwsFaFZbosGXCNNWa06
	 rWI8YsoJ0ExDslOETKpF0EY7j9QsE0AnkRU2li00mC/4SBIvWyVEgNS8wVRpeJCSo3nEw
	 kSeR8+Krunk21AGREhaelcHQywz8OiV+9+2Zs7nWvadqiAJFVOMVQXhC0f+x65I0AaT3P
	 Huc93OFQ8at+weTaJThbGdYsut+EtPm2NwH1eNn2pydmixaCx94BdsJbZDLVNz/APbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
	b=rd1HXvn0Mr7k09/Ei+n6U7k2KswWCGME4Dfurt70tU4Jovud1GZvh/vHsFwr2iAzj6Nk
	 wpi5IQBOx1qBMefdQYp/0aAyLEV3aA1ZvxjcWuRYgJghKLeJpzECC9cNWqVJ1OcdyNNhQ
	 5I9oBrg1j5kClRA0qZDJNO1MyUDsFjUq2zcyItU1Hwj2N1/BqIFH77TrSwU/EEsQQn9kW
	 DDMTdH+vewILwScQ6AtJYG+JIRXKg5XRCDK6KzZu2mlGi99LfSF931yvmUnOiJcwgaB+a
	 L5uhcwPvvDlEnKJ3uZbJvPLwc9IheovJDOZPNxPTF+wIANrj42UNjGlZNZN2Zrzkd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjJFfOjv;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33737606A338
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33737606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjJFfOjv
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8241a56cd70so1559256a34.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911934; x=1794516734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=NjJFfOjvN6OJTs3+ELek/WM2NFYhKA8wuBUCcV/NcpcAQOMD4pbyCT7DIj9R4Q3750
         Dxj0lY4YQLN6U2n5CCcHaDOW6YgldlFsaf1LFiwPnMZ9nXDg0cuHo5C3JDrMnf9iqjPQ
         lZz2Tc0My7nu/aNOvv0uEdY9Fh4tDZKZkAq9ECYhgOgEjRj5SljbIqV+mp55uq6kZODy
         HC1N0WrLCfkOxw3lHfba1dIoVeMTE3pAc600+IA8rBpKChSuh/q/y4DLfM3BGIR2JYR4
         CjFb5yxnJB8hv/KoSXC9t1Ar9uFPt+xzLAwDKrXW3k3kysjLjbh4P0e4SlmtbRZd7LvK
         yTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911934; x=1794516734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lE1h7vRI/sW6l31u0lxhMtA1G4uNToUgbvAzqOb6yc=;
        b=Cdszv0P3fHScXyz4YAd4pDA/tBehvGQJfqYPce0thBsB0JTpFY1d971JcWo91Czs8D
         qAN3NgIZE+ZB1xrljNbdldpvjm78m6uY0maFGSRbUa3lGT7g6/SJl2bzZx0FjoYwzk6M
         PBxfu8ySKhZQFKBfyk90VFGLmUcZlX0MrJerJL+5PV1nmhL19/bjG2EyrUD8lH+XZtxJ
         940/ZZcOE7JmhmNPD1rRu7jTTGcot7jehIcwhdyAy5Y2DxdwtDBwr4KT262eYtB05GDr
         k3zDP9mAV5+qrWv4uISHgYeryWlohNDW5Ibd8S2x7ySB3kKN4+EMloE37ZJdZ5a3F+r2
         DlxQ==
X-Forwarded-Encrypted: i=1; AKwUvBymZJbBiQHzJbSlllAX8CvlYc1PAjC+xbXQ2N9+xsA4oAoWH2UxbBE9nlALa64EWKnjMSsLJd38xvTP@vger.kernel.org
X-Gm-Message-State: APuU4Z+PP4Xi+j5q4J0F2q63pglCEnThWhpWHG9gn2DC6/L6ooxRtA0X
	0dGGep8+IRu5FhA6OwNSWvYz6cKEzUvg4tAboxa0SeX5Z2/VfzWr7CBD
X-Gm-Gg: AYBFou1t20xGhpjo3Wgr7KZJdr5Mzz3pBzkyOEXlW/nSWcXoswNzkZgtU3CbRuPbJcq
	XCpiOfCOa9UZfTAZobwTc3/kM+Wmb0UAAfuYJUmnAGaKGEaMB10Wxrbz/lk2yvpfR7z0J0uKSR2
	/+sRUfrO3yQpp5nZ+loC8Y/jZdsXv6ossGNzScCKKxmYNzRu4RJ/qpwZxbG/v42vEAq+CWqHAmy
	kTawfqbk4aGELggm47j3aAQ0NGUaqHSf4TClPoihMySyZZ4ZVqFjoCbIWu9wuHav+uV015bQASs
	jhg0ocS/fBTpuh7XGDmDHecuZpNmMqGAJUUjJ1NdsCGT2fnVp2xUlXHpyepHApc9BiNMuijFkJB
	nSE/At5O5WVgfpurCuys2QcsnVS+SHfj290zisqWw6tu7lVx8w4fewbvPvFXSZ/Mu1RzzTFCeFw
	rnBNXZsR72wE4X5LkXVyKCYA37apHyRAsK/fUdQ5HyATP1ipsa3PuTeVN5c+1lY73P2PyNhiHbE
	FfBYCfB4VUJYI+77cuuVGIj+tED3XsdzJC8GNwQDZsxYHjKrIM035Z/Xuas/yDeCp0jpnsNRaf6
	KXjwpkqkKooeWA5bTQeMNWOCpItXZfypbmzyuuCaoKxHXFyHdsVTje34QhLrOEZitRWdI9AVE5m
	hX6aPdpv1bqR3FKI9rtk9glb2L7nYJCZbujRA9T/uQ+kQEoHiXKHfoll0C8f3pIs9Xt01BT84Ri
	b8UAK5d4Io8SJyroqfW67eRUsALVRuBJncUoeoSshkaDXWovDt+URWoIfN2KgvSiB6EWwWD7g3
X-Received: by 2002:a05:6830:2e12:b0:843:cf07:7a99 with SMTP id 46e09a7af769-85f1d14ff4dmr511092a34.31.1793911934069;
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:02 -0700
Subject: [PATCH v8 01/11] serial: 8250_dw: allow port setup to report
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-1-14024d2b184b@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 7 +++++--
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..80b2b673b422 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -765,8 +765,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (!data->skip_autocfg) {
+		err = dw8250_setup_port(p);
+		if (err)
+			return err;
+	}
 
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

