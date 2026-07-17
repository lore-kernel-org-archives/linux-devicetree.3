Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741DE360ED1
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784311593; cv=none; b=QaVyfK0UHnGUP6wGr49zzzPXEFPrk245MaHjU/Hnt1Y7gzx/oKwOHZhQobXt7AypuDMsifZ4hJ997oeBBPA8AONzp6FEFwk5CzqnltdpAijJJzHtTELcHwrS4+bKKMTm6hWtgsw7MMbvwjOTAS1elWU0iBfGCNmPLY+giTtCk2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784311593; c=relaxed/simple;
	bh=+hV0vQQ2qccegCAb9oQyV62O6SKN6X4yQBpfcmEKnnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r3ylzQPIITX5Ssb6isuNoqoHcazjeoFvoAmz6jef6xPrqi+JTOVNjNRuI7mmf3Bn5Kgr7V82Y9vim/8xzV8F0GLs/PvP+xWGrC++gyhwyRp+PWwoLtNdi8lggO458G2Q0l9f+tvtgY5PfPhIglWq6Ygn36ABqL1er6FNtAWwF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Kf/QXJtg; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Kf/QXJtg"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1702426e0c.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784311591; x=1784916391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TzgfqCvjoQZnveGpPF7MFJ2MVCAWx2MGGUIgss3Wdts=;
        b=ozGoSwOQflJS/jKBp8S6hQ1SDcibglrcGRhs0jl1h30WTbfIxrhYf2NeKISVMzVWJS
         88Zl6K2eDOljpkO2hnWUm8UnEA/4Odoe9I4I9VB/exTV38m5cHzGdMQrwWX5j2aCWRtU
         jPNW3c13LXSgh2ZTC7LIEtJbz3TW+TjAOxrHFuoeDZt9XNOehYfHrWS+xNXoK4+CG5CR
         B0AJTE5fk92gKXdpWe6q775HgNaBtsimpljh/Txyc0MF3RaKlOrxOpZGXTeJLxR5ZRUn
         pqGdADSLdYfrG+exwnKZi4V1Pw7Abesf4d2KO4XbqqceJDHChAES1whrCvdKVX5UJ9y6
         bkaA==
X-Forwarded-Encrypted: i=1; AHgh+RpcalfZQNrryuGipYKjUJiTBkdk9rRZAmhrBuNo1QOLrJlEWd2Ria3YFEYrZovH5c5TZB1Cfrx6KfrH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0JPzWCCdpfizUuVkkAC0MDf6uO1JuD1PmBZ7SasflrRJs3VcT
	Dt3k2M86MBaq1NV1rhK0oO2q/fX1qOGgQXcnopss5SI/9zfMm54c+G+ZkLNpL+CUq4juBdIjak1
	c1I0t6tRiSH/P1Kq7Pff7xojVKOBATm+qOB0Um27v9pVQjKrfw5doB+N3clPYdNZa36jqMKltuT
	AqtIvky3MlG/mH21vZZaV5SCHJKpwmU/W1jwHgmnY7dSNpscPjUdfJ0h9E/v9HIKxVSE4Lal85W
	ju6DgCcWHCjPQ==
X-Gm-Gg: AfdE7cmwn2vhd98u5L89sDEgsJWPqmBuMhTMXo0NfysAH3dDrxj4cvGA3g12+s1STWg
	/1BWumBmUaJ7YZL5LPRxvOyqbjvGt83rByjBVefWlA1NnabtQwXin6slW3TruOu2aclyemodroi
	qXsZiUm2c4Ncsyr7crqjuYBPJs/up4xnD5GM8xCEXei4rdNwlzFJ/8C5hABwbiYsn7dy0bQ3Pza
	Lvzxq0fP5dX2Oee/gMJBZqP59zZn4rd+WkehcdcYWNNogQvDrD0nlQRZF3SyLLqpq6aUsqiHq+c
	IcxEcriLBvcTKbAkQRETAq8kWkc/DOw0Hb128jqtHo/QTrlnFOfYqQsQ/Qetup1vwNiJ//T1CRR
	EatoxIkv4sE3rQvIoPzeujAFLFJGkzcNmBY3rr/19PJ+2SYhZzgeWDl/NyTjxn8oFkIE8b3DS4g
	LVAfxouFCYlIrtF3ziIkj0yx48vAHiIo1hPYc=
X-Received: by 2002:a05:6122:8b10:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c1b64e6136mr639571e0c.3.1784311591093;
        Fri, 17 Jul 2026 11:06:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-976fc46ea84sm109075241.3.2026.07.17.11.06.30
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2026 11:06:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fdace20927so58503726d6.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784311590; x=1784916390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzgfqCvjoQZnveGpPF7MFJ2MVCAWx2MGGUIgss3Wdts=;
        b=Kf/QXJtg4ZPT43THpMyP6ntKSrXuECkPTKWeMGwbPUCMWUOPA3G2jCUVwn+iy0VuoJ
         3k17dk2/QSDsV9WU4hO8UH8g1zEUGiLdAR4liHVxu7613lJXHwT/v0SC0bSfbdNsQJnD
         iVzcB5hAozn/gBR/S9juPC08kkpRFhqEuVbPM=
X-Forwarded-Encrypted: i=1; AHgh+RqyLIMJwOd0uwhBFUgnhQ84p2vsRq+rXhnI2cua6VJhLRbSsK740hOuP3H/BwWXwNttoG7M8MMwmcyg@vger.kernel.org
X-Received: by 2002:a05:6214:2387:b0:8ec:a010:9af9 with SMTP id 6a1803df08f44-907783b332cmr41216996d6.40.1784311589850;
        Fri, 17 Jul 2026 11:06:29 -0700 (PDT)
X-Received: by 2002:a05:6214:2387:b0:8ec:a010:9af9 with SMTP id 6a1803df08f44-907783b332cmr41216276d6.40.1784311589265;
        Fri, 17 Jul 2026 11:06:29 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077856002esm23175896d6.11.2026.07.17.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:06:28 -0700 (PDT)
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
Subject: [PATCH v2 0/2] mmc: core: Add a host capability to skip SLEEP for cards with a broken resume
Date: Fri, 17 Jul 2026 14:05:34 -0400
Message-Id: <20260717180536.1757204-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is v2 of Florian's original patch:

  Link: https://lore.kernel.org/r/20260413180551.3683969-1-florian.fainelli@broadcom.com/

Background: the Kioxia 016G01 eMMC takes ~10ms to exit SLEEP (CMD5)
instead of the ~1ms it advertises via S_A_TIMEOUT, which can be
problematic on systems that resume from Suspend-to-DRAM by first
pulling boot code from eMMC using hard wired logic that is not field
updatable -- if the card is still asleep when that logic reads it, it
resets the board. The device stays powered throughout suspend-to-
DRAM (no software-controlled VCC/VCCQ regulator toggling on this
path), and the CMD0-before-resume sequence follows the JEDEC boot
spec, so this isn't something the kernel's resume ordering can fix
on its own.

v1 addressed this with a card-level MMC_QUIRK_BROKEN_SLEEP quirk
keyed off the device CID. Ulf pointed out that a device-specific
quirk doesn't generalize well and suggested a host capability bit
instead, settable from DT (or derived from a compatible string),
mirroring the existing no-sdio/no-sd/no-mmc properties. Oleksij
separately noted that quirks registered in mmc_blk_fixups[] are only
applied once the mmc_block driver probes, which is too late to avoid
a race against an earlier SLEEP/poweroff triggered on an under-
voltage path -- a host cap resolved in mmc_of_parse(), before any
card exists, sidesteps that ordering problem entirely.

This series implements that direction:

  - Patch 1 documents a new "no-mmc-sleep" DT flag property.
  - Patch 2 adds MMC_CAP2_NO_SLEEP_CMD, parses the DT property in
    mmc_of_parse(), and has mmc_card_can_sleep() honor it.

The actual board DT change (adding "no-mmc-sleep;" to the affected
brcmstb eMMC controller node) will follow separately once this lands,
since that DT lives outside of mainline.

Changes in v2:
  - Dropped the card-quirk/CID-match approach entirely in favor of a
    host capability bit, per Ulf's suggestion.
  - Added a DT property ("no-mmc-sleep") to set that capability,
    following the no-sdio/no-sd/no-mmc precedent, per Ulf.
  - This also resolves Oleksij's concern about mmc_blk_fixups[]
    being applied too late to close the race on an early
    SLEEP/poweroff path, since the host cap is resolved in
    mmc_of_parse() before a card exists.
  - Reworded the rationale in patch 1's commit message and binding
    description per Florian's review.
  - Added a Reported-by/Closes tag crediting Florian for the
    original bug report.

Kamal Dasu (2):
  dt-bindings: mmc: Document no-mmc-sleep property
  mmc: core: Add MMC_CAP2_NO_SLEEP_CMD host capability

 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 drivers/mmc/core/host.c                                   | 2 ++
 drivers/mmc/core/mmc.c                                    | 3 +++
 include/linux/mmc/host.h                                  | 1 +
 4 files changed, 14 insertions(+)

-- 
2.34.1

