Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742013;
	b=zy4HlHcTkc/kyQJGeErkZfKXtM6a7+WjGWX/4E5JC5WS6K5i6X912JABTPubkCdoRVla
	 v03mLAwzCg4CjnZA13xUEV1FYOhv8+A0vCgy7KH8oGiJDFh5MymZuMh1XIk/lMu910sBu
	 3dTaHKoufHMCNkvDxpS0FPN7TCcbTgpeGJiryTSfsLUONvzoUjlRaYqc5809xvPEgJfnD
	 lpCk8Heh9nVVHaevT1LZ5Xvt0Gbct57mWGwiQN3F1QlCvzJZpkUWcJeaCsE46UFYakU6k
	 DtjzX/ivdgPn/I4iz4P1S2cG0jVc4q+XzD0Qq6Vl/F899TH8/wk6HFpF28T2YSxBUkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
	b=Mtsocs+r0lIOwvXHhgvKvvZKifHW0b9/37i2RNmGsfgsdzd++m8u+hh5oPL19FJmQOcC
	 xbDrPE3hrZ6Qas0bwtiIvQtJj/3YVr37k0mvlehlenfvwghvE85H+s4hpz6/LktUDaQ4J
	 V5j06HGQRezzpDj0ULwD3rqxKNpFnm4XbArSSCYaqbsA3SiQYLxN8yoXegdvvc7AY8a8q
	 i7FR66ZfFGrm7p1m2OsBg/cQoMmksEMzFzpPuIWtmSkPeSPgHKq71uaaUv7SxBaAmPfg/
	 N6UxtN4nsgFD9CBrlTSiNGYv0a3GcODpg18Ns2w6Y7epZ/UdN+2hR3DZlwNRlvWwJYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByDFiXHV;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A84A606D82A
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A84A606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByDFiXHV
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-49ddddefadbso58887fac.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742012; x=1794346812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=ByDFiXHVwC84fNnosmmrBEsgMAb7JGd2Rw1dUQWMEBibv04/S7TBJszh2D+GBvnjq8
         hLJjJqS8hSUmq99vQjlYbIk7FHEaOeBdVqx+ZzugbERNMlDlQE4vJd7EbXsoPOM1I5Q/
         SOfd0G5dnm7xKIh8hEI+/m4qyqUWNxrqEBZ3NB3nQIcrrPr9C/rkQVo+T0JCNyfV40p1
         0gnDjXopkTAqxnjppYFBwvKn+84/VN1qLcWzx/9IOLZixJ+xjJnRgG/5LYMy4DlzMI/9
         yT4qVMsFKO9cIJMLMsA2csQpt4GTSRvf7ALP1izGBo5dKFMgypVGu9nazNI5I7Jn1bBc
         mlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742012; x=1794346812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=O33yzRw9VQg5cqzCIOwnVyBoFRY09ZwUAJM8vqkmpSWYQd+2kdM76tYxXLxP9FgAOl
         cpVmLwTf00U/iF8YmTB2S+H18Aaz7JZM4N4yHIlwAguy+YSd701LqHDOihXRHgTw6v3o
         Us3lcH2WvsguLPz9zLUvGOSDefXS7aCGU7unKenJnXEIXrsKRDTXORnVDGl0FqhC5889
         aj7K34YFq+qlfyu632w8x6dM3jw/YFsoV7/qSTizbfYSvdHTjVdKCL1yOhncZdS6uZYQ
         UEqFbd3LZQenmDWTZ0AsV70J3r4wpjvU2gWqJ8tHmM8+w+XpiU44Wcb9Q7OzqPRdlFVH
         9DYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/aJ+goF9cl2JR64g9v6kNlDn4ItFx2EKMIpYskC44vfbT2FZytDHCAf7bODTNzso2eJe4k3awmuw7@vger.kernel.org
X-Gm-Message-State: APuU4Z/hoV+xwGwP2GYoDj3jBDgzz16H3Ugfh4psZe7qxHqTwJi912N0
	7ZjV6Dw0uTy45BRHK3s5YtqGPytGU6+SUqr8i7tsO9JhSA91MvfywIOI
X-Gm-Gg: AYBFou22KsfOzNnvI10R+O6KgcOOI/6GnjX/FdwN0HyMxgIrF9uHNE9BW6eb1rUBQoB
	zOyFisaCBGDoQxUZWB5ZpwX/Sd3M1eninOkXqJcCufin5IzBLlyk9xrgZCjy2MoCW1sHyOhALAn
	JXzMLDRa0zxWa0WCLm3lfYsevoDilak65NxxDaAeTSD6kCTbgaH5/oUtHGsvyc8aI9qE7BCEDNR
	/7b9c29nw80GnKNuC4dpKcfZ6dyYZ5+ogueGOvoIKHsxqQnHPM7QvOfkEQPAidPJK14cuSzcjq8
	H/BFAtXZp9AGKWASUcNdfJtrtiUCckglsKGJFNNo0U3v34eSwvyGoyyN7PskkpMtm6ETmnTN69N
	eje4Kn7oxABVjR8DiDu/Al1woPN66/RgeYrs4o1hNlRmuwUw2XURKq5Z00Mqe4ksKVQqnrUpXGs
	LFF6DfYUT9L9wnUcClwHmO0QbI9/5JkYqkPP0WTct/HF1M59Q7CKE6BDFYTzDHHFuGDPiLN69Ba
	pWgoExF7C31t8LOuPxrnWM4HbVl02zcOW6XoxIN7IDLW4Q6UJpWn9zGIBLSOcPdZ734ndAoaey9
	VMbRzmEmyN61dBGiE2lf4qhIWEAq+qeILcYpAgveekao5RIY5uVZHS+GJbHOdILJd72GC82Jni9
	t8T2FZBIz+f7tXKsr13uQJVKamEo3mebdhyCySjwlb+1tQgJAveGQZalxJVi7dN7NQjS/1JF0A0
	aziUAZVC8NnuCDQ1gqtFTrQiyRG6bduYs35zOGwsGdFgz7wV9ah91K
X-Received: by 2002:a05:6808:191f:b0:4f4:3790:6615 with SMTP id 5614622812f47-5640deea416mr11125036b6e.11.1793742012357;
        Tue, 03 Nov 2026 13:40:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:00 -0700
Subject: [PATCH v7 07/12] serial: 8250_dw: configure the Allwinner H616
 UART
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..0e7367ba872e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,30 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +905,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +963,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

