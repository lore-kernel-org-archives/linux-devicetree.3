Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942E245008
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092319; cv=none; b=YhY3gpZM8XQkvOcviymPbSPXHlEJ/PImjmrJrWdcxidc5zGLJhJbrI9XwGaPDGnjN/INlUp9xXISdswPSNqbRAE7r4bvuio63YdCu1MZZvkaBp2CyGUubza/fZyaaKExdr01djaG1y89rwEJ9ae+hMiXclnDwf9bxLBfPNe9frY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092319; c=relaxed/simple;
	bh=uhIvo90yyNuSPEcJaD9VYXjhX72LdlUeeMyWYoo59cw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uMq3HW4UCALMNCwJWC3dC3qMlNIluL/FhRmgcCvxBErzXUKA+8D26/AiJRC2qqvfWwyNzXsH2qB/xTAMoAVbIW80uhtFE82z+XiLJOUe6fvXWgxcsLV6s+vmIxefXtgV0uxzz467PJ+I/nZ/OXwtMCzJNDRyC1Xztj2MUz21fSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT0+fxEF; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT0+fxEF"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-519eced8cbeso36758101cf.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092316; x=1782697116; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=QT0+fxEFJwhupn4qq4mQVL2B7uzaGa+eeKV1WrKCU5e08MatYTisC8yiDzf75eK8Zr
         DyF75reH5qiQG1sFpj0u+au11Ykm4enkPLPcDFAjHix1AXOHIpgPegFLw+AmACSHio0n
         lJ0+AbmsO9Xj4P2l1yEA3jFE420DbLqH0LK0hpjhf3kyCKU6k6+m6CNBt+qPmzXOqIi0
         EDq+qWqcVQvHmuF7p3Oe5rG3KOzpNP9C29SdB1fJbAANPfihXQggXxIckj/O0yiuRtyE
         Cnb1ajflpWNalbqgida42TaUwmlWVh5aYXRVLoPZAcsAqjHCCcZwAM5uPx4/Ytm/9vIN
         fKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092316; x=1782697116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=aXnNnCXifTk3zEVH145ROd0rv8w4uXP2efsFFDQYyIRhCVIzGLJPw3Azsn2lXt3Y4B
         5ujD2tnWbcB435cH7Rm9QdSAdb7ZlEoqLaUGxH6Ir4c614FQe0Z/tTJoeMb+8X37tqwt
         6NvDGw4Pvw9WadMixqjdEYoS4YlhVF+dUoqjpXTTG48GuSuSE8IlD638V9RCXBGPhdwL
         Zrqx+UD4xOgxZaQhP3SLqm4oJzbJt5ocfclUhdwyfoIAqCJtJtyuSD8RS2/3pSu3m7Jk
         d9kYIDf2K1hVLTivP1r5fMI7Ec6uurVnEmF3YacChdmseLJ9RDnLqobEmAmLYKbuAIyq
         D+Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+5HUkPUzz71cEYGHPR3IIoQadGzZzdn/BQ/PzvGjt40sSIgzLJEFQGtlL6xx7tAhfASNh2tIWZhVMt@vger.kernel.org
X-Gm-Message-State: AOJu0YyYXBYAYiTZ16T3R/W6xNTGal+/bn9hFjp6NeOUqD7HL6WdLT93
	8FuIeLQwbjVBS5ZzE9m4m8hfNlKySCRPz6+YnVTphRXmLEILHn7+Qoqr
X-Gm-Gg: AfdE7ckQWGP52KEoBXEitUJLV0BOhEv3vAKJt/38XPyvdJZt9Xg2oU336vhZlS12yJy
	6OD+MHOGUq2CqEeUKgZABBAAC4elYGbt5qSFxYEf2+Y/zw92PsFzGA91xfK9ocguHHo2QsG0EUz
	Afvvi3GHi0SAAWUy2n3wXZkePGffUhNcYm2hVYzPBdBACIzUoo2x1Frfvve8HJZwQfuIR0+VXuM
	RCXKaMye8RvuviD5fFbFhKE5qNhWC7NRXe6/bXl0HP2+ZdxrzQcPeAL6dtcfcU4IfKovRqZikqb
	IDxMTOFBNx3smvm4ig1C2eKnlbsLi7c2AyEitZXGIHLZty9ys5MHMxEd9kJoAzzH+mCBvyCqw4y
	ngZofg3xITHtIOINzRsRVExmqhvmxVS/5+bAvHFdIFBjxeBbmqsJdZcYfrsFh/+cQJWnVcPrbqg
	i5ravQcIL0QfO4Hw==
X-Received: by 2002:a05:622a:a04e:b0:519:f2bb:1036 with SMTP id d75a77b69052e-519f2bb1203mr115543741cf.36.1782092316301;
        Sun, 21 Jun 2026 18:38:36 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:35 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Mon, 22 Jun 2026 01:36:22 +0000
Message-Id: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBgFr0K6tqb9+oO48h7GRWkL1AiYFhoN4
 e62uCExLid5M29BwXpnAzoXC/I2uuDGIQE7FEh3amgtdiYxAgKSSFrhMA+SOKxKxrDpFdbAhaC
 8olIYlKynt417bcXr7cthru9WTzmTF50L0+jf22Wkefe/Hikm2CheS141ugR1aXvlHkc99ijXI
 +x8oL8+JJ9x0gARp4pqvffXdf0AaAIbAQABAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
1. It supports higher address (up to 32G).
2. It uses a different interrupt register layout and mapping.
3. It has a different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series first refactors the
`sun6i_dma_config` structure. By moving interrupt handling, register
dumping, and address configuration into function pointers within the
configuration structure. This allows the driver to support the A733
and future hardware revisions. It also aligns with the DMA drivers in
Radxa BSP Package[1].

The series is organized as follows:
- Refactors the configuration structure to include function pointers for
  interrupt and register operations.
- Moves address setting logic into the configuration structure to handle
  varying address widths.
- Adds support for variable channels per interrupt register.
- Updates the device tree bindings documentation.
- Implements the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com
---
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
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

