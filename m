Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742007;
	b=cek2C8IcvkklELD0u+DuUVMgunLH02AgvQjntVrDaby55LIRSJjmNJcVYQa4SORSoBvX
	 Ed35g844wI0y1uyiawgpaLyH/S3li1/KgboMGnhsHA+WFrzqHjS7BslxqRbVw3ULct6qh
	 0TMB1WDFP/KZL8sqn9H2o7boZoCicklqzZlxokmaJhNB2EMPW38gVR81TbxkbNzx5Wy88
	 mPCSrDJ3PBy6oT9EtL12oLiTW4n98oaBw9fukWuQjJZn0TEul/4b+761PDmmo/UgYqp07
	 8SsBViFQqvMD0hs8ERRcTTDaWWat5Zw93MwHFksSIIceZjMwiiFpAHyJZyXH4+TKdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
	b=olCf0w+xVIHV3qi2jctltCq9G/Q1Hy+GaiVzcsqWSYoyxMoQVH8ZZyRxdfavNjmG/WXz
	 783Dub7+7lQzM8RNBuR1OET6Q2Ub1jxYeSDnTirAxFC4ZNXVEkaaDPRjbtA3nVZFtnTCL
	 rl+e/tZC7a2yS/66N79ZhKpzGdrZFRXteyD6e1qSQgzhZBVbz9MJJYh2G8Gtonx/Z5xyb
	 FiaczDYL71r81YM8TornJPqvz2iN/cTVCETBLpRK5Ng9Q0LGE1z7EC6LB7kHoNzaw1cFi
	 9EjawE30W2wbAxGipe0LqcOkwgce3zuHzwvHzCdqd/Hp9LGR7hkJdMQVSF6yl0Adl4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re1wsBE3;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11252606A332
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11252606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re1wsBE3
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-847ac7ccd85so11833a34.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742006; x=1794346806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=re1wsBE3N5usOw4SMgvBcZi5X1IlLIbBEsqlNIwEN0P8G+Vwv9Og1ZP/8DHVM6Dw8c
         ZT0tNq/mWh57pbDNcekGJPfeOm/FPYxv1GByDUyuTD6z52XTS8DZMD+Y5P3LQ2sRpF4N
         JUUYgq34+HCzgmBek0XQhpin+i8y2TafiKZXhIjZugWmMbpLtL20xkuleuKRYhiazBmY
         AvKP6COJLdHweYkysqw0spaDo2mWsiqKUe1s+RdLFjO7LsbUbTzgKlciA86Q0l9yZxXo
         9NCWj1CAoWYiHx/wLJF2vnupbALRk1dHNrvRjNxNCpTbxYvTI+wSCTIOn1Dvg81Rs6mj
         sT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742006; x=1794346806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=PHZJ9fy28eGNaP17M8VnJZ0p9U+YQzXg8zdDeAYBPqUNClx2ngkDGDoacmuC27jINx
         wKdVDn06DbJXmOxrTCGonA4BVLqA3/Rz1Fu08Iijj4clAORHa4C4vnHQX+lD+kCy4AMa
         A+XKyP95Evcefb9k6ikLZOubOzDUZlDZ78syl0Wjk++UNmn6406LjKU+4k9Z4Mpmz+eY
         ouH7qwZXeJrPSeNrnSRJSPDbG6fI6OC2sk+3HHNtG+ZwGiDIHbF9gbFN8S8XESIuBPkm
         E5U1UjRqU0JMLiTDjq6GAUpxHdg7uVv4trOa3hqflAjbk0Tomqn4ksafJEl57oCjYxlF
         b1iA==
X-Forwarded-Encrypted: i=1; AKwUvBymp9qO6eFWQu+moCk8ZDpcplgoE/ZqHvas+O99/QA9JKroDv+8SlLnuF0Gmb/Ijc8ghiispBfRBqqM@vger.kernel.org
X-Gm-Message-State: APuU4Z8p6yBq6/wN+zDu8wF3ZlBWI94siREe+8SdSwZsAMdh6wlzlYTm
	M/n4/TK3dC2Ux5iDqbeDAm9ifj3aMv3j9WvJEi9kqvxHmuC97SV6DNY2DhbNR4HG
X-Gm-Gg: AYBFou3P4K3JlD3AKAjuQCuWQzE5B7h2dCiLufQQA8CmwrVIsKr4WjUE9rZaoHhaJpm
	svulTmerMpLMvseXqBZZN+RzZikl9786Q6oJ5TtoSQW/rLzRzx+IyZ0Rw+NaATFan2tbl0r5UAc
	ZtqY+OHikye+FYtY0zriLib9VgFAqGCMnzeN4JCdKU+tdGJJ/GB9d203EqaLMgzCWn7GT2d0Q71
	38tEzQ5VaJKyAWoAazsKAbjye3Y8ixIk4rGEbrBV/7rj6gxW1ZePiEj6vxSG/CrEgi8hcKo5gYV
	Ym+ou4etbYjpFMKVo8GjR/vX4EH+U1a/u9k5YsI48Raxz4C0CZGXcbYX3GeLghqMRr3k7AK7R1z
	J5k92AqA+cJ8W7iXlybgS7micoOjHFHjCSOGbSW9Z/ZKeymEqPc/uDMFw4xlE19ixo7mfk37Fui
	EsygBJ8woF4tQcIGP3UzK9CW5t+gwr/XsXcttv6RRAnOzRO2M0COTKlRhcBCU3keGJp2+67Yion
	A0nabOvG6xa5f1hHWX1NK1X2E5U0itl3GBw5L/CT+E+R8Ix2rmNbSRQue1jPINes33wc6CbffGj
	haKFCF6cA/BPinWVyErv4hH3007sGq7CwXkvS5QXSGpWvJqSoe6EoQHRKuvzT2+hrQsrgbJBu4z
	dWMmIo5pwNSOXEhLSazXAvV8g3w6UCt7aOSTwFX2LfcMoPK4xXjS2HP8B10lJ0IwRBCVpMSAa6C
	+2kYIUyUMf6QLRalxL6BPYqpya/cDctcQY5hg3iLl9iWx4ll/ehINc
X-Received: by 2002:a05:6808:1a0f:b0:4cb:26a3:a0dc with SMTP id 5614622812f47-5640deea675mr10671861b6e.20.1793742005972;
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:54 -0700
Subject: [PATCH v7 01/12] serial: 8250_dw: select port setup through
 platform data
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-1-c9e248d685c1@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while preserving
its existing conditional DMA attachment. Select the DMA setup helper
directly for this integration. Keep generic setup for devices without
matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

