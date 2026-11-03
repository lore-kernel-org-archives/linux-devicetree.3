Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742019;
	b=4IMXpUnLMTw6J+q5gFKvUGNxLkdvUBmJDFXsXrXjN0NUH3rnH1doW4nHsDUpJKSBjF10
	 kVK4GVa1/wBX94+6/J/f1RTG2155Q+IclUW91lY1npJAfOe8yNU3QbeBORmNSlvT9YnyZ
	 TUWzP/HDAZe0g0nZoeQCHi5pmRICEZQBBPxP7SXPVugeU4HplHoYvjb8+DQHdki+sdgsL
	 s4Rhg4b2nmHqXq/ZVufmicpQ3P54TUK0I89mDQ2K8nDb1vWMnffhWDn/Xm14Czv5V2IGh
	 WlP/GFcowyn0IJOnjASamVdBwhXL9Y+87W0/K06IfZPxJBz5d43IkjO0jA4Uh1+2atA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
	b=ZnkL1ni3xNhKjp6X0jcjK7/XK+TPA/3unIfs4/oK2ianZ+If8mlMA3XIfODfEYO+aa26
	 xotoCks2wowDefLGhuZL2tkfQlVelXfWzzmjv7fRP8zpxTTAkwVc7ICYasmtTfZ3j2121
	 ctGQzFPFb9PoO3c0V/lGnjdIu5HXQVD9+TeiiyOHcq+nxCB5yOZoSeXQ7Ebi/pSyhXTNm
	 x53PsBuywnpreunrnQaHShyH5fIPNsAhRJtZXR2FSqFfSotTgttohLbXCAYC5RnyIqx3Z
	 NGmgWo+ci9OAiAkE18siK0gEs8jsuS2t9nkHPPW3JEndscBHf56heWQEQTGMxEIbOnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJQqhZj7;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453A6082BC9
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0453A6082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJQqhZj7
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53ec9237600so38557b6e.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742018; x=1794346818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=mJQqhZj7QB6/b23ZkeZPi6U2gWPLiOsUvniL/CVMecJNvKf9Y/3pCihLh7ZMU8NylB
         imJabc8c3A06qHiTin3azbLXEsmM3D1+XX+tERLhdbXjlJdpPvnjzISJypgQYCjrukZi
         /FL8pY+ltdAeGKqrDlOIAN1Bto3bBUH/KMb5UKmrib5fmCZNhiotRGU7jIJ/uES2lN8n
         F6Z82yErAnMduYILloPA5wryIjF40wS1eLJOd4hUmjIHRiTt03GjBISomLRhayzExT29
         HmniyLMCH93F36bKCXsXykCOutBubycLyBStjNqMQ47uQIjKfoqe4bAGdusPeZxWUfUh
         ohBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742018; x=1794346818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2rzwl/OUiuhx7dhKJQxUK0UVCKf7xbOI2dH9gpFv6M=;
        b=xjgbLR/7eoj1z8vXlhnnWOukIhC2oYTfB5OL501yd6TbcsDH02AQFyjw074SvLyPUZ
         JEH9ahEn2SQ5NzzO4RLJYqbw9iqO8vpJGn22wtAgg8HLcX9szAKC9tfAtF2EqhJh9+7l
         F/yWzgI1PGfoPkGWXwOI0gsFmoYQJrLbZ/6xouNSgdiCA75QZyzs4uikqdAWXO7vTdoZ
         YVmyE9NE8cotDMOt/vPXEos+1EadHzK3hNvGCAt2Ttj3BfzCcXPlITTKsoor1+M2adxb
         aOIH6lk3ZHb3dxjRN89Tb6Bhs+KXz6vA3fTDwn9pjbkqp6hMVDFGaXisVZ/8IepbOSoV
         QsQg==
X-Forwarded-Encrypted: i=1; AKwUvByv+E4rbaiZ3i3bSTi4dV4sVdEIqeRQwiNQ94mMcKEhdXfCt9XWpMnOImueDF5BOCefJCPP/rIRL4zT@vger.kernel.org
X-Gm-Message-State: APuU4Z+BzyyDzhgnvn8HKyO/VUshyA/cJfgjF6tlumwrMDICxp1RLQgi
	8wgZPqWjvs0E+7Bm6pGhPbLebTTkDnaKq4S2VtFkbymx7Zoqq5XwdvyU
X-Gm-Gg: AYBFou3ucxqtX8SafgO4FgjH9nL8I36hOPdMWQDDS8pVkRR9jXmTulfPqCpk/6HQmmJ
	h8UVi97cTE73QyBo0H+8GyImQxJQxh4IGE4h7Xtz0sbxArE05JaOiZAlKCi2s1ZUSq+wELcqag/
	huBIBIJZFNoxchkS9dun9nxA4LLhHwa3sLQM5G1wo0NXia0IfSCRCXa1gjBCUxeZCEaxDhUXc7e
	GNe+QYid+OoDUjyBJk9EM6xU2e/V1JZxLYPFKefA0KSzFoAhZ9Zol+w5djjv9bAaNmpdHHSNw1m
	I5O0IEr7LlUCYzTIIDlVmOiWAyhqNpAJQ1oKaCND5sVEDhLgIUvU0MFZQ6bEVs/N9DU5X7wVPuV
	9iHy2wAXcUWiZNPmmrpibASl5VE77rdfzo61ZbQOYLFOpAbwIVeyuPUlVQJzOcHBhPI3Oug97qa
	eYScQ7AheYCJ190H8+2IOk1VmUgJCeULxb2srMSdLvDb3qSHmds+hyUdTyo/p9x26xJxDjcIVFb
	i/DMrDRa9MGNuczyL+MTJLVgjvOY+sNyDINB/2ghn3yNiNoqHYircR56NnxMLYHP9zD5oAwJf5M
	Qic92xU7jM2I1UJybW8VFIJBsuwbuXqU+Pgs/MHgsmwgRqqbhlvjynV610SQhvF2zWvOscE24FJ
	yorO2D29P2zc1CuQkPLjqH0yYTTQgjxb9gYe8dezjiUTnvYYQdq1n75fiXy8H8mj2k2OvtH8hkw
	ABpSWbmGvJyrssHaoA0kbsHz2lRJLMiutEnjsmkhcCjn1GqlFgfbgoxYyFApPhQ/OJ7ypkj1CE7
	w==
X-Received: by 2002:a05:6808:1997:b0:4f5:d3bf:edf3 with SMTP id 5614622812f47-5640e035525mr10789884b6e.59.1793742017956;
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:05 -0700
Subject: [PATCH v7 12/12] serial: 8250_dw: configure RX trigger thresholds
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-12-c9e248d685c1@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index cdd3a62dfa7e..063441923864 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,22 @@ static int dw8250_setup(struct uart_port *p)
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
+	if (!p->fifosize)
+		p->fifosize = data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -931,8 +947,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
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

