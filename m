Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191882;
	b=ZErbygzvP3MdxoMZ0RN6tevPFiZLyg3FokZkv8g2SBFauoz1NehH1hQRrEiD8j3goFji
	 5kLfeyw6Dtt/H5noMjkxOQp2Xocom+vs3k7TmaGAbkKDYn1rftkApovMZ/Om1hbq3/Ws8
	 7OdpzGdcw54yP8fXfblAbRzNIO5tYMk/PvoW1zOAhJXQh1kDYB/FojKDo493NPPipSU5F
	 5S5FbWVerkT2Ct3mShb8IuOvQ32ehy7SMsy3fd9gB9ypQ7wJ/1tGfECKYgaolBAZVrPSR
	 MC3HpsrVMj5Yg7WS+46V5WvlgujPD5tDAszxRFl97tZsjk2o9layvOns1yqmj19ktHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cOD+3y2y4oFTCu8bqJziXlWBFU9+6RCuk7yT9mk627c=;
	b=NF6vataZHkTuFoR0WCdtgSkd9Jq4iy4hWPY0EhLTrFkUrRNTMcDhvVrZtpMPMj+/lNSh
	 DGEVYYTZ8qTttJ36i9LrrZLmJbaN7V26TQG1W93faKrdDzsjxdUKRtJe+oYcRLPLrF4Ko
	 D4QC9TxDwmmKb4sBMm+OZ4XxfxylkPMUnXcJ+GpUXFEeVG3c5ll+3zNsPRc1RQqS7FvoH
	 ampfax/VYhGLWkGhCsoZIgOaz/elsv6/R9cTV9Kn9HvWEM9xyDT0gg2AKrIZoK666qSWA
	 JjWAbmSNVZoIv8gXm7JY5r3v24GYbaNW/YpYsgLe3ALA4hMfnHjVFU/9fx2nuvLp6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm+UAk2d;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55335606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55335606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fm+UAk2d
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48bbb06e746so436648f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191880; x=1793796680; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOD+3y2y4oFTCu8bqJziXlWBFU9+6RCuk7yT9mk627c=;
        b=fm+UAk2dgbVPygolzAhzQcaLO5Zx108eylqHHHo2+Hy+Mvtziw+srJv83UFQ9ksxob
         zwld4n2kF/n8ihO50+oUz+uRZMTUfNDbBB80UQnAbkqr9uYrsczpO61SYgNhY3Q3iSq2
         obpM6RQje7RVqg7ZOy0yCHnjcev+jDTgqgoSU8XuqQ26bYrKr5dZd038FRRVeyoOud0H
         6Kezse99zMa6zg6EaD9qU1g//2AC6WCshghmFMU7+LfWMR73ISXiFjb2tt/Rnk0DGO4e
         hXcNZsz+SzfwXUe7wLnxqomOc4350uz4dG0MlAv2gAQBXBWdJKJurh/Fr9VLk61TM1fp
         Y/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191880; x=1793796680;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cOD+3y2y4oFTCu8bqJziXlWBFU9+6RCuk7yT9mk627c=;
        b=IaVm2el0u6eS49eROSf0+TDoyQ6LajIYyMr8CBTCxehgPIfXUWQMWV3KCIA2ttsB7t
         h07Jf6htKyzql4gCBFUO+cTkDUtFNymk9SmKBHWhMalqPYH4euZsDaxcB0wtF/tI+904
         BQGALH60gqzFOwVCO3nEi7raR782vDSdSViV/5ccPR8hTC8mYpW9GTNvjGgWYJZswvK3
         lqy+tmc71x0fdgIHvZ9+xU0PRU717KVcL6yNWxRNYs8ds7aA7ZVladuqpOZZntxHMusi
         pj4Eh9zLQYf9D0uGoua4PKu81AiJRBm2AEsKHHkjXP9IkySnbalcLIVP8x1FtLjJ2rJb
         G9QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqBpcQFIXpm9pSwkt5qf06XHdHVPPbCh1S2cweL+qA7CAgTRRwp6YH/OICKcht9Mj3Fg+MbYTuVnMr@vger.kernel.org
X-Gm-Message-State: AFq9FYIGhJncHYUTuLmr3m411IselOks5RT4erWe/NkXVAlJsjkmBCsV
	lwzTvx8jCjkma3DwS4UFqos+2BFMTs+YC++qoCKLx4kq9lcPauFo+3XK
X-Gm-Gg: AYBFou1Tnp38irI5xXsSSe+tD9BxzdIpzG+ylwMdq/1m90005Rti8nkyuKQHbIl4D0p
	t3wqbrlLoUcNK4uKU4izcYqIwl/64kQUx7NcQu82XS+2C6vjXmgh+LtFG8ZRYW4OjeM5jbVtVr8
	BWBu7fefdkpqGgYsBdVjLJ3L3ISWOhMs1rFzz8VbsunbfwFM6NfvNi5OuxV5T35mNAuD9qV5XSv
	ai5vBEcc9CfGYFgg1yvaSCCmx3YrGk1s/einZ3/WcKic35AnThSE3TtIS8dJrQ9Ep1vaXMEN1Kn
	m21AZGk3rieKI/8MpcXxSdupKK12OwZT2U0o2ZfvinasGGXnuhg2KELnZCj0t6nZ82P6NRfFjv+
	EWMBXp6BnThTsv/8qqMXh2qaf33maBBS1QD8891nQOU5ebgmlnvbivXZnO+jpTbkq81uuPyV4R9
	3jEo6cdfqlgfXOq1aFOAjaGGe67x10/Lc11MS07cebww4IyGxQxZ2fXMo8fVQk2SI8tAcpUCcAJ
	xIzg/8Gm3Vsq/Sl0ZgWmTzDe3Bo3ROuU4ObSy1d6eCQwmvva1eZ3JhiQTQhEX6QK12RhqnKsK18
	LpEB/aJ+art02LSlAKi8uAh/v8kMXzcieLqmcZqgisXoFDlpr7nooCLGzcKIHyQ+RYQ=
X-Received: by 2002:a05:6000:2312:b0:487:767:b301 with SMTP id ffacd0b85a97d-48e5d5d2b33mr5543760f8f.57.1793191880031;
        Wed, 28 Oct 2026 05:51:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:19 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v25 00/11] Add Renesas RZ/G3L SD/eMMC support
Date: Wed, 28 Oct 2026 12:51:17 +0000
Message-Id: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAMXv4WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjEx1FJSSM
 xLz0lN1M1OAAkpGBkZmhgZGRrpFVenGOfHFKRmZukkGSSnGRqbmiUYpFkpADQVFqWmZFWDTomN
 rawHRiO2VXQAAAA==
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=9059;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=oiiYOXksZ20xr3S/ETyP+voiPCikCYeM6QV3va9MfDY=;
 b=Yc5Z3II1HVTPOe+0b+VuZ8e/MilCee5vwXTZg6ke/f9QvLU0C9lHUwLbVE7uOk+WLf3kg66Ab
 EAeAzOApoFgCUBj5ZfJCVRnF0B75lxa64fygflAbW0wX2dhVJrR6ZpE
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi All,

The Renesas RZ/G3L SoC has:

Channel 0 supports SD and eMMC (including HS400/HS400ES).
Channel 1 supports SD and eMMC (except for HS400).
Channel 2 supports SD.

The SoC supports a maximum frequency of 150 MHz. The SD0 interface does
not support IOVS and PWEN in the SDHI register (no internal regulator),
unlike SD1 and SD2. It has an internal divider for all modes except HS400.
It also has a 2048-bit divider compared to 512 on others. Moreover
RZ/G3L supports HS400 enhanced strobe mode.

This patch series support all modes except HS400. HS400 support will be
added later.

This patch series tested on smarc-rz{v2l,g2l,g2lc,g2ul,g3s,g3l,g3e},
rz{v2h,t2h}-evk and hihope-rz{g2h,g2m,g2n} boards

v24->v25:
 * Added max-frequency is a required property for SoCs with internal
   divider.
 * Retained the tags as the change is trivial.
 * Restored struct of_default_cfg.
 * Updated commit description for patch#3,#4,#6,#10 and #11
 * Dropped initializing clk_mask as it uses the default value.
 * Added suffix ULL to macro SDHI_CLK_MASK_DEFAULT.
 * Fixed a very low or zero clock rate from the clock provider that causes
   an infinite loop in `renesas_sdhi_set_clock` by max operator.
 * Restored the data type of max_divider from signed int to unsigned int.
 * Dropped initializing max_divider as it use default value.
 * Updated mmc->f_min calculation with clk_round_rate().
 * Updated the comment using "ilog2(max_divider)" instead of "{9,11}".
 * Dropped initializing clk_div_mask as it use default value.
 * Updated renesas_sdhi_set_hw_adjustment_delay() with force_clear
   parameter
 * Added a comment in renesas_sdhi_execute_tuning() for tuning delay.
 * In probe, if the SCC registers are not available, it clear the tuning
   delay flag.
 * Dropped default masks from struct of_data_rz_g2l.
 * Dropped renesas_sdhi_is_internal_divider_enabled().
 * Added a comment about the internal divider in
   renesas_sdhi_clk_update() and replaced 'clkh_shift = 1' with
   'clkh_shift--'
 * Moved mmc->f_max to probe() and made it fail if max-frequency is
   not defined in DT for SoCs with an internal divider.
 * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
   TMIO_MMC_HAS_IDLE_WAIT is not defined.
 * Added macros RZG3L_SDHI_SCC_HWADJ2_{1_8V,3_3V}
 * Replaced the quirks sdhi_quirks_rzg3l with sdhi_quirks_fixed_addr.
 * Added helper renesas_sdhi_sclken() to handle 16-bit and 32-bit access.
 * Updated renesas_sdhi_set_clock() with max_divider check for
   TMIO_MMC_INTERNAL_DIVIDER instead of SDHI_MAX_DIVIDER_DEFAULT for
   consistency with tmio_mmc_reset().

- Link to v24: https://lore.kernel.org/all/20260820171657.62815-1-biju.das.jz@bp.renesas.com/
v23->v24:
 * Added Add SDHI_SD_CLK_CTL_DIV1 macro for handling 1/1 option.
 * Updated commit description for patch#6.
 * Replaced GENMASK(7, 0) with CLK_CTL_DIV_MASK.
 * Replaced magic bits GENMASK(9, 8) and GENMASK(17, 16) with
   RZG3L_CLK_CTL_DIV9_DIV8 and RZG3L_CLK_CTL_DIV9_DIV8_SRC.
 * Simplified renesas_sdhi_set_tmpport().
 * Replaced GENMASK(15, 0) with RZG3L_SDHI_SCC_HS400MODE1_TMPOUT.
v22->v23:
 * Added write32hook function for hardware idle synchronization for
   CTL_SD_CARD_CLK_CTL writes.
 * Changed the data type of max_divider from unsigned int to signed int.
 * Assigned of_data->clk_div_mask in renesas_sdhi_probe().
 * Updated commit description for patch#7.
 * Updated tmio_mmc_reset() to handle 32 bit divider register in RZ/G3L.
v21->v22:
 * Added HS400 ES mode after fixing inode corruption when eMMC is
   mounted as rootfs.
 * Updated commit descriptions for patches #4, #5, #6, #7, #9, #12,
   and #13.
 * Added clk_div_mask to of_default_cfg and of_rcar_gen2_compatible.
 * Added a renesas_sdhi_set_hw_adjustment_delay() call to
   renesas_sdhi_init_tuning().
 * Added renesas_sdhi_is_internal_divider_enabled() and
   renesas_sdhi_clk_get_rate() to simplify the clock rate logic.
 * Added `clock &= ~GENMASK(9, 8)` to clear the divider mask bits in
   the register value.
 * Added a renesas_sdhi_set_tmpport() helper to set delay values.
 * Added a check in renesas_sdhi_is_internal_divider_enabled() to
   return disabled status when in HS400 mode.
 * renesas_sdhi_reset() now restores data strobe register values
   after reset.
v20->v21:
 * Dropped HS400 ES support due to file system corruption, will add this
   mode later after investigation.
 * Added support for make clock divider mask configurable
 * Added clk_div_mask to RZ/G2L of_data.
 * Added clk_div_mask to RZ/G3L of_data.
 * Restored actual_clk calculation in renesas_sdhi_set_clock().
 * Updated renesas_sdhi_set_clock() for RZ/G3L HS400 clock handling as
   it supports only single clk divider value and other values are
   prohibited.
 * Updated commit description for patch#12.
v19->v20:
 * Replaced the check mmd->clk_mask with mmc_data->clk_mask and moved
   the code after assignment of variable mmd, this ensures assigning
   the default values for non-DT platforms and DT platforms with no
   device data.
 * Replaced the check mmd->max_divider with mmc_data->max_divider and
   moved the code after assignment of variable mmd, this ensures
   assigning the default values for non-DT platforms and DT platforms with
   no device data.
 * Fixed the ordering of resets in suspend/resume paths.
 * Added bitfield.h header file.
 * Reworked on renesas_sdhi_set_clock() to handle the 11-bit divider
   case and the 32-bit register write.
 * Updated resume() with scoped PM runtime call.
 * SD_CLK_CTRL clk enable turned off before updating SCC_CKSEL_DTSEL
   register.
v18->v19:
 * Updated commit description for patch#1,#2,#6,#8,#11 and #12
 * Updated clock and reset description with AXI master and AXI slave
 * Added else condition for reset and reset-names.
 * Renamed aclk->aclkm and reordered the axi clocks similar to resets.
 * Retained the tag got binding patch as the changes are trivial.
 * Fixed the clk_mask for non-DT platforms.
 * Fixed max-divider setting for non-DT platforms.
 * Replaced the magic number '9' with ilog2 function in
   renesas_sdhi_clk_enable().
 * Dropped divider variable from struct renesas_sdhi.
 * Updated renesas_sdhi_clk_update() to return rate for HS400 mode
   and non HS400 mode(uses 1/2 internal divider).
 * Updated handling for clk divider.
 * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
   hardware tuning delays
 * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
 * Updated suspend/resume with scoped runtime calls in suspend.
 * Fixed extra space in HS400MODE2 comment block.
 * Updated the comment HS400mode2->HS400MODE2.
 * Dropped the updation of clk handling as it is taken care in
   previous patches.
 * HS400ES support is enabled based on of_data.
 * Fixed the space in HS400ES comment block.

v17->v18:
 * Collected tag
 * Merged patch #4 and #5 and updated commit description
 * Annotated the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is a trivial cleanup.
 * New patches drop struct renesas_sdhi_hw_info, instead using
   renesas_sdhi_of_data and tmio_mmc_data.
 * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
   will send later.
v1->v17:
 * Collected tag for binding patch.
 * Resending the series as there is an issue with patch threading from
   patch #14.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (11):
      dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
      mmc: renesas_sdhi: Clean up whitespace and add OF table sentinels
      mmc: renesas_sdhi: Add clk_mask to support wider clock dividers
      mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock ranges
      mmc: renesas_sdhi: Add SDHI_SD_CLK_CTL_DIV1 macro for 1/1 option
      mmc: renesas_sdhi: Make clock divider mask configurable
      mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
      mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
      mmc: renesas_sdhi: Add optional axis/axim reset controls
      mmc: renesas_sdhi: Add write32_hook for CTL_SD_CARD_CLK_CTL register writes
      mmc: renesas_sdhi: Add RZ/G3L SDHI support

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      | 109 ++++++--
 drivers/mmc/host/renesas_sdhi.h                    |  10 +-
 drivers/mmc/host/renesas_sdhi_core.c               | 305 +++++++++++++++------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |  59 +++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c           |   2 +-
 drivers/mmc/host/tmio_mmc.h                        |   7 +
 drivers/mmc/host/tmio_mmc_core.c                   |  20 +-
 include/linux/platform_data/tmio.h                 |  12 +
 8 files changed, 405 insertions(+), 119 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-rzg3l_sdhi-b0bd3257a2d8

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

