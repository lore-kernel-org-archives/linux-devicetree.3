Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873356;
	b=bpZL62/jJ4D4GIDu7vL8c3/wQ+jTKRb/x7lL4mCGqAiuqbudasZlD6VVdRwke7iIn/7g
	 lX4uCritW6D4Zy/kRhMZsriyTIfr7H7sYcTIPy6mJ5/kfzEWkvS9BRaxRGNtowb3cOAtl
	 G9GzqUCsJEyjEqdNGhFqSj5aHUnH7MJ0aWAKDZ7NQLaXR/Nnqg6C2AO81EYsw8YZGf0pF
	 PR2iE46dckn1XWY5FxWdtXISVVjREA/71VTXsqOw4N58YOB7aI+cXKj9v0VTj+5q90g8Q
	 8ae0hD2Oq6546MZ0ecVaj/JiT2HuyeuRIrw2nuSIsFOtBgQlmcFZQnNnWGPK2NFkoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
	b=vCliIwnkKg4oX7mxo8+/XHXQ67nocdB8QfZVBMSOshlVKG1HFBjsAmUmRgNdNs+MBGjH
	 1zRcL+e6JceXRb6SDWPHTFpSW06CAGwlp6PQ+ZvSC/HNkGsqKmR0EBBjE12G84d+osfvu
	 J7ROPsegQfswqGixhYMeUlIJuedpyo48y7XFJY20MJExa8WRg61V86rvBpzrrf8F2Vxv3
	 DN3qIFJWbcWfrEKfDmfOeTXPdm7wfWcQichTVOxc9KwZEte1RNgZXs9LkRDo3rxcAPhkp
	 DsFe62oAkzVXmnrTV78VEELhlAQHw3IDBoNRXR6rWdg2Pfv8j2zSiIXBScPXLpHJnlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i6G+YSE2;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B4606A327
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450B4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i6G+YSE2
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-823b938464fso1395807a34.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873355; x=1793478155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=i6G+YSE2VtuPXvFmigV45DZZLCH6LB+XkG5kfejVXRhCgum2x/GkbzfSq3f1FtjFLt
         A/k/PV/HiOSWfoX+TuzckdEWAdfd0jVZZtNsWh2nGw2rQTKgHcck3DcZ4viCwL+v1cu6
         Gi3M8ht7pwLkefdSvbUizVO3r2f7Z/u5nJ3Yk29OFmRKrX7N0SkJn/3IsdEwbrssEHXq
         QIpqpkjoLrKmzMntlP34ejWW3qK1f4w8EOtQwvVY5PnhWk+lwGNyPOmoKIt0Ev3xIKUo
         gH7oZmipSqJFMpi/M8iXt+hvhMdkqVRaguhWtx2ptIvEiQ9nL09P4B2dlisWxhpM/dWe
         aS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873355; x=1793478155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=0q7v8i+lb7mvA5MSCvenL88fOMIWcUOF3HN5srrSfFGV8vuffYO2KmOXeypSoHm9OS
         N9W8wMsrO7Sf/yyBPZe7vjyEhNGO2Nw72drEH08MZGNk6MojLsMI4ctX2HodUs+BtLnD
         Whi4WUUlB0db4YeEwyu++yMVxQxUkWXXTheJ+gAHA0NmG+Nhd/hllCVs1xgbJyblM0Na
         Kv09jNY7aNjlT89PslXB8Tlb/w5cyOp9dBjHASl6QNn/eYWNfPEG3DQd5SnkG0Dqc4/w
         mcly9oL5ToU6SXq0yVrMS2Yqwgwtq9cRLflkwnbkKe/g6s5GaQ5jr4oYl4gsjhNhv7W/
         R3Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxAxWpRiHeNB5z1d7QupqdK5RSC4FHGsVglsSureXWo0TJvlNHtKue4SxaD8zFmm2HjJuH8fLnZCkMw@vger.kernel.org
X-Gm-Message-State: AFq9FYIGiw0yBetY0s/k1zu3tdzTc955lWkFsy8Nv9TVbWX4K2Ioa15E
	uMurnWJvl5cv/vKO0H5jviECdZ46EkS9OPh/d8fR77323rlizV7F49iH
X-Gm-Gg: AYBFou2hDVH9d/mhY8cXfGO9hjnN3q8dL3xtUlZK4i0Q2GKFBgCRt0Dz/VnbEv5n1FY
	8wirIZngmLmMeB1CsFeahaQmN4zH6Z/LK/Kmm6xUYbdUgB/xt1t+0Vf7Qjy6zO+9XjzAQTvmCmg
	/ATA/+5HV0Sx8iz4oa+fG3KNTLjK8XPE7v3cPf4WIE/WvLwqE3n9bh/lnxqMaVXkRvK17DhZg15
	fGfGRfsCPKdDOkGBx4mIRzfe3k1bZFD7k1A73nCaOIfvPWqGFUiTDDnFh6W32ebKm8CMro6XDSi
	GiQJuMHKBE0QmYVwe0+0pTn9TrHRs+LZcnX4wSaSYCzUmEevZJemft41eUZXEVMEzvk7sHZIUhj
	Gepj4YYynB1AImlFy9fHlhp+FQg7vUioeY03C4ZWmis/Vc8KlXO5FVbIs8HyRavDmVb/OXGViCD
	13g/29xFv0XlpXr+f//BikTHi2ELerbcevSDgfXR2EY1sMglJQXNgZQtcyqVhE9E6nMfNssbMkK
	4kncuBNT7rTS167afgzUi+e/bz5jhcRqmwDIEfCAvucTh7lROISZeobvV5y6UpP8xHiNxknorI7
	9U1T/NhX0oq/ZfU2Vf9T9aaWNv+/uuNF5L5dj++qXJjAZWxuutycLcPjJ6YgiCbw/Ur28hKnLJt
	Fgoy8oPJX3VoKZZtk+Fry7ilO0oUto5DfxWZNE8yBL5b5vNVMe38LA+O47kLMIEzgpnYNEDvWVG
	f2efcHk2/yojN2bOU1t9F+cWBr
X-Received: by 2002:a05:6808:1786:b0:4ec:d521:9124 with SMTP id 5614622812f47-55c002e11f9mr2173304b6e.30.1792873355240;
        Sat, 24 Oct 2026 13:22:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:23 -0600
Subject: [PATCH v3 1/4] serial: 8250_dw: select port setup through platform
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..9c171c5775a6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -595,7 +595,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -630,6 +629,25 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* If we have a valid fifosize, try hooking up DMA */
+	if (p->fifosize) {
+		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+		up->dma = &data->data.dma;
+	}
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +783,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata) {
+		if (data->pdata->setup)
+			data->pdata->setup(p);
+	} else {
+		dw8250_setup(p);
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -852,16 +867,23 @@ static _DEFINE_DEV_PM_OPS(dw8250_pm_ops, dw8250_suspend, dw8250_resume,
 
 static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+#ifdef CONFIG_64BIT
+	.setup = dw8250_setup_dma,
+#else
+	.setup = dw8250_setup,
+#endif
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
@@ -876,16 +898,19 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(16),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
@@ -895,11 +920,13 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
 	.quirks = DW_UART_QUIRK_CPR_VALUE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_tda54 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ,
+	.setup = dw8250_setup,
 };
 
 static const struct of_device_id dw8250_of_match[] = {
@@ -918,6 +945,7 @@ MODULE_DEVICE_TABLE(of, dw8250_of_match);
 static const struct dw8250_platform_data dw8250_apmc0d08 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_APMC0D08,
+	.setup = dw8250_setup,
 };
 
 static const struct acpi_device_id dw8250_acpi_match[] = {

-- 
2.53.0

