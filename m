Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0F3FADFA
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968725; cv=none; b=BtQItdyNthvP/h1zFYht/IiphmTw82kUl9YxKCeqeQ4sEMX78FHvRcBQyy0uRTBaJC4SQvUREq3LIxlC36oflsZf2ktt8uEdD4HRO7ncNbE3+9r5OTnngSCDwsFhehHGFP6OT0E2y+tWiVjAXmlKjyUiqzq8e3r1TIomuiVLLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968725; c=relaxed/simple;
	bh=//9sionMhS4M7t/0Wt1MxqBaL/YEZe85CEZFIpJbxGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b0+5cHQWwFfTF2yCFG+lHdXM400C+tAHs7sFKSLqEVm5M2vYu6LJ+AzD/CBsr4RBmyqX2CxYXhmo+Mu8PLG0ngv5HF5SzjMUfARWdpvRYE/vKN7klB5joSyMx1ap6aff0dV69M5lXQfmvY4rBDDRSv13OsDafmPOFOdnkWnmGKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YShYhabf; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YShYhabf"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7eb34c17b96so1109669a34.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785968720; x=1786573520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Youi575tAxYNiwgXr28Lc52i2LD/cKBdFtczF6a874=;
        b=Y9+D67lTyt0frXMIErwOd/LgJlsEzU17E8z6BB95XEmGeUjdhgKxyLJTL5ptW5f8od
         6kGHIEyCx7NCSBeqkac809HgdD133huzFRpGPS2yvwBBSSb3YU3Kp7NjuzoeAvYPVd3t
         fBUGU7KH52Cmd/c4MAsTVQdwRh8Jy3kLgUhgUC6yA6sEacy9aeOp6q6SwE9X1HmzHlyZ
         b06r2DhICmqBLvYK6sm4yyxOXIoh0l5uP385FspE7AWPo4TT9L13UK7IXk6Mm5sUUymI
         ZQlus0ZB31rCmN5u3MgFs9a38CI5Q8qwzDbgl29UVX2BxOg55yUrTQgTR0+ov1gdlpld
         1Ebg==
X-Forwarded-Encrypted: i=1; AHgh+RrpOGFBlIJ+yzDglUu8iZXg/f2WpJJ/paaC0f7FJmWfeSHQX/HO/bAw+0CTjQ0SvrYcLlHW3jRHuNXM@vger.kernel.org
X-Gm-Message-State: AOJu0YyEOlySwyNpP0Ef8+0wxhvp+ZuDWa3/5gWSuNnoCn2SQHRCfoUu
	oUN7cM1SECYRVL1XQl3rBfxXL8DpshKEsstpUefKuqWbb7CWGoxnhbhSIiC/bXKgp/qtLAyrIXq
	x+cnb4Xj7+vqAIYLJS5yA4/MMTvbVAC0XGB8Mb4FU3OFJqUzRtziXNS1D/Ri8qnRLUbjvngnlzb
	9cJlr601rTnfrYInoDnN+pChTchSzXzFu6ZOmncV3gcQxbVMoKc2b3wPmxfw/PNEp1FOBKBIemT
	hd6x9ZK88kVLg==
X-Gm-Gg: AR+sD11T3AG91h+wlsDaN+u5HRexFJenlcqCyNzEpylExxZUl1qAnwPsqFu/Xt/3PiJ
	F8oM0X9X52Qbkwme1qM0KRjvR+mAAmo+35Y2WN/AL/zhuUtxSujViODOVQPJi7h1jny440XdsYT
	n3XUwq+MhzVSFvDByk3qdiKsap4uB1x/rMfPN1/rW5kGgA6C4Ky6wL7vJQQ0atjmxF12UtT0sIk
	vHrEOqYOZ/RdCDbCzShGH0xs8Z8kOHfHX+uDS/i0tEfn2jN3NR+q5VascxkkeaGLJX/E4LFQECn
	+os2imkjW0mdoa1Q4kKUVpIz6kCyM1ZRnFPr3iLewppsWgZ1jhS5+moD0RLTLbE01UQX0tL9diE
	et0HpUT8QavGO3R6MZhnjZRXOVMJ119XAsE0ZoH6tLKpJ2MSOabR+nd2H48YSAadkawQmqI9Cha
	NYoX556HSpA9oGNzLlhChAhpgnKa+DBUjo
X-Received: by 2002:a05:6830:6018:b0:7e6:efb8:fe66 with SMTP id 46e09a7af769-7f1e5e8b862mr6158560a34.12.1785968720328;
        Wed, 05 Aug 2026 15:25:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f1df317f9esm739297a34.1.2026.08.05.15.25.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2026 15:25:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2194013a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785968719; x=1786573519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Youi575tAxYNiwgXr28Lc52i2LD/cKBdFtczF6a874=;
        b=YShYhabfw+Yx4mtVQ/WivoBAwypSAd55ZT8OaxiS80OcmBa4jvLqKC3jDwOBDldbLz
         Aej0rF4FsdLVioyPWiYGoTnyDMvUqvSZ7imlrjfEtwQD88ZAleAYHoGDrCkGKkBB34Lb
         +IaMWeWZ329L79VXXC3zrtkUEJZKS5AiuR350=
X-Forwarded-Encrypted: i=1; AHgh+RpMwaGfGWYbzDeiKK2WSCPeHS4TgEMCxDXOe6bUHFTo22LxjnJgkYCTvAtL6UAeYf+bSzvKgEpaHWza@vger.kernel.org
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr11055869637.0.1785968718609;
        Wed, 05 Aug 2026 15:25:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:728f:b0:3a2:d316:de53 with SMTP id adf61e73a8af0-3cb85c0732fmr11055793637.0.1785968718027;
        Wed, 05 Aug 2026 15:25:18 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm18526160eec.20.2026.08.05.15.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:25:17 -0700 (PDT)
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
Subject: [PATCH v7 3/3] mmc: core: Honor keep-power-in-suspend and reset-card-at-resume for (e)MMC
Date: Wed,  5 Aug 2026 18:25:00 -0400
Message-Id: <20260805222500.2567801-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805222500.2567801-1-kamal.dasu@broadcom.com>
References: <y>
 <20260805222500.2567801-1-kamal.dasu@broadcom.com>
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
safe, since firmware needs to talk to a live card. Since the card is
never power-cycled, nothing else resets it back to a known state
before the kernel reuses it after resume.

keep-power-in-suspend / MMC_PM_KEEP_POWER already exist for the first
part, but are only consumed in the SDIO suspend/resume path
(mmc_sdio_suspend()/mmc_sdio_resume()), gated on a per-function
runtime request via sdio_set_host_pm_flags(). (e)MMC has no
equivalent function-driver layer to make that request, and the
requirement here is a fixed platform characteristic rather than a
per-cycle one, so _mmc_suspend() checks host->pm_caps directly
instead of pm_flags.

reset-card-at-resume covers the second part: when set, _mmc_resume()
resets the host to its initial bus state the same way _mmc_hw_reset()
does for a non-power-cycle reset, before mmc_power_up() and
mmc_init_card() re-identify the card.

_mmc_suspend()'s fast path requires both MMC_PM_KEEP_POWER and
MMC_CAP2_RESET_AT_RESUME to be set. Keeping the card powered without
also resetting it at resume is not safe for this driver: skipping
mmc_power_off() leaves power_mode at MMC_POWER_ON, so mmc_power_up()
no-ops in _mmc_resume(), and without an explicit reset first,
mmc_init_card() runs against whatever bus speed/width was active
before suspend instead of the initial state it expects. Conversely,
_mmc_resume()'s reset checks pm_flags rather than the
MMC_CAP2_RESET_AT_RESUME capability directly, since pm_flags is only
set when the fast path actually ran -- the only time power_mode is
guaranteed to still be MMC_POWER_ON, and so the only time resetting
the bus before mmc_power_up() is both necessary and safe. Without
that check, MMC_CAP2_RESET_AT_RESUME set on its own would drive the
clock and bus lines while the card's supply is still off following a
normal mmc_power_off().

host->pm_flags is set alongside marking the card suspended, and
cleared in _mmc_resume(), so host controller resume handlers can tell
power was preserved if they need to.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v7:
  - Sashiko's AI review of v6 found two real, complementary bugs in
    treating MMC_PM_KEEP_POWER and MMC_CAP2_RESET_AT_RESUME as fully
    independent in this driver:
      * keep-power-in-suspend without reset-card-at-resume: confirmed
        on hardware to hang -- _mmc_resume()'s mmc_power_up() no-ops
        since power_mode never left MMC_POWER_ON, so mmc_init_card()
        runs at the pre-suspend bus speed and CMD1 times out.
      * reset-card-at-resume without keep-power-in-suspend: the reset
        block ran mmc_set_clock()/mmc_set_initial_state() ahead of
        mmc_power_up(), while power_mode was still MMC_POWER_OFF from
        a normal suspend-time mmc_power_off() -- driving the clock
        and bus lines before the card's supply is enabled.
    Fixed by requiring both capabilities together for the suspend
    fast path, and checking pm_flags (not the raw capability) for the
    resume-side reset, so it only ever runs when power was actually
    kept this cycle. Verified on hardware: the keep-power-in-suspend-
    without-reset-card-at-resume case now correctly falls through to
    a normal power-off/power-on cycle instead of hanging, and the
    paired-capability case is unaffected (still hardware-verified,
    now with an extra confirmation run after this fix).

Changes in v6:
  - Reworked around Ulf's two-property split: dropped the
    unconditional mmc_set_clock()/mmc_set_initial_state() reset from
    the suspend-side fast path, and instead perform it in
    _mmc_resume(), gated on the new MMC_CAP2_RESET_AT_RESUME (from
    reset-card-at-resume), matching the property's name and
    description ("before the card can be used, it must be reset").
  - No longer touches MMC_CAP2_NO_POWEROFF_SUSPEND/no-mmc-poweroff-
    suspend at all -- that capability and property are gone, per the
    v4 rework; this patch only adds MMC_CAP2_RESET_AT_RESUME.

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

 drivers/mmc/core/host.c  |  2 ++
 drivers/mmc/core/mmc.c   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mmc/host.h |  1 +
 3 files changed, 50 insertions(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index b7ce3137d452..1622f7846441 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -400,6 +400,8 @@ int mmc_of_parse(struct mmc_host *host)
 	if (device_property_read_bool(dev, "no-mmc-hs400"))
 		host->caps2 &= ~(MMC_CAP2_HS400_1_8V | MMC_CAP2_HS400_1_2V |
 				 MMC_CAP2_HS400_ES);
+	if (device_property_read_bool(dev, "reset-card-at-resume"))
+		host->caps2 |= MMC_CAP2_RESET_AT_RESUME;
 
 	/* Must be after "non-removable" check */
 	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 05444ecf3909..62cc009f2a2b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2157,6 +2157,33 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
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
+	 * Require MMC_CAP2_RESET_AT_RESUME too: without it, _mmc_resume()
+	 * has no way to bring the host back to a state mmc_init_card() can
+	 * use, since mmc_power_up() no-ops when power_mode is already
+	 * MMC_POWER_ON. Keeping power without also resetting at resume is
+	 * not a safe combination for this driver.
+	 */
+	if (pm_type == MMC_POWEROFF_SUSPEND &&
+	    (host->pm_caps & MMC_PM_KEEP_POWER) &&
+	    (host->caps2 & MMC_CAP2_RESET_AT_RESUME)) {
+		if (!mmc_host_is_spi(host))
+			err = mmc_deselect_cards(host);
+		if (!err) {
+			host->pm_flags |= MMC_PM_KEEP_POWER;
+			mmc_card_set_suspended(host->card);
+		}
+		goto out;
+	}
+
 	if (mmc_card_can_poweroff_notify(host->card) &&
 	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
@@ -2217,9 +2244,29 @@ static int _mmc_resume(struct mmc_host *host)
 	if (!mmc_card_suspended(host->card))
 		goto out;
 
+	/*
+	 * Firmware or other hardware may have accessed the card while it
+	 * stayed powered through suspend, leaving it in a state the kernel
+	 * can no longer assume it knows. Reset the host to its initial bus
+	 * state like _mmc_hw_reset() does for a non-power-cycle reset,
+	 * before mmc_init_card() re-identifies the card.
+	 *
+	 * Check pm_flags, not the MMC_CAP2_RESET_AT_RESUME capability
+	 * directly: pm_flags only ends up set here when _mmc_suspend()
+	 * actually took the keep-power fast path this cycle, which is the
+	 * only time power_mode is guaranteed to still be MMC_POWER_ON (and
+	 * so the only time this reset is both necessary and safe to do
+	 * before mmc_power_up() touches the bus).
+	 */
+	if (host->pm_flags & MMC_PM_KEEP_POWER) {
+		mmc_set_clock(host, host->f_init);
+		mmc_set_initial_state(host);
+	}
+
 	mmc_power_up(host, host->card->ocr);
 	err = mmc_init_card(host, host->card->ocr, host->card);
 	mmc_card_clr_suspended(host->card);
+	host->pm_flags &= ~MMC_PM_KEEP_POWER;
 
 out:
 	mmc_release_host(host);
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index ba84f02c2a10..14a407a9f9b7 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -463,6 +463,7 @@ struct mmc_host {
 #define MMC_CAP2_CRYPTO		0
 #endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_RESET_AT_RESUME (1 << 29)	/* Card must be reset before use at resume */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1

