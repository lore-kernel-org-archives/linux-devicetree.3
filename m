Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82D3D16EB
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298518; cv=none; b=MBz9mS6PUDhkH/ASDLO+xfomeSdAX0lrb5XNR/U08vy9TJ7Oq8GnBL5gvOsQhTcsTuOuc89607oo+VKCed6CxWAsoBL2N2aC/m+9iOJnTu+SFx2F5IkbkyIv0QfHetLjpkZRxn5dd1pEH06IL7bHyDeW32ao/K3k33QCCF4Db0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298518; c=relaxed/simple;
	bh=g3pJ2gBc1dRBCq8L8urDwEBaGpgQ5w9caIqS2ukslj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D/AH73KbzG0deudPOVCYPe+coELNfVhxogLLT6m1A2BgykoBCVW/8PuKN/KXRqPB2pOUiwaexzV+WbtNHoeLVVLomQqBbQ0+fiosJtV6zGR//aIQk0Jf93H3S4fUExYGGW4vJMN1Quo+OyOw2rOP3BkiF8ERjwUVTxI07gHUMZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JxQk3pPQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JxQk3pPQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3953658a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777298516; x=1777903316; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndQ7ks855/7G/wGzP40by4HLyLDmrMbbBWm7gMhIPu0=;
        b=JxQk3pPQBgvBM9+TTkmxj6t3tcg9fhYbFzn8a+iWhZ4uv6BMY5cBoWUfDiouSrOlqu
         l8htR8pYXVZ5nOP8lX3kROGaU3nYejGO3MYITbASTacpMlncOcaQwoiXOQ9eJPnfM9M9
         C9A52m5wjpKjCskh970TnqoGPbpfKI2LHRlZmsMv4ZLUInc2uYcEAPLquvszY8opMyGY
         F0dE8sHJ1l5cFgGQ7kNeqOpcAUqktp8CK1A+QDCQZCjPwp9EU1yhYY2H0ujBA2Z4aLEB
         LlELEmqBSRTAV5I4rjPDtqrqjEkB7ZsvS8upZFwN1KoxqY2UroCJv42mxdE8mA/dpju8
         VDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298516; x=1777903316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndQ7ks855/7G/wGzP40by4HLyLDmrMbbBWm7gMhIPu0=;
        b=F21UkPuFCpP+ZYHVQYl0oRR75fM+N9scZ2cXEIRJjkWHM25Cmc0IRs08muO4JVBq8P
         u6+dOE5oZHPSE6z8mFdS23vrepvuWM/DNNo+izByWgrEilHwzSUYBnKaet2eEyHGLzSq
         8QRm4LmnQo5vh400y3RnBSBB8wJ9jZEXS30Kj0yAYxZshzAVSXLG39ZQ/6dyKJymbf8y
         mEM18ua7pWkWH5JNvTN19o0g4lWFdTxar3aDWD+FOxTh178zs45I4FJdNhEtsaQC52AW
         5EyCbBgETKy8HEbds9Zndb2Vw2DvB9Z4synZvCb9h7Esyajwd58JiOdyU+SxD46mIxbP
         E+zg==
X-Forwarded-Encrypted: i=1; AFNElJ9e8thrFjJ8duiJzWxFb2z6kod+Cnu/sC8WRDRwc2RbOL0rut8yifcAVmXBwis+0NZ/ULwRzoRpyM+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfLFpQT9rwYQaiwfxu9qpR5udxyYL0ijwu2YIlhpAWER7YZ+8
	ic13sLpOII1NgrOLXXVmyZK+ZXniBjkOrCL5800p67EHYxvJcEKLlrK7CcwZ4SQ5FXs=
X-Gm-Gg: AeBDieuVVakdZfSvFdxW/qYyuD4n4YlxxNu+VMhgULk2DoANCZrfIsZBgA8a4/i/Ug2
	uhnV7VrSL9brbWQxgjXLduvSOTTMsT8QGdu8GtWMWk7KmvOyl+2BTq5u5LBKjio7SQ13ZcKr9+D
	8bK3K181VQnCeF+xbr++Zex+hBgdZchQ1FuvkYTcJ1GTEmQmP3yWNVgl90Ewe1FbxYCpreqnpGd
	1JFbAzym/mgaORnolKMN4o3sC9b4GXuzVryDc8Efsq7SujsQDcFpsDVaQSTCEozmMfk0GdwiVw1
	VbsjfbOTwK/wuEna6IXsWXfQXhetWB0gwoVb6lz5nZe1tYtFV+UJ02mGgL7PsW8hht+l8oskr2Y
	F7l91nUXed2gnDQ2nvu/BgKDYyKzOgK3xnD/CeT1hmi6Wsb4pZSgDfWVWOI0+54MWq7k14CDYgs
	sUNivYxhT/RIa+9M7Uyz9YrPf//VgRe1PjAJYXzuc8Opicmkpj/CYitA==
X-Received: by 2002:a17:903:1a2d:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b5f9e5df87mr445635195ad.4.1777298514930;
        Mon, 27 Apr 2026 07:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3016])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307143625ad.3.2026.04.27.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:01:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v9 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 27 Apr 2026 22:01:26 -0400
Message-Id: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYU8GkC/2WOyw6CMBBFf4V0bUnLG1b+h2HR1lFGw8NOaTSEf
 7eAOxezuJk758zCCCwCsSZamAWPhOMQQn2KmOnUcAeO15BZIpJCZKLkNGEYZaBHx5+Sg6jz0qR
 Syjxh4WqycMP3Try0R6ZZP8C4DbM1OiQ32s+u9NXW+9Gl+KP7iguep6B1VqlMZsXZIhlyysZm7
 Fm7HgYLrzm87g4t04qAh32ANJEvY8GtkaG8fgH6oyj77wAAAA==
X-Change-ID: 20260407-spi-spacemit-k1-e0957c311152
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Alex Elder <elder@riscstar.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.1

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  The controller
has two 32-entry FIFOs and supports PIO and DMA for transfers.

Starting with v8, I am taking over from Alex Elder to shepherd this
series upstream.  Alex developed versions 1 through 7.

Version 8 reworks the driver based on Mark Brown's review of v7, making
much better use of the SPI core framework. Version 9 (rebased on v7.1-rc1)
addresses Mark's review of the patch 2 (driver) and fixes the patch 1
(binding) subject prefix as Mark requested.

(Note, this is a distinct series from the QSPI driver, which was
merged recently.)

End-to-end tested on Banana Pi BPI-F3 with a GigaDevice GD25Q64E SPI
NOR wired to the spi3 GPIO header pins.

 -
 Guodong

Between version 8 and version 9:
 Patch 1:
  - Subject prefixes in the order of "spi: dt-bindings: ..."
 Patch 2:
  - k1_spi_dma_prep(): nested ternary to switch.
  - k1_spi_ssp_isr(): return IRQ_NONE based on SSP_STATUS bits
  - k1_spi_ssp_isr(): rename reading of SSP_STATUS to 'status' (and
      'top_ctrl' for SSP_TOP_CTRL); stop overwriting it.

Here is version 8 of this series:
  https://patch.msgid.link/20260410-spi-spacemit-k1-v8-0-53ebb48a4146@riscstar.com

Between version 7 and version 8:
  - Use // comments for the file header (Mark Brown)
  - Remove open-coded DMA mapping (k1_spi_map_dma_buffer(),
    k1_spi_unmap_dma_buffer(), k1_spi_map_dma_buffers(), the dummy
    buffer, k1_spi_io struct); use SPI core DMA mapping via
    transfer->tx_sg/rx_sg instead
  - Add can_dma() callback, replacing open-coded transfer length
    checks
  - Add set_cs() callback for chip select control via the
    TOP_HOLD_FRAME_LOW bit
  - Switch from transfer_one_message() to transfer_one()
  - DMA completion calls spi_finalize_current_transfer() directly
    instead of using a completion
  - Add SSP_STATUS_BCE (bit count error) to error detection
  - Return IRQ_NONE early if no transfer is active, before
    acknowledging interrupts
  - Simplify k1_spi_driver_data struct
  - ~160 fewer lines of code

Here is version 7 of this series:
  https://lore.kernel.org/lkml/20251114185745.2838358-1-elder@riscstar.com/

Between version 6 and version 7:
  - DIV_ROUND_UP_ULL() is now used when setting the speed, to address
    two errors reported by the Intel kernel test robot on 32-bit builds
  - Fixed a bug interpreting the resource pointer in k1_spi_dma_cleanup()
  - The driver is now built as a module by default, if ARCH_SPACEMIT
    is defined

Here is version 6 of this series:
  https://lore.kernel.org/lkml/20251027125504.297033-1-elder@riscstar.com/

Between version 5 and version 6:
  - Rebase only

Here is version 5 of this series:
  https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Yixun's Reviewed-by tag on patch 3

Here is version 4 of this series:
  https://lore.kernel.org/lkml/20250925121714.2514932-1-elder@riscstar.com/

Between version 3 and version 4 (all suggested by Yixun):
  - Fixed an underrun/overrun comment error
  - Renamed a pinctrl node
  - Formatted dmas and dma-names properties on one line

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20250922161717.1590690-1-elder@riscstar.com/

Between version 2 and version 3:
  - Add Conor's Acked-by to patch 1
  - Add Rob's Reviewed-by to patch 1
  - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
  - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
  - Added a comment stating we use 1, 2, or 4 bytes per word
  - Cleaned up DMA channels properly in case of failure setting up
  - No longer use devm_*() for allocating DMA channels or buffer
  - Moved the SPI controller into the dma-bus memory region

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/

Between version 1 and version 2:
  - Use enum rather than const for the binding compatible string
  - Omit the label and status property in the binding example
  - The spi-spacemit-k1.o make target is now added in sorted order
  - The SPI_SPACEMIT_K1 config option is added in sorted order
  - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
    however MMP_PDMA is checked at runtime, and if not enabled,
    DMA will not be used
  - Read/modify/writes of registers no longer use an additional
    "virt" variable to hold the address accessed
  - The k1_spi_driver_data->ioaddr field has been renamed base
  - The DMA address for the base address is maintained, rather than
    saving the DMA address of the data register
  - The spi-max-frequency property value is now bounds checked
  - A local variable is now initialized to 0 in k1_spi_write_word()
  - The driver name is now "k1-spi"
  - DT aliases are used rather than spacemit,k1-ssp-id for bus number
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Alex Elder (3):
      spi: dt-bindings: add SpacemiT K1 SPI support
      spi: spacemit: introduce SpacemiT K1 SPI controller driver
      riscv: dts: spacemit: define a SPI controller node

 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   |  84 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-spacemit-k1.c                      | 792 +++++++++++++++++++++
 7 files changed, 928 insertions(+)
---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20260407-spi-spacemit-k1-e0957c311152

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

