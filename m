Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2857A30E84B
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257259; cv=none; b=C0w/zqADbbN6MYgM+86AbSxEZRhQne/EQpJvKOHYTjVOOUCKlVZ0kMDVOihIDbg64rSneRW13+jD0iGb+KYlo4vaxwlugHu1r5sAbAKALiyPnbBv91Ly9DyUXZa4NG/oTDzCgNZHuuYTG6LWWiqV9BSa6RuG5vc3hPIzkbuDglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257259; c=relaxed/simple;
	bh=iXpJZqwOLd3L3bnotkRID4m3omMfaKxprsRJgq5FXDg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A5+UWtbFfO53NlmSQEUBPFDf4vupqwT2grgqlwxYemrLWM2VI663kmpvahYPOO6MoAwcrkeCDfzbJveh54tpt2QhmLpbbpxm/GVBmljT/8/V0lJ1gdABUfeRkJB97xprHr7nF3h3vf9ZrRoZ7lXhMF2X9uGI1sQx0l9VjmisDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fINijEmk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fINijEmk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d72875729so2427495f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257255; x=1776862055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz3XlrHKIjrtPZ6U4iIhqJn8c0J6aQuwpCZlZmDOMVA=;
        b=fINijEmkxvpg/wOlhoozeQh1Jl7qHiXxwaWM6KzWTiCHi8uViZYeEe9jWwo1VeHScb
         9I9DIGSaKhmNwDW0n9SSXJd0DkeZlDqs9gpm4ARMyrHtW5YrIkl2mhBihjJ4usIVvQAj
         8BXLUB6u5mVwWQoG/5NAdPLVCUIbBuvWOYQFAigzzd0N6dxvEiJbvll/nUzCxFl9/lk0
         EEQfwQYwulsOBdFlVui5JBCzCMrPRY0dC94DvVBrl1Um8W/Aapveii3pLfmBfW3vnct+
         dSw7TObcjlN+QWTiQ3JioJf+htFFQBD30ra8UwLwECL6TL+YhlH6gbxD2QS+JBDlB8+v
         BmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257255; x=1776862055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz3XlrHKIjrtPZ6U4iIhqJn8c0J6aQuwpCZlZmDOMVA=;
        b=WEtu83/ckMlPiB4bKBQi/T+r3C3NATb8x81SdMsCZMx/Fool6KRMn4/BnfNFDhV6KJ
         WPBxTpe1eAVKAeOYKE4xFveCxioTJSU1nU/4fi+rsXdexpWSQsh4Lha5UPylHHQjhVBW
         XFoU2PrTTKlBgzIEsorX+Pwv2KT+SdRnwEj5ZuuM6fSphpsGBY3rL44sifpuB8MKC7t3
         RX+pIZdlGA2CW6NW6iRd7LfJ0yWtxQ1ccKMoHTDK0uBr8sH+In763k5Sx6CpnxuT6sRp
         gYDCu4X2qqZl86L30Z1TU9j0XqRw+EA5NlktUeJUVwc3zrqU3Ch/tSREVBUC8tvrwJYL
         UQnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dhKakkZlxFcsXwfkkPqV1pjsi+hlejLsXTLozKIzy69VilueJe6n0cl1CqLJgAHnP5H4IvmSb+Msd@vger.kernel.org
X-Gm-Message-State: AOJu0YyenLuQICt1Sb0wuJ+C6aLqy0GSAjYHlaSgg7rgf6UPK1deKQNY
	9PVnWf47eA7A+gYXggHTdS0VmC9fEUNft5PinZSAT9BQiWWSXpgMCS7o
X-Gm-Gg: AeBDietYPOgmixgxW/oo5vEASUfB3HloS8VY2lOe6iJSIO5GRJ7FPeG9bDMqTiL3Rxf
	gc+DQGsXeofnSGqkcPp9XzuNl80MbM8LGsDWfXnMcFui26RyvNXEhEHgeY6pyki0RnccvH8nIUF
	y9FWH4uUaOsWOegUWU6myskepmrjD8pzY8TyrjXUx8GK9ZNema35bjJP0EUOodHXAnaxuORNAsQ
	kYZtl3tl0LwzLmufR4ahZJZuqvxjUoJozjvnqe28ev6taLrG67ZADMoROOcaBZKhh6IGJkyRT9r
	UoSvkn3dKcwrtPx4Riws7gvL2/SvnYNd5/KRG4lPMRH5xafv5tf8ynXUscKNb7jniDHJrusLJgL
	/6GoIWE1jX8m52CFvGnSkM5qYWzduf2VeHjyKaQxyCow/0Xbp5ZRK22t1y5LOv2l5OQPKaM6arT
	BEFkfuIvgPc2WqjXYWI16BMsU3KzoWawcmUNaoMg==
X-Received: by 2002:a05:6000:24c3:b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-43d762e7865mr19873913f8f.7.1776257255219;
        Wed, 15 Apr 2026 05:47:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:34 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 00/14] ASoC: rsnd: Add RZ/G3E audio driver support
Date: Wed, 15 Apr 2026 12:47:17 +0000
Message-Id: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
has several differences requiring dedicated handling:

  - SSI operates exclusively in BUSIF mode (no PIO)
  - 2-4 BUSIF channels per SSI (layout differs from R-Car)
  - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
  - Per-SSI ADG and SSIF supply clocks
  - Dedicated audmacpp clock/reset for Audio DMAC peri-peri
  - Per-SSI and per-module reset controllers via CPG
  - Unprefixed DT sub-node names (ssi, ssiu, src, ...) instead of
    rcar_sound,xxx

Link to v4 at [1].

Changes:

v5:
 - Drop the rsnd.yaml binding split (patches 01/12 and 02/12 from v4):
 - Extract RSND_SOC_MASK fix as a standalone bug-fix patch (01/12 was
   previously embedded in patch 04) per Kuninori's request.
 - Split the DMA refactor out of patch 06/12 into its own preparatory
   patch, as requested by Kuninori, so the struct/lookup introduction
   and the RZ/G3E address tables are in separate commits.
 - Add new patch "Support unprefixed DT node names for RZ/G3E"
   converting rsnd_parse_of_node() to a function that tries the legacy
   rcar_sound, prefix first, then falls back to the bare name.
 - Simplify flags layout comment per Kuninori's feedback
 - Add comment clarifying that clock/reset acquisition is optional
   and no-error when absent from DT, and drop spurious blank line in
   rsnd.h.
 - Move RZ/G3E DMA address comment to rsnd_rzg3e_dma_addr(), not the
   shared header. Separate the line-wrap-only change in
   rsnd_gen2_dma_addr() into this preparatory patch only.

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init() (Mark Brown)
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with RSND_RZ_MASK.
   Add nibble layout comment documenting the flag bit allocation
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl
 - Replace raw [3][2][3] DMA address array with named structs
   (rsnd_dma_addr_dir, rsnd_dma_addr_map) for self-documenting
   table initializers
 - Move busif_status_count from file-static into new
   struct rsnd_ssiu_ctrl, following the rsnd_dma_ctrl pattern.
   Remove duplicate priv variable. Properly propagate reset errors
   via dev_err_probe()
 - Clarify commit message regarding PIO mode still being available on
   R-Car
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single lines
 - Move per-SSI ADG and SSIF supply clock prepare/unprepare into
   rsnd_adg_clk_control() instead of separate functions
 - Move shared SCU clocks from file-statics into new struct rsnd_src_ctrl
 - Merge rsnd_adg_mod_get() helper directly into the suspend/resume patch
 - Drop former patch 12/14 "Add rsnd_adg_mod_get() for PM support"
 - Drop former patch 13/14 "Export rsnd_ssiu_mod_get() for PM support"

v3:
 - Split out from v2 series [2] to ASoC-specific patchset.

v2:
 - Split of rsnd.yaml into common and R-Car-specific schemas
 - Introduce RZ/G3E sound binding as a standalone schema
 - Addressed Kuninori's comments (details in individual patches)

[1] https://lore.kernel.org/all/20260409090302.2243305-1-john.madieu.xa@bp.renesas.com/
[2] https://lore.kernel.org/all/20260402090524.9137-1-john.madieu.xa@bp.renesas.com/


John Madieu (14):
  ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
  ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
  ASoC: rsnd: Add reset controller support to rsnd_mod
  ASoC: rsnd: Add RZ/G3E SoC probing and register map
  ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
  ASoC: rsnd: Refactor DMA address tables with named structs
  ASoC: rsnd: Add RZ/G3E DMA address calculation support
  ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
  ASoC: rsnd: Add SSI reset support for RZ/G3E platforms
  ASoC: rsnd: Add ADG reset support for RZ/G3E
  ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
  ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
  ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
  ASoC: rsnd: Add system suspend/resume support

 .../sound/renesas,r9a09g047-sound.yaml        | 770 ++++++++++++++++++
 sound/soc/renesas/rcar/adg.c                  | 125 ++-
 sound/soc/renesas/rcar/cmd.c                  |   2 +-
 sound/soc/renesas/rcar/core.c                 |  88 +-
 sound/soc/renesas/rcar/ctu.c                  |  22 +-
 sound/soc/renesas/rcar/dma.c                  | 277 +++++--
 sound/soc/renesas/rcar/dvc.c                  |  22 +-
 sound/soc/renesas/rcar/gen.c                  | 180 ++++
 sound/soc/renesas/rcar/mix.c                  |  22 +-
 sound/soc/renesas/rcar/rsnd.h                 |  54 +-
 sound/soc/renesas/rcar/src.c                  |  85 +-
 sound/soc/renesas/rcar/ssi.c                  |  41 +-
 sound/soc/renesas/rcar/ssiu.c                 |  91 ++-
 13 files changed, 1681 insertions(+), 98 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

-- 
2.25.1

