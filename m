Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383882;
	b=4+FNP+G9LawKQOWXbS0Fu6v6DzpQiIBw2DDX/idDIjcgnZ7yKPVCaLzW7tYAFeqmRFuZ
	 Yt2RXeZGUD1H4c+KAlqRe78T7DJslijhzESJa/BMTNBLV0rP77XoxvXCd1YlaQFMjm5RZ
	 0ATbM3DsZnQDCwRmjkINfvgr4+L/7t1bx1Kl+Asr+RfjekLs0j4gM4c3y6n4fZfZ1Ny/H
	 +pALO66PXyrgUJaRVqKWmVZfDCimmnycLRoZ25ecPSbsTRjPcngkQ/WIb1Im3cxA502l1
	 rnFfy8zm26QQTbBDMeOxoFgKgg/uKn0JTlxWDiIuRRgpTM0iRaWuW6qXAoWlgAbgeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383882;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
	b=WLOjwZm9tSbBg0aPNLlnX5ChFndFsDgl4bjCsHclzk1RL3Mzs5F1PS3VeuqvARov+jHs
	 sMzQJzlcRL1nQImTi9xZpEP6kvcbDt1FTzI5DEtjWWG0FATNYhcI8c4MUNJc53gbSp42L
	 0mgIXDJCEnBKzEhRndOLbVRWsv8c7mSNvsvy5JrXgdMZGGXHK8ZXbgH/iptQeAIiKnZFA
	 rWT6pmw0tO7UqOEn5Ty17dfjmQmwPuyJ8T2P1bC+CdB15/F42kiRsSI4EJBGwXuJDsOXX
	 yW/4cNQ7mVr1bm9OLzMTlLafbW9FCUTi6E36spJExIA8BOjtQm7PVOuz32ABbS3lEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MY0LmUWI;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5260A260F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A5260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MY0LmUWI
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-53669f7b518so10700661cf.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383881; x=1793988681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
        b=IcZHWQruW+VxMBvCpfQDERU7vZJGV7LLOJHlA6Gp507NHMXjH7vgHfKpkQz0YqLUaQ
         AbuC+sGXnpyd4YZQl/FJrCxMhkMEIFx6RMBlhjqtMASpXvuceTE9VMK18ZzmCRfNHkcQ
         IOEGV0NWP2CT9h9jKIwqPE1Mlj64Ql1pxMranpA3A1aCVvCpqsaMRDcy/Si7I5K6J64g
         cNLsGsxuWe78T2ZhCkQGcQMtLhxjsNX4lBPaia5N5Xygric9gCpRN7yynvkCM3SWGgom
         CTOhI6KWhe/7jKVUl+wONhwjFzdi9bX+8aBx15D5lBe+ese6loMZOW9jg74wiaFf/JsD
         TRsA==
X-Forwarded-Encrypted: i=1; AKwUvBw976RnyGs3SbXn+c7lYJJxa8qAoPhmgO5oisml69nBKSjNWNpj59lqfPnBRtAq3XQjGfPR0VMhRcD9@vger.kernel.org
X-Gm-Message-State: AFq9FYJT75m3b45Ka64pgck1PvbFWJDaEFyEH/8KSnEjEvGfkGIsDArB
	P0eDWT/mbwxOg5KrTIgrOvCx/FE1bTLLl7NH8l2QEPUvXtkURF8/spsUc9GMhmYHkHZz3OpBMwA
	nbr3tpIwWVbsGpbe9Xi8kjP8fa3IdfAFq3hv+w8PGBWbosNMGi3GiEdq/jr7TwDa/s8BeQKUfAO
	6V7EXmd8XY48mCeCGfT1LIGZrVlQkzr+mhEJxoTGxeDPPc+rDaDEDE0+uwEA45SXuLiEk+DTr3B
	SrB3W97tRZgNQ==
X-Gm-Gg: AYBFou0TM4+kWiRxEXeU3IbE51TSksGAUmPZ4VpDTZNvML7re7jzoyPnoQiyt5SlHVD
	Ns/PQ9siVnz4D3mw8N4HmmvXyXCOxZNT6l9ev6UTjtrvFCY2AfGg4PcBYN1wseODFDt/wr3O85z
	WXLn4Pk0rxFJbScS4l3UErhVU6CBtBndBxdZCb0Oo/CWYzz02ceOGl9TVnywP4TRmCOihWxuxgu
	v8GmI2w1UhyZToJYY9IJlHlaq+J1NAizUDZd8jiIYCVuRE6GZ4e5X/UWcllhE2fxaualPI7kPDt
	kFR1e49UyBkRcOOfhWWsDuvs3o5Y0TxjWs+JogK3Uzp+RQ6Yqq4gYGa5JZJuVSkvvqBMTWHlgbh
	ObaqA4Q7mH5CtqUULGsjeGTnKMe+SW1rHEWp5mZay5q1qG9jKFt3zkVRjdi6DwmepYeOcx7Md+d
	HMb2T9PgCqEUCKYfK+CzHxkw7Z5ANYeGM8
X-Received: by 2002:a05:622a:1f95:b0:533:8900:4eab with SMTP id d75a77b69052e-542b6d60becmr45156481cf.16.1793383881206;
        Fri, 30 Oct 2026 11:11:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5430f906d00sm149571cf.2.2026.10.30.11.11.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1585087c88.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383880; x=1793988680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+uaoRo5l36iC7XTBrb03pfY3TZLNhetIMMz75SoQNo=;
        b=MY0LmUWIg7iF8KYq4I8CKycgOvu9BoMnJwcGvR8jf4bS6cgrzXQLoWhksSP//5FYkY
         Cg4jA8EYDcqBUDAwzwY1isWxyJUgZ4b32ZxNOTOgO8dK69wSVKt7CI4E93x2wW9I19mj
         2N7Ut5z1EORS5de4ct4RcHlF/BYuRlA217BGo=
X-Forwarded-Encrypted: i=1; AKwUvBwsWc9tjrluI0ELnU6LJkeWSoHznX9BN7c9tzXotO5zzb8anP9wz5oqhh2sY9qOqxP+Dh5jNDmJYZ/X@vger.kernel.org
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr4838111c88.15.1793383878374;
        Fri, 30 Oct 2026 11:11:18 -0700 (PDT)
X-Received: by 2002:a05:7022:38b:b0:1aa:47e7:97e3 with SMTP id a92af1059eb24-1ac5c45fd1dmr4838041c88.15.1793383877613;
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:17 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
Subject: [PATCH v11 5/6] mmc: core: Move and split reset functions for eMMC
Date: Fri, 30 Oct 2026 14:10:32 -0400
Message-Id: <20261030181034.3811225-6-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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
-- 
2.34.1

