Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C33CB8EB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968713; cv=none; b=Anf7l79/SXajvUViNzUccMaqwr7JXUaQvqmYme/uUA1acZFZz3wwGsExOJn1pueliqtsl2qh4NcPBbQ8AICcqUt4kqg5rry3MSsohW2aN6me5WrVMi/2H6qgjfjDp7pxPyNLNX1C+aTc1ig88CCByAD1x8k2NP++EjFl+IGHKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968713; c=relaxed/simple;
	bh=2Ef44NE5I8djkdFS1NYlRhhkHaypMUdPqBMQ9jn9zpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GPGa0epKhDbt72Uoc2Femf9m86HYsdrwI0DWxKIZnV4BIyWcs56UdHfvYTkxzRRN05w0kcbAag0PPMre8U1+fv2/XUlLc4c652ZJUM2uJAXQz0Kwnh1wjTVwSZpGvBx2LxFCIsU3HiScLvBu1th4rDVl4FTNjN/z5KPgta+Cprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BFhn7pnS; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BFhn7pnS"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-668005ba03cso1937026d50.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785968710; x=1786573510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLRncDuyKwOflu/6tMTLfOctGqnwhO/BaelPc17xZZ4=;
        b=ns6O1qHuqg1BrR7A4w1i7J8p5ETlu/S3HLmVT1Zz0lGwJHjURiVHz/cVJM/TxibfzO
         0b804YFA7af2/6FgJ78bajoE51ozagJmHaNUU8fK+zizWepTRUXJbN+ZNjTo5kJ7Y7wZ
         XTAMCfuQSUwMP3hFJg+OMITDX4ZiAim08cs4nbEDUjmy/bkkSKLlB2lZKLm8TwOYfdoE
         I6kETZQJiKOrkEO9QAPLMRlCKmdcRcOplujgfXHYOKe0tjH5GgE4lcXHhlhweHjEIGe6
         N2XVuvdBuB9c0o9mu/8pdcsUhfqAKKv0oijta/Pk6xsW2wEDUXLZRB4ZStnBccNyymGX
         U3iw==
X-Forwarded-Encrypted: i=1; AHgh+RqN9+HkDtiN5BWAsEtiJYE/tqT2wsRMmq6LXvNBPtUDy1qgJvk76yvZcZB0h6uO1qFAj2IcXC05uSWP@vger.kernel.org
X-Gm-Message-State: AOJu0YzuEYHFSpCjUNbUgzXcUeLqM2QA5IL+RepLxL++8xlQ70n3QNKN
	BcBxaSGkdtnSrwAcZtgMU0a0piS3vaow7I/WkZ0dMwAup4YNG5wTAItaHZYSotzivJbZ5yohsI+
	l5FItuFuvkLkDvyokFdkp1lWU2zmJqgj2qZ9nx7RvCOExYVoXVXru/w4QHh0MXE34vahKrBb4IJ
	qxnsZJ5L4XEvii86xsjwuMSl/fiADeadGImyBtksZYTKNAJo0w7nerV0i89neObIpSztJ7L65ZW
	u4nV5gpPKtODg==
X-Gm-Gg: AR+sD12N7gsFFtJjmeyL/kABuLXVk+9DPYxu6pm1bbdeKmoYYkkWDaDHjSmypQHRHC9
	Fdu6dOHExUsCU5+3AHrlvbcYgvYiHpbg4bREuvAnH8WDgK6MPVx+6BFAsTHspHYHy+yWqJRh4eW
	b/tatR0sU59rjXP83nunWhlz1OIRdTM+nMrHyfbShEHGUIKSMqkw0SlXudaifk7nvXF8qHUGNXa
	R5Fbh6vV4B8xD5ZHfTk/cJAC7kv9OKyie3ZLidV6w0cBuYW/e2DsUHSyxp2cPQM9P2THF+gsCWw
	Gch24vXcRg86sMTn+8gTABIMZRkl4hjjLpWmh3m9e4dEmmlm9qiF2VnRoL4IF1b7Rc3wZNCAeBL
	enjwUmZ01g1bjUAytM3oqGwuiVR+Za7tFwVJya3uv4AxZdwsfiTu000up/YT/YwknaIisGJ5VXm
	34HaXKh+Mswu9B7HSYakYqCgFPBLWeJwm7
X-Received: by 2002:a05:690e:450d:10b0:664:d0ac:7c8f with SMTP id 956f58d0204a3-6699ac4e919mr4592678d50.30.1785968710506;
        Wed, 05 Aug 2026 15:25:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-6699165d23bsm387084d50.29.2026.08.05.15.25.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2026 15:25:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1695332a12.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785968707; x=1786573507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLRncDuyKwOflu/6tMTLfOctGqnwhO/BaelPc17xZZ4=;
        b=BFhn7pnSSxmpAQXqc0lsjN5Lzi0lit8qe9emwHWlamZCMDPd3ayAgrfWeTI89yAQWb
         WgL38B8AOcenzCEcDMHLO4uTP1Bkngxpg/v+uBWJc83BHIcNDgLibr0ySkoCfVLMmG+r
         C8+xvU8sssw+Ef55Yk1kwFU3uHfvF9tML5w9g=
X-Forwarded-Encrypted: i=1; AHgh+RqT3bf6BRoMHUgQpg4B9zSbAhWzJNvo8OCTImTIwtbrH3T/8taPRce0t3LGIGpO4/yASlQ+FmLB+JdN@vger.kernel.org
X-Received: by 2002:a05:6a20:b598:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cb85eaad12mr12458327637.28.1785968707531;
        Wed, 05 Aug 2026 15:25:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cb85eaad12mr12458280637.28.1785968706986;
        Wed, 05 Aug 2026 15:25:06 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm18526160eec.20.2026.08.05.15.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:25:06 -0700 (PDT)
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
Subject: [PATCH v7 0/3] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed,  5 Aug 2026 18:24:57 -0400
Message-Id: <20260805222500.2567801-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <y>
References: <y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v7.

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed, and since it is
never power-cycled, it also needs to be reset before the kernel
reuses it after resume.

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

 .../bindings/mmc/mmc-controller-common.yaml |  9 ++++-
 drivers/mmc/core/host.c                     |  2 +
 drivers/mmc/core/mmc.c                      | 47 ++++++++++++++++++++++
 include/linux/mmc/host.h                    |  1 +
 4 files changed, 58 insertions(+), 1 deletion(-)

--
2.34.1

