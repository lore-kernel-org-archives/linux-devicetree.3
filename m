Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531414;
	b=cwCZBHZixEiK/NZz1t/JklZsvTGB2hVfFDVyRqBy0ef8MbBpdZ3UgNX8tx56JuoMwZ3v
	 u+eO4ZSqD3HT2/Uc4iQ4ynMgiuM9mvz9QfQrKNA2SXSuRDGUn2hlM6wDFnvaCcR3DeGq6
	 cI4QZ74Zs+vv8guimgpvVj4qsHi9AXmdk+kjDjdfZ8tDVhDzoogJ80nVhb94+5q4YgASp
	 DzkacR2vrJpE+vBVph3pSTgXjSYdgVAcbsUHHSgFUEIE2SAv0w300Yb7nwA5xp7dH2FXJ
	 8TxAAgVtnLey11lekcwCxHNV+9b0U2bYh8nUigHs9fGtXCu6iPW6z0u7/nCZ5QQiWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531414;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=fw8x4cblT+9CNzcWzbTkTDNh6D8k6L4c3aTx+Ze1EpA=;
	b=C7g6DS7A24JToYoR/K+CfgQlaNMI4/W85Gr/0qRJab53p8bEMK5diKv+mnikUetZJv2C
	 m02OQukMi+9HpGM2zdihulCmNSwW0SzxUOHw0o/HvOsbENZ8kZ0Jkk0/LobmJz//RsRPB
	 s08lGOpaCC1cZSkjCWP3fj94DWwTtScoOat1RXzoozK4m3PTkCHivrtUtnOece3Kn15i8
	 OtmdJgWiMHeeCyVW/ZZBqiTaOKIP7MRoiT5w2zQr3y86NAKswsyRuHhZQfWYPTZP4vEJ1
	 eoiF6aRQ/gvYXbKkaQGVUP6s0ZIZrs6VWZW9RZqojnKzqHWQIamQXCju7UUWL5fNNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wJWsrX7h;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017A606A33B;
	Tue, 24 Nov 2026 14:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B017A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wJWsrX7h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7AB9C2C65E;
	Tue, 24 Nov 2026 14:43:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3921A601E1;
	Tue, 24 Nov 2026 14:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1302E11E6997D;
	Tue, 24 Nov 2026 15:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fw8x4cblT+9CNzcWzbTkTDNh6D8k6L4c3aTx+Ze1EpA=;
	b=wJWsrX7hLYoIhVeQNW+u2YTSGa3kC7oJ9EMLYyBF8MNUkUbycG+td0l48AKNGfZu57Ftan
	D8jSaZVr1L5oaun8qZCsaYrHK36lYznLnJ2lgM3kyE9kTZLlCtJp/TrqtwKkN78S25Z/zG
	uhLILi9rqi6GfYGSOOIAakgLZCQhtGP9oWbWzEoEMhrohH7jqPuHECoHFOatHl6IHZUWUT
	rg9c/jP4u29pH3WTZiIguEVyEO5/OmkrgOcZYza/V8eta46HLUsXKNjbzXt8r9dt17lkdM
	tlzjcg58YXRmp2G/mvAQaoyc+0+szRGC1AUf45+vRyu7DOaq1rQld+GjBvht8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/6] mtd/spi-mem: Enable DQS control
Date: Tue, 24 Nov 2026 15:43:01 +0100
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43RwW7DIAwG4FeJOI8KQwhJT3uPaQdCTIO0QguUt
 ar67iOttE3rIbsg/WB9ls2VJIwOE9k2VxKxuOSCr0G+NMTM2u+QuqlmwhnvGGeSfjo/Bj9Rr5c
 Dz5ke5gvNJ+/8jmo9ojUMeiY4qcQhonXnO//2XvPsUg7xcu9WYLn9J1yAMipRTWJQnWUWXscQ8
 ofzGxP2ZKEL/+F6plY4Xjkl5CCxH6YOxTMnfnHAVjhROT0oI3QH2Cn5zLXfHABf49rK9YYDglV
 g2z/D3h6LjXg81e/Kj+2SUSek9X3v8rYpatPSaHgtvn0B5bmCXeMBAAA=
X-Change-ID: 20260205-winbond-nand-next-phy-tuning-aabefc018032
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

For his PHY tuning series on the Cadence QSPI controller embedded in TI
SoCs, Santhosh initially needed to access the availability of the DQS
(data strobe) signal. This is a chip dependent capability, which may
sometimes be enabled.

The SPI memory flag already exist but is too vague for it. Let the SPI
NAND core and SPI NOR core set this flag when relevant (per-chip for SPI
NAND, always for SPI NOR until we can do better). SPI controllers now
feature a DQS capability that they need to fill. Manufacturer drivers
and SPI controllers can now query the usability of the feature to use
it/enable it.

I contributed the spi-mem bit in the previous cycle but my changes were
too simple, and a more complex approach was actually needed.

As opposed to v4, this series applies directly on top of v7.4-rc2.

More changes will come on top, especially on the NOR and NAND sides,
plus more Cadence QSPI changes on top of Santhosh's series.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v5:
- Drop the dependency on Santhosh's series to make sure the spi-mem
  changes can get in independently. The only conflict there is the fact
  that both of us add a property to the the same binding.
- Kept only the SPI/spi-mem patches.
- Fix my understanding of the Winbond I/O configuration (not sent in this iteration)
- Also fix the location where SPI NAND sets the DQS flag (also not sent in this iteration)
- Link to v4: https://lore.kernel.org/r/20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com

Changes in v4:
- Added a spi-dqs-not-wired DT property to describe boards where the DQS
  line is not routed.
- Parsed the property in spi-mem.
- Renamed several helpers to explain what they do more obviously.
- Added a controller DQS capability;
- Expose that DQS is usable only when the memory supports it, the line
  is wired and the controller supports it as well.
- Advertised the DQS capability in the Cadence QSPI driver.
- Advertised the DQS capability before the SSDR/ODTR variants are
  negotiated.
- Only enabled the Winbond DQS output when spi_mem_dqs_is_usable() reports
  it as usable, to avoid useless power consumption.
- Enabled DQS in SPI NOR (always).
- Dropped the already merged spi-mem capability patch from the series.
- Rebased on v7.4-rc2.
- Link to v3: https://lore.kernel.org/r/20260810-winbond-nand-next-phy-tuning-v3-0-a97c3a61e675@bootlin.com

Changes in v3:
- Rebased on top of linux-spi/for-7.3 and dopped all existing
  dependencies on the MTD bits.
- Link to v2: https://lore.kernel.org/r/20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com

Changes in v2:
- Dropped the RFC prefix.
- Rebased on top of v7.2-rc1.
- Dropped the spi patch for now, just allowing to use DQS on a few
  Winbond SPI NANDs (can be improved later).
- Link to v1: https://lore.kernel.org/r/20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com

---
Miquel Raynal (6):
      spi: spi-mem: Rename the DQS setter and pin field
      spi: spi-mem: Clarify the conditions upon which DQS is usable
      dt-bindings: spi: Document the spi-dqs-not-wired property
      spi: spi-mem: Take the DQS wiring into account
      spi: spi-mem: Take the controller DQS support into account
      spi: cadence-quadspi: Advertise DQS support

 .../bindings/spi/spi-peripheral-props.yaml         | 10 ++++++++
 drivers/spi/spi-cadence-quadspi.c                  |  2 ++
 drivers/spi/spi-mem.c                              | 29 ++++++++++++++--------
 include/linux/spi/spi-mem.h                        | 12 ++++++---
 4 files changed, 38 insertions(+), 15 deletions(-)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20260205-winbond-nand-next-phy-tuning-aabefc018032

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

