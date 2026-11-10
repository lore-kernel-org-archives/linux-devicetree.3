Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280398;
	b=rXHiqiZYHHvA/5QvtU8Gb51hkb8cx5XjFh/QCW1HZeLwyJW1F4fxQ55CvFVn/ja41xD/
	 b1NZew2/drr322EBqq7gYPenfbQ9a4NR0XoBrPwL1RbZ/u0jG/lRP1r1pacA3Yq03rtMt
	 B7/7NOpqh9vT6CIOGuFukJp5ifrF/8mglP1uMMOgfVCjZKuRU6QcEXvy/jYNBGygfjJu7
	 FYifz4nvkz6qzmtEPMsi6UNPGB5wQTcqjGUklqP7XCRGmnHeeWDocF5fugeXUwTTwh/VZ
	 729UogRvofrSfHIugJUbNVxaNurdRsOYRM7F1brU5zkO5yhHnzeTaoHBmO8ezndCDqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=dP0yMQ3OAMi2QJr+fUz7ZBzhpLKaGMhJkJQxAH7I3zWYMH3ZM9+2RB9e0wTmSjaSowb+
	 VHT8UEddh8Jx8kLGSOf8cdaJ5Kwtbp3JnBRCuPZaDLTvQqKtElTXlpSamMDseIaUddxdI
	 XgY+39f09XAhv9OaWC8BUh7y5Z3sMjPjj7iELrVtJBMuOuqtGDetNRmKBhOE33KUJS8Gi
	 jFEoHPIN33s4FGR/UhJjgfrtlfLRLmJpBcYuxj9BT65Db3WgJ1qEvrDxDrxdPd9eKmW6s
	 ri14FCttm57jkRLU03WrOOhRXzjO1dyildJq9VxD+d8/CW8X9fFBMhksLa/3pbQXdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9AqkMxM;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5C60A262D
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F5C60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9AqkMxM
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-843cf077f10so1992423a34.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280397; x=1794885197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=A9AqkMxMK4FPNMW90MZCORCwopA+gopgfmc15klZek3jqQcsXSA2GSwT9kWjmd24eB
         zH25ro0kMNjEWSxesGBg7DobhiU5rTmSOApVldcJNoevOvyAmqhGDXaOjT3wStNPPAQv
         aDlYE+OjKIfMD/TX8CRogMA/dw4BrOogYWwzOU8kB61EzPbLaJNsyupGgYBDklYg5qNX
         F/4Y2MvV79eEk06J2Rm34zhduSKv5Bwff1oXrJhIaJfXF1TXIP+a1d1yAY0NhniVpsdM
         os94y5U8iGreDqoVOUZ8y3+FhygJGv9zalpEXtrd9vwohQkQtGJ3YRBUVw+qAkXKixSH
         gcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280397; x=1794885197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=uAqqhNARAHFyFUqeUCl/A0mxwtQ4034m62g4T0Dopn3heknaz9CR0DjKpdYZk/lUTI
         EIPlrlS5lmko7JRg4FATDSzKPTZdQEV7jU8dBx6vnqeQB9VpsPDi9+nHmnKm7jULfH8Z
         1avC5XqPotG0fUfDiEVYqBceLJbIF2UgUHQekL8B0BHgXNC0cTbVWKcNj335udCPwURT
         139ZKXigCqaP2mdEJCKe0+DQZ7Dig0zV6FzLtxzburN3+o8N/nfhJa4pdlgJFw3N3mi+
         UiqpdeI7nkwUuSgvfWujo3TKYprpFukEcUFbUKjpv87e3u4Pqn2hHf0vSpEtNTfBQN6l
         v7IQ==
X-Forwarded-Encrypted: i=1; AL+hErGkGe/2Ud4rOq1nBbBvP4nH9TXQ6wq77kWVHppEGPaEd/aA7vrdbUMlikmbL+FGaiVdFdLSkrD14s2B@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jSEJ2HzHt4v8Ae1ODIGevPAM6ioXIKO2PvTtLirVPO32hPUm
	sVlUkVkKsYD09Kke9shB4CpKcWHQ89CoDAndQjo88Y/kClZHXUjxJmV8
X-Gm-Gg: AYBFou3eHoY+5G38HQU2MOcyeCukgaWuUeUwrSaoSK5Z1UsJy2HDT0gLU9ZCT8QKxWR
	627dyswEmEI7JkSMWxoAWrNJBCb8fMp12zgszCHslF5+Ue3sonvtS8XiRbADq6IsD4+tdx8WR6c
	LUrA++zm7caVt6oQJYWXwLAQn+sEo4UH99M6Z2Rmanowrr+IlJUKoKqdzWErlp/H1j23T0vS/C+
	pr0Yr/95YbW8/rJwZ62Gyh2nFMEX+lypQ2f5UREca/VjosXDCXkki9ypoFZ+az7aGryLpjpSIkx
	GdcCwOalGoJ3F9f+UPcnwYcE21vpjkILtZOpBHrfal6+tk9i9tLh1ELECaYYymmqPE6aD3SYEF4
	cQGYfStBqAB74iwi+QDnn8oN7wCmf4oTuLyNzyNAGNe8Zunb+T3/YgZ2ch49gVTGbbesU7PAPXS
	L/XIA/MhshfJ/SP+Bk/BoR/pb+SOgv4oCjLw1a9JIQyudx5rqcl4Q8l87rtMMgfI8JQ3HLlnJum
	qkIywo4MbbCjx9DRCsnEYEuzWapMFIjWiGjmBfNS7qXA06e2vaOl0wWeqOELrYXiKV43zvL0fOo
	qHvN1fDQe3SvAS3J3bGl9+o7JTDb6UF4tsIAo0byTzGexX1CY7glpz61cxGSD/zLH/neFXiitVq
	mxBls1xZ2QK3nc7MAExxbOUtW21mSo26+yxtty+WAmfXm5d6YTL4INTWwLhvvpfPi5OEnLaigqv
	kX5CIuEXnoTf01EVN9cX4/dREa01kAIuniAuEsr8h076NODWEiiRk3
X-Received: by 2002:a05:6808:1787:b0:564:347c:5a7c with SMTP id 5614622812f47-5683cd801f3mr1322272b6e.59.1794280396724;
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:53 -0700
Subject: [PATCH v9 04/11] serial: 8250: share the RX trigger conversion
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-4-3f03961dae8a@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

