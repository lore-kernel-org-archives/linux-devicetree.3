Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957735C1A9
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132894; cv=none; b=jDAJt++jKMxQyG8JqMxHhjcf9Wjei3scwZ5FKJkrgIOF4bo4YmIuZ8vKw+EDtlyx7glIrOmQvfe23xCJhJIqPb+U+9voWhu1Mk8t0/QxveYW6557rdwM3ZLK121npxA1cs4i1UND3oZ560QmHTz/gR41R+n4okQlBmo7IaWhoXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132894; c=relaxed/simple;
	bh=uu0TuG830TDAd8HVpkzQtAJNBwlyK6DtxfvW6vWgrkA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lcgij1rrj6sN+hnPitvTf0avGcIxALnQJ89onW65w2AWiLITxfzG/m4xnsijCamXSYVoJ7xB33ofAkLuyFpVmCZG2+Jj71E++rgDpFa1dx9dXJEixzPhtgyJsmYMbB+u0z16yIrvISTkHyOPKBXNa0U/E/oGcSk1ul7f9324Z0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dkn471c6; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dkn471c6"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3096880a91.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132889; x=1786737689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8BHthRSdGciBTrHXenwgfzAOH/9DlLCYoqKmsO1zixc=;
        b=NAIw/YNlg+pk95FDbe2JqkR1FD/BOXCNcU5HxlOvQnfL2HJVdixGO3eHQBHA3e/6RK
         +4rF1Jk5HzhWShf4hsGYmuwWasnPNWMpjXmcn8MY4ZOsfwIre8RCB9CfwTddSKfgM7kD
         0yyajzPhJVc6DZee+OmyQHQCLg7Ah9SU36wEY0yM7nn5C1jIbbR95xievmI+YkiYOvu8
         aT+L/ofNtLOOkLV2WBPRc76isFwc9GqLFhszvu75snSLKSM+knrG6Rts/lVD4GSNPhiu
         3pRvWgbjrUWAwnQYeHLQOno7srPsUwbprBYVcD9Ha/o/z9Ed5V3dVheS0YBT6/hsChdL
         IsNA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6jx+zui/NZZuJ0K/5N/YEgK2ixbtvfMU5MNmTGpAZ/tM/bvO5BvrOQXHOBUZQ+6yQgqmRI/MjL1Zg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7JX513CC9Z/B+OB5cqT5WFauXodbtQFKbOrCJqvt8jYKU3sjm
	HgV6kl0qq0UVqQgYhQ7Rn7Tp9yAZ5D+hN5FQeT9z5XMkaF5EVey5V6RTrE3wb70p36kRHI15iFD
	PSIkgASZNiMtwTuXmtYtkXsP2HMX77mKx5jT2fjmS9/VbHc0lB0tn6gBCfKqfC0tMgCCoZPCYxd
	KQphRH0L4wS61XqpTbH4LFlOo6+Q/e2owSPfqZG/uD87cgbq9d1TIk1vKRL5V5yvwL+Joa79DqP
	Y8qpq7s+LUMMw==
X-Gm-Gg: AR+sD105MaQszxGupTseSbkJsBZNBCtsMcK/TCsjhkVCZEKOKXUrmQCYF9HjQ0dnMlr
	B76Rid+LPm77JMMOnnurQ1Lt7/cz4C99hCPkInkOzLKGEDpQIfDday5+N9MheycoiNbC/LW/T+z
	6Nu0BYI+BADYFCyDtl6DuazZKCxEx4puqIxXGfbF/fvkgA1RPDOgYDlDMOh/8HRoSUzJL3OA73b
	GaDpBfm3y2VRzG3Co45kFI+aO6O0r5cFXoE0H64SmppCjyfH/h+zI8ht+3En7ejWTy7Xdq+Iapk
	G+e+zK7kTGRGjsj713kW95KA+s9nLinwG+tB2a2E4KnICjXS5WCMyN+mcIqQ9PTRgK1hC4zt7Ts
	dj5L9InJjVMbdT07GOuSW7CEDubHt4N+q9GU9Tay55dUCYVbYMKf+U8RCaLTAK6wwGINuSNse5Q
	ALWHslZ0vRIl1+I2T2fzyKQXYExT48viwK
X-Received: by 2002:a17:90b:5444:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-392821fc107mr2267836a91.2.1786132889281;
        Fri, 07 Aug 2026 13:01:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39280ffee29sm432969a91.7.2026.08.07.13.01.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Aug 2026 13:01:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930f5da3467so372492485a.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786132888; x=1786737688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8BHthRSdGciBTrHXenwgfzAOH/9DlLCYoqKmsO1zixc=;
        b=dkn471c62GO2/J7nq5EBHWVbSgmApM8LVF7nZ8L6Sb92rCarMN5DHGuaS5N+LCP85T
         J7fWVXNP4WQ1dnNjl7Hz5pOWX+E27b/SDS3cKOA2n7orvOv+cwBycB2SnnpfBDJRAwlO
         Yas9849LEm1MuMCCTZczApjw1YDJ9Fg4ktodg=
X-Forwarded-Encrypted: i=1; AHgh+RoLUacKHIyGC9IYvqvR23sD+TC7CiduzoHixoktIPrz6HaeKzelK+gUQmSFtVArq/Hqdhrju6Yd4ljZ@vger.kernel.org
X-Received: by 2002:a05:620a:aa15:b0:930:9783:9910 with SMTP id af79cd13be357-936798a4e92mr281100885a.40.1786132887909;
        Fri, 07 Aug 2026 13:01:27 -0700 (PDT)
X-Received: by 2002:a05:620a:aa15:b0:930:9783:9910 with SMTP id af79cd13be357-936798a4e92mr281085985a.40.1786132887151;
        Fri, 07 Aug 2026 13:01:27 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366dc51b43sm225839185a.0.2026.08.07.13.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:01:26 -0700 (PDT)
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
Subject: [PATCH v8 0/3] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Fri,  7 Aug 2026 16:01:18 -0400
Message-Id: <20260807200121.2590202-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v8.

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed, and since it is
never power-cycled, it also needs to be reset before the kernel
reuses it after resume.

Changes in v8:
  - Sashiko's AI review of v7 found a High severity issue on patch
    3/3: the keep-power fast path marks the card suspended without
    powering it off, but the pre-existing early exit at the top of
    _mmc_suspend() for an already-suspended card doesn't account for
    that -- a shutdown, unbind or undervoltage event landing before
    the card's next real access (which is what lazily triggers
    _mmc_resume() via runtime PM) would hit that early exit and
    silently skip mmc_poweroff_notify()/mmc_power_off() entirely.
    Fixed by reselecting the card and continuing into the normal
    power-off sequence in that case, instead of a bare early exit.
  - Sashiko also flagged a Low severity gap on patch 2/3: nothing in
    the schema enforced reset-card-at-resume's own stated pairing
    with keep-power-in-suspend, so a DT could set it alone and still
    pass dt_binding_check. Rob Herring asked for this to be addressed
    on the list. Added a dependencies entry for it.
  - Patch 1/3 is unchanged from v7.

Changes in v7:
  - Sashiko's AI review of v6 found two real, complementary bugs from
    treating keep-power-in-suspend and reset-card-at-resume as fully
    independent in the driver: keep-power-in-suspend without
    reset-card-at-resume left mmc_power_up() no-oping on resume,
    which hangs on real hardware (confirmed); reset-card-at-resume
    without keep-power-in-suspend drove the clock and bus lines ahead
    of mmc_power_up() while the card's supply was still off from a
    normal power-off. Patch 3/3 now requires both capabilities
    together for the suspend fast path, and gates the resume-side
    reset on pm_flags (only ever set when the fast path actually ran)
    rather than the raw capability. Verified on hardware: the
    previously-hanging combination now falls through safely to a
    normal power-off/power-on cycle, and the paired-capability case
    (brcmstb's actual configuration) is unaffected.
  - Patches 1/3 and 2/3 gained Krzysztof's Reviewed-by; their content
    is otherwise unchanged from v6.

Changes in v6:
  - Split keeping the card powered and needing a reset before reuse
    into two independent DT properties, per Ulf: extending
    keep-power-in-suspend beyond SDIO (patch 1) no longer carries any
    brcmstb-specific rationale, and a new reset-card-at-resume
    property (patch 2) covers that instead. brcmstb sets both; SDIO's
    existing keep-power-in-suspend users are unaffected.
  - Patch 3 (the driver patch) reflects the split: the
    mmc_set_clock()/mmc_set_initial_state() reset moved out of the
    suspend-side fast path and into _mmc_resume(), gated on the new
    MMC_CAP2_RESET_AT_RESUME, matching reset-card-at-resume's name
    and description.
  - Also per Ulf (raised on v4, applies equally to v5): dropped the
    mention of sdio_set_host_pm_flags() and how Linux's SDIO stack
    happens to expose this at runtime from the binding description --
    that's a software implementation detail, not a hardware/platform
    description.

Changes in v5:
  - Patch 1: added Krzysztof's Reviewed-by.
  - Patch 2: only set host->pm_flags |= MMC_PM_KEEP_POWER after
    mmc_deselect_cards() succeeds, instead of unconditionally before
    it. Otherwise, if the deselect fails, the card is never marked
    suspended, _mmc_resume() takes its early exit, and the flag never
    gets cleared -- leaking it for the rest of uptime.

Changes in v4:
  - Dropped the no-mmc-poweroff-suspend DT property and
    MMC_CAP2_NO_POWEROFF_SUSPEND host capability entirely. Krzysztof
    pointed out they described exactly the same contract as the
    existing keep-power-in-suspend property (don't power off the card
    across suspend/resume). Extended keep-power-in-suspend's scope
    beyond SDIO instead, and reworked _mmc_suspend() to check
    host->pm_caps & MMC_PM_KEEP_POWER directly rather than adding a
    new capability.
  - Gated the fast path on pm_type == MMC_POWEROFF_SUSPEND; it was
    previously unconditional, so it wrongly skipped the required
    power-off/notify handling during shutdown, unbind and
    undervoltage as well.
  - Set/clear host->pm_flags |= MMC_PM_KEEP_POWER around the suspend/
    resume, mirroring the SDIO convention, so host drivers can tell
    power was preserved if they need to.

Changes in v3:
  - Reworked the fix in _mmc_suspend() (drivers/mmc/core/mmc.c) to
    skip the poweroff-notify/sleep/power-off sequence entirely.
  - Renamed no-mmc-sleep/MMC_CAP2_NO_SLEEP_CMD to
    no-mmc-poweroff-suspend/MMC_CAP2_NO_POWEROFF_SUSPEND.

Changes in v2:
  - Replaced v1's card-level MMC_QUIRK_BROKEN_SLEEP quirk with a host
    capability and matching DT property, per Ulf's suggestion.
  - Added Reported-by/Closes tags crediting Florian.

Kamal Dasu (3):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property
  mmc: core: Honor keep-power-in-suspend and reset-card-at-resume
    for (e)MMC

 .../bindings/mmc/mmc-controller-common.yaml | 10 +++-
 drivers/mmc/core/host.c                     |  2 +
 drivers/mmc/core/mmc.c                      | 71 +++++++++++++++++++++++++++++++++-
 include/linux/mmc/host.h                    |  1 +
 4 files changed, 81 insertions(+), 3 deletions(-)

-- 
2.34.1

