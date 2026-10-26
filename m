Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042284;
	b=eJ6FAaHkQ+TsxXGglQQ7lJHrd5gOfGW4380imzQkQkMGLjo5JP77+bn2EQxDcQ7Az5M3
	 yQoflfnTaxxaILlBUD8NgTemToOA1V6gAt3oN04hXMnTkcLo9t/+AtlrsawLL2oi7syp+
	 q19C0QSsVyv25mM3AC5ikKPAeTHvmBekE3xXVoSBdXDR6OikN+5WX4TZ6D9QOLbi1xTVV
	 +GW3be6mdv4rrgnArYuA6HiLWD8tyb5wnH5gHaJY+Gyw1ImUOKnOZvFVLFwRiT3iuqYuZ
	 ECVeo9eTCJt4RjQ2uKKlO+xEWYb9GnmWqND1Y+A427WYhcLcD8X4k1xLiSaz/lSqPAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042284;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
	b=C6aYZns8fczAVicxHcIo+FuSpsEmzObUiPbhU6huZrWScOD1mFiT7S2WRL5T3M2PgJ/F
	 hmtr3ogvD45HLIwZsUd1OhvQBQNmZnc+rsmPAnat4qHru/1YvJzWq8hZ2c5iZxrdRFZlh
	 eFuux6b5sQWviDLTYuLLMnMcxq4UMGr921LzVAUw1i4zoNLwRJAGj6dgl8nBIs6xh5aJX
	 6p0KaO2vCNNZZI1k3BvPhuTVOX7I0WPLGluLy/j5OpR7Uxdg4jbzb4OH2pSch3gIBLbKv
	 CVy9fH6tbEUzQAkX5x8IuivF8S1Amcr5mz8rdMb7tM1O5D2qmDMgD2WjvGRSWc/+xwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VnXo6gFW;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50B606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 19:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA50B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VnXo6gFW
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1748028a12.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042283; x=1793647083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=WwYfGP7TEpYcN7XezQ6Ovhvi4/mhX+MJJntN1/uM6NTWf6TP0OfEorSYf0TeJnUi13
         nHoWj/G+WtTIddTIIV8pmogTU7Gt/hHn8xrdO2pd0Uwc+vZ0vGACJtIhm7BZb2dBHmZA
         OwP6KseZFKNjhajkgkYzW3UElsUNnxRwg8jO8rrJGAH4Op64awUBU1pFjHO7vRQ25HYF
         8Vq2ozjZFx+Ozuw7/A3Hb4dggV6hu0w5VVgoPyMwadrIA+g29k/jePRC2ObZRowxz0Ea
         bpycKkzQJ4/la0BOR1w6RS3TVcEojysYJorlnP7wVgf/A83lhO7XcM3K8WzmZF3eJfzh
         TrPw==
X-Forwarded-Encrypted: i=1; AKwUvBzdxHkbo0+5FcNck7tdWEFdcnzYXZVCRm94T/r3Gzj8TuIbbFnwOrE5iWefiufuVcv16CgLZ6jZGZOw@vger.kernel.org
X-Gm-Message-State: AFq9FYK0pgoD/iR5e+PR85nMOpW43UCAEzdJdUtSR3lvUkOMGAiCK+vh
	9f13vAWqNWq8xT7IdFTJ/wtDOAlbL1bc/v0mNXZ+vlzAAane8GyBWpQ+tLkrB/7AzJ8wNtEUehI
	gwmL4YQ37UY6J9fHguRbJQEtrSSk+6FEF6ugKlW09Pr8BXWNDuVGSJZqD7qJoicPa2OpvrV8SVG
	MXo1C8Z2Nnzq3s34GQwSxxAcUzLd7tqrWH9wddtiJ1ezI9fDqivlNZYTizBQSj+mQISHP1HFOX3
	TJUEFOWPFKEvlivz0TKpXGk
X-Gm-Gg: AYBFou3jFwp8yfT9RwgCYkWfPQ6YTqVwjTsbVbjrk2i8k8hSMbduSMXO44IzgQO63Eh
	eBkfqFKOoyYY7z2C30LlbATF7HKQ8XtJJiRVls5/a9BOU6t7dlUJDl4pCz+wp8oqSRjJq3SPW4V
	tbl+QfnZgUM4oR8wMu4cm85qBfMYCe/jnRll3Y86VQwSwqbncx2r+/ls0lgFAQBI/Z6XNpw5o8c
	0KKju2XW8wwy3+u3J7kLgSNv4ldMxMZerv8W1FvbdyIpdU7IiKGFW78fkdyR9Az5/GD+bky+fLY
	gdon5UF9NMvsrRAA6GOJMAcupct3p2c6ELNH+w8xPW09BbaxDonpfzj6Sr/RnTDSC8BcRlMaX9i
	fxQBbMOyCtDL2f5Lz0qRfSeyThKyNXLI3jznEmlEtc+B/iydWB5eRq5eNNHMp9zrYlTzelhtzjN
	Qe/h5UpmxiCxxO3QwIehVh0hHUHejaDWI6WWm84inU
X-Received: by 2002:a17:90b:1652:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3adead50e26mr7048650a91.21.1793042283208;
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40784e8esm339462a91.4.2026.10.26.12.18.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91785bd637bso83257756d6.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042282; x=1793647082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p/mlaTn2+IjGPmTD4Eg87y9QseS3N0pAeXCuAryT24=;
        b=VnXo6gFWH9nAhmmymggKFZZTI+AkfpYAmNp7DrWbikPLFr5SiGjsQSuc3lllB84tLx
         dU+FbJGy7NMcOM/jvc4SaDcmLF4tVSFZGlYo8fUhVgOhQbZy6B4BMivewgIGGiYs1Yg2
         zNE2mrl698m/8EOSJjbcGWdoAKk85g98j9OAA=
X-Forwarded-Encrypted: i=1; AKwUvBymGAaRkxH+MWTi5FTeNqU82iP9n11I86od+43Rn/uw2ecOl5vc8PWxCv2mmsi7hHM8+6bkVBrq9Dy8@vger.kernel.org
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109739631cf.76.1793042281639;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
X-Received: by 2002:ac8:5f82:0:b0:536:11c5:1dc1 with SMTP id d75a77b69052e-5383b653983mr109739171cf.76.1793042281166;
        Mon, 26 Oct 2026 12:18:01 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:00 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 12:16:12 -0700
Message-ID: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

This patch series fixes SATA on the Northstar Plus (BCM58xxx/8831x)
which was broken due to a number of things:

- the SATA PHY assumed separate PCB windows when a shared one is used
  for this generation of SoCs
- the clock/reset (IDM) was not being configured by the driver which
  meant that depending upon what the boot loader did, or did not, we
  could have had the AHCI controller still in reset by then
- on some reference boards, the AHCI controller is not DMA coherent,
  assuming so leads to all sorts of timeouts, data corruption, etc.

Since this touches several subsystems: DT, PHY, AHCI and DTS, I would be
keen on having Damien merge all of those via his tree if acceptable by
the DT and PHY maintainers, I am OK either way for Broadcom SoC.

Thanks!

Changes in v3:

- actually submit the addressed feedback

Changes in v2:

- addressed Damien's comment: comment line too long, imbalanced IDM call
  sequence in suspend/resume compared to probe

Florian Fainelli (6):
  phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
  dt-bindings: ata: sata-brcm: Describe the NSP IDM registers
  ata: ahci_brcm: Initialize the NSP interface clock and reset
  ARM: dts: broadcom: Add the NSP SATA IDM registers
  ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
  ARM: dts: broadcom: Enable SATA on BCM958625HR

 .../bindings/ata/brcm,sata-brcm.yaml          | 20 ++++++++++-
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi       |  7 ++--
 arch/arm/boot/dts/broadcom/bcm958625hr.dts    |  5 +++
 drivers/ata/ahci_brcm.c                       | 36 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.53.0

