Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649330;
	b=PbR34i1QL3YheALV1VmLuZWfPPv9a8BvBt0mU67zzyvhGxvghLoRd+FAin7TwdNQhl/e
	 Zo5ycE4pLCREvII9pcTySAiKD2ZPeehX4R2XFx5Gquk+QUtPtHy0HKW4UDCz7+gNl0Xla
	 uBSQH7zBDdPG/0Y0hqc4eJ5ajRAs/fOQBahRxbA84ArsGEAUysn102NyQBntxiwMAZb0i
	 TC2tf+juwhyJ0QMjvqZrofkQliJJpMfQuYIUFScO42+kSCsSif7iVzrVUaHu613R12ZwS
	 sw35BEH+oNe8fPy9fR5TP9JGrA7GEFwxyREvFd2n9wgyTy8w5v2lgx0W2cb+d1rD2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
	b=USsmrixEVorknovXAJB/DlwFNvpGhe4CRo8wzfmpUtqPd8/dmos3Yiq0hbXoZV9eFkqg
	 xiD1I5yI4atmiJv5btSje+nHnyzT1SLmRg3R8D42CrdK2pE33fHa0Tisz7HcuuLyiA90S
	 pkf84Jm5/wlAki6UKgMyZfVSMviNsO78WzOPirvJa4sSEFw/6jZZFSNX9Cj7wBC1G8rNg
	 XBDWuMP9mWsd/aKAtyxkgSDLJP2aWKPbQZQlLdcqMZeThqr+TzDUAUdLbKOEFWE+ipTYU
	 9PDR1hfZhmKfQmfJEdiIvarrCRe0DUzO38zV8IbxUaEXYCNJMp6SwYiy0xeHsKZRyEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHrcYLtu;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF4606D82C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DF4606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RHrcYLtu
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4911df1e196so2172756fac.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=RHrcYLtutXWsZ6SzT0PPS6ZO/wc4raZ0Bykh5LV3aL5yAuRicpt093K2BGorJtG5YX
         0onUZoGnUgget57tuH9JA228CPhjtMyjwfLjoc+5XlHt+JtTxrVffWftnNR0pm8NKUbW
         r9jOxek8y3eHV5Rg0rsFEM6PEGtQBc+gJUFNmiCRZwC0+3N7zG+v+u2bnT2L8Ofb/vmh
         ZAqTCJMsx1JLv+Oeyh6zRT063BldX44YmhK2489ZFGZgsfCskZmZ288Ppvel5DddXKTW
         Yzo91lJXWU+KxsDlhG0CCUFCe/DTSm4UhVC4un1K2/SQkbpXHUgJOsc7FSJvH/Zuu5ZL
         XPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6NaCr2YqwIe/GreNxQyGPwW88t11Y+r+IlcKQCQW48=;
        b=F9KqGXks+UK2gmn4vpUFbDw2Napr+GqAR53yxHPSoqfr+JKKxtunxLsiiKpmwFoEtR
         rA2afdTwyvCkLlmPa218oBrPLEz3rz3OuDtmhe1I1teEBPZnYjNrIbD7G2P6iTn8u8Xb
         AhkbSCcIdE94MJySxklwhcT8Wu8dNm9N06DLrIWkesY2/1xbSLYdY9zb3FcYCE0QkxJg
         ZC1/OFBl8bRKMoy9qjTWbQKDaIeu8yfvPmTe+AVmqaQDVSPfcxRtmCB4J65De09b/EAo
         OFvEkNpoJYuag8Uem1e+f+8waC7m5nihFNIr4f6Z9tqTrW5S/eXmcNmbi30+OqhrWwsS
         OQdQ==
X-Forwarded-Encrypted: i=1; AKwUvByGMlLah4peqymyVgSx0GMlnKisgNs6y8mXWGD77+J+DDyyaODEV1fRwmpzgr5gwKO1Yt1pBk27gg6B@vger.kernel.org
X-Gm-Message-State: AFq9FYLtgjcSImdY1UtGWyU85dJzpdG5octV8Y6ZjIW6PRSI0juGOCWU
	b1tpQCHoSJc4/Thh7s9GXP/m99M8IaMUG0F/ruCmK2bGDK3zgwS2TRHf
X-Gm-Gg: AYBFou3j1+9JWAjgFjR92NOIHNTP9c7oyaiAw6pshea2k30Kl+KCkFrDmLl7qeTLwzK
	jk0XxnUlafx3yLEPq82cDK8S2fi9gWjJW+SGWFeuI5o9+K3ZbA5SmHl+tHHOu7+uD/ph2lRKEBc
	FWklNMG51Yex5YgJfJ/2nzhTrUW2tMuO1//WDh1tHTcDZAAYZ3hlrI9J39Dj10him53lWKRclwK
	TKhEO3keajewZN/3rc1c5CGaq2sSwlLLqSOUaeI87VDF5nYMET9MzMImPqdm5G2XVdrEBuURenj
	8RZ3ynISxAbQetRW2zcY/fceDfTHEvQqJozWUzkraQXT0FeIPPPlA2Y62COtCtBiVGIA6qEVh/g
	JoI1tSX9hcVD/ZyA33Qy2S+fOwB+fRG4groxo8IvW2gTxxt1zbUagkT4G0j2fZ4LQ9FKPxdVrx5
	JDlrfeit3QHC0f5pJUlk4N0iI0W28bUamh4tPMmfB+bWFQB89KazgvgIDIEiT0BykWuEQnkjhS2
	p6jNHXVAqo2O3SBp/dBvjfUGInOrRyEfBlg0mlzCzwJ3TJUDs7K+HZfQ3R/NgxoTeKOZQlo7y6K
	HySKj4mk1kQ3GQN4RfOBd/DuwGEc7rF238GgwZ6Jq9ZAj9fW2oWRAu2YkfAQFIHljQ4MiQkdZOD
	fZEZeLrTChJYSLtYRVBj1K45B5/6dtZaPvbwQUbFQXs/3EsIaEyRo6PzD7P2aFO384sUbPoKLM9
	e1nqLD2scBfpIUwWtU1Ur0Cb/kqD0tU2dU2TQ7rvBcrcmGYVdfbNA=
X-Received: by 2002:a05:6871:e41b:b0:4a6:f610:87eb with SMTP id 586e51a60fabf-4a90729a753mr6897453fac.3.1793649326753;
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:17 -0700
Subject: [PATCH v6 2/8] serial: 8250: share the RX trigger conversion
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-2-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

Keep the implementation in 8250_port.c and export it in the SERIAL_8250
namespace. Include the unsupported-table check and preserve the existing
nearest-lower selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
index 36b2b0a2c05c..4a25badad3c5 100644
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
+EXPORT_SYMBOL_NS_GPL(serial8250_bytes_to_fcr, "SERIAL_8250");
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

