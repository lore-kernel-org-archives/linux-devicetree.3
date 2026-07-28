Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12A470EAE
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265407; cv=none; b=lz+fa6K5NcTr+40MoaTtychQNuv3AC2rrB4VT6lvxy10kLLE8Fr34in0LRadeNH2eVR8t0I7tlV9Em7qlai3ONtUcDqUlWP5xYloJJEzCOtruYUofIQNzqWx4Vx4sa1XffVrbTQdYoWCevaeq7Bg0HqNVxOQHrY2a9sxYJBTcak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265407; c=relaxed/simple;
	bh=1lRR871VJrXi9CdE5wjzgROnvgD8zT1RlB/Mt3ecGWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RkHLTD2i70nkLOp0mMQ7bAjTNjOO9QhTVyTwTOR59m2oCzBvD+ik1jt9yh33payTwyx8prkQVvnOPydR4CLYbCRIp3UmT5UVGbAL1uc7IiaXDSw1MSmcfDF8IMoXIhwtfnVFuWoOwlYBbnpzyjTwAYdKjNNKib1NFnQvEfVtgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Sdls+dLg; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Sdls+dLg"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-38deea72eebso202943a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265405; x=1785870205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=06R0C5Az4WbwaNLd3vMNncYkeUGQ09VjFTKgkN5pTMs=;
        b=miou12LgKk1A1e2tMWhGgaLd10+E5pm0frjl1V+rHG8eVEWNJVmh7EQfbs2SEKCMvd
         iUmiOdGHPrd1jC1Id5B9zZJX5hW2CILRvrQV+y8kR3UHSyVtzIV/T5tcCFvcKwZS55Jt
         olyysbO/ZxksebFrIyDW/wZ4B7SAhq7uwOn587U8Wmjz5cdNgYjuYPt5sp2Dv2av+ETY
         r+IDFoEf4rGIU9Nh+iH4+28q7N2uSCJzBBDyYggnRJObEp0L1R2euQaiMaVKQKsHGYTH
         O9PkkbDcUijArKC2CL4PiscikLKAu0678roioTVzhCK/mOETjO+wHRzs15KzrHB1OP/l
         nUzQ==
X-Forwarded-Encrypted: i=1; AHgh+RosNGLOoJkg7u4ldPIC0M7ajbcwTDYjHbtLbGG705dz2t/Iz+48PW+1bVGZGzTEP23BvY1D7thR54fh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqx8Xkb17RneNahvH9QUmZAzPZ2cVKb2BkBhD80XD5EEhVvFph
	XLLl0L86P+00jqxoy5/fSMKPCCTtVzMXOMEhJ9I5A4Ji0Dy+ejTkJqH5diANqc58QpxQQlF70c0
	gqQVpsFddPHQV6Cfup89sBvt/Yr1d2/c0jySjAc03caVPLBdOEMwiztw4UKN4CAdB3at5UnFheN
	hKnkdBuwKxh9HZ8omwzC28xFNMC5L3d2F0sEzi5FSL+sM90jS4kPx/ZwdQY1TC5VaV+FATtBipo
	OOwFiOv0dSoPQ==
X-Gm-Gg: AR+sD13GYdTzJ6cGO1F9WwFOdMzUvT63EdEaJJd9OvdGTbWzxfpxoKA4jVbF5c1fzZD
	xp4fLP0eXuUXDpIdW09zExu6w2Y2xD6A9W+zz2gHvAjgZEZl47h2V/bGq0Ga96fN5bsPlmhcUO4
	q/Xfv1z1TJKcMX6itB3xpc3wlGvLWfui8uoUQzm7dCxEuJM8H0G6es4A7IWh/cnpOGPAZsaBMV7
	21Edn3JyzhC4POgD5wjfF4JI9mrwv58ebZ7EQnSOSUX5LhUhd0eQ7aYhYBN8xsmEeNRp/b0EDhs
	PolBvyv9Kg/0oGrfDqVIoDkgj91exqYO5hUFarYUN3xqb3hytoJ4jZCYOGdzb3CBkXE1Nrhg8Rc
	inOl3X7noRwEfE8f4ItkAMiT+/BxxswS55apI9Ue9YYp2PUkDzQgKcO6sB5iuEmLf98ySyi4xQh
	21dqIKhEvYVL0jzg6y2VIbh5yreD2A/6Rw
X-Received: by 2002:a17:90b:2e0c:b0:38e:4482:ab15 with SMTP id 98e67ed59e1d1-38f6a51baa2mr4116007a91.22.1785265405090;
        Tue, 28 Jul 2026 12:03:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38f81545d48sm86a91.2.2026.07.28.12.03.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 12:03:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso3251616d6.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785265403; x=1785870203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=06R0C5Az4WbwaNLd3vMNncYkeUGQ09VjFTKgkN5pTMs=;
        b=Sdls+dLg/Vv/1jEO4Z/GtRiC/RMAcgB9IQp9if0ZRJNEtYnNjK1829hBpK0PY83zUZ
         S8k1gQ/l+7rs+eai02axnFEY8sOiEFWekjZBOHOrUVBIQi2GyBa6e/d5vtOHF6UMIDOF
         TkqRr14xZsuPcCH4aB8AWR8u0DNG70PffAJqY=
X-Forwarded-Encrypted: i=1; AHgh+Rq3aaev4zfxG/+BipgSBCKDZmo941usVpfVkBSyj2UgSerzvgAEeanpBMJsuAM7aSAYvaQkDSH3dMhA@vger.kernel.org
X-Received: by 2002:a05:6214:33c6:b0:8f2:940e:2406 with SMTP id 6a1803df08f44-90816fbcfeamr40134376d6.2.1785265403474;
        Tue, 28 Jul 2026 12:03:23 -0700 (PDT)
X-Received: by 2002:a05:6214:33c6:b0:8f2:940e:2406 with SMTP id 6a1803df08f44-90816fbcfeamr40133526d6.2.1785265402810;
        Tue, 28 Jul 2026 12:03:22 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8b21esm5502856d6.46.2026.07.28.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:03:22 -0700 (PDT)
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
Subject: [PATCH v4 0/2] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Tue, 28 Jul 2026 15:03:12 -0400
Message-Id: <20260728190314.2325906-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v4.

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed.

Changes in v4:
  - Dropped the no-mmc-poweroff-suspend DT property and
    MMC_CAP2_NO_POWEROFF_SUSPEND host capability entirely. Krzysztof
    pointed out they described exactly the same contract as the
    existing keep-power-in-suspend property (don't power off the card
    across suspend/resume). Extended keep-power-in-suspend's scope
    beyond SDIO instead, and reworked _mmc_suspend() to check
    host->pm_caps & MMC_PM_KEEP_POWER directly rather than adding a
    new capability. (e)MMC has no per-function driver to make the
    dynamic sdio_set_host_pm_flags() request SDIO uses, so this reads
    pm_caps -- the DT-derived, fixed platform characteristic -- not
    pm_flags.
  - Gated the fast path on pm_type == MMC_POWEROFF_SUSPEND; it was
    previously unconditional, so it wrongly skipped the required
    power-off/notify handling during shutdown, unbind and
    undervoltage as well.
  - Reset the host to its initial bus state (mmc_set_clock() +
    mmc_set_initial_state(), the same helpers _mmc_hw_reset() uses for
    a non-power-cycle reset) before marking the card suspended.
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

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  mmc: core: Honor keep-power-in-suspend for (e)MMC in suspend/resume

 .../bindings/mmc/mmc-controller-common.yaml |  7 ++++-
 drivers/mmc/core/mmc.c                      | 30 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

--
2.34.1

