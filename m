Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1533D75DE
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356076; cv=none; b=PxGdYGe+tWSoQpUx3NurirdZyJoUG4O9+SxwGb42nHB0JleOEecjxUBgJDLifmOGZCzatPbZa4HWgvUBlyniW/w/5u++8+5+2OocVTnUg6YSKRxs6S+PoaDL01IKqilbVirbn/8eYZCS0ErEUgyasFawmNVQKKs66ohl2PtQKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356076; c=relaxed/simple;
	bh=aLDeGr6qfX85lNg7fmCss7gpAwAG5NFiImhEO7naEPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aO6wcmmvpiT30dkbh5dDM6IKX45bln6NAZLDzDq8pAgqr13nX4NYbt2WIaRN9kfnKJW7smbhp61IRI9lJC3MD6wAvcheYRwLXHmm+zNy7fZFqFPWZgjsNEd7DDqRWAA1XUyiIJvfvk3NNbAGBXw+z/FeB039iVYhmMI7ljUSv8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KeEGqNlh; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KeEGqNlh"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1094275a12.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356073; x=1785960873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVgVMD0XC7wXJ/3B0Kj8mFsCcLdJpANA3CnABjrrNW4=;
        b=TUfdJ0+k9OJPoniycbRxZUNE+tv34r6bwpDw3xS0gXoNcYjKPbZoUgeBJG3zf8TKIr
         kIfsy2ntKBVTRk6OndxssI1D9tyUen4MyJ/wT1zzAYZerlsIlaH7r2Mm2VN7puEJIiYf
         SAzFvKqwOogkS69UkpeaeCrinjDL1tLnbEt/FORWk7Hbwqp7/VJubH2frHc8r9SvTRFL
         Jp5d/wsxD2777mvKdvClkxqufRwsXgzHK0JZ7AAoTJ8J1FobWEzEjG4X1/cx5bFr9Ca2
         wi99na+Ilzh5og997ReXSp6OZsrgvp/HEuUoNe33iceP1+S8//qICT6HcyrvPV9IWC6h
         qxyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGLDXlpsSJXVvxa2svg2sUi48ef/Rg0VS8uJSgnp95S7JUs2L+MfkcYPOx6nDayg4/MKS1fX1Zcb3S@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTGy4KGbBbZMqzZ9hkiKDDT39QtQeKZYFzhIkvYANfrioeMgT
	D9vtz5JTI8RRIo/9ysrMZKraYII2ienokIBByJpMUIbHnJZA/at00cyS9b4ZrJSsWldVY48yq5M
	/l5ygO0/4V9NJhwI/SLg2DLCmThNLTRJYg+GSPJLf2TKz9QqQcL3qg7Sg+WbV4T0osv93vO5vfy
	7dZXQ5PDkxeJCl6kAVc6JZWHbSE4Ujsjpqarn7GetJAzZ3iBP8tY13skeXCwOdiC/2Yo1jfOOJF
	lIJ7lJ1MDW6sQ==
X-Gm-Gg: AR+sD10LNCEByULKDxQWux4GN6QbdFfD9rYnrbxn2W8J8MIAP+1QN0eHmK5xDQrnn4T
	QHoiraj1NMtnESrvOsbIRJ2/K5gkyFKYLhxekoWAQQmEATOILw61rNG/spOqmA6GCIKppCL34u2
	OdxgE1mFQnoyIS+50JNk2aRfcHOvCssH5FZ0MI9kGjNIXJUlEixYnf+yMc3/6Y7yJgDfixHXmHZ
	IeqY+JQsWsxHTEad3K96+XRAQZONKcohWJq6zaBTY/jFWzkA/CLoLgJNUkBto0Kk2ioyH3UWgb0
	Lthjy2Pp40yUOhlcNkGRTUlQkKVpG8XIhGJ+w4/Yy4u2DZtVWmblR8ahPJrTWGwOD+uBEXzIRdo
	O5Jjch+byy1KM0Xk4GG5vTmtNRwgsxqsH//u6kpXA1Fiam47e6it5jhq0riiow7vrvXHcKAtEDU
	/ail8gfPJO9bOrUGRU6K2fLs4YvqPQDiou
X-Received: by 2002:a05:6300:6698:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c8aafda266mr9325603637.30.1785356072660;
        Wed, 29 Jul 2026 13:14:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cbdb9b951bdsm186847a12.8.2026.07.29.13.14.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:14:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef18406878so13861846d6.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785356071; x=1785960871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVgVMD0XC7wXJ/3B0Kj8mFsCcLdJpANA3CnABjrrNW4=;
        b=KeEGqNlhAa0jzjJ61px+DVy4ojs0rn6a1PNfWWcTomKfIP6H8QZcuNneBB5hoUg3vm
         6aP1Oz9mq0j/SDjgohIsD0/chEJh9WboE4KCg2Z9x3NC5cWIqLymnZRIUn+7k4LQSopU
         5PQdVg1dTUE4E3NsNdpynsaLVbK6jnstfU9LQ=
X-Forwarded-Encrypted: i=1; AHgh+Ro9aAVAzyr3DZ95Lp1HCJ/mfM5pvQ6twhNu+Yxh3vtD0ex5HHK4n+qm4xMr1FWpxOeOvqBne6T098ST@vger.kernel.org
X-Received: by 2002:a05:6214:2429:b0:8f2:1cf:c13d with SMTP id 6a1803df08f44-908302b301dmr3602366d6.48.1785356071154;
        Wed, 29 Jul 2026 13:14:31 -0700 (PDT)
X-Received: by 2002:a05:6214:2429:b0:8f2:1cf:c13d with SMTP id 6a1803df08f44-908302b301dmr3601896d6.48.1785356070559;
        Wed, 29 Jul 2026 13:14:30 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8cb0dsm32033066d6.48.2026.07.29.13.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:14:30 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Avri Altman <avri.altman@sandisk.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Erick Shepherd <erick.shepherd@ni.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] mmc: core: Honor keep-power-in-suspend for (e)MMC in suspend/resume
Date: Wed, 29 Jul 2026 16:14:20 -0400
Message-Id: <20260729201420.4047677-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
References: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On some platforms, firmware accesses the (e)MMC card directly during
resume from Suspend-to-DRAM, before the kernel's own resume path has
run, in order to load boot code. This requires the card to remain
powered and responsive throughout suspend: putting it to sleep,
sending it a power-off notification, or removing its supply is not
safe, since firmware needs to talk to a live card.

keep-power-in-suspend / MMC_PM_KEEP_POWER already exist for this
purpose, but are only consumed in the SDIO suspend/resume path
(mmc_sdio_suspend()/mmc_sdio_resume()), gated on a per-function
runtime request via sdio_set_host_pm_flags(). (e)MMC has no
equivalent function-driver layer to make that request, and the
requirement here is a fixed platform characteristic rather than a
per-cycle one, so _mmc_suspend() checks host->pm_caps directly
instead of pm_flags.

When pm_caps has MMC_PM_KEEP_POWER set and pm_type is
MMC_POWEROFF_SUSPEND, skip the poweroff-notify/sleep/power-off
sequence entirely: deselect the card, reset the host to its initial
bus state the same way _mmc_hw_reset() does for a non-power-cycle
reset, mark the card suspended, and set host->pm_flags |=
MMC_PM_KEEP_POWER.

Setting MMC_PM_KEEP_POWER in host->pm_flags during suspend ensures
that host controller resume handlers are aware that card power was
preserved across suspend, allowing them to perform a soft resume
sequence instead of assuming power was lost. Clear this flag in
_mmc_resume() upon completion.

Only set pm_flags and mark the card suspended after
mmc_deselect_cards() succeeds. If it fails, the card is never marked
suspended, so _mmc_resume() takes its early "not suspended" exit and
never reaches the code that clears MMC_PM_KEEP_POWER -- setting the
flag unconditionally would leak it for the remainder of uptime.

The pm_type check matters because _mmc_suspend() is also called for
shutdown, driver unbind, and undervoltage, none of which are
guaranteed a subsequent _mmc_resume() call, so those still need the
normal power-off path.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v5:
  - Only set host->pm_flags |= MMC_PM_KEEP_POWER after
    mmc_deselect_cards() succeeds, instead of unconditionally before
    it. Otherwise, if the deselect fails, the card is never marked
    suspended, _mmc_resume() takes its early exit, and the flag never
    gets cleared -- leaking it for the rest of uptime.

Changes in v4:
  - Gated the fast path on pm_type == MMC_POWEROFF_SUSPEND; it was
    previously unconditional, so it wrongly skipped the required
    power-off/notify handling during shutdown, unbind and
    undervoltage as well.
  - Reset the host to its initial bus state (mmc_set_clock() +
    mmc_set_initial_state(), matching _mmc_hw_reset()'s non-power-
    cycle path) before marking the card suspended.
  - Set/clear host->pm_flags |= MMC_PM_KEEP_POWER around the suspend/
    resume, mirroring the SDIO convention, so host controller resume
    handlers can tell power was preserved and perform a soft resume
    sequence instead of assuming power was lost.
  - Dropped MMC_CAP2_NO_POWEROFF_SUSPEND and the no-mmc-poweroff-
    suspend DT property entirely. Reuse keep-power-in-suspend /
    MMC_PM_KEEP_POWER instead, per Krzysztof's point that the new
    property described the same contract as the existing one.
    _mmc_suspend() now checks host->pm_caps directly rather than
    pm_flags, since (e)MMC has no per-function driver to make the
    dynamic sdio_set_host_pm_flags()-style request SDIO uses.

Changes in v3:
  - Reworked _mmc_suspend() to skip poweroff-notify/sleep/power-off
    entirely, not just SLEEP, per Ulf.
  - Renamed to MMC_CAP2_NO_POWEROFF_SUSPEND/no-mmc-poweroff-suspend.

Changes in v2:
  - Replaced the card-level MMC_QUIRK_BROKEN_SLEEP quirk with a host
    capability, per Ulf.
  - Added Reported-by/Closes crediting Florian.

 drivers/mmc/core/mmc.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 05444ecf3909..7cbe65532726 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2157,6 +2157,35 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 			goto out;
 	}
 
+	/*
+	 * Keep the card powered across an actual suspend; shutdown, unbind
+	 * and undervoltage still need the normal power-off path below,
+	 * since they aren't guaranteed a subsequent _mmc_resume().
+	 *
+	 * Check pm_caps, not pm_flags: unlike SDIO, (e)MMC has no
+	 * per-function driver to request this via
+	 * sdio_set_host_pm_flags(), so it's a fixed platform trait here.
+	 *
+	 * Set MMC_PM_KEEP_POWER in pm_flags so host controller drivers
+	 * know card power was preserved during suspend and perform a
+	 * soft resume sequence.
+	 *
+	 * Reset the host to its initial bus state like _mmc_hw_reset()
+	 * does.
+	 */
+	if (pm_type == MMC_POWEROFF_SUSPEND &&
+	    (host->pm_caps & MMC_PM_KEEP_POWER)) {
+		if (!mmc_host_is_spi(host))
+			err = mmc_deselect_cards(host);
+		if (!err) {
+			host->pm_flags |= MMC_PM_KEEP_POWER;
+			mmc_set_clock(host, host->f_init);
+			mmc_set_initial_state(host);
+			mmc_card_set_suspended(host->card);
+		}
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2220,6 +2249,7 @@ static int _mmc_resume(struct mmc_host *host)
 	mmc_power_up(host, host->card->ocr);
 	err = mmc_init_card(host, host->card->ocr, host->card);
 	mmc_card_clr_suspended(host->card);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 
 out:
 	mmc_release_host(host);
-- 
2.34.1

