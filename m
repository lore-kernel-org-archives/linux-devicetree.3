Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2753C4544
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356070; cv=none; b=fSQ93oEkROamUb4Mrm8GXCI2pGEt0Nag/xi6mB/oXWn5bQPC4NQEgFzkR5ID8noO/29No5sY32xFJSosMKpDZvGuMa4TdOokoWUpNbmqwpasXY7w0u4yEOL6jG1pOCdWXZawZNEoEiC19nqBCI8G4NfTOrgEU9IaCDhz7LcH6tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356070; c=relaxed/simple;
	bh=dNibn9+fRRxAz+bSl+iGvhTZbe1S1JvPG2WY/u6Qyeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aq/gaAPQle2hVWxaVHL/q0Q3EYMLDQq+9WISWvp4hlhQSCYp+q96HXQjU1VP/ieAdedv3xJy4X7XD/0UbHbsUGWsXKR5fC7UuQAPPMY7+imcIUFFNMzzhfUDHTFHTmGxydFv5OyiZ4OowCK3fdgH76SxyXXSxp3hvKahJZwqShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KLAT7xGN; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KLAT7xGN"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5bf9466867cso421819e0c.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785356067; x=1785960867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8cg7db2G8jIu7Q9xqei7Xa543QGG7fv2VU1Z8dI/3U=;
        b=coWUqiyJO/R5pVrplqJu3kyT9Lp5fchKUb/gb/rVxd4xDeuBnggEjffM+vwKPjCd0c
         AqG+q+eASIzLRhM/4VZB51Tn6UrCyftn2iFY6TwXyymqgKDe3SliczEAxwzTyyjUcjgE
         vSKRmSgKa2c+x9xH+YIOD6aEn9dNzw3qf3wZG/wEGkVDTsUujc8Y6XQ1sFtTQgrrHmkK
         7LdePDUAX9lWm5BEiX+Kp6/g93M4pnqUz5yV12c2hknOCeO8J4iW4PESJCgNgYQrAM01
         XSbwcbbw53wOZvTlQmpsfHG/rhzLwWz4mtRIrhX9Pte8cFN+njRjX3QTlI190nxHuLrZ
         izMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpA0jiQsfJRLY1mF/g2KHUInL96Fnial7tDcYx3ofr0Cpg5S2BdICt7wLFOdwkMq3QYLmC+zNLOlgVV@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6WrsqBSFOM2J4rGlkTaL/3HicD0FDHd3uHuIsnXez/9AK+L1
	dM/PT6Bg6t/pqW2HxxO6S69elFa0L8PFPq1+nfPDHTWmAhcF8N/qlVE7erAJFdvifEvJ3R4jVly
	S7ImcceqVchm8JNsUK+l4WndM/T6+v5XwsXxAOcUjCCeRt5dURCrhPQmoJJogc+3iVD0+wxxQrF
	Ezd2/8RsFaA0PsgfbQ0slEHg1a6dO+f5q46kGXoTgrPXC6Jt4gkqHzyO985Ad1V2CDtDvcNJPus
	oAu0UiaRRUd0A==
X-Gm-Gg: AR+sD10sdIzEfZjhjDvkLGwMHTM/5gET9stoWqGkO81sjhKBxtqyi9+4Y9WSmnozFdl
	z+MthwY5LslqldwaPVjGYV09vZAEb8bD/ccFw0Xkm/d0W5WIttlEnITAvLJsa6dXkEc11vlxfwx
	C4diSnXi65MFlwnLluFhtPIBNwlJaqgz4CWlvx8H19L5S/V0e7uZgEImW9nUtcp6H7mNwD7JwDL
	KHg742GxZhAg+QoObzMDYRMYC381Lw24yWkJbjNbVwaC2Wd1az+aEKBmwt6cnQkNd5VYH/1rCQO
	nwSPvX+OT5Qm4uM0jpxroS3DAP7Df24HLZs3O/3jPqM4d71qg4e0xFWYWq4umAw3S0WvES9yGAx
	ivJmObWKjaf4O5y/uv/R30GEjpJpd120Eew+FQ5XKoyZO+YT4DgoNxJDQ2EbBYqPcKKaG0mOliV
	tig8pB9XnuwkUOURJGcgDQfyB9n9HRUUNb
X-Received: by 2002:a05:6122:4f82:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5c363cf95e5mr63708e0c.11.1785356067340;
        Wed, 29 Jul 2026 13:14:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c34f0eb4dasm367118e0c.5.2026.07.29.13.14.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:14:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907e49dbae8so12453556d6.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785356066; x=1785960866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8cg7db2G8jIu7Q9xqei7Xa543QGG7fv2VU1Z8dI/3U=;
        b=KLAT7xGN3zCGZ0XuY/1YFG3dwgTEk/fgJRRQa9Wzqu/x21cQZXM8rc7C51NzVTstKB
         Yod+MxN/3f8/b0eVCVOuCSTzKCWmhYKG9Ni28Vn8wpi1IaYailKx9gpxdCRvOce9OVSs
         N/wZtWSEUhwjDoWheOoO83VnVJyexcuNVQ880=
X-Forwarded-Encrypted: i=1; AHgh+RqrZXJbaN7vjzU394r09S/3fTuai324WHRws1X6BFaAhL0RvLZGmgUar0TWQrNkINdCFtZiCjtK//u6@vger.kernel.org
X-Received: by 2002:ad4:5f05:0:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-908302562d3mr3904276d6.53.1785356066539;
        Wed, 29 Jul 2026 13:14:26 -0700 (PDT)
X-Received: by 2002:ad4:5f05:0:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-908302562d3mr3903896d6.53.1785356066008;
        Wed, 29 Jul 2026 13:14:26 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd8cb0dsm32033066d6.48.2026.07.29.13.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:14:25 -0700 (PDT)
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
Subject: [PATCH v5 0/2] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 29 Jul 2026 16:14:18 -0400
Message-Id: <20260729201420.4047677-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v5.

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed.

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
 drivers/mmc/core/mmc.c                      | 30 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

--
2.34.1

