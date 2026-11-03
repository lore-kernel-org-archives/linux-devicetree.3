Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742010;
	b=W9UHgvKZcpDwRcbNZQmYCr1MCLWZpcybWSzO0Rs0ffkCx4B8UYMN8a9WqGEXQ2RH/edh
	 KyOL6gdfNH5LT/2FI6jrrNWF1ws/Gkgn1iBd4bJk5boRGGN88MY8567NS4eeUpAMhHGeZ
	 2akAhl2BZ8S9CWskBTnmWxW/j3e6dBNTMjQyRvOZH2ZNpBkxE3ZwUNKsT0s+AJHHvSlBT
	 xa9i6GpWrd2AvfQrEBFG/4Ln/BD0iP4hvUss9NuwzZ2ZwIzGjiuwBhRBrlmSq+jp2kRQJ
	 5Pv86ZtX1tcZQ/x8UHTDvpGMc6KxX4U4LF3lCBZtdrZcwG4j/0MIpnDNvaxF8foFd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
	b=y+qbWDmEjvWL8ic5wLieF3lckANm82USamx/UyImS7iUvSF53CqsQXnJJSTfaKgjGAdW
	 NzdRVhS+rpgr3VT/FjeL6kisVrXvtmjTQucU/SDf7/QnLH7ANZ2JSyMgv5e7VuiIHAaHO
	 K+1mga7jD4NofXKZeyorHNJGZE3UtogMS5Mnhf6BEMSy8cVY8DaPL+2+C6qKCwYn/tMad
	 gWH25TPtXtxqI3qblgslXujxLDUdEOsMKl7x7x6uPUtUMr+LIeJC30hskE21f/tIuHmAN
	 DLupQlFBJT5vPzztx0rrhLD+NATDe6oXgbFjt7JyIBHcHb+O6NVT9adO73CUfMcYMPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEBiMSuH;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF8606D813
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DF8606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEBiMSuH
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-55651e7de9bso48952b6e.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742009; x=1794346809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=EEBiMSuHQEQBAiNxmoAZwWAQOzZsZRscDbuJCfiW2amM879KWEAz0qvek7925XV0sI
         bifHFqPkH+Gzs+F2ySuS+DbPYgTBlLMMMUE+1J9KZJio6tJAfRMKMyR44JyO+qrRXrGj
         ft0eVdNEH7HmL9RvhGF7+gX2JT5Kg3v53pVUGwd+MCoaBZ0heCSX/ocbUWxlIMaKpq04
         T7H1R3fqGk/2D3KiJeZb2VJyjJTAC4qEEihuEhryuLwDDNYw7xWfNuinxkFOseJCB1Xj
         0vcc01hYOHp4RapZuK4AgHLxH1oq4UpCm+SQkerNQ2Q9YLtBMrBxhZDoVASIXzYIr8/Q
         raqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742009; x=1794346809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=EPwYqcMXWYQPae+SlHduCuebwD6sgeJcD2JhGNNx3V9dE7YXOsU4iLXxzj/196+6TG
         AV0aVR9PR5MefFCInVx7FAZU64L8FrouZGJmP7GGdIadBbtuR5YGVuIwaIK0SbmLTx3y
         /Ux5kkCmHeRRjmgLm3xP8IKoV3zLdusou/s1XnAvVOamCXpGZmqQV/1j3JlQPzM446kz
         TeTnmQUpL0FW4Jxj5bjWq9llh+//biD+nYa6Tm7aP5c8LQAZcTo7x5Fw4njagbQS3Fxv
         Ymo+sk0Yn0tXxl1PmpTYpUPRam9pxpGqDF3KJQzwMcoGX4eEQpbI8QMJ3GX+pf5KAHGf
         8j6g==
X-Forwarded-Encrypted: i=1; AKwUvBz8oXnuPybInC+QPHt1pXG30N+Vqjmuti5z7GXsWsFHLnaXYh8Dtf7Jvek+mPUosgFgytSdoGjUPX4t@vger.kernel.org
X-Gm-Message-State: APuU4Z+zBqTnuMB3w3QfPOItxtIRI33pYKDbmWuIfs5rpECXTCXSQLsH
	omCeCF/bAhvNMiPvRCbx92ec+5WEGzulRv7CEOmur9/JsxKj9nh6fjgC
X-Gm-Gg: AYBFou08suO2XFXGQ5FvNA21N4eQfJLnUAmqNOQHc68BcCCM9X+8z9eaebk5LAbnlu4
	A0/RAjAbbMt94UJ9ZpSQ+R2MZx+vopqBSGABHCE2K00PFap0k4tFxJsPulxBLIpPdaY0t5CzNzG
	i7dBUlSiHzmZOZSFZt5WiIKY27fyTlKfTg7AiUI/jdL6DYqoUbR4eU4CSDfBogn4a2A4JTg+SHH
	9MjsyHQdO9YoNgqCBSgllXI8nTty5E+nxwXhDixKWBLGDJFol277DkD8Aa1rhHGRiP2e2UUW3K6
	PI5jJMxL5CTBSNpzMOOf2EobCY3IVo+CtfNS9eqeh+kk2Y/sCccCmuLJzahDAyz/8+nm5a9FMvU
	i7iLsufrKXdfwbRDLoBwtNg60fwtsaW+GN86wK3dFvYyw/JgQlXRcF4Kl3xutl7Y0t33p1otEyq
	CPvpPF2JDV0U0Ue28jwPrNpQA+hou5s5mL4Ioa3C+eKjbdc+2RIVlsYfkC0eFxR06dX7JUKC8C7
	h7MQViO2QS6V8vF5vJ9JkF3jN9g83XsHwEbgLO49xfHH/hxgyBhZDjhKrwqhmJkPlRefHXJsbBg
	xu/k+AIVO2Z3Yd1M3XlscWXqZ766EJ9gxcKv6lZjC/XThMRH15CxjFZLmRcax6tfmgou+gfh4bW
	qysU5T7DFCWRafrvcnNpFtyRC6F6/Wq70FfalYzFpBRmLsLYyaudXJROOa/ktB7XBh7sjxPdcjK
	nwhYsj4gmVvCReMIprjTmJyizToQFKEDvH2oaYe5SLN6Gawy+AmLPrZA==
X-Received: by 2002:a05:6808:1715:b0:55c:836:5950 with SMTP id 5614622812f47-5640de0af62mr9879107b6e.27.1793742009246;
        Tue, 03 Nov 2026 13:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:57 -0700
Subject: [PATCH v7 04/12] serial: 8250: expose RX trigger controls for
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-4-c9e248d685c1@gmail.com>
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

