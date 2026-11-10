Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280399;
	b=5tl1sf6U9VEZ9fyrUcaff9pWMYMugk17ZkX++wkvWBDE7/I1bx4nQJp8/m/ety18fl4k
	 EURHIhTYnAwfyKYHcZb4HPjBPe7+GrxfLJGaxY8ON5P1xnTDKaYJJeYgZcMjO9nw/QLK8
	 NpEmSW1aEnvViDL/FC3yTIhGJ1RovhjCxb2LFC0zFHzCU6GvyGhHDXZgII5nLHHqC0I2M
	 HtqiJi9m1fJ/tHjeDRqiAnirXOzwzDx2IANDTVQ8z8Zk+6WM9ZQOEH7KigWV6RjuK6jdN
	 qhe3MC0WkG6ONd+gYEnFUk9pzPCZyeitYzLwwH4NkWIOKg2CinealALPbLcQBxcuXfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=toAePouenIUVVH/SCNnOcYgYRPRi1Cqq6j1w5zomfRjExsiTFjF30Zwe9JOY6COh2Rnr
	 ZOMkFNgpRG+gMdFY1mol2PS1AGpYu5KBupqSMSMTGe2xqD7s+kBoXO9CnoWjXLtjSouXP
	 2zTuSX+avi8UzhvsuK3wz2KqagnmX9/yYaaDyFuNY0snXViUVHwLBtJAZFYaKlEno2vOO
	 96agM/IAUm/Fd5GBWGwFB0lQRfboof3mAdcELDXB2RyLBj+bSrhBFci17hmr5tJ00wCNd
	 hs+mA23ed+YkTzGu+Q/CXG2AONJe7jEo7AusDaeqEb393N2qh9DOPcmF9EF7IOPBqKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axK08LBF;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260A60A262F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F260A60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axK08LBF
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823b938464fso1088498a34.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280398; x=1794885198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=axK08LBFRuDFSSWcJwC1jUIQaZGsGrA6ISY+1LrR2QblHAU7lPcHZkLb6BfpEGJX5d
         ahV7MoOLNdF+fqNCzn19P6FXisZhnHLKcpJ9FOGOR32nAzXP87CcVvQZfwPSvH1wosKz
         sqoerx7PTEPK/Jn6mQ4EMF+0g8WXidCeo0Jxjz4oikLE79ntsaMB1k0YDC50F7pYX/k3
         tDolPwq9sg04NF6uux87t0z8Gv6u9r2cR2eA2/grZ70wNUKWVpZFp4AhvdrkPYn1HGCs
         Z8f/BwB9y0iIGVlPLUl9mcW4M4Q7oamEbEHw4LXPGE4Ibfb/40fN5LQp7YsNH3/Iqq6+
         6p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280398; x=1794885198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=naKdZmXt+wACk9YMhXzJpM/rqnRE2Za39zWSY/EvipH4dSno3PGRJEHGf4nEOb85q0
         +YECVXK0ZqlSVp6zB7d6fL5F1hE7tC+jkFzGDlM2C/EVz2lf3vXTFPjJ1LZabTpS+RKd
         PS/faOkxqEXeol8TrkeAp2r/SRuN1R90RLc8RvuyUmmpmqFTDfp+yc2tQIYjpiYDe/gN
         PLRsVYxYEXptKFFB5WWpjs1p1D8+PcLEHck/NkW9wKtf003sn2LWhtAZ621wYdl7Fb+w
         dRd5XRV0cBZV6mSpYhpRNc+n4vixPQXO1gmJheFeXNNqqtOW7/sryMjDaRGftqgTg4JO
         +dww==
X-Forwarded-Encrypted: i=1; AL+hErFji4tOh4LmtQD/22QO+shRrOe+FexoPRM2irfMdHUogynPGzXtHAD7Xdt7qnTYhD1IgeM/r30dSu2y@vger.kernel.org
X-Gm-Message-State: APuU4Z8JpeSe1Ob2S2K2XJSwzEwCsdWS/uGRtre81BSv5HR5SJ1JRvkG
	tFZVy3H6C0LtSabAZ99VsKnEGCIIhSGH4xpsOeEfy1UiGnpC1hQLSZjh
X-Gm-Gg: AYBFou36Kw/afdiSfkEgsOAk2R8VU4ExqMIq5f54L27EuOv404qbwQOhdYDRPt3a5JX
	wtuzWqxziN8bPwlrsd019YM9R1up78s2zKzAKN9XhtyaBs0l7hcC4eVOGINNcw5tMLgNZV5X0bG
	v4sHah296iCTh3cl7DpRhngtFWmmBaolhsMsJDiYOP3bk3bB2Jf1hhnD8cQFtA9xUocOWWyO3iY
	lnEYFWN5wMnvetfWlY9MXDwMUPKe6ugTdNk00B4VZxzolhsf6efMKdJuqH9PULoi7VHkHbzHxg1
	p55SUk12QML7BBpOYEguz6UsH3tpTWTbVnS6LpUV8lXL1pNdUz2qANsPJRIVWaSTxZ7gluL7NuE
	6UX/vDWQ2p14YYeA4xdoJdqbpBdLeJuYMcEKBIsbfP5zw7t/v1uMvzdVbLPQ5mYQb2uxtGLbs2D
	UIdwppw8lHTft2jcAtsgU2VzRLxhp26/JzFC3iIk/vz2/+zI1awKaLfFvsMKx+gqHZSbmEaPe6F
	7BJ06CZKpUb9ZmCm1I5Sid7Wg4MDHh+pa7o9IecnKzVOzv9JSawLivZJ6Q25geGXTbdN9qnIE/2
	A45Calc31YpLqbqEga7KVTJCu/533Vp9xVOMomJn+oJTJGJjJ6ravJ/SZLKe6f8uUC9NaxV887G
	qyxiBCxvVcgaPEyN//+lslQwJuGrzFwXV804l+HDbfQAwoTRhJb9t6zMsLRPpph/Z2es+pzb1mM
	vbjfB3+X7I5Dg22TFPkMHig/TCFAN/efqQn++eMpl5ulyhMGnUqkCl1i6TM2czIGIDR3ByKWzMy
	w==
X-Received: by 2002:a05:6808:3c48:b0:568:2e:531e with SMTP id 5614622812f47-5683cdcd52amr1079208b6e.59.1794280397927;
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:54 -0700
Subject: [PATCH v9 05/11] serial: 8250: expose RX trigger controls for
 custom callbacks
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-5-3f03961dae8a@gmail.com>
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

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0

