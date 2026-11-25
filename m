Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630871;
	b=PvSLa+yqAW4GWXFG+TGYnLzWNhYUZ2EQdWy04GSDlz4QLnUi62vkMUCaNq5iVGjJRFUf
	 P+8aZxVpzD8hLUrf3fqDTFl283PJeknSKZyqeNPqAJFcG6IDbvzHj10EWTZ7Y3CGN/aDv
	 NyZf6o8yKZXsWtmMJ20/Seva/LD4XK6i3l9hhulQJEzNom4HNN7QkM6KPxyGCQm0LLpLF
	 ICKzIZEXbnx4qIxw1zLmJjGgw2wJLVJlFg5743Ib4/liPDmVi8Wq4/QxASewCpi2Qk169
	 6zT/x82ysgUub3RDE9i16ZeZpjjoBg+A7UTvrQSy5My4bju+XLUnenRWFBDxjZCQ5Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630871;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
	b=3NcITxGC7RQdK8G0JqIJwHElVEvb4xAN2wL3HebIpFKQQMsnkX6F23VSMDBVDyrlPC6E
	 EdBdY7rUnkBZrTiXQSoZlIp4k2Pihk7WBEdKBkeVujFh/mi6hPi7ik4TQP4Pf7rdYNMrq
	 vlmkDfEleqsr1GQSfZYhJuZRaW8cV3aF94LnTGTEk9cmb0VfnI7jDNT2ybcwqAdroRnbd
	 Z911LGYovijSCJlpFzXXYDfXOYNSZnZe2zurmpDVP8hEryE9Yc9j8G6R/Wcn+JChI9nQ/
	 X36VLRdMu67TH3UfVnK+hweJnyrszC0/2S9L+h6YBiyXZczI2BqJqQxbbfPwJxRzirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OPD5IsaT;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1338606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1338606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OPD5IsaT
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cddc250d815so2447189a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630870; x=1796235670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
        b=q8h+6WotPOmgVi75BP6xCVWbg/0RjlIRnrqjbxJL6YxETUHIRnL9jQ+oJ4ODnsGNh0
         WtfGlhFDF3kd9yA6WUhc2h5yZqDWUfkpWjrEzUdZN5fKh7IYht/maS4f0Td4ic50NKCJ
         9EtmEIsZR1YjfUmcxcsUpc0J1G3FmbwIF6JYcH+LZiCA94OlCb6bsikoIXc/cQV6SmKL
         cb7Z7B+Qb0aUegoLqZQU9yXrExRqq0AxonDW9DEphpFFEsc0mm1iUbCjaZnxI4qHry3F
         q5aiji3LRX4OiFNQwmiOfCDtqyPIFvnhNfGNiHGVGNv7+3YKqwlV36yt6J5lFooIPWM1
         R4YA==
X-Forwarded-Encrypted: i=1; AL+hErHgspG6MrFjyimHMD21DTA0AL5C6oCq+/MqoW17VA1tXz2U+f9DWFgm49/w6lZASkmQHwBkn6w6iBBf@vger.kernel.org
X-Gm-Message-State: APuU4Z/RwNy2mDEcnsD7Hb2HmTy7TK3nsCJfzYJcmEm7829z1jZfJa2T
	Q5Dvwfvu6Q5qobPWGve9DyiVmTIz5L7mzhlzonDyw2+13ObdpjilkG2a70oKz4Ts9AN15FMam4s
	FWPsaxq8Rl/wX19FZgZ3lQPdb9C5vyFBPJavL7RqDwUnf0cT6Lq3QmfChlD4yQpfZea06NZ+Txk
	Y6HwY25i9sSpk1XkUbtyBWDAUEaJYTcz9D4O6xsOzBp7oXF11y8yODMBs4/VndPdc0Ts9EgeGYc
	6b60qNjJyquzA==
X-Gm-Gg: AZFdTZcVlY5f9YN/p3clc1x77mpaaFfSR2HyyJWsspmIyVdoEJ/YLXSnZiH6q9VJE7C
	Qmcb47Orp7m9ZTi+dCYYrmqP7mTZFytB9X9Bh+V7jQSAHMHRie0LJTSrDcZHOOodrC7Ag80vN18
	hfA5F9GZ3qYUl0rRa5yEUS/3ArKQ+O+gm8QRKdG0F6WK3yXDuUnYBssLf4TfA6vSSEjKESeJ8nC
	CZl34s0nqA6yYA2aNSBUHmQ6th3aHgwFn6Nbj3OCxraDSGfLBd9o/JWf4uaeUcledRGpRE/n0fG
	/Zvt3t1lrhkLw5Qh9OniZosiJlXBlAXdBro8x+yeKf/SGxMC3cab8QPCmQOdnwpYylu2qHruEGQ
	zaAy344ILffDzYo9l44SbTe3Ce4U5ClympII2noS/IPZd7NpxyvcbQwNZNOKE9xUuR/9oMhZrkC
	EAFSvwxvDz4Upq4XOWfvdhIeigpLoRaqwmskg=
X-Received: by 2002:a17:90b:2c84:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b41c7c24a4mr16495600a91.7.1795630870070;
        Wed, 25 Nov 2026 10:21:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm13089671a91.3.2026.11.25.10.21.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso248216885a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630869; x=1796235669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCytLPbTQSjOf7Vpu6o9kchdmZ8p74IaOwZ5U8CL04Q=;
        b=OPD5IsaTISg6sb+rgiXx94CpPWIX0jkkortJeADY7RArtWZQBlSWH5mkPxstplUx+J
         IgnYXTzicnWOke0YNZD3XQEEDU60u54x6/+MB/P7LRO2mOjBq4GZYDQv/8LIcRZoPsVj
         6NdTvsAXkTE1i4wBZDFpWRz/Pgcql1kF7V0hs=
X-Forwarded-Encrypted: i=1; AL+hErH3YWMjuaZcw5nBoZ0E3ZV9wXtDfybhUv47BfpONUptspN9pyOw7LZKWAc5PIsu8XyDYHkg9QdbU8QE@vger.kernel.org
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr2856744185a.32.1795630868613;
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr2856739385a.32.1795630868124;
        Wed, 25 Nov 2026 10:21:08 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:21:07 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 5/6] mmc: core: Move and split reset functions for eMMC
Date: Wed, 25 Nov 2026 13:20:52 -0500
Message-Id: <20261125182053.3915833-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
References: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

To prepare for a subsequent change and to simplify review, let's move the
function for resetting the eMMC card a few lines up in the file.

While at it, split the cache flush out of _mmc_hw_reset() into a new
mmc_hw_reset_recovery() function and use that for the ->hw_reset() bus
operation. This keeps the flush for recovery, where it was intended, but
allows the card to be reset without it, by calling _mmc_hw_reset()
directly. That is needed when resetting the card at system resume, as the
cache has already been flushed at suspend and the flush would only fail
with a timeout, after the card has been accessed by firmware.

There are no functional changes.

Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Co-developed-by: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/core/mmc.c | 73 ++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 93bd9b44e7d9..122ac9ba0a4b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2273,6 +2273,44 @@ static int mmc_shutdown(struct mmc_host *host)
 	return err;
 }
 
+static bool mmc_card_can_reset(struct mmc_card *card)
+{
+	u8 rst_n_function;
+
+	rst_n_function = card->ext_csd.rst_n_function;
+	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
+}
+
+static int _mmc_hw_reset(struct mmc_host *host)
+{
+	struct mmc_card *card = host->card;
+
+	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
+	    mmc_card_can_reset(card)) {
+		/* If the card accept RST_n signal, send it. */
+		mmc_set_clock(host, host->f_init);
+		host->ops->card_hw_reset(host);
+		/* Set initial state and call mmc_set_ios */
+		mmc_set_initial_state(host);
+	} else {
+		/* Do a brute force power cycle */
+		mmc_power_cycle(host, card->ocr);
+		mmc_pwrseq_reset(host);
+	}
+	return mmc_init_card(host, card->ocr, card);
+}
+
+static int mmc_hw_reset_recovery(struct mmc_host *host)
+{
+	/*
+	 * In the case of recovery, we can't expect flushing the cache to work
+	 * always, but we have a go and ignore errors.
+	 */
+	_mmc_flush_cache(host);
+
+	return _mmc_hw_reset(host);
+}
+
 /*
  * Callback for resume.
  */
@@ -2321,39 +2359,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
 	return 0;
 }
 
-static bool mmc_card_can_reset(struct mmc_card *card)
-{
-	u8 rst_n_function;
-
-	rst_n_function = card->ext_csd.rst_n_function;
-	return ((rst_n_function & EXT_CSD_RST_N_EN_MASK) == EXT_CSD_RST_N_ENABLED);
-}
-
-static int _mmc_hw_reset(struct mmc_host *host)
-{
-	struct mmc_card *card = host->card;
-
-	/*
-	 * In the case of recovery, we can't expect flushing the cache to work
-	 * always, but we have a go and ignore errors.
-	 */
-	_mmc_flush_cache(host);
-
-	if ((host->caps & MMC_CAP_HW_RESET) && host->ops->card_hw_reset &&
-	     mmc_card_can_reset(card)) {
-		/* If the card accept RST_n signal, send it. */
-		mmc_set_clock(host, host->f_init);
-		host->ops->card_hw_reset(host);
-		/* Set initial state and call mmc_set_ios */
-		mmc_set_initial_state(host);
-	} else {
-		/* Do a brute force power cycle */
-		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
-	}
-	return mmc_init_card(host, card->ocr, card);
-}
-
 /**
  * _mmc_handle_undervoltage - Handle an undervoltage event for MMC/eMMC devices
  * @host: MMC host structure
@@ -2412,7 +2417,7 @@ static const struct mmc_bus_ops mmc_ops = {
 	.runtime_resume = mmc_runtime_resume,
 	.alive = mmc_alive,
 	.shutdown = mmc_shutdown,
-	.hw_reset = _mmc_hw_reset,
+	.hw_reset = mmc_hw_reset_recovery,
 	.cache_enabled = _mmc_cache_enabled,
 	.flush_cache = _mmc_flush_cache,
 	.handle_undervoltage = _mmc_handle_undervoltage,
