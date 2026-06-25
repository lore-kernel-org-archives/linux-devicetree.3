Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5F2FF675
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782355207; cv=none; b=QyCqCDS2Mvh3rMjg2fa7mZao/eJh6BOqaBTnk2lFS3EcURKz8sQq1xcwaZXBH04HmaVwTJkiFRpiFT22NKe+rIeCOcGh3zHjosVh8EKQX50SukyMd/v+mYCNKRGGhrwEwh7u9VpvEDBi0LXNne1jHMgN3L+KpBeWnJQz30GmL8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782355207; c=relaxed/simple;
	bh=pqRPvxuElMLpNJPA6OOKR1MMoXC+pRsh3BKEffCRTwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UENrxkPI3eFvf7GzIsr+C2E0MsBgZn+gdDBxdQDnZdsg3aGuQ0qE0mR7AkCcn6djRP9wde5h8M3W/Ddk0xzNdbKv/HkJQ8dlTTX2yf2C0CROFcmJhlmbJizSTpBSPg8c062z2rZwXiAKjh+ZT9SiCs0iLeClDfKil4wYvCN8cL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaLe+cYt; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaLe+cYt"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8deb37737dso654839a12.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782355205; x=1782960005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNZIPicjbhTWqiH8QggWQnz7Ntv8N8jFEbB8QeyQbLg=;
        b=SaLe+cYtzfMT+D8R4juHzept0uT9ID3ea8rCy+N5uqHyUzb3JoHEq94O+o8aIRmleq
         jR5wf2pVDqdu1c78I6UOOxnn8NEQaH6WxkCG7K1QkaK2sYRrVJ6l8k6+3ILgPgmio08T
         8mdZLLSrCZ6D92DxZaO1dt+aiq4zuu9MSSpOauXxdG8jolh4QVUXwDocESkiCmgEPyJA
         nSrVKR1MgHdvN3KjDfejayrzF3rhV4TMGpjuuvlxusryS5gpmE/zdqsOFzFyeCwy3F0k
         oBgGc2r889+Ps2eW2zF8OUmDqWxUO3kP0f7ykUxggSNITufw3bliPNSUhSBD+YchFzCN
         2tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782355205; x=1782960005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNZIPicjbhTWqiH8QggWQnz7Ntv8N8jFEbB8QeyQbLg=;
        b=saFWo/9H/sAjB6UPEQ2na+5RkcjwinpyIb4Dfwl9BlPTatx04PyP+1qqroxVbjy5Ob
         /Yn4/MefopWu/w+wUONpJfICXmwjEOa+ov5ns0B8MZsH2LWT5BONamHeW6XLSEPJP+hG
         0ScP85WrTjzA7AEid1LsQ3bG5gA0gW6eemcr1zlvLAsqgS/v7+2lsPC/fWfa30qFYWnx
         Q60U3Qz4fp/g3KzerKlYvAiH5++YI/6+x/A3AP9yEsR4qwnlLfgf2RjGT3u8Rff14Wtr
         gr3FsVndXd6vtqf/T9KRe8sEJ/zFIvpyNHXrixDxJobguccQzocTsMV12FVLVCxrv/6q
         hbSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFIkWD9eXcqh7H5VDgBflIcrO9rrXz/ZsEqwn7R0qpAbzsHHIMg9fwuvd4aw2YPJ4BlPEmZ34/m4do@vger.kernel.org
X-Gm-Message-State: AOJu0YzllPnmKRZXsoUvafSI/fOx3mUypZUS8KFx5slhpkus4751JxDs
	yVD22ELr88KBWJyw7TDnIwJ5579Z6Zkc4ySv4KAFjMinFXa0SoBpOkse
X-Gm-Gg: AfdE7cl6M2XPifX4sNoE3JNEOAKJ+gWS2SH1W9ikfVmXUygbfAz8lRmAl4Yx0peVwjK
	TgVXNHDGTR1H85+EdINqdGmDqXdVTatSDA5llwjhAe4a7qTIF5KeD+TVNyCeCfB6cVZVI1PzR/O
	fplxbh22crMgY9lZ7wizcjvmKV0orQGozX73/Lwofe3GUDSCO1JQBMlUlTXDDZOzJbv05POnO6d
	AqGWHZH6nc9/7lwfJoiwKcdiuoKrzqzf6EEJ/sp5nJa7+iWumwblvlIS/njBBmRGZz8x9rfENM6
	oULREoBt5DZR5HYGupdZ6xtuEPzWexp090sacf7gkhC1O6e2flksMLwaqBfOgN3hq2w4Z7fqr5k
	E7ZAFkkjMJFHQqL+SHIP5XG4Nr6DSms7kexXseXuqL6W1GaTxE4H1aHJ8ZzsK3CxjhPcXSAqzTV
	RcHxwXeQKT1k8nKdrg88khP2NJZCi/F+wuOIvzC8Y7gH7DbWacFMaAFKmmtciyoM1y44kp82YEj
	w==
X-Received: by 2002:a17:903:2c5:b0:2c7:c4b8:60c2 with SMTP id d9443c01a7336-2c7fc798ecamr7218765ad.11.1782355205260;
        Wed, 24 Jun 2026 19:40:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dc839sm8538545ad.68.2026.06.24.19.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:40:04 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Thu, 25 Jun 2026 10:39:54 +0800
Message-ID: <20260625023958.569299-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

A previous series [1] added a separate phy-ma35d1-otg.c driver for this.
Following reviewer suggestion to reuse the existing phy-ma35d1-usb2.c
driver rather than introduce a new one, that series has been dropped and
this series instead extends the existing driver.

Changes in this series:

  Patch 1 (new) adds simple-mfd support to the nuvoton,ma35d1-reset
  syscon binding.  The sys node needs to act as an MFD parent so that
  usb-phy@60 can be its DT child.  This patch is a prerequisite for
  patch 2 and has no functional impact on existing users of the syscon.

  Patch 2 updates the nuvoton,ma35d1-usb2-phy binding: the PHY node
  becomes a child of the syscon node (reg = <0x60 0x14>), nuvoton,sys
  phandle and clocks are removed, and #phy-cells changes from 0 to 1
  for per-port selection.  Optional nuvoton,rcalcode and
  nuvoton,oc-active-high properties are added.

  Patch 3 updates the MA35D1 DTS: sys gains simple-mfd, usb-phy@60 is
  added as a syscon child, and DWC2/EHCI0/EHCI1/OHCI0/OHCI1 nodes are
  added.  Board files enable the nodes and add pinctrl for the HSUSB
  signals (VBUSVLD, PWREN, OVC).

  Patch 4 extends phy-ma35d1-usb2.c: a loop creates two struct phy
  objects; a unified .init handles both ports with parametric register
  macros; clock management is removed (each controller gates its own
  clock); a read-only USB role switch is registered for PHY0 reporting
  the USB ID pin via PWRONOTP[16].

Changes since v1:

  - New patch 1: nuvoton,ma35d1-reset binding extended for simple-mfd
    and child node support; required as a prerequisite for the PHY
    binding which places usb-phy@60 as a syscon child.

  - Patch 2 (was patch 1): nuvoton,rcalcode description updated to
    clarify that both PHY entries are individually optional; example
    reg corrected from 4-cell to 2-cell format.

  - Patch 3 (was patch 2): ehci1 node address corrected to lowercase
    (401c0000).

  - Patch 4 (was patch 3): register definition section header comments
    added; HOST_READY and DEV_READY macro comments made more
    descriptive; ma35_role_switch_exit() added to the PHY provider
    registration error path to prevent a role switch leak.

Link: [1] https://lore.kernel.org/linux-phy/20260604101220.1092822-1-a0987203069@gmail.com/T/#t

Joey Lu (4):
  dt-bindings: reset: nuvoton,ma35d1-reset: add simple-mfd and child
    node support
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port OTG
    support
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  62 +++-
 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |  13 +-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  68 ++++-
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 267 +++++++++++++-----
 6 files changed, 391 insertions(+), 91 deletions(-)

-- 
2.43.0

