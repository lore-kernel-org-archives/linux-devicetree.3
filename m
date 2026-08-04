Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9E3C942C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 20:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875907; cv=none; b=CZ4t72CSdZ++rMoLY9F/hBep92VQevo0PKTtpUE28l4ECCoXMniWlgdhuKRcaDVnuhL8S4jeP7VWDiDdLfjGkUg587YBBIO1CgWw32yHRsUlc5maLZTWgMxUV7N2qTYyKej1oRsswgQoCftn2jU3n2ad/1nL2Ql1Je8R18VcCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875907; c=relaxed/simple;
	bh=R5Qnv70P5N/IFzuqDWY904MEeXroycu6O4z9BGFiyQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cz4ppiA5FxHpyxMK7/flA++RVkMmspZ5iii3INrwX+9CAl/JYZ+wHulFFngv5iKtH6skT534m5NgmP0AlalzMh4MrdmtPDxcI0D+N+3+t3EW7jG2kc1ESeTWvQ3dIeCHaayl8pY0AzMuKBXHcoB4XF8qsHTr1Bbsm6PIO67SkZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RLNLoRYM; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RLNLoRYM"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so89743e0c.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785875905; x=1786480705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RifdID+ubAjNrEP9gKUm/CCi/duq76C23UHVDTetxoc=;
        b=DmDwpLY2Tc1LBRQaCVTHYcvlPrdjl3e5yzZsk+NapPxVDlI9dBLuBZdLmKZ9qq/61z
         EvYKdXMKwzEu36c2SbN3bUeykd09ZuRSHWeex27R0/x00o90GjuiG6i3Nb4RIUPkd8x9
         Jswn+Ur+5tymkuocJlwBxc05Uuyf3QaCWRMm0G1tCgREaatwWkethpwwPORPEiR8eMtS
         nDzcEqnl809qO0G/CaZsANSaFZudRXi0lgMsG0H8+pacNN3vEU/6q+OZCH2MeZ87bNQr
         lbDZmbdttmx0Uw+sf27jM759p5GeCuvdSBJ6rGHYiJa3aib6MjUlNrBFMGItj/4gIx4X
         EaqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/6bBNaJdBpk/ow2PXbHYg+Dy4Jfsk60DEwHxGivZ40NQOQfOVQfTI52NqcYnNJAd/j1MefX7uR8+j@vger.kernel.org
X-Gm-Message-State: AOJu0YzxQHu3x2rz9t2tvNN3NkxuVuI/ha878+Gvt4UYr8OQILL9BX0d
	Twwwf8GEOhw+NcyR0f9c1Jwpay+MGLYlx4J1ECPenYSzDgeqwAed0JdMG2tbsRwG/1esuvC1YAP
	tU6txHfAuDiJv3ObzxPXMok0xZkJ3N9btb05DOWdmcmj/YxhDJqyZJIT4jYD/ieSA7kBWUzdmo/
	ZW582BP70BOiAxYrDoM/8RY4D56qgeoPCuCvL9jg57SjNJET1kwS5JfMNNojo5/DbEabgIiMY9J
	P0vcoL26Fq+XA==
X-Gm-Gg: AR+sD12vjVTh4D0mWyFDkYXiiSLX1nWs/lr5oEisCOtA4tVCG+/nuRpPI4d8DtskMb7
	rwamz/bJGX+Q0/+lYpAZfRz3Lua1A3PDzxX6v3pmRW8vokYrN0+Mlz8HkD9I9XBJtFmCiBI9v/X
	8m4noWGBwjfE2H7UfOT0OJdE99/b78VsgXfBTpNBQPrzoJdt6/yQNer/elXhWntjinq05uTe9r3
	9ZE5+KKMuo8WPD2HswlPeWrvEdYAEA4Iht4fG4Bp7Oxm8h3fgiccL2ZKVYUVUy3b/9Av3i3xisv
	bPwh4Tu4/wPoPshI0h4Zh2oGmdXtJ36TFBIkmWca3U23ydqzGngs0AUjbsnKE6HL4zIPElLg7Pl
	Khqr3yc9gAQi3GWum+3H74aTl4I2So6JPa0gS7SA5piBWAoFMazZ51SrvAlOEBMfVtWzDr2eoKD
	y0ewiXR6WF4vUo0+WV7kvxZO8yZirIcCxe
X-Received: by 2002:a05:6102:c48:b0:737:783d:1900 with SMTP id ada2fe7eead31-760ec867d7fmr420667137.9.1785875904751;
        Tue, 04 Aug 2026 13:38:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-9782c90947dsm73270241.7.2026.08.04.13.38.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:38:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so29106585a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785875904; x=1786480704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RifdID+ubAjNrEP9gKUm/CCi/duq76C23UHVDTetxoc=;
        b=RLNLoRYMP7UjAE/aw19tImWOtEMwjA/Qx0swy+fgPpDbQ9hBU3K7yIYHyhGy2YUUIK
         9N/igmTab9grxLVwoNTXFAWjIL/9h70m0TwW8IOMRk6sPYmhs0+JagCZXjwpZk09zR+v
         MRlx3Gx6Iyy1XInr5L2yKgOnt9KwOxzyBqv3M=
X-Forwarded-Encrypted: i=1; AHgh+RrYaIkO3OmYHEaE2FsbqohE9l9jaIEir2oqW1Q8S30stezw2lx3zqdFLUDOtTn9uh/U1zDY5sRpJJY9@vger.kernel.org
X-Received: by 2002:a05:620a:8012:b0:936:4955:e5ef with SMTP id af79cd13be357-9364955e630mr106755785a.22.1785875904039;
        Tue, 04 Aug 2026 13:38:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:936:4955:e5ef with SMTP id af79cd13be357-9364955e630mr106749285a.22.1785875903436;
        Tue, 04 Aug 2026 13:38:23 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a52dbeesm11089085a.30.2026.08.04.13.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:38:23 -0700 (PDT)
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
Subject: [PATCH v6 0/3] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Tue,  4 Aug 2026 16:38:15 -0400
Message-Id: <20260804203818.881765-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v6, and grows from two patches to three per Ulf's review.

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware
accesses the card directly during resume from Suspend-to-DRAM, before
the kernel's own resume path runs, in order to load boot code using
hard wired logic that is not field updatable. The card needs to stay
powered and responsive for that access to succeed, and since it is
never power-cycled, it also needs to be reset before the kernel
reuses it after resume.

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
  mmc: core: Honor keep-power-in-suspend/reset-card-at-resume for (e)MMC

 .../bindings/mmc/mmc-controller-common.yaml |  9 ++++++-
 drivers/mmc/core/host.c                     |  2 ++
 drivers/mmc/core/mmc.c                      | 33 ++++++++++++++++++++++
 include/linux/mmc/host.h                    |  1 +
 4 files changed, 44 insertions(+), 1 deletion(-)

--
2.34.1

