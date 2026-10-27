Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142348;
	b=uRdPpLQNA8fG0GSZaKQNBpC7dgXNTACCqeRKGXRoJTTrmHqJ67agZUy9HBL/Xlhg6SQa
	 D+WdE0+xnvT++qM+iJ6Qe8gcYvKiOvRBEFRllGPw0GgRcSgCRjDRCwQ8pfe/iE+zAAxII
	 7N0hGUF5yrOkckQaVbB1FL/Yn8q1XQ3ZJ/1BhZsJU0fnRxYr7/tIE0X1nWu+t0N58R78d
	 xH1L54AmWcMucw5eV+dHRcxTQjO8FxRk7ZwkXcs/hkf3hKPSfZh4AYwQ8LmT6EIE2KFLP
	 EEs2km+8+62YL0r5Ya+Gosz2Ji3joUscyTbQRmCSNCLtUMwjwYiqpn19SKYkRTq+iow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
	b=IJBg7u6Jw6mxh2d3Nvoj4Qz80XzjyYSqe/TG5+BefWIVLhROeLwnYmWOVDKEtAvzYbV7
	 yb2frOr4IqObsHKvyOFDkVTpsAZkC6p4HxeWvoBDYQ4VWU7ojTS4wFijjiRsQtTcJ6qGm
	 /14RXrYbvGB33rT1lmj1h3rzELWgZhhDqNZrjQQ/K12uj+OUgiTeMtDrHRPBft7XMQrSn
	 Tt8R1iS2UhTATRc+VuH/qxyhNWSnTmwiDx8D4X364BLBPUn1ABBJ5of6PD7OuQvy9xKNq
	 GXMSyXKucBsr2icIx+PHOiZ4igD919JqMCw0Z6+/vpeMD1/eLr6X2Qet29OWJTj4Gkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy8Ns+OC;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C76606A326
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy8Ns+OC
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6df5e315bd1so343911eaf.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142347; x=1793747147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=Oy8Ns+OCuC8ms5bppmSME9oA5Rj8eAcfHuQdFl+6a68Uh/Yh4JezhkNOUtwi2fYGS0
         LQ4bfKrOfnWNOVfHrDj2JaL8Q1f9TRiCjKqOO3a+CGjr7AG8HXv/iRti4XirkbkOxAJd
         iKd9uTPNgd8ICiFtbWFFdOzMlbYlPfoN75I9YOMXl5jPLt84T+0uj1oA4sPIHYUYAkPO
         PKsdlY2vdCf5evctBKpLJaBChE7jzkDhv9Y8gRcDtFo7XRlu8niEL3QqbprUdCBoJUNf
         LvchEAOGktphaYcq9HiQYAvucYhV5bES3OfQWOQ5Ptbf1udgIalmmHqRPLFJw0rf11Gu
         AFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142347; x=1793747147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhsVd9Fsi+UcY/XjunpIc7bQ1eO+aEtcrlfgyGAcjFk=;
        b=KdBQF5E0WjPGHbF191k5CWwKxzXZrGxZrnMoT0LS5BYsdu1fUbT5gg1rzv1Cp8LdFh
         UVzRic5gvRUp0ZZf3ie32rpTVbhoGeZM2di+66FoNH4c2oqRlcZmjjbyW84KPqbcGIhO
         FS1QAYJgcLlL15tVy1prFZPXzYPndUmMrTkXD2qmbw0xITW132fT74WBnrMebqn1/uQG
         s+6EU6NLMyBNoxln8CS4QcwHLEfSOAGjZljs+yIZmRv4HM143AVENSH2XwZz7K6/tjg4
         YdLe8UuEcyQGtTZMkzVGjFgYx78wvt1AdU5sv+WjktXsICRNGWTjTOBUtCIyvmssOTYC
         AF0w==
X-Forwarded-Encrypted: i=1; AKwUvBzaQaOcklTqSomznSIr1tOCz74D+ArPl4oNt1sQju+/g8sXcokSNDksPLWG4cUJrYW3FgRS2bwOaJEU@vger.kernel.org
X-Gm-Message-State: AFq9FYK0hY8IGq9rC6szW/u6aVJvC+xmRQO+h0RPjuILBJW3yHtfGiLA
	rRrXlUihHcQXjgMnhHy/Zy7HEi24v7fbcnyu34X7aeXtT+iH1FOqn6PM
X-Gm-Gg: AYBFou2VR6QMaHkBtuvTn50EeOk135I7zcB2V/BLHzr2X2qQW5d+aBy4CJhYp7QjD2Q
	rKNPE0Qubw8kpuyDH5/tYmKLhCoMw7GV/N90vH98soBr2EV/jrngYayuLarJhEAJSFAo3PW1rld
	Qg4fEKcoch4AiduhuzBUgigTIbRPeWmLGZ8LxEy8N1kqBOXPkuQsiMR1yzxsSaLlL1Y1I9Rstqq
	JwDmvaqO/6+ukPUy4wPf/GFTkJIZT6STm70wf9U4Sg6qh1LY98ulxhOq8AF3Tl5AUSXGjuIX+AF
	++/FAtK69Jh3Q8XVZfo7OJVUjtROYvfyh0oHnjxXlZeNkl6RnOyHZhyPT/RrKF42KxKqqixaN3z
	sa8QdZ3h0NuF125GrnjstBZwIBgawm87B/U4zBdOhFCWuFGG0HRRiIUYiPEE71qnkdMwG/23gEi
	b9arot3ns8OVp7LI2b5jKIPRVyLhstnp4GtyRrZNfGJ9uOeAaBzyVjEH+y5rbs9TzmThEDVyfOM
	9FC4BLHYx6coSXVKYezqBiUcv429fT57nUKsVvk6G9GzICjPU13pZOnbELqmAuAQgJNoRHfrBJw
	rxgVocFCDTCQyokXbJWmrfyEo03Hhg7ByJ7EB65B+y7lHHPFfuldgwTc9xePhwr44+r8kQcd8AG
	ST5y/8J6YXoox+L/nitXt0FPyjoaSW9UGv5dp24JOW0p4cQikGwet4W/rHebb49mOijzxJseGBu
	AA7Q==
X-Received: by 2002:a05:6820:3385:20b0:713:da3b:901d with SMTP id 006d021491bc7-713f21629bfmr243308eaf.79.1793142346826;
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:30 -0600
Subject: [PATCH v4 2/5] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-2-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

Extract the receive-trigger threshold search into serial8250_bytes_to_fcr()
so drivers with per-port threshold tables can use the same conversion as
the generic 8250 implementation.

Include the unsupported-table check in the helper and preserve the existing
nearest-lower selection and highest-encoding fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      | 16 ++++++++++++++++
 drivers/tty/serial/8250/8250_port.c | 12 +-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..195ed58a2231 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/errno.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 #include <linux/dmaengine.h>
@@ -73,6 +74,21 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+static inline int serial8250_bytes_to_fcr(const unsigned char *rxtrig_bytes,
+					  unsigned char bytes)
+{
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+		return -EOPNOTSUPP;
+
+	for (unsigned int i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
+		if (bytes < rxtrig_bytes[i])
+			/* Use the nearest lower value */
+			return (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	}
+
+	return UART_FCR_R_TRIG_11;
+}
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05c..c332963dc2ed 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3018,18 +3018,8 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, unsigned char bytes)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
-	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
-		return -EOPNOTSUPP;
-
-	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
-			/* Use the nearest lower value */
-			return (--i) << UART_FCR_R_TRIG_SHIFT;
-	}
-
-	return UART_FCR_R_TRIG_11;
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
 }
 
 static int do_get_rxtrig(struct tty_port *port)

-- 
2.53.0

