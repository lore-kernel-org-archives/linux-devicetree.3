Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299654;
	b=LXDrL6Ui62oweeQZd4adXR/gmO5BmXZlWHoiLlnNO/qVdoLQ4brINVIirutSq34jEoQ6
	 xRgcbqcJAKzEdmSSfRWHzdUoS2/GXTbb8Qge/vGnO+YCWYgTBiTo7/9nZO4Vz2oa9+b7H
	 tJrdrhI5rnhTNZOH11FVfOrX5cID3hdLVt4VM5akgmUdIUKzGq0uP2xLa4BJkCKFkQz0k
	 Ho5PAeE//oUZYZoQ5vOcN/IjOHGrQRfWfCtq3rY6QbMyUZMS1hDpcItELWB5Slpo3/aRv
	 Dt9o9YiaKkald/RHcLSr8yJ26gKt7kn38ax3g3GVryoPKsItcNAg0exGwJmPcCsYpPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
	b=HFeS2zST2yQkUR1f8d8yKWW1DoeCKXDid4TS6BenGuKyb0GEx3hjrENLwNp1dpH2SFme
	 WAPela54j0GrsjSoSdRWJWXlMLWepSnUFsrmdh4staDZkYQ22RUUux0CT4w2Hj2EQoCZ0
	 2eessG62VIpUBPk0RDOLsGsJPRCfsdbu8BHR/laFMFfK9KOPyd1YmbORGlYmDwsNytzwX
	 6VRVYOhKnx48VBn3TyQSi2/cH8L3tsWJF2i1TrduzuNonvy9issYLAYbWsGcZyjOpYL4s
	 FDiK+l51sewQ6ym76DT3d6S1MFSxImtLJg8hTxy2w0IzLqnY9GMYQggO8Kli47lEwww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQgwVL2a;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F23606A32A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F23606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQgwVL2a
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84d5e56f876so1750646a34.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299653; x=1793904453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=cQgwVL2aukhRdQ8yftPlO4LigSxl9iTiOuaSqZ6cDezKbSl7UUj1GUMhf9tNXHtDNP
         W9Yoy6kIZb/oYi4LE+ZQ9tCt+GVRT9C2E514XNKiCgKkFMSbw8trlLR9ucugvfqYy02t
         60gF8BzUv9zL3h/uPmNyw8NrgyE+thK2I3xiPTwxdYApoNo/F0WyRj5N1zP4KH9VcrQu
         rHehApSlGwhb1lBF/NTV0OPubZ9nrS0vkvVlJvndXTeInT5V2dX7PzzABhymc202dnlM
         T2tW/TjMbElJ1ZnYb2dQN6zPaVrPYivIQmJfx//0UNObSJjppaX7CiQuZGH8+LF1B+bn
         fVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299653; x=1793904453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=o513XWjYwekntvnJuWPjFVv8dn7FbEXcIyMLycrv7HymEdWzi37FPJvuG5FuzAO0FX
         46AFxDfqhhuoA6OUxrZ/76nqPobbUArPeOMaRqogAXn+tJsnCAObAV/t8EvOOXGhkjcK
         eTevPHi3ufK9oWjP+TrDpK6gioUftQ09X1oo4kaVSZCjf0g5kFWLsLi15HwnGiVNHeCn
         gegOTBvfIUEYmE+bFbh1ddEtHUGCICFRfbomkPaYMiQJGyb0god84RKiawkqwtxiCo3i
         G/VVg8PU+jkh2HZu8xBuyiBmRDtdgbgUB4VwJ6MDjw1PS7WqCALs723cfKbkNQZ0CZFN
         BVZg==
X-Forwarded-Encrypted: i=1; AKwUvBz2BSeTFmCQWqyD004wSKFgiM/HC8Uhw0oUvEXyx19Y4GrQHQD22AYOSuzdnW1CBO9XEEW1omu530gX@vger.kernel.org
X-Gm-Message-State: AFq9FYKtCBdfo2JKdnPsU5V1+9iAdx6Av2k0OxsW2gOXDLlYrlw9jU7+
	o3RpYHEz7+cj8MXGSLvHDXDJ1agZiscgOHWPuQjyXhtneV5OaMTibNEj
X-Gm-Gg: AYBFou0LG7D5Bf6AMCyBkfQ6CRKb+91Yk5hu/nEMcCR2YgD8LlqPJRrAj5D5SxzXDOB
	J9vebpkyYBOCs+XdmUZzTLjf8Ro+LMtlVndlZ6T2Qs6PEdOE+qJJvCb0Q5rS9khUeO5Ehq3DegM
	aUfBAERyftfMn439MRXSlyssueieEBch64OzLANjylzKGCGV1keA10XJR9CdAvvJhUMkSJw0a6m
	w3x0KLWq6uGtR6dUYEbyOEXRWAtOW0C7eQep/kRu5q15sy/V1TSPzd/hLvro56ZJ2XFvTIOFlkb
	pebponlb9ZrXDpXHYRTH1u0WS1UHledwUjGB6rzJxc9ts2/JjU2pX4p68+wEJZZkx/cR3agMaqi
	IUH0JkN2TvDFlyvuS/4aV9/On3ZZ74OlWHtYQJFLAp8g9sC7xmqVScuMvFjY4IY0TuFHToz2ZLv
	6MW54iGdHtwWjP8aEUQ/rYX7wJsJi588UI6XWFY4/s+ADKXIUopZp22rMxuE7MxtRAmt+4t9LXN
	SSH7pmuo/yE4DW66GiwGnE8zUo3NkqmgJTM/u+ct0Ze1Q4+IHpaXfwFKj4t+ZDBzgnEcakMQGwa
	xMyitc/CTpxUbTrcHQeT8J8/FRqzOh83KaP4gfXICJk8E+q7bvXgJF/AinuQ8FfeaoY0UFOyI0A
	LlfxuPdP2yJrKW/QDBy39mf148TvwN1i+Rh1yAsUL3NjTx/pMDliJy6Xp3CkTcFe5hO4LFGBo1n
	hpbdpPtTBd2IMplUBaVUMMNSX0gu6eFGxXG8cVsy3VPAdbm8syXtM=
X-Received: by 2002:a05:6830:43a6:b0:821:a0a4:5016 with SMTP id 46e09a7af769-85d364068famr49875a34.18.1793299653520;
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:22 -0600
Subject: [PATCH v5 1/8] serial: 8250_dw: select port setup through platform
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

