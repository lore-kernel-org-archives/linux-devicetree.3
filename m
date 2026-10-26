Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039367;
	b=4t79goZGcqvqLqpv6N5mZef57t8kSmD+5+eoz3ALsWDlcFWYNFPGTcUE/W+V69Evz2na
	 S72tZJ6/oe0GBLiXzGCbYt3nwzpCTT/Xo7LXe7r39IppPuoItPhM8VDIu37O+CLV35FWR
	 sxgFYMmbz7qWUZfKAm0Gkqzjm/UUUa8kcj422jJxzLUVXtyhbTx8efANkoTR4hd1dgf9F
	 TNtmAkcDVyLIRzL3qKLe6X/bdHL7MUldovUEJ9SwFQROrDBW1R+JUF2fYCgyIEQQs0WlA
	 eGZBB9wXEumS8grINgDsWwTq8MDab1OerkHqqfeKVX+NX5IUYKlfYm9pdjFbUDusaSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
	b=GkvLCuoGiuxsAHjfeartYYxnhwE7shGp3rq31do6hUIDbBhmAmG+O6zpV50dqFK9P/Hr
	 +QocTAYS6gTWetkkCjHWiruddTjmWmz9f07y9aGHzmzCRlO+9HybCiZmcW0EQhMyCKQ2N
	 SbUzmFy0J91sD000pV1UDDTVlEReGKvXQ+QL9fN9QU5EMf/fTV8Y7r9h8p2EL08E3Avr6
	 +xivF0S8+1sh7UuoJdRh7px+ZHR1XjZn4mENDWuHxDpsHTBBUh9z7a3ciVUj0ZwXAKcnP
	 ZZ0wkh6OqWLbGq52Fs8WkFvtrZmxyinbXGM2OKxzmHSd9CQHe9eqGJAp8PRhaCyl2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EkEknSoA;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1327606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1327606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EkEknSoA
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so2222642a12.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039366; x=1793644166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=u2q3mjfPX0bfP8xJ95DIQGBR4yCnpmb1uevAW0zlzxWUnuGzhmPnAaSBznMu+/1ABE
         xp22ZUJtuXEWaBvDTgkrU+G/QHT5JKKooX4EYgCjGFefXsBpaB8yqX85lY1qPU4Q2eFr
         qWCab4umG9KZYDfmEGRfvNyT8dqiVLIQgosV9JDIYYG9gfhLeM4BSNbBSPknxe9nIGlJ
         EDBHLA6ka9rpP+f3T3sV2ZxXBN+fWD+w3LzpUBWIGLzmNXf95DB/xQg0h6F60dbe3YDM
         w0VDPjwPSxdR5UbDTEYPU/1FhPdjTN4gpJzT7yE1Lt1pBZS2Mm4H6sdgIXtdm4kd6pNm
         E8FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd4My79iYUZnH+AelSBCDN1h8iHdK2DXEpTuxQ3xuf51Lp5N9BY1oxsQoLvbzJmxGxRxLfA/PA+cV2@vger.kernel.org
X-Gm-Message-State: AFq9FYKc8i1wo73n/7yNZNGFp4fY6RLHr+hm0DM+b+t1tiXMDicnWa/P
	NfPgiVh0KjmhvPkdAXck0ub2HjAsBsfJvm4Hr19MPqF9kLAIUsjNaswS6j8TrmnS3oRMCHCfNCz
	IuecXtLYP8GH7y/+4YvJCEi4CtLG2jTbAIwHylB6b5VbvdJP9/2rzPdqtIpxqCaF0VkGaNigj4u
	b61HFbd/MQ4OcFAUHRkrbBbU7Ub/H9REbtMF0JQPc1eAQ928/NXvbZkEdzSx6+vKfGFwb1gVWQr
	a0rfSwuwbJlkoV7dmBTHh1y
X-Gm-Gg: AYBFou1BbPR0LIQ1TEqomOwgkB4Ovr7uhsor//M1Yy+Z8wUm5JrSRfoTnyruZ6UMeLX
	4s/bGmScp+MlAkOtjR9Rn4LN7747SXpNAgf3Ho2brB3A7EOnzrOTfuwtqklziReUhga/2Hlt98w
	XTSU7NRStH6ZxHg+SDmcYFZL4OJo/6uqBMHTwEfdC3Dl0EdtiSBu/qb4RCgCpM8yVQGEX0TlUwg
	/C+8KFrfFjpbOuDNymf4A/Z16/ZFnyIfFIcFvGg3nEIljT4WQvuiy42r8ESXIV26YDIS0PFevjM
	cwpYXgX0Pwel0KiXNs6qRLgt73/o866GuFmgOG32eKgwr0mA73449B5GJDh4A6V3QOt/UsT/c6g
	GLtBg/sJUbZYbr1SD6qucW4fdsITCkFOduYDvopwB8J7FmTXi7Hbh9JbkxN1X6rMFTm6Z7GdAlI
	w4xj1l3r8xGcciKr3ybiEBeh56WwoarhnjG3IjS2dh
X-Received: by 2002:a17:90b:3d8e:b0:3ac:7116:434a with SMTP id 98e67ed59e1d1-3adea8993a1mr6151684a91.15.1793039365889;
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3adebb29f25sm2581515a91.3.2026.10.26.11.29.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so2392661eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039364; x=1793644164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGqeu2xbMnoE0Rt6DQ1E+iwd2CSMeKN+5rvls1JxyJk=;
        b=EkEknSoAd14g9rRGILFvsZzS5deAAhjeegEQlHVP21tfStxDdR1k3SA85rKQ7GtJPl
         exhJTSenUj0mOD3Oar+9yidiO0D4Dlx9DnKdeZJ0HJMQ84i2JEdK25RKzCvqCOb6BbSg
         InNAf4NO7MqUWJusyBxTZGL6+HVLPyEFjad54=
X-Forwarded-Encrypted: i=1; AKwUvBw+T2Map5VwZak8YwngZa7Z6+cmx3LbJmpUQr6/X2ILuF0K7/rXC/wyUfPE/3Qk3RmIWMsd1RJ2MERB@vger.kernel.org
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553944eec.34.1793039363638;
        Mon, 26 Oct 2026 11:29:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8943:10b0:366:fbdb:2070 with SMTP id 5a478bee46e88-369e84c7e51mr11553896eec.34.1793039362799;
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:22 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Fix SATA support for NSP SoCs
Date: Mon, 26 Oct 2026 11:28:50 -0700
Message-ID: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
 drivers/ata/ahci_brcm.c                       | 34 +++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-sata.c          |  5 +--
 5 files changed, 65 insertions(+), 6 deletions(-)

-- 
2.53.0

