Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E65471D06
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265413; cv=none; b=akdzAiaE7MFg0vQE9IiByxOj9fMFFuJY528tXObtE+29bR3DtKMyZnVBNkryYDpPfyp9PcBafjhduIJmoFXFCcK1q2RVyPl59GxeUj9IYUk+JTJkIsxqpjt5DmD2DunmhuXp0atUkEP6VEHMBfQC0NL04Bc5WkoBMfVc6Ew1Jeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265413; c=relaxed/simple;
	bh=eetq7XpE3Ybytc8Hsj07t5iui7R/XqM3b5H6eDBH200=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tJfiz83zhQRzGWzwe7WrH/Huid+Xi5+5Jt6b5OI0JP/EXpgIuNJ6l8KgY6BgYS5B0eP6sSqR7IeMLhMjfntXYqU+ZvgG2zZ6iHnrw5WHTEzg+tNW94YoZqGwttbbUVHhu3uXgnSKWcnZ03vYWe1tbg25D4EA3c2T2di43tn2q50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SXqZIyzG; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SXqZIyzG"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so1125176d6.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265409; x=1785870209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCgHHDSjxqQac2HFS0bKfls/PU3Kxpy40sOV/zTVIrc=;
        b=NUX0pnXT9dY0+YUu8A+ayo7p7ptiH/3La0OlPIbWu7u6zzF4AhDD69DTqwUqLIE3uV
         4jpj/t8/0xxId6j1vkEqNjVqc2Znb+ahgLEXO+RXS8Z341/6gS6634oeapxKZ6EyuoiA
         Xc4epMJvrnUiuRZD03BxCpe/Cgg0orIZ8kBop/LbMTEqXOpr4cLd/FBUCijz0Ab94VoQ
         MBt9SZ6KGlIAsP7pamUk83Z7aBKGm4uB7Mm1fJoiY37vTU1T0V6qA0V7w8iBTnA3Pna9
         y15p0I9d8FfcjyoPSqilaevJGr8gcBGlrih2LKJd6ZNGbK4xZX1TVRYLgOM41p3T1+lk
         AQ4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpHPgT0KbOaOjMYjuBmGTM8QCTMV9ROHKgyFUra0UKSw+tFH6xxSpiX3vjH4zwIFj+8CBFHzc5ksaN1@vger.kernel.org
X-Gm-Message-State: AOJu0YyqC8j7SCCRgrTZ0a3icRboKTxcXvpn7R4fvER29bCuOYgSIAZV
	Ik6Hat3bi6ag0ZyTqxFj8AersU7xv2wHSKtKHBobJ2IA+zgKwvj/HpdYoVcqRYALYfursihHjKZ
	cGJvuxaPQn3qSeOJUtwD/Y8EZxj3vLdZ0P1OONJOG82EXlC5KL3LhfX8djmuoV1GhETqDTywxT6
	HZviA5uHjeQJEnLxRyt7ArgHR3HRzn60gKvU6qdzB+CgUYoG3oSquCBOTPRkxpKjkyzSU+nWusN
	qvwMj3VTzRIUg==
X-Gm-Gg: AR+sD100yGV6cEDPh5iCdSILmaAbEXnpe6CLek0eMYWDlXv18fUAcLWQaSyg2x4vT5l
	e5inQN8q5RHETgZo15mUrjJ46vfJ/tPBjc3DrPN1TGA9UNfU6qYhvT7t8pZ4VWRFhSA3qTl15+p
	O3qBMvq9uTcanymobFJWfVdd0YhrxqiWfGFll0kqb9EmNsWJ+ze/7/kSCWCTK/yEPN8eksDF8SY
	wcFosmdkyOk2/PrUA5incsvny/EZgw+0UFN0RBWWIK6VNuhTHCCgKhY+j5oib9fGodekjqSUIvu
	4FRKIPMlLF5R19WdBZgwccT76yOq+MVjYfRhxV4613V9cNNoMloRdUkLpI0f11ESUhIhKXQbEF/
	zbktOgeL6oajQVlPJa058RlVmffvtGMSKRYEA91xoXFDCzKOAqYvWRgCDRfvZfnJZ0rXMBCw399
	F79801bkJ2cfqv26JUEbJzAQL56qn8eoLc
X-Received: by 2002:a05:6214:e48:b0:8fd:6e32:1aa5 with SMTP id 6a1803df08f44-908173a1d5dmr40817946d6.63.1785265408562;
        Tue, 28 Jul 2026 12:03:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9081dc48ca0sm407176d6.12.2026.07.28.12.03.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 12:03:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso1931581cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785265408; x=1785870208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCgHHDSjxqQac2HFS0bKfls/PU3Kxpy40sOV/zTVIrc=;
        b=SXqZIyzG/5CPFxxGinxQzO+l5JwSMuAYr4LmjeEvKO42tusVbXGYTZ0jTXKly+3q+z
         Did1VGWlziX2AJ1XObhLSLZDmmUDHnpI/ib7XiYu0QWMtafFYCM821zqVDiA8FDgLXts
         /yPieoMbebUeuI13RxLLxz+Tynav3iJBdEI8U=
X-Forwarded-Encrypted: i=1; AHgh+RrYUiQ6H5c38f8P7kj5sKC2l8xLtNzPJhv3PGvdB+WfQJfMb8pIeNhPewAsM3yUUkKbndTklFUoW7TV@vger.kernel.org
X-Received: by 2002:ac8:5a8f:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-529d7247571mr33198771cf.78.1785265407752;
        Tue, 28 Jul 2026 12:03:27 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-529d7247571mr33198201cf.78.1785265407041;
        Tue, 28 Jul 2026 12:03:27 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8b21esm5502856d6.46.2026.07.28.12.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:03:26 -0700 (PDT)
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
Subject: [PATCH v4 2/2] mmc: core: Honor keep-power-in-suspend for (e)MMC in suspend/resume
Date: Tue, 28 Jul 2026 15:03:14 -0400
Message-Id: <20260728190314.2325906-3-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
References: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
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

The pm_type check matters because _mmc_suspend() is also called for
shutdown, driver unbind, and undervoltage, none of which are
guaranteed a subsequent _mmc_resume() call, so those still need the
normal power-off path.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
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
index 05444ecf3909..dff4e372ecc6 100644
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
+		host->pm_flags |= MMC_PM_KEEP_POWER;
+		if (!mmc_host_is_spi(host))
+			err = mmc_deselect_cards(host);
+		if (!err) {
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

