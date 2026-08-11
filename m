Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C492D97A6
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466311; cv=none; b=Sn55QmAqlk9VbLVkEJua6iuWuOi8zjvhR7tNHrdsqQU2nX58lLDdK6QBOHNCcHnfvSX2NjuYOiyayRVi2x6x0iuc6YbXh00IFzhrcPkTS9HOH2CSs6T8FzOtxhuzXK0NcbxBfr0UBuARWRq8Q9WNx1ZumjoNgC6uw0ud8Hpc8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466311; c=relaxed/simple;
	bh=qDIPVpVxEpcy+zvTLK84r8RGodocHdhfgyJCOWwDWL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MR03BqUnd9heMxgx1zUJbOLGXN7ng4+dFEPblFpClSjHSwuyqGNEI0aGoXJW30kc0o+L8jJkXx31PgVQbHiScNkXuLg7JQJLI8mZrPhDSSFsAJxi0FkB3z+sbUF9ChEo2swvi/GNAhiBSRImtEnhWdC4reqyZMy9xkbzwH7VgQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EagPx92G; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EagPx92G"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38f620399a0so62994a91.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466303; x=1787071103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2PGjge9uHRNeS69RnlDH3bcMcQ9lvmh6M0bI5U6ZnQ=;
        b=aIF4bgKgEvnQis2vhQjRON7FeZp2V3HQpHlGOPcNjaX4Xl0Ve+R1/N928O5yD49AXN
         JL916gNHQs1VbONf3pAPF732ID4Y990p1Fsz/v+nglSRbzUQJuXXD1PmNq1JVTqomDa0
         nfsfUKl93V5HHticv5P7ERQVUHQJ53EUfDyanusW8y6LRc7zWpMhqNz319YghRTyFQLZ
         AyZ9ORh5oLPtf2kzvVD32biJUF9TG7FGL/8Gp+vguJ4/kBowsIsCLfRnGPDqnykuc/a5
         hGDo0IGn1EztyIoQ6FElZwYqhjyS+CGeVciLr17pKLSogV5Ky7zJajSNgfMdpx/X9dVi
         b8WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7sEXNXZLeuMI0o5s5qHmtuxyRjxwZRCx1qKWxUj/2cXaOF3GH4nHlTmngBNzljNwKLWBSqH1ucLCj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdn/+U5JCprhpxr3PT/Jwz5iux8d/uom5zQZks1yK3/y6D6nh5
	HGY8XXDMAcwtlbns7OEYS8vnCs/MOrX4CjkGbxEn+AAGfJNwnT5waHjbmGz5i51sMSN4lsQJE+0
	a/vEhDrHWdSTHlxYld3+YDFXspOCi/0bIUG5Hf9feEO9IaXKWMrckima4vYTTTzy2YqPMLB6OBr
	xVlrw0jqNeTNWq0qK9PtpQAH4l7hNb5aL72CgY+zPArdhkunp9ISghH4t+NOStcVvHBxrlwYLgP
	hd4mH0nKUulEg==
X-Gm-Gg: AR+sD12R5jAXhkPdPfD9N+KoTz/k/Ng3eE5uPw8V2YR21zvkNUNQU5yJ1LjljhY9jcn
	+R1IAQX3rvkCuOkT3IhBANPI6zZ3jaWt7NZGy3aNJzvI3pOs33SncJw9LMv+N7okoy9Y/UE+gwF
	H3AtzbL3qS1yF/Af2Tzi7qxLwhGJe7pDOdNn54xz1Ro1kY39Hg7j6BANQwipFAWAWH3ZhQoeXnx
	od2Wj2mW64GjHhkbGcFTUQJ+WC1NhAwNhDi6u9o+zI9ZGHbaf2zOJj4a+/1EHjupnMlp7+Af+6/
	uWPi5WboGWkacmT5SkIsxXLL2dLndJSQaNKBvMq8TRsjAAq+XOh7nCxZ4gILbvr4nwcUOw55tRj
	TY32nHz0La4sy04DPC/5Rf98ZNMTInArnM1lX6mVyef+53EpIE8nL/7dCxM9qmmVBaRgQbuSTM1
	ZZb4xJ5638rvZD/Wbm487LdhMKpPpsxw==
X-Received: by 2002:a17:90b:5706:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-392f4803047mr1455974a91.15.1786466302471;
        Tue, 11 Aug 2026 09:38:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-392f934d0desm40135a91.3.2026.08.11.09.38.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2026 09:38:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso964751cf.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786466301; x=1787071101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2PGjge9uHRNeS69RnlDH3bcMcQ9lvmh6M0bI5U6ZnQ=;
        b=EagPx92GGJzuWnX5xycj2/LovP6jWbre2OeO1Wh5OdjrPwutBU5uxs0KO+KkVqFFbq
         tKl0MAvl6HQgRB9BGPaRD/9PSG9GnQBFVR+NHYZdIvml1/zMgCU4ObxkjZ7/MLaFxIAk
         VuK4+1xC/3Z+/X9aktvFvCTbAdu1xvlWKv/Xs=
X-Forwarded-Encrypted: i=1; AHgh+Rq2z7FUpfHGwhgWaYME6HYDIOm9v+1QyY82Q4izXE5EpdRVPWxI4VQDlExxO2UUSWkmzueeTBN9vzQ8@vger.kernel.org
X-Received: by 2002:ac8:5d13:0:b0:52d:28f8:578c with SMTP id d75a77b69052e-52d60232d28mr14082191cf.31.1786466300765;
        Tue, 11 Aug 2026 09:38:20 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:52d:28f8:578c with SMTP id d75a77b69052e-52d60232d28mr14081381cf.31.1786466300075;
        Tue, 11 Aug 2026 09:38:20 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d57c3c09bsm14427981cf.25.2026.08.11.09.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:38:19 -0700 (PDT)
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
Subject: [PATCH v9 3/3] mmc: core: Honor keep-power-in-suspend and reset-card-at-resume for (e)MMC
Date: Tue, 11 Aug 2026 12:38:10 -0400
Message-Id: <20260811163810.1599747-4-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811163810.1599747-1-kamal.dasu@broadcom.com>
References: <20260811163810.1599747-1-kamal.dasu@broadcom.com>
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

The fast path also leaves the card marked suspended without powering
it off, so _mmc_suspend()'s pre-existing early exit for an
already-suspended card can no longer assume there is nothing left to
do: a shutdown, unbind or undervoltage event can still arrive before
the card's next real access lazily triggers _mmc_resume() via runtime
PM, and those events need the normal power-off sequence regardless.
Reselect the card and continue into that sequence in that case,
instead of returning early and silently skipping mmc_poweroff_notify()
and mmc_power_off(). Reset the host to its initial bus state first,
the same way _mmc_resume() does, since firmware may have left the
card in a state that doesn't decode reliably at whatever clock/timing
was negotiated before suspend -- otherwise mmc_select_card() itself
can fail and abort into that same early exit, before ever reaching
the sequence it was supposed to fall through to. If mmc_select_card()
still fails after that reset -- the card may genuinely be gone -- fall
through to mmc_power_off() directly rather than aborting again:
unlike the other steps here, powering off doesn't need a responsive
card, and shutdown/undervoltage need the supply actually removed
regardless.

host->pm_flags is set alongside marking the card suspended, and
cleared in _mmc_resume(), so host controller resume handlers can tell
power was preserved if they need to.

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Closes: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
Changes in v9:
  - Sashiko's AI review found two more High severity issues in the
    same shutdown/undervoltage fallback added in v8:
      * Calling mmc_select_card() straight after finding the card
        still marked suspended assumed the card would respond to
        CMD7 as-is, but that's exactly the assumption
        reset-card-at-resume exists to distrust -- firmware may have
        left the card unable to decode commands at whatever
        clock/timing was negotiated before suspend. A CMD7 timeout
        there hit "goto out" and skipped the power-off sequence
        entirely, the same failure mode this fallback was added to
        close in v8. Fixed by resetting the host to its initial bus
        state before mmc_select_card(), the same way _mmc_resume()
        already does before touching the card.
      * Even with that reset, mmc_select_card() can still legitimately
        fail (card genuinely gone). The code still unconditionally
        "goto out" in that case, skipping mmc_power_off() entirely --
        but mmc_power_off() is host/regulator-side only and doesn't
        need a responsive card, so there's no reason a select failure
        should leave the supply on indefinitely for a shutdown or
        undervoltage event, or leave pm_flags/suspended state stuck
        retrying the same failing select on every later call. Fixed
        by falling through to mmc_power_off() directly on select
        failure instead of aborting.
  - Patches 1/3 and 2/3 are unchanged from v8.

Changes in v8:
  - Sashiko's AI review of v7 found a High severity issue: the
    keep-power fast path marks the card suspended without powering
    it off, but the pre-existing early exit at the top of
    _mmc_suspend() (for an already-suspended card) doesn't know that
    -- it just returns immediately regardless of pm_type. Since the
    system-resume path only re-enables runtime PM rather than calling
    _mmc_resume() directly (that happens lazily, via runtime PM, on
    the card's next real access), a shutdown, unbind or undervoltage
    event landing before that next access would hit the early exit
    and silently skip mmc_poweroff_notify()/mmc_power_off() entirely.
    Fixed by reselecting the card and continuing into the normal
    power-off sequence whenever the card is suspended via our fast
    path but pm_type isn't a plain suspend, instead of a bare early
    exit. Calling _mmc_resume() itself from here isn't an option, since
    _mmc_suspend() already holds the host claim.

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

 drivers/mmc/core/host.c  |  2 +
 drivers/mmc/core/mmc.c   | 98 +++++++++++++++++++++++++++++++++++++++-
 include/linux/mmc/host.h |  1 +
 3 files changed, 99 insertions(+), 2 deletions(-)

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
index 05444ecf3909..3a0855a4ca44 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -2144,8 +2144,55 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 
 	mmc_claim_host(host);
 
-	if (mmc_card_suspended(host->card))
-		goto out;
+	if (mmc_card_suspended(host->card)) {
+		/*
+		 * Nothing to do for a redundant suspend call. Otherwise, the
+		 * card can only still be marked suspended here because the
+		 * keep-power fast path below left it powered and merely
+		 * deselected -- reselect it and continue into the normal
+		 * power-off sequence below, since shutdown, unbind and
+		 * undervoltage need mmc_power_off() regardless of how the
+		 * card got here.
+		 */
+		if (pm_type == MMC_POWEROFF_SUSPEND ||
+		    !(host->pm_flags & MMC_PM_KEEP_POWER))
+			goto out;
+
+		/*
+		 * Firmware may have accessed the card while it stayed
+		 * powered through suspend, leaving it in a state the kernel
+		 * can no longer assume it knows. Reset the host to its
+		 * initial bus state first, same as _mmc_resume() does before
+		 * touching the card, so mmc_select_card() below is talking
+		 * at a clock/timing every card is guaranteed to decode
+		 * rather than whatever mode was negotiated before suspend.
+		 */
+		mmc_set_clock(host, host->f_init);
+		mmc_set_initial_state(host);
+
+		if (!mmc_host_is_spi(host))
+			err = mmc_select_card(host->card);
+
+		if (err) {
+			/*
+			 * The card still isn't responding even after the
+			 * reset above -- it may genuinely be gone. Nothing
+			 * else below needs a responsive card except
+			 * mmc_power_off() itself, which is host/regulator
+			 * side only, so cut power directly instead of
+			 * leaving the card's supply on indefinitely (and
+			 * pm_flags/suspended state stuck retrying this same
+			 * failing select on every later call).
+			 */
+			mmc_power_off(host);
+			host->pm_flags &= ~MMC_PM_KEEP_POWER;
+			mmc_card_set_suspended(host->card);
+			goto out;
+		}
+
+		mmc_card_clr_suspended(host->card);
+		host->pm_flags &= ~MMC_PM_KEEP_POWER;
+	}
 
 	/*
 	 * For the undervoltage case, we care more about device integrity.
@@ -2157,6 +2204,33 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
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
@@ -2217,9 +2291,29 @@ static int _mmc_resume(struct mmc_host *host)
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

