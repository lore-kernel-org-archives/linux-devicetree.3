Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630862;
	b=EdE8LxXebyE1XZBmynVaWTYe3eoIF1uNLOFQD2KzjlD12XDjRngPtGrcXTb8W1OOSQtA
	 rjR1Gx2g2FCnJA5qriHKQqUY9c44ZeT3OvPxErDPWBFfKgmpUAdCvOU11B/ZKJBKjLupy
	 /DlnbKKxYO5+SOGQUoeTquVrOS5+9GhvWkqQj8Kb/HcwBLJczWKoaLSXiLe6le1mNN76W
	 tjuViDPM4y6vXzbxTxtqQgch6YaaVOeoRANCc+MnBAlC27QPtOybZAtZfpQwHOL9CqC/Y
	 2SVRCkLSxgsSfvBLlBjIjPbvn+1jHyw6AiQzOb2L0ZsgiyIVbGWvUM8HD0CoUfrKG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
	b=ndsf2uTGoNdcAhSeoh9Xf2bbFhtENRG4JZ5OA9HPqaW8mGTwF2Bgd4ZCq4OytVhCzy/x
	 hpSGY5jWA6+PW8mueVEPu3cetoalFbK9DkgieMy5m6/RNs05m2y50ur94mqnNfx/9AWNg
	 WeU27krWPnDeC+Yu5WyZdnsZnFP4Y3dsjrS/7r8Q3+Dk4vLDtQ4uGuwimJNKHzKBC1QjB
	 GGLFOKHDU01/ec+i/Wzu3TObBoaflIlIq3VTYEqqpjO827algf7l102TvUKrrkt95HClI
	 smCLXLu4vj6CB2PAdLUIxhdNsciY3h9fnEw8ocFfAMuzMJP69DYwlUDfZ2spCLjFgEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Tekx5b/H";
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BEE606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tekx5b/H
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso3486450eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630861; x=1796235661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
        b=amybjFHa7/ypqxPWEmXb7UULtZ77FY9/KPTG1xvbiz8SzkNa6S+p9Rcg5i4Y81DB/f
         IUwrkfYCLUYELHRpG8ypwBJDDyIA23Ga+SS81i2cLcRYsB7HzGN6vh4wce26rH5ZZiWy
         ohk5KEn6bJ9rbcGJx5ktBBnpG2ioPrQdL0Adb54YhGent+eyejx7dTwKkgmfZ49QLPVO
         dqO/ir0UOW87f7xQQIJFv+u9TWbEtSDrVC0gz2Ch0ruWASLC+4/JLFAnUl7HSizzWDak
         E6TWJyZNbQq/y8K/zaTGRdWuTJT3nPeHijFKIsurVh3lJAIeAROuaxfZ++JRyYPQhECn
         TXiQ==
X-Forwarded-Encrypted: i=1; AL+hErGTh9YmNcVkCfgHxZw4HqK6AKuxv86sxnmR/GHER8T/uTVNAEqAecOH9b3LdiwsEO5yeLyVO1l31ZQa@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qan0+LvxrT6v6gOUQWpQswZixGdVz8KD4B0qy0BuhdJOLvEm+
	D3snL7XGvyvRIC0BoIjeqae5lJm+MIHpJbAUTJY8/noVK1dF8KMbCaPIMKZhjuoTK4Y4TXR7x/g
	CrkybXJ9U8QlWlUbjCkLUGxN1LZjqfIP7qX6T1LOBe850PgeYbR0iD7M59iGV2bVOmmEmMmgib0
	+pIG5+yoT12zjBKwB1Jzo2KqNY1aVQrGsjrGC0FCDBGpNw9OgyIMgtdM/hLITVbQ8H1lJWVFzq2
	gOe2yLqBJW32Q==
X-Gm-Gg: AZFdTZcKVkKpDGAn8oZXyKueVMaVBl6WuY4b5mIN7dBelSpIQvNTRNuo9B2hBL9v4sh
	a3UY9Nd4THO96K+nyYgaQXvOn25DBFYV6n8Yoe5eojiubqFhvDq4AkyfL5WrDT8WCycAuXnnxPh
	Yz/hgNl2P1dCBPGHzWJHZDA/CN3AjsJnMl3TCTxPSF+IAqhcTA9c7JJtCGAdz56q2+FoR/4PVBy
	DHH3zFr1U/h+k4Qo9kKU90L17DcyUNtGKtfTma7UhPqhZdtqegIoBR/C6y8hIZX0kqICynnzaL1
	+JdlSp6VqueFVLWh3HlMCInIqK5vPEFkWbZM4bCG3ffxtqjv6vKcfhrCIvasn0r9HdNxQwgT0tv
	+Nf7hPpi8vwBjdum/5bJgHeQxl0E48oUADVXP6XG/oUVxU5z9WxQ7Y5U5OaSQZefgzaN79hO0vk
	CfUuK1wC15CKqmqwriulhnMLsQlIogS3uMTzk=
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr9796459eec.16.1795630861076;
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566cd605dsm2792796eec.12.2026.11.25.10.21.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:21:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1137317085a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795630860; x=1796235660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/F4REHKnNGd2R1KVdj00UINXhvcHz2K31NhQDQ/pxI=;
        b=Tekx5b/H5985aMceRVG3RA4Mj9KOy9Dp9Zua4cPcQRjE8rYrjgkncF3ird+QeMhrgW
         5TNcD6KAcTQtghmqsHS6uSzVVvvU7l9GTEuqzruzlyZZkmVXtZ2871NLlG+0lhuPIDOW
         rW2ktbeIJuxkmO+q93GdnRhSCdBSizQxAEtQA=
X-Forwarded-Encrypted: i=1; AL+hErFW1nMBU/E2bn/C6YK/khBjQ179NWwbHL2O1FOHnt4Rmxu8Mi7lPm5csEA1BDqhTF+54UJ/kMDrVcdr@vger.kernel.org
X-Received: by 2002:a05:620a:4713:b0:93f:31bb:e3c with SMTP id af79cd13be357-949bab1060bmr3347957385a.68.1795630859847;
        Wed, 25 Nov 2026 10:20:59 -0800 (PST)
X-Received: by 2002:a05:620a:4713:b0:93f:31bb:e3c with SMTP id af79cd13be357-949bab1060bmr3347951485a.68.1795630859301;
        Wed, 25 Nov 2026 10:20:59 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1375419285a.17.2026.11.25.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:20:58 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Lin <shawn.lin@linux.dev>
Subject: [PATCH v14 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Wed, 25 Nov 2026 13:20:47 -0500
Message-Id: <20261125182053.3915833-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware accesses the
card directly during resume from Suspend-to-DRAM, before the kernel's own
resume path runs, in order to load boot code using hard wired logic that is not
field updatable. The card needs to stay powered and responsive for that access
to succeed, and since it is never power-cycled, it also needs to be reset
before the kernel reuses it after resume.

v13: https://lore.kernel.org/linux-mmc/20261113211143.3759154-1-kamal.dasu@broadcom.com/

Changes in v14:
	- Patch 6: Clear MMC_PM_KEEP_POWER in mmc_host_class_complete() when
	MMC_CAP2_RESET_AT_RESUME is set. The flag is set in
	mmc_host_class_prepare() but was only cleared in mmc_resume(), so it
	stayed set if system suspend was aborted after prepare (reported by
	Sashiko).
	- Patches 1-5: No changes.
	- Tested with CQE enabled.

Review feedback addressed so far, including Sashiko's AI review comments:
	- v14, patch 6: MMC_PM_KEEP_POWER is set in mmc_host_class_prepare()
	and was only cleared in mmc_resume(). It is now also cleared in
	mmc_host_class_complete(), so it doesn't stay set after an aborted
	system suspend.
	- v13, patch 3: CQE is turned off explicitly when the card is kept
	powered, as the cache flush may not send any command that does so.
	- v12, patch 6: An error from _mmc_hw_reset() in mmc_resume() is
	propagated instead of being dropped.
	- v12, patch 6: reset-card-at-resume without keep-power-in-suspend
	makes the host probe fail in mmc_validate_host_caps(), instead of only
	warning, as the card would otherwise be powered off and system suspend
	refused (Ulf).
	- v11, patch 6: The host is claimed around the card reset in
	mmc_resume(), as it sends commands to the card.
	- Earlier series, before Ulf's rework: Sashiko noted that the DT schema
	allowed reset-card-at-resume without keep-power-in-suspend. Patch 2
	keeps the "dependencies" entry that enforces the pairing.

Tested on a brcmstb board with a Kioxia 016G01 eMMC, running S3 suspend/resume
(pml -d) with the DT properties set as below:

  keep-power-in-suspend  reset-card-at-resume  Result
  no                     no                    board resets on resume
  yes                    no                    board resets on resume
  no                     yes                   host probe fails with -EINVAL
  yes                    yes                   resumes, card re-enumerated

Kamal Dasu (2):
  dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
  dt-bindings: mmc: Add reset-card-at-resume property

Ulf Hansson (4):
  mmc: core: Add option to keep an eMMC powered on at system suspend
  mmc: core: Split sdio_set_host_pm_flags()
  mmc: core: Move and split reset functions for eMMC
  mmc: core: Add support for resetting an eMMC at system resume

 .../bindings/mmc/mmc-controller-common.yaml   |  10 +-
 drivers/mmc/core/core.c                       |  10 ++
 drivers/mmc/core/core.h                       |   1 +
 drivers/mmc/core/host.c                       |  26 ++++
 drivers/mmc/core/mmc.c                        | 111 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 123 insertions(+), 43 deletions(-)

