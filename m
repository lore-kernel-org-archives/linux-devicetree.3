Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000522D46A1
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712041; cv=none; b=UOoWUkksfQ9sk230z3z0vKi6sasBf4Q8AjAQcUbKeGnDqHFyGO2f4r1bQUMe1CId411KToQTwD0YiQaKtXqilU5hzWPxAdk5IEObthvMtSCJ26EF+Wq+sSSYyZaZexMs0R1Qz91GtBTdyNPsBnVbbACzqKX9H9n+nnLH8RwLaLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712041; c=relaxed/simple;
	bh=6NqPbrTNcDkfPzxIiV0u6zMejuf7e9xVv384zw446gU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uPhcVTUJcXhobCTK06diPzii6uF0G70xWXdesTKXPbkhDIdVJCjQ2OyFXuRlqA9k/HPtE7K3zbCHmj1WX47oyLIbMBHOjlMLyeDXlaSLlRhpMbVayqGC1TkjZMcZ+ZZMCbF/00+ouxXL9srrjwqgNsJzSyL/tiqkGm51ksYHIA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvZaxYdM; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvZaxYdM"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7dbcb505578so4264787b3.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712039; x=1788316839; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=QvZaxYdMXRYj+SmTL7Krw02hT9sopGDs9Oddu2+pSJPz2q6u5I2p0fM/cDbswQItRJ
         5ShKzk7Dtr2mDLd0oEmdjMEEEU8YT00jv7i1rVtHwPYpRxAYu6Qg9QkMzLomdQENOcpG
         4DfOXL1zs98VwYI1Zp0UIBiLI690EuxzZn/IE27sGAqAeP9wpyAutMXwb7knBqDijRyF
         8BOp5d9oqjtyn5lX56AzcipwJYpwDaHIj3FyWYBSYB8G/BEpVOCLEPB/cOy/UadDnUrr
         Ffwvgg2c7PhHIGrIC6AzknKkDl2o9azN6FkgVUMXGpr4f4doCoQfiN7pyPFdtGQB6Zjk
         gtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712039; x=1788316839;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=V0c++YWM0wELeEHym9J1xugYdOUVabpseq8NroU1xw+NRtM2cM+Bc8vpYjw7Qap9Ez
         P0+BBXZr2/J/XjbK+n0ZaCpqscuFbrcPlVPhpdWLztWOUEMLfdZKibouJi7vixjG3c+o
         FvgXv1JAm90Ekpo3KaMGJYMs2k8iPHWmx8qX65SX5PcXQcBvQygvMehLRQUhDw/PG5Je
         Ha3kroYjGLP1Y8z10Baj+QuxHSPRX+63pgMazwD1h0KhygC+Yq8rzTONq0RncRWsFo4/
         whCNExpeGK69Iyv9YKL2EMuJQjs4UGir1YeeTRtq8AASRAvzLG5T15iEOqiBF2lC5Qqm
         7IZA==
X-Forwarded-Encrypted: i=1; AHgh+RpWgEDVKQMujdIgMoLGcS+ZC0PQylRFYnZXmxPoAUAkoKk1pWaIyZ1JuZEkoapUYwbuhN86Qwq/CS8Q@vger.kernel.org
X-Gm-Message-State: AFuF++m7A7uKX+Ar0qs0FkXXu1LnVLyhTk+RAmeOBiRDWhtO1Yu5zr8p
	zZkE6V3dwhG16zkj442IifK04t+hGAWJPIg7q+Oi+6MMSs3LbGZF5eYU
X-Gm-Gg: AR+sD13r8K68Yn3G5gbgSsiq4eq+pgi31Y1mEca37G5/aeURfwLawM1eU5zqp4n/1TG
	5CLlTOg69gX55Ls0C+st52ajTyaOST7vxwhMKHx8bJP+FnQhHJJe18I2WuYHuFOwECiROBdn4LA
	xCadFxFH8D1AA4twHxcnPOkJriX67adF+oPsbJ36x0zpb/4rO0ae2ztqLYsdSiFP7lQzqsy/ED/
	zI0C/91W7rSZFaP8nC0fBBSrQN3gQkHPfWeMHHUJWwVHoas2Rm9YLLw6GolncSmcHfgV3S85oyd
	koKdhSPpGb7WUiln+AGVftqrxVq70cH+vUWdVLl3wqrlVClzb8BoJi/pLJ2KSSjpHtYkq3e4c4m
	logyFoA9DHEtxUt7CxfZdPLO7tZ5VGNckwcy37kbIHtV7fFdgSa1lrtxKwvNOqRI2g1Lkp38azX
	rwyudxOoqesw2nDwkkX1b5TM+ucarjZhv068Cu9Xi2+HctPy+03WU/phI/q84fYVKkefEDeiO8
X-Received: by 2002:a05:690c:c3a4:b0:80c:cad:c4e5 with SMTP id 00721157ae682-8574335d605mr11800927b3.30.1787712038777;
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v5 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 02:40:26 +0000
Message-Id: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwY7CIBAG4FcxnGUDw0DF076H8UAHUDa23RRtN
 KbvvuAeVm32+Cf/98/cWQ5jCpltV3c2hinlNPQl6PWK0dH1h8CTL5mBACOMtDxfeiMSd41S3He
 OE6DWEq002rOivscQ0/WxuNv/5nxpvwKd60xtHFM+D+PtcXKStff/+iS54N5ha9BGasB9HjqXT
 h80dKyuT/DkQS49FK9QRBB6YyXRu1fPHpZeFR+NbUIEa6hdePzzGzBLj/V/gtigjij8i5/n+Qe
 KES2mgAEAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
- Support for higher addresses (up to 32G).
- A different interrupt register layout and mapping.
- A different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series refactors the
`sun6i_dma_config` structure by adding hardware-specific parameters such
as interrupt register offsets, address masks, and channel counts per
register. This allows the driver to support the A733 and future hardware
revisions. This approach also achieves the same functionality as the DMA
drivers in Radxa BSP Package[1].

The series is organized as follows:
1. Refactor the configuration structure for interrupt and register operations.
2. Add support for variable address widths using masks.
3. Add support for variable channels per interrupt register.
4. Update the device tree bindings documentation.
5. Implement the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v5:
- Use field_prep in bitfield.h instead of the custom version.
- Add the missing function pointers for sun60i_a733_dma_cfg.
- Link to v4: https://patch.msgid.link/20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com

Changes in v4:
- Refactor configuration structure to use irq stride and offsets instead
  of function pointers.
- Use GENMASK and field_prep in set_addr for different high addresses.
- Link to v3: https://patch.msgid.link/20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com

Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com

Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

