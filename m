Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426290;
	b=AFFuVgG7oe7UWb3wVqENYpYljkRiSv7AGC6HGrK0OMJ0222pbkyVSvMcGpy6p04VVeLt
	 7xUPVZuI4CrXxcIAN/0A3R+HWScAyliGfJUiLRQifyblzqyM6NMJ/1yYj5taQLmaPO2op
	 rApvtF8QfpmJXSBMJ22I5DVDdAnOGaHlS7KU0GdLEor+dJaUvFwPzZgjbeCf8dKf4oWoH
	 F4Owul2QssR5lJspJWoS4BSUfys8iLCpBYzOkg5K36IXRa0vn2+8wooIKNxcyrO7fh8Ng
	 IOGrKhUjwip/8Mlx1mrLaqItuN+BgFmY9dLwO3gSib54a5XxkVevSf/oB7xvT2qW0Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426290;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
	b=Hs1810NV6AHAjQhPyYd/Ww4d09B2mibg/4FRYKVMBEY2uulY4v3h/u2NkE8WkIlzTAGw
	 0jPdKv6TPSO4FtCCJr5UztiSHP307aV+9Llxa5AXcYdeJZOePQhNdHWgF2/byaE8mUKd9
	 fY+aQicU6Y6K5k5czS80Ip29RnZth1KdY6p6PjmhqJACMC75r/FHVG4+Te/Q/Y55lUxCf
	 TnJTCIS531vrdfRq0/angKlqJaNv0isZKlYv46XxTA3EcfMNNhVI4GQneDNvJF8/hfkXH
	 XOXUg1vaZLGzjHKoL6aj4pOXjSOzNghQhZzW4leaZ0XLGcJZtKYtJuWZQDu0+qruMxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RWDM1IIx;
	arc=none smtp.remote-ip=209.85.222.100
Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E1606A882
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB4E1606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RWDM1IIx
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-9903fde8db8so943593241.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426289; x=1795031089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
        b=dZ+EHhoKyak8FcRfvMgr9RsZYnXlnaY8Bl4T/FcnxN9xWidqrx7xNeWK8FczKpfJdM
         lcfRiudbW1ZvrnADtHOrpyFwLKHY1qBbmv8GjSkdA1+AC/NJay0LxHvmEWzcdx+hh8MN
         gARJ46hAq1QMqkWRj3LWaefplzn982ykHwNkRILa4gq4qaCxjgDA92xiBDshYMBp3ONg
         sUxHAM5bfJ/Nrfcdv+xy6I9L64iWE9eULt0ad28ny6XfHfX4KMQsXuF/fkav6ukCW0FT
         bA1Z+t8Du9Vi2tmOIMpMwFmGoqsOmHZv6dOeL6CJxpb8zo52S96D/JHVhtpnQJBFfcsS
         Kqog==
X-Forwarded-Encrypted: i=1; AL+hErFmyzX32VjwPR8xPH3NVcVXmY/9m748EWmRXUYT5gnt0uaqBYiruF6DSCF7uMv6Y1/LarM/f/V1eCQu@vger.kernel.org
X-Gm-Message-State: APuU4Z+bpERTMUeDdrasoCS5Gr8oQGrbPS7IldtX/XkgSLWTxXU4tNbr
	lpjYWOoTx4ZqPrTqZqycLALEYYIK/jJK6+ZbyZNa/oMBIV0v5Ue01vr7qYe4lElzgdK4I1WhHW/
	3V/QL2UjRbmLvXJ06F2ZyqhK12V7xSlEV+5IXgC7tFNFeFDWnbL934IGdvy/ct7vMMT3ZEquYtg
	1fSQUo36Zeuf1tur7JoZdz1WMa0bQ+Ruf5uhTX9LcBY2eTRXKIezMOF3yaZ1mL+/8CiFBFE3w7i
	Mb/zE5M7LLucQ==
X-Gm-Gg: AYBFou3yYmukV5AqKit128GGBZSl9amh1FlN1Z1xsT3svyMJA+KXDtIBPljz/l056Qw
	K+SEE6DY58n3Lo/F+CfL8xYcDCmD8gWxpqybZXufgQpo5buFdLe2Q1B7K3gxyJplpFP/DnqXAbZ
	IL8yogTEpoRjUuMpyYm8CyVvOLWtUtKcw3kpo/MN6DFFcFz9EW7R3+7HCpJYjsNVN4a1Azu9cbh
	Nz6B4+ffjrjwVwwbroxKISPj0Thm/4Qf7fY61rYPPC4vMHom9pziKDi1crfDKHRF2MxrMR9X1Ni
	EA00bFfaEgXfKybFf7fDO5YApewfm2zMxkxjXh9vBsgMqV8oHBD3ctJKJXS3NoI1m8WP81OZ16N
	46DNOg+jQYL2diCpRtNEpWCmO3ZhrxnXkhEXW12oLbqL216NvI0D/SVxb0XtTFwvGRJOzGFn819
	tY3VBSAI8c6iaZnEfilW1jLTdY5rQsFnEc
X-Received: by 2002:a05:6102:a50:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d4fb4d246emr1276581137.20.1794426288607;
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c1fe74c03sm395636241.0.2026.11.11.11.44.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:44:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6680001eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794426287; x=1795031087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHzk4Y5rg8a5GL6NtRlws2skWgvMQ4aNhHaizSYchuA=;
        b=RWDM1IIx+KQrQKt1dV5RTshb6sNlaI1LtnQ+ospUgkmC3VeH87IUiKafvOUikNguBV
         iG5nfFWtr+BZRt3xRdAbUg4NL11qDe8ay9AgUehKcCnDpcGNCHjckDZUyTSdQwAOJdkT
         XgR9TkZbXat/bZtcm19+qn/756xP/JWAyqvXY=
X-Forwarded-Encrypted: i=1; AL+hErGfaj0uVQLeSONsoHmwy5DzgMmde77KuiMg4VZiGxNq13th78oDAHgWi4wSkOfj5xZyxZeVRWoZJQ9P@vger.kernel.org
X-Received: by 2002:a05:7300:f143:b0:36a:1089:9836 with SMTP id 5a478bee46e88-376855b265cmr3502323eec.15.1794426287315;
        Wed, 11 Nov 2026 11:44:47 -0800 (PST)
X-Received: by 2002:a05:7300:f143:b0:36a:1089:9836 with SMTP id 5a478bee46e88-376855b265cmr3502291eec.15.1794426286576;
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm17948013eec.11.2026.11.11.11.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:44:46 -0800 (PST)
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
Subject: [PATCH v12 5/6] mmc: core: Move and split reset functions for eMMC
Date: Wed, 11 Nov 2026 14:44:25 -0500
Message-Id: <20261111194426.1652644-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
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
index c936272bcd81..026003ba507d 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2271,6 +2271,44 @@ static int mmc_shutdown(struct mmc_host *host)
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
@@ -2319,39 +2357,6 @@ static int mmc_runtime_resume(struct mmc_host *host)
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
@@ -2410,7 +2415,7 @@ static const struct mmc_bus_ops mmc_ops = {
 	.runtime_resume = mmc_runtime_resume,
 	.alive = mmc_alive,
 	.shutdown = mmc_shutdown,
-	.hw_reset = _mmc_hw_reset,
+	.hw_reset = mmc_hw_reset_recovery,
 	.cache_enabled = _mmc_cache_enabled,
 	.flush_cache = _mmc_flush_cache,
 	.handle_undervoltage = _mmc_handle_undervoltage,
