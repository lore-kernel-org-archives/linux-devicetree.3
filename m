Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299656;
	b=m1Dmi6lUBrH3dPRj0sLE8Ijp6JmSuLr8l7L3KcW0a23Mvori7kXgRq3h4b9sbVj6Q22p
	 O/MDP2Jgb7ig3KtnINfU/5OyWs6E2XU/CdpDNBKMSMh02qyFzwUMwB0FQw+g+rdbA5Kzo
	 XIORo5xKbJgu+myWAYHnJB+pBfgsltTdBzGDevyXZi+l+BknnDxxJ/qQMp7hcH2pDStgc
	 fqlayhBAbYVNVDCx792JZRMdou3VB9xaeaIZAS+fZmfamzzosGdkrWFs6mnbOsLsXGQfi
	 K3embB9EIodz2HU8mB/KDp3GycfHAZcjVCnrYG3s6Zgkz3ysjtIsaW+7gCanydrB3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
	b=Yua3z0pvQiqImUU1NselSqge0Ln0TOI13clzCLGUJxDi+UHQ3tpUzOJBCphjRjGGYQyh
	 6OByJrLiTei6+dqSwpIoaUhlwhKXc/YjGT2flwa/ILIR24YDAQcGw9qlhPG4xHCailYps
	 wvEmD4fPue9/TwgPmtSJv1KutH1UaCUF6SckwpFqLsvuSGfcHq2YyyT7Qv0IYsXNWkbTh
	 NMT+C7ZmDpuWlflfQiTmvFmt9bLud7gRHmUeizhUgfZEAhw3nqWR9gWQsRqP9/QAnLajO
	 rl59ZHUhV9LuEJDdsFRyHB4gJgubOpn/o+1VtkTvuCusoE7DFcIGfRaF5fD5vO/e6vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gLDIyi7;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF78606A33D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF78606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gLDIyi7
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-844a8bf7e25so1694332a34.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299655; x=1793904455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=0gLDIyi7Bah1ok5NjU3W+QnQrCgcCetVDDOLnLlhSnQN1Rvm/TxnOHDei2dNZF0EL5
         bmZL1Ez/VkXDpzym1vcM+APlpMcFY5IzWsahAxbopCebue9c5GilZhKDzvDv1rw3DTah
         d0umgizm5JiR9pfOauDoHhz0B2tA6DqTWsfK27iyZ181qfBRXbRxKJhJBHqM5q7vczTN
         NuGVn+qDWvFe41dzhNCRUe5RhuyfNEUTg17JxUI7Hy2A6z2mKksNIzXoEBHmvfcQRRGi
         FjMAkfzGzTG9NF0v0VMnydD5H/ttmpDM44k4xi9U/xJRhtLFzzhcMy0jWAwGmdJ/KqCH
         TC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299655; x=1793904455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79xjx57HjwzmaHLw3TFo6BlyGst5sDPWB7FQ91YNv84=;
        b=FI2WfNcODoYp7tAxdeEf/8jucgpz8aARoqo4LWKl9SQna5TaqOsOedzPM+G/OTO5zI
         yZN68bEV4B1pGUFzLEIeCNwtIqbB4BOnpAiPeL1KEWfBqeBQsvHSLCMOGV+cQcSJpkeb
         1+OmiCfdaOgbzrSOHHQoN3ErJJG1bfjahF2XQP9I9vvOh0C/X6jNGeRgf5kApxtJccnk
         SUtJNPvk422IPFuynt9opXRIdUIlD2Swgshz86/R4tIfJwzaN5J9GTie9exydeRpMkAf
         nTBehDbuY6L2/jS+j2gARh+hUqaAIA32XwsglA9SYtZwnsKeBpUc81fkKuMPsfJOoAaJ
         H28Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsrCL9fEhyo1MvCgjLub70iEpmTjO1XwONwI+sNVdEOXeD6URTQ2Eymc2Q/6ulgy2i50vrokezEJM/@vger.kernel.org
X-Gm-Message-State: AFq9FYI1NgL3E5/RwAEscyp6DK+LG7TM62/f9zK94XfloAPRo2p4CudX
	YeqwiF/kj5Qz1HJn8Hcvud4CRXweLiDxlE6SZn/NsqSvKRE3NZjvjxGf
X-Gm-Gg: AYBFou2LCA4TB5A4nuH4o3qugrIfv6Q9yvsyTy1LCOGl1+++B6waHXGK/I/t4iH4vAC
	s9NMbYNlaOa3vWsutGQPx1c9am9ATuHEnKaDR9mKpin2ngvbTgdBRbeu8whjmKzNLAiXJ3avnVu
	0UTpaEmrAA55i4LBTnELgDTtIEZ6sDrec9awve+/hm5M63b20A1NYCdtdZZPL+Ha4OsiYV7EzOO
	7KI0Mg/K7L6dhe42VMC8+gdvCBj7bQBEsZg53PQqRu8hWxiDa+rd+nbb9//5U/ICQOnNF2/WfMs
	7WP+PMp+or6EPBy6hv0/17cEVmDS3Obx9fpQkD3aI3jZ8aK7CDEO52MizppBdsp9yQ/V+CZRs5F
	iAa1eFI/GZKIro0Qj0riVQVAsRYFvzjgg+6eo0axkfz/FeiXGUqF/Ycp+QCqcAUTrVriIt7iNHV
	cME7qafYmyXcuQAsfKd0CL8AptT5d94bxRsG6KdBnOAwVgRDLanMFh/7fRF9yRZ0fAlhj/4jLZQ
	poVeR8dlUqyXuEkioG2t+z32hXXc8SxHldTcwsdQVlXWm80Ke2lkBtAzABpsgiDYyP3tQACiGMn
	cS9bT2T1pafUMdT6vgkqQXgDjQRYFCxkwWGu/c9wGZ+xGtbZm7CZZP612G2rdSvvqAtuaLFQmLT
	W31J7xlhyiAmwgZ+Z9o7S50xqglIOu/tgNCVFKDkWnQxNtn762PMXTnUg4rxzVpH4pRGWaX6+mF
	orTXuDki9bxywp+EvQiCY+l0ZMBgG31n8wL4H4cDlKr0sDPruE5dAu87Ar9MJhfiDPImJR0EGH
X-Received: by 2002:a05:6830:913:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-85d361417afmr94378a34.2.1793299654718;
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:23 -0600
Subject: [PATCH v5 2/8] serial: 8250: share the RX trigger conversion
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-2-53b433aebbf8@gmail.com>
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation. Keep the implementation in 8250_port.c and
export it for subdrivers.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..1600f2e45d76 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..fc3987b5a70c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,22 +3015,27 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes, unsigned char bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
-
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
 	}
 
 	return UART_FCR_R_TRIG_11;
 }
+EXPORT_SYMBOL_GPL(serial8250_bytes_to_fcr);
+
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
 
 static int do_get_rxtrig(struct tty_port *port)
 {

-- 
2.53.0

