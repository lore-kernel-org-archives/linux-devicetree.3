Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969230B517
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320765; cv=none; b=avWHgYXpVOGNqtO+EA6M1LhQ04Mj7NzAoZ05xq3zrDZQQPXg2bh2oJyGOsnaNvEYtLXHCSnBihc26+GAq41vUo6wnRxnIlMp2dO6+82C8jFJyLqmVNygIwEk9KfiFUv7YXogkME9AFEwM58VBUA1OjxkETBykQ2MH0GwmhDbeqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320765; c=relaxed/simple;
	bh=i71Bp36ualB1scUtZbDN1BlrOJCB/iUmDohv4h35vFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xt+RCcq4hW/NmLFkINVFxJV/G9tyIO+wVLR+Wck0rdb9GeCI3OxTVOi+uXU/F9oYDDDaEDUSvU1wPH69dqzOqrzXi/Rntb30lwzu44SGV0uFhU1Yz2h9vdGv6VK4krJIunM4nBlfJWpHG1wiRweHPdKpoayoCA6P6HczHfIG9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O6C9Orh/; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O6C9Orh/"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so5076822a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320764; x=1777925564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=k5jMxAB5WXIXBNHW7spVIO9on+u7dFkC6oHD2oIvUbD4nLQqYvhsUpHEz6rmnAcsI7
         hztYWXILW5NVnDNdDe3InxxwBOlUn3u4XhKYmADKqe1xXKGuNxWICBG93WS5kl2sjSiA
         pSc08wENilzA0FeGOyicSZqVAl1kZtagtya/L+PTlj0a9YlBljUOTOeZ/l9Glv9RMmFV
         A7JPbt8jRmp3mS20d3/5CxaahtgLmmG7WA33xMNDYORmHzFpley1x5E9W8aKr+kyi3vr
         mzMZvMfyj96ogVyAIBltorI0xWrNFN5EuEcPn4nxP2qRBH765addJm++ozw5/waUoO5r
         5xcg==
X-Forwarded-Encrypted: i=1; AFNElJ9MN+G3yPfVbQleKi55xqGyzaXJHdwcAeYYTVPHq55TOI9vyP9GmQHOSW86NTB37WLMCELBnBRQgQFf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0O36U6YWQfm8fSgwcTEi+722AIGvqbXSM9f5HlacqRgm3W/zF
	+2+XULXKchZImV+53ihvANxkq0XxaaWicbuVy032/cFVNfQ9VgMCkpzAhsmindJVz8qC1vZfS2X
	Ko6miZ6uNbkvZblP2GIFgUqqArtTMoA20+h6fW7LvTPfQbXR9RyUp5+AgG50O3T67/LKkNRnUHk
	ALuGUwTuFvjFfdtRusXtfYFvkbh7aS02G3dYmrKUVsG9OfwEqDo+0D45o66th0NzYBRt/HFxbEC
	BxY/T2NXteKJw==
X-Gm-Gg: AeBDies+hjA7zSyjaOGzJCy5WVZa6IIN8eBIawNnAfUnOYzXVEOj/4itSOdKPfXDVRl
	6PihjVjEObp3epnRi4AR0h/avVPfWCvcaXMFMstuo7tjQfGPxIMGxrZk8dnmaesOjK6ckEzEuE7
	8TZnd3U/eVLccT2zrGsLmCaBpchRhLGn27uA+8bJZqRbsYXQ6dwjtg3+C+LCdzF8WKq+yv/E50Y
	OBFsTCH6uSt0m9mNxxY5IEJiPYvdAidFsfKoSZBtHsvfhn6y3XtqMEI2stW5hBcvwYZ6kiyLGi4
	0TdWToXe/xBHT7CvBV51P4UlH8WLcuoJzYIV2v6KvTjonaoRQ1v4Z0S88AfXCJdoeUa8VU/JpqN
	6sV1YWZGDQ3sRZlzXO6GhSHW5SPyYgmmvMzU8S6D4LaTCyqwiWEHv3tNwQ+St1X1R6fzKga8Yfy
	bABxwNezRs/gWa
X-Received: by 2002:a17:90b:590f:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-36491f00173mr95692a91.8.1777320763707;
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-36490e7b60asm35532a91.5.2026.04.27.13.12.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so6690804eec.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320762; x=1777925562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=O6C9Orh/8U6Z9ADbc7/3mzc+hxoKaz8GdIKsyxWiMnmG35YoWHG9vqmA55U02muNHT
         fXNgA/PCiS3hgIL9J2mhJ2mgUb1Wn1qy019nwcnoIvtaMUYsLgmInnNYfF3DC8a5y7I3
         huxq5QUeDxPCw9sim/xc9/UKoqHgRGCfmszu4=
X-Forwarded-Encrypted: i=1; AFNElJ8e6AAeBjV42sWpN9gvO4bVllqwxjilAA7dK9J99EaD9YuJDdst44/OvI7LLTLlj36rtZUXWkHWuKGz@vger.kernel.org
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107173eec.0.1777320761892;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107159eec.0.1777320761283;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:40 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:30 -0400
Message-Id: <20260427201233.380314-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series adds hardware semaphore support for Broadcom set-top SoCs
via the generic hwspinlock framework.

The semaphore registers live in the sundry block; the DT binding
describes only the semaphore register range. The compatible is
brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
appeared on set-top chips).

The driver has been tested built-in and as a module.

v7 changes :
 - Rebase: Whole series rebased onto Linux 7.1-rc1 (254f49634ee1) so it
   applies cleanly on current upstream.
 - Reviewed-by tag (PATCH 1/3, dt-bindings): Krzysztof Kozlowski's

v6 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
   to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
   compatible string
 - Updated $id in the YAML to match the new filename
 - Updated MAINTAINERS F: entry to match the new filename

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC where the semaphore hardware was first introduced,
   following the brcm,bcm7038-l1-intc convention

v4 changes:
Addressed review comments from Krzysztof Kozlowski and Rob Herring:
 - Renamed compatible from "brcm,brcmstb-hwspinlock" to
   "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
 - Added description block to the DT binding YAML explaining what
   the semaphore registers are and their relationship to the sundry
   block
 - Fixed typo in Kconfig "Setttop" -> "Settop"
 - Fixed email typo in MODULE_AUTHOR

v3 changes:
Added detailed explanation in the all commit messages as per review
comments
 - Added description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using common compatible string

v2 changes:
Addressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platform_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch:
Link: https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 10 ++
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

