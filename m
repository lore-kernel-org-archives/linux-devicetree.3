Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383871;
	b=m26pR2zXmSf7ngJBSnK1HYdOxSZkvpgn+pZavZiRNf7O0j9VvHbkkUmFvdJjjcFMTbOw
	 Xqh9fT5QLgbotsryBQn2CeIPW6Z/f0b9ugRyBjcjiGQzB5JX/FKbxm5PNYj9aHyhzRQwz
	 ULUeKa5Z8B4KUothBWFrgwefgrd3RL87kSMbHW9VqDPURldmEaMu1homqI8kZ6Ai4EXSM
	 vZ0LtQGUOWv5j43clbqlWzE0VIWPHQi9j3fH9zOLWpKKrhwDdq62Pm9MR8wtooofRW5ma
	 mM1pbnYSoNZPXG5wrPE9QWRQ/fWrvhefnjfaDZKeVcKypmshFE98INkJdq1SiIa8Yog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383871;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
	b=QzuakKq/IXRt+92Q99vCp+7xtbBbSJL9cEyWQp3Drp1X75UGVbNqRhF05lkH0iQyj2kv
	 XATS3DVYEJdjGEXVsevSnkxpE2P73CHelA8Jh0EZ+4BdsCg122xzyqLaJ3zZXTzIlMq3B
	 268oJ9YSosQNqXM6ZAbI+nSwUphYVH+mQik2uW/4N9nxqAka7+wkxme78ukktUKIA+H4G
	 Z/k06z9DeRBgKHFzyp8+LziteO7vR/ehaRVA1A/Y9a/xTpuYUkaWqwBEyB8oidufShUTd
	 M8hij8cyLfYjpJkRivPTmUXeKktmzq8+SzMpidlAN4Hrh9IEkAssGvCBvitNu/LyMTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWmFVWwf;
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE6606A31F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCE6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fWmFVWwf
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-53644ab1f7bso8656591cf.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383870; x=1793988670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
        b=2IJrFsk/0DiwprZdxajI4Ika4HDzqcl87y7UipUZ28MpRpwqzYYIssjOPKMYmBjH9n
         +I3jGywD9OD9uuiyJ6faJe3LC/fbYdJ8KF2ntA8iZgyNWZ6KTaBVeXI80qwE45GfAlO0
         fqj8J0LYibYEPnw/TH4ObTGNh8I2YL4xnQpb2REh/T8gmX56cEpNuaFYfKAFRu6rzx5S
         yPVwkvVFm/h+rbfP2j4JWPAH/pk49kpkloRfIbdXddxJY9xYHRpnwj7eZ+GTvSJglz3y
         dHpj/vhDPsPAnjFB8udq+4EBBc25pl7ZpAUylJbi2O6pm0g4ib+gn+oZaV5Oo2pso0XJ
         c+aA==
X-Forwarded-Encrypted: i=1; AKwUvBxu7siB1IDfVYJu6KbTOFgbulytzoEC5X+V08WexzaoqxztSD19IYCFoYJ7CuLyux3ilLbgOZ/dii+U@vger.kernel.org
X-Gm-Message-State: AFq9FYJeFSv7Olf1aUcgQRPhOGdj05dvo4JNcV0XUycbciCW2VCOId/t
	vnLeudjh9BGyaVvV4fJdmsu3IKLTlu2/YlPpFKIFBDfM3mw2wUGkW8Gq6xS2XHh2eMzzpK2OL+2
	wEnbJntxFVXuHbKX2O2jcwKdwFuF4HrPx8VVTTmFcnt8fibzNl6YFyOW3iH1q4KmnjGsP0iWV+n
	zoNQPDeZBXNA4f25MESvNNgL1LlGbLEBPqaPEAgbiklcaSofzGOa8oY7oZ29ik1iXwcF61a2FtD
	XtLuoBV+7M1JQ==
X-Gm-Gg: AYBFou2rW6QbGoIF3wiIfPhUv5WpFgo75AlpPyeIMZtF9XlMzqLZHY2x6XV5VdBEx6m
	7aIfLpXjkJpKlR4PZyjpHdMyzxO93mMyujlepeI0I9cS/PiaQxMR+zOh73LwD0m/9Hn/BxAPw7q
	FPDZM/3mxWUdVvdIVwTSAMhISdyq6lazFqJUESXzZHJ7nIp8XMmTKl0pQuMr8Uxph9NNIo5t1Ze
	YPm2aLTElQzvQMEWAo4KjHE9cJQhPriWMBXaRayBuA3OCYPvRt/Eps+enqVOwQNYddr+f797k0s
	gerJ2DuIxUw2oercODXqi0ZDj2dSU1Xp2h5N6F1o342+P9OqGn9wFMbA6ciO9psfXqGzhGZ0YpJ
	NvBKvS7rCBzPj521hrs1ET5ndtxfhXfbNAChViYui5a7F+8GQz6Yo7V9n5WLl1tcEvwDqyecQUV
	xCaobt7tqHmZHzCkgBCIuwRvR2Y5eKtcmy
X-Received: by 2002:a05:622a:120a:b0:536:458d:525e with SMTP id d75a77b69052e-542b714118cmr46974071cf.37.1793383869692;
        Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ca80535a6sm315036d6.39.2026.10.30.11.11.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso4521994eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793383868; x=1793988668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENwKWbPNvS8Z4Ya5TukwYEHVlcVz+1SrF/4rTtdeRYE=;
        b=fWmFVWwfFFznQYOWpN98DL8jaN+4yzy9BpHYt06HW++iHPcsdOMN7h99SlCM5Tov5q
         wvd9z0zdGvUgSMAE/5OTpS+QXqcC+SN70wPv6KVpKZu80HXyXl4qnVP/OdOYnQW/MdHM
         oSozGo3aZB/TRLOjorv23M+UzDI1JSUhRE0g4=
X-Forwarded-Encrypted: i=1; AKwUvBztXI7cnfJiGepH05qO27ZMsTMkMN6i4sCdC3P5tq2ylWeVLheAcRIu17/JWQbmglVZWVsd0bOsarAz@vger.kernel.org
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr5419031c88.26.1793383866890;
        Fri, 30 Oct 2026 11:11:06 -0700 (PDT)
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr5418989c88.26.1793383866189;
        Fri, 30 Oct 2026 11:11:06 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm9974062c88.11.2026.10.30.11.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:11:05 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
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
Subject: [PATCH v11 0/6] mmc: core: Keep the card powered across suspend when firmware needs it live
Date: Fri, 30 Oct 2026 14:10:27 -0400
Message-Id: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
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

Ulf's v10 posted patches 3-6 and I'm resending the whole series, as requested.

v10: https://lore.kernel.org/linux-mmc/20261027144051.249211-1-ulf.hansson@oss.qualcomm.com/

Changes in v11:
	- Rebased on the mmc tree's next branch.
	- Patch 1, 2: Resent by the author to complete the Signed-off-by
	chain, with the DT list and maintainers on Cc.
	- Patch 3-6: Added my Signed-off-by as the submitter.
	- Patch 4: Keep the comment about suspend methods being serialized, by
	moving it into mmc_set_host_pm_flags() (Shawn Lin).
	- Patch 5: Also split the cache flush out of _mmc_hw_reset() into a new
	mmc_hw_reset_recovery(), used for the ->hw_reset() bus op, and renamed the
	patch to "Move and split reset functions for eMMC" (Ulf). The flush is
	redundant when resetting at system resume, and failed with a timeout,
	printing "mmc1: cache flush error -110" on every resume.
	- Patch 5: Dropped Shawn's Reviewed-by as the patch changed.
	- Patch 6: Claim the host around the card reset in mmc_resume(), as it
	sends commands. Without it, WARN_ON(!host->claimed) triggers for every
	command sent during the reset.
	- Patch 6: Warn while parsing the DT properties when
	reset-card-at-resume is set without keep-power-in-suspend (Ulf).
	- Patch 6: Dropped Shawn's Reviewed-by as the patch changed.

Tested on a brcmstb board with the Kioxia 016G01 eMMC, using "pml -d"
(S3 suspend/resume):

  keep-power-in-suspend  reset-card-at-resume  Result
  ---------------------  --------------------  ----------------------------
  no                     no                    Enters suspend, board resets
                                               at resume
  yes                    no                    Enters suspend, board resets
                                               at resume
  no                     yes                   Suspend aborts, -EINVAL
  yes                    yes                   S3 suspend/resume works

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
 drivers/mmc/core/host.c                       |  13 +++
 drivers/mmc/core/mmc.c                        | 105 ++++++++++++------
 drivers/mmc/core/sdio_io.c                    |   7 +-
 include/linux/mmc/host.h                      |   1 +
 7 files changed, 105 insertions(+), 42 deletions(-)

-- 
2.34.1

