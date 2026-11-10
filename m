Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280407;
	b=WYqmKs3Ikk7NF4n5/hHwIfSiJCyhUpYuMwBW0ajSDArJF7kMHq10m0QToN3m8G6sJ0nS
	 kP+GzD1QWQjjHFwKN7rq+3p0rd5rrIZOCFLe/aaYIKJRfP19N6CDPru25P35yBYSmzAf6
	 l9Fd9ITqhFqRU5GFDC2I0Q1dRKrKNhPYUnb+jf8HHdQdfFE7w02ZPEhnd1vSoqTUD22gV
	 wB2C4sJPWCkrSdQPI1tw8zSuAFlUoUoL+JY6mT0J2heQvAXSfh8i+XMsg0BkcvPkQFX/v
	 WKi+lwWigHxyRmD7+Qh5o6N/BpLbipY0Wb2NwU85go571prSB5I1iBVejbl/EPql5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=UsNo1Pulg0DylX7Xiw3e8d8G91MjH6GORYTF9z+NcSTIeaF4+M0yOiaOt8Hts0KoQPYo
	 /3er3c5CJ5zCZ6vB2DUFcAo+ZYM4NqmDGa3kSh1Ucl5+gAX4TIBrRz0iSK+8r9UxmqtPl
	 0+20b4TrB0cblg45p403mXNke0JbnVKD1oWNpoyuY50Oc4rC9nciQp+x18LQg7dSNgfD/
	 gJFKbQ8ibu+3L5UlTb20g4UOLebTqQzmlJiRHOgcI8vgCWTS6Km/gctwA1nzUyLj8QOfL
	 ARphtUVp5g57JoKfjzgUGBsGL754rWXz9makJ33mQgBVFT5iVSqkSoGBHvKM26it0RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROkKaZkM;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04F60A2602
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A04F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROkKaZkM
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1283639b6e.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280406; x=1794885206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=ROkKaZkMWh5d5OvpULRiZEJmYvA+/FdCDQzPNlLL7F7ekMbXbekAgW8jTlvQgY7gOV
         ns/UlBCci8eJ2z569ftVevTJV2To/dboOcyV5EYi/R49d6Z0GddcCYVD4Z6W6WTBU8xa
         LZC6DgxzyhLMxlDdqVoSAtjIee5WIa3Cf5gms86s4bdW6re1B9sAzqlmLm50kJzXsfXJ
         iRQRC1yLwbU6hfmSnwryaQHmhySQlOveZBA+MVg0vorY3bdurElVwgDLvCDk8klkfCPZ
         Fo5WSUVImH0miVWP8Zxbh9FLcG+KMUmGASU5xbODVCqfIK7P0NZt9ecp8Nsk5Lj5A4Lc
         mnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280406; x=1794885206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=x7Y9U44i47T/+iAu9Nrzzt3ZFRGAgi4BfxJt4PNYXsGJFtTDJq3/n1zUvbi/vnmuIT
         tNG8xcxoMxj3Gr4gangbQAsfRtNf5XLz3gFPNuYPPe5BxOgi/llp5E1vG8EWGwfhKblm
         M29XJmwm800Lo7bllXbvoJfLLudlsRn0PCkI2NOk272YmMH93gnfUTrEFv2HRU87mSM4
         +1puTIeuPxOnvA2gAqgLhsz0uOTL2oWs4QB8AGiD6IhCQbTZEfZ0rKPvP+fqs4GeCVWd
         FlC6oHpsrG/woAr0Weu4xHbNwlYAqiWXA/VHNDhSZaLeFkykyKe4ZdOiE1+7VTxJwA5K
         K8eg==
X-Forwarded-Encrypted: i=1; AL+hErE+4+MAAFdd16FrVY0RR7WA3clhITCI37Lh1h+NR/jHtsci0sS8Hidsj287gKwikg/bdQnNuGHtkPCn@vger.kernel.org
X-Gm-Message-State: APuU4Z/qxVbBIJHbd87jRQ0UHonZnmNrgMjU49IrvhU7gEX5XqzbiqXf
	J+H/Ia9tC0grBIw/8G05ReoWJ78fqRXpAxV3exptlbExyTFenAz3IaO/
X-Gm-Gg: AYBFou2ncIwjprdUt0WXhzL1ga2LKFRXQ3I21rqD3rdacQdfznQbtVg22Yr1ZjTQ4aw
	af/paUc2S4IhdhjgJiyhGbHqI3z0caLmFFcPUe3aaTGD+sJAXwCXjY0TDxfoWU7cdSjhQo4/rdX
	0JUjz0zfSc14/nmt5qzlM1CN6K9fzTZBjM5BL6JyJf0XIhH+98tNeYVGxUq9J6JWbMfEONUu9Dz
	bfqDK5v1t1bst3aespREMaCYB1XmfRM2cKKb5PyOMv8KR2lS7GQVdjDi8ebvwbrHSQ/8S926Zsd
	K/nY6vtLh7fjWV9waE1bEWbyfE/EJuPgXmg0fcxXvtkQmds4jZFqX3f1r/L72BVA7eljzu8vQtI
	cnrpLcyDcT2mkZnjAkP2/yr3bfP3mysvp0ZNTWFV9wNXF1CN/OUMgKt/w65Ycw0+CalJd6r1ZZN
	NSUBddAq9nKV4zF+2qA3aj1YiwL2iTqt+pkix3UO90kIEn1Ldw5oOqUtmUKRNjKmVH8+eYkUBBk
	hYZuQh84WQfDrgis0GCnvIPDAZhYQQGnQIApOu5NBb/Wmb+dyIfxy2oG7H8f8uDLyzl4W9C7e1o
	Q28+cUTnI7t9CC9k9vD+CZYp+VfrtC3oO5HQo4fi3400ODDl95vEomMCXZbxaRuTVkqhBySMESw
	Pd5gzEACELUoMXFShhJ9isGlb+4fntvI1jsWnRUrKnhF7UD4WNa0SdxsIaCpz1l2jvOeDPCsq64
	S9CNBlO8b/8woDjYb7xbHVq1u873k5OKnmicTaAYt66JqHZLQFfLZN
X-Received: by 2002:a05:6808:150d:b0:521:561a:8e8c with SMTP id 5614622812f47-568813057e5mr726068b6e.33.1794280406385;
        Mon, 09 Nov 2026 19:13:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:13:00 -0700
Subject: [PATCH v9 11/11] serial: 8250_dw: configure RX trigger thresholds
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-11-3f03961dae8a@gmail.com>
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

