Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873359;
	b=UlglL4dGmy6Z5lu31MGvuDqI5QrgOzh92BV/krp4UzepFOKHYliHcdkszE4GZH2JLy3H
	 XC1AWP3wjMjcNkguQlvT1JqD+gZBjUznSyXOwkalgn7tKUPFQo5X3JIVKxtsRAQBKdWqD
	 uzL9T4j1pPrMtdErRgj/sTGVRgtRT6aSRl6Zmj8rA2kqFaa3a4kbTQ4IyqJS1CMqOVSa9
	 ULyOeSIcD/HgylBdFGQt6PLmC+T/kHLPo7jO/NT7YHys2JalK6NwNi/eFCtqHGUthBzKN
	 6Fxc4LzMUTAEAADzYrebJSw4irYbszDhqxKElZd2a2/S0dd/Ok6xVoYwz6CiGsK6c2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
	b=FRruJVVtpXyHPuWZYLKgFoVO+e6rq+ulvHg4qsv0YeO7OpxKLUMCYSx+w8gvvoGSQwHz
	 TTILRg7IYoeMAk2wJmwSk69kcZo9jGphzChmW/oIaBFLYKm0UFxPzoyUvwon+Ti8MsrKf
	 fPJTnTbkcGuBqFmOMG5G4chGZ8Oa4vn3GiRk1qTAQAFQTrvSmAZK58/JTxIW9CsZOhX5J
	 WyI+6oxu8qEnTp8btv1LAVsK3BDBQoImUluadPChEnA0H1Tn8jq9JfOKHIHpU4eVnMrpH
	 hWwRl042EjBdhzUJDXCFAkQDIy0jTEuCNJmj+4VrTt3kktcAnq8fQKxTe4BT3xs74NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaMzDOtb;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E660A261F
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468E660A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaMzDOtb
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-823b938464fso1395823a34.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873358; x=1793478158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=TaMzDOtbipq3H0hMxrTqLEGpvgLxunR40KiGs827LUA4QZZMMUolHwo+b4Fgo1gjoN
         HBYyl7hhKUNJC8hXczwBGPkSvfDuUva7TPoxIlWAY9Fbu9UKBtYr0k1oC7q3hvI+IGyS
         tZex8M27oBhp/SqxZxhUelQ+zdb7oX/tK7enj3VgvblWFCiUVczdOD47tmbfV3Vn+mNu
         c+vLcma9+71iaRPITXF4kraotzk31MUiTxf69nioako7JvHo2dtV+nLqlcsay0FpxSpA
         adOjC1splw50rM1yNvw70nQdwH9pdc5Fii4H6vI4tkRX8YXfk1QpP89JSMdIwFE8RSNr
         ixbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873358; x=1793478158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=iGGPyLVxSuRKOVbreX49cSIt+Kcuw0xEmUHCBPb/xHPvX8KB04DfAj5er6APTKRCup
         3knNYIX/eEi/6+NOAwF+1y8jlwK0T1bBopjIvttvpnkmgPGUu4h5w+9pn+VgvlBmd1Yo
         hk+I+HALqgc0dVaSP+eERrMFwRU6gMUT5kg5iqzCdavTI5IWXiaVfeFKlr5n2PHFtysb
         r9fg4Z7IhPyoD17DVLGmj/ltkE8dts3eIAN3ZjN3f4lYbE98DwpMU3z8whGj4ESVYCDe
         IzwFJAF9IJvmn8p4FRZt+nzIFfzMdUU9yL2R+aH4Ib/LRXp2LyPequhkuHrxbWRyDgdK
         lqHQ==
X-Forwarded-Encrypted: i=1; AKwUvByB/3atKYWDBsG5MHH/JH3P+FJP9ezvw20WUrLB/9y46B7iHd1DOmz8/p/xLPCC+XfRA65HcS20KOSz@vger.kernel.org
X-Gm-Message-State: AFq9FYKupO7BJXXRWibezyceJNMgP5sSPtdn4qBSdsmNujIvynrtiKId
	OtSvSrgm/2/xjuzXj1Q2X+OFqJxTpB3L/hfOimQUxDIY0reczrLeiOzS
X-Gm-Gg: AYBFou0S3xs42bVYjEQtFMjLrYrVMsu1hM7+67WM7SCWfwlsBdzCa7SdNYJ40TnrvcP
	KA2QTcRdPNjAa2tcLXpDVeo4fI5c/SphDyrT2fDvfvrTbuBE/auX0olPkA95ncWRMq1rmZxsmYT
	ZB55utrIMxVnPI47yOvvBBQQ7lI1d958+fZLc++DXkQm97VjtFxta4mb0c0lxflAS+fwoTPEj2l
	pb/JHrN79ta19R6GtMjJl8HPsjtpicX1UrQwCl82SlFPRXgcPjGWfqW2nT4NwD6b31KwsPRjlnK
	wCWbwEqy3zHDAefkkEw2lD3mH4m3XaP5NMJXKYPtsKDCAgyO4fgcsGSu9/108dcYPQQqoTQxFXi
	UCPJbexG6c/P+iniGPOE8y5/f3FdkRWXyQsLCFcH3UP9cc71dhdT1c6yvGhrNqRHMPBXI05+xoP
	WZsBCp4BUJpoUmHygTjq8SrckpR85y/jPOg6Lc2zx363/Vuhb2AlNS8Eeej7i4AC0kr9xidtEBN
	K5yMeJqnWhQQDVOhjE2033idCRPc3xJovQH76gyEjPaK6h8zVI6diFmYbCBSmV6RMSirSaOZQ/r
	iyqGXqC0IUp2EcdtS6x6RXsHxTcaUrWF8Jv3Rxm6ACq7Bt4yV6KmGV9Jx2RJwyU+5WjjJV4GmUk
	u56yudeR2EC7O0rgw/0j+3yvPQ15aiTghQvKodkVD5hvO5X0VNAfQlQimXcizz9G9EpgKTIfAXq
	Fc1gN3ztPH7UcUi/pBQzunbiyP
X-Received: by 2002:a05:6808:1982:b0:4f4:3790:65fd with SMTP id 5614622812f47-55c002b7e97mr1918256b6e.29.1792873358250;
        Sat, 24 Oct 2026 13:22:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:25 -0600
Subject: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and preserve the FIFO size read from firmware by
uart_read_port_properties(). Use it for the transmit load and derive the
receive thresholds from the documented 1-byte, quarter-full, half-full
and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128 and 254
bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9c171c5775a6..557832254c37 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -648,6 +649,73 @@ static void dw8250_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case 0:
+		return 1;
+	case 1:
+		return p->fifosize / 4;
+	case 2:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_sunxi_rxtrig_bytes(p, UART_FCR_R_TRIG_BITS(up->fcr));
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	unsigned int i;
+	int ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
+		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -870,6 +938,12 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.setup = dw8250_setup,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_h616_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +1005,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

