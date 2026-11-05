Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911950;
	b=iFqX5t9TI3ZsJ/B2BPGjHRbPfW2xjA9wo6zh+h8VTjuU0b5OiFtQ2mgNUdvsrFhaNPS5
	 GlZnAwso/WF44Jkd3eLe38fCsWN+fJm3myEY0D6k7oF0AlyCaUk9WJOh8PlFyBcYGDnaA
	 4NBYhkgE8mSIpWz2zQHhU36b0zupurAqX7zLtWbPz/s9ySxy3MgCP4RQbTqH4MFFz47I7
	 1oN/XbQzgqjdwUa+nPNzVaJ978OKGGpB0djLe/PV1q5JtmaS93KQsx8asJTl1rpKrX57L
	 YslgMezCOLoIX3OqgnQrfzYIOEJqHR43JKP/j4KJaQHDhuSSlXtH+q+vk3PFkocqKSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=m8oYJI54FW6a8ik+mO1iZaTBUZvwOXubBqDEQXp7KG6aiU4x+sZXXxbWXxfPfijS+9N4
	 kY6MQWf9SCXbpx/KQbB3kQFYPUE+APAQuNLLJfK+hmdKPyQdWEas8JPESvCGwYHgHCRvn
	 n02MDxD8h+KSK1JqAd9AB1wyS3Af8LgUqhD/WSKR6ZJaUy1NloMhKpbK0QfAfQTCvHPzs
	 ShLtDwfjYNdw6h0XMz9FRK/G0PftbqfdEBRbKB6Wdo5oXeWncEH2VWGVinleMYufkDNNx
	 A3qE3WusgYtRmdcPkM86rRbxFyhSoCbpDhGZRuOfpY/SD1cwq4CIspbvRHfjSmSe9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwefDBnx;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A431C606EE8F
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A431C606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwefDBnx
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8446af403b5so1397523a34.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911948; x=1794516748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=jwefDBnxWZ2EcWzrZjbofVUZdtpnorCha8tuj/gnAHs01FEdUqqE3IhNil/liBwLzb
         TdKM87/UfMeyVgPHqyMq6gtZov+tbjV9Sr+B4QmCBlpuSwyuo0Rd9eSXlNwdLZX4N7gn
         ZpXZ/YdPfKwx9YawAYDI8U+0K5+ep8Ce7Dga88rLfslpGOAJ5T95CBumJ664BsoUOCA/
         Vfw/J5MkkCSf6OFdE9aYuRWs0vhTCQBfxlqNio+dEz5vusTQOwAjcSKX0aQ7tPhOJTg0
         HpZyYQgPHN6BfKyFINi7pRzBreGbZThLA3W2SDjdw4P/q7oZVgi1r3l/07wfKR6TGbit
         6uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911948; x=1794516748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=irkocjXl+NFmK1Nz2a3lge50uhRbZYNbeLtoilRuGqZhmkcdYKSzDnoQ4zebdE4A/q
         u2fKRoZO70tWK2h4S5Lqcdu4AlLLIlXOisgClP8GqMOiQBZGqbPMOuPZWnuVvV4kBeoE
         7YVBXkcotbexvuNXBb5dj9iZDzbfyhxKBKaiXqnOt3uHfiMHUGUs63bsOTeTnXxyuZpO
         PkOv4ODK3lki6OwouOOyqF22C4Qw7/mpAJ9xR8pJ6OLDuGoFEEPhOk+8LW51i7hUdxci
         PiEFQ0CeTN2vEkDKLKwPx4hWAmI8/hE7m1xqBPL3q4i0kc43Ggnhx+zKNU3+0sdPdTLQ
         71Jw==
X-Forwarded-Encrypted: i=1; AKwUvByVyNFn/ksmLJ/kVfAS8oKMHgcZFbqfRKZsOO7G9ftJA91RVKiLcnokyRSfDS+zsptoBrHvQrElcmv5@vger.kernel.org
X-Gm-Message-State: APuU4Z/UWdr/Ylgi8LpOAsNDQ8NB/XaxzTD1QwvxzdMM+myqcBBWKcNx
	V5wrV+t87ShX+DdJHkRhVFk74pXPwcuT3Ir4QAevraa24T0JjguPnKWX
X-Gm-Gg: AYBFou1CH8Cwd0BidIWsqFhcxD14dO7ZMpbKzCOS7HsDS/5Bqjdjx1wTkN+OIuAB2zQ
	qznHwg7LWbR68YwRxCM8pUQen+Hwi/dcwYA0ZOCptwZ9kxWJzpwBxMbNcEtumpNC75CFdisfhM8
	S7Ujtq27ILWXAdrUtwfgfBeWtBiMyQmBlEA8P0jRBbCdPF+IiFnoafobWtIO1KZRSmuyhcYOUJI
	dge11ppqW7Hc7e+8UcHhHepxUzPEvDZOywawupUCUaArnGgbR5h+VWhaW1AN7lkPKDM1flacQ9P
	PFr0u9gfXv5UjQaInFLHyoOhvWMn/wpHZUdDhTTYexsjRKfLVL7+9DKVW0VcruodbR2gNGV9FUJ
	uTdu1DK34C2lc/lQnV8DZdZgeh3fot3HBvDJfvsw3V4aHY9bzPfgibz02wWDgTSN8Z1d+sylM00
	0mosF/SiWeuqDmkMfJptdoX92ZjXx9zRmdM/Jea/bcKlSHsS0Vuy8y+VTADCRZeAYk7YpZTaBsT
	hSERqKDJaDJf0Cpf9garjYBM+4+vQJ1uj6OFd4ugvPFteBkkUYLUtWY4JQvDl5H6b0jWOyajmqA
	t3Ool+vuCAcDHgWHmvnaOhOgYDb01yzqw6foMKxgZ6x+gXI1NRtqJmGsawnHX/gIcucnInrwD3T
	2rYyaeG7rTMsZHZBVMJroxPvYlqgy2Y/zOnWxAjc3NGgN79qOtUkdMmDAIVy6N7MvDwVwq33zFY
	HTSJNOdneynzA7tlkd7y3hEuoC343FfaqkhOiWfVsHHW/we5MZlCg=
X-Received: by 2002:a05:6830:82ee:b0:830:43b8:72db with SMTP id 46e09a7af769-85f1d0fdec6mr511917a34.24.1793911948501;
        Thu, 05 Nov 2026 12:52:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:09 -0700
Subject: [PATCH v8 08/11] serial: 8250_dw: configure the Allwinner H616
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-8-14024d2b184b@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
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
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
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
+
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
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

