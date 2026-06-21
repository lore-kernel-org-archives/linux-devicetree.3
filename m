Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA837104D
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078092; cv=none; b=LeiJFOPk8/iDN0epQ973xac17R6XJqLDIfMUxRXQ6Xn7/vQSVU3p5Q/RBcUP2WRnu6nKWtb7GH/0fbxuUIYVVEPDlnrsFrG3JRDvzUkFEe4qLmOzTXIt+ORhxmqKpqlI2e6mPwn8yJFEyT5htmFhC6ZYpFD+oBpqrKOWZMy5mLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078092; c=relaxed/simple;
	bh=AaVqPSi3j+R9XLCyLLFs+E/l+JBQxT8UcVIvlLB1NRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pAFFJw3Sb/DiKq4nMKdLDkh0RnNdB6f/BlkCW0HXGFdRH4NPOSTzrA3aGgQKUi8FIxFudXebZZed29rf8YnBT6afffD0pK9UUfIyozW0hqv+OHu68BGiUe2C6yVLGXjtbu5GsEjt9tPPWVKBWp5x3KH9dZS33Pbv/mw69cbu5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnC3Vhkp; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnC3Vhkp"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8dd74f90e3eso42202666d6.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078089; x=1782682889; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=HnC3VhkpgPgaPK1PEVJZa39e3ETSbx3b1HIO4isI0deWEf/TAPiyP3pq5qJlyErn8X
         amBobWDMM7ZYqfb04ItfXbQSIjiTxpP+vBH7CXC7/h5h7Kq/vILfTo9smHJmS3kofPlP
         /h85AD+YlkD3xXMa3iX6Xzuzqjw0mjbiU7ZlJ8v9ldkhNpaBfWvqS5TdwsL4TzHp2+46
         hmQn7rB4j9ZoLbZrh5DBQwINGnPC+tH9pC9bFaiLQ56igkv4dNKo7tti3K/Pc/uI5c3J
         ybBdqQlx5W81GB9bFyFuMcN9T0DSrcVptAhvenK5PG73s+QDQXC46nhap8RS7Yr1UfK7
         p5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078089; x=1782682889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=i/m/QbuyooTJZbpEMJT9rz95DWitLoB5vt0UJLLp4BhHGh//tjW7E61HfR7FbBqaRQ
         i+nngNGiTrQiHHRPpNmgCGMTqNrFgzey7qkdyP8UlcNBLddYivLkVUSARIv9y8gt0QjU
         waUpsDuU6WGuOpops1fRSPvPVm2KhejchSHLR5KSPCMUb+ikRpgMCeWKTP5/bRRrUsTT
         aYNywSyUKsHGYxW2HLT+O+LoALQGlvDOxzuYpUMvkxA+hA6lmaU7ENRLF3oFwGLv/b8X
         PQYMLhzFHl/huV1HS5eQciwHuDBjwCCt70k7dDR2U6I+9ezvkIjGky44MZcz8Pm7e1kx
         80LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj0afQ3tv46Zre68w93tnHXy4hx5BH5PR8h34Dmy24YevbvdCsolozCaKAF2q3auq9rBnGB2V5yu86@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6crwcLKBpbTJz+rSzQAB4cZIF/SsA+1YFO49oTvb0ny3NZ05Y
	LKzpx9kWLde0qRs1ObmOTT3jZby7r0D+hnz6Y+i3TXaoW7QKAZ6V7GSe
X-Gm-Gg: AfdE7clAlaztZOOnBrNXLN1AjTXs1hm8CQkWNun2XOWAMtboI/Z7QUclS7cdNHXoh44
	CoMoQHg40uy0fvmlVZLm4nsrRV7Qjdcfk56H6MSCOhqTBKKZP3IoCDbmqjslrcxsMxW0dQ9WyQC
	Uk4jECOphvHP0qLeqgy5fcSEPD61FjE/VMK6PQbPmAbkfFDvlAHnjCHzSZCDt+ekH9/Bvn6vqTM
	/NAaeyzz8mRqmgppegNQ2WK1ZM7/52+W83nn8QWXTIHbFKn0tQWeaOIUe5amEbmogcIB962mUc7
	i7CTb+b7bNDRJwVagcXXi/hA0tenohsk9KpuFBCIjSawWzoK53BzyfoUHYBm1kLIBOdahDgDj47
	kZSTyw/XxvEJOOWN3yucmh9E2yS53hH0p5nBKE/FOXuTu4oV4ZHEv77fdOzqVHFAWLZ4YYk6IgQ
	350QPHrLLeoB9IxQ==
X-Received: by 2002:a05:6214:5182:b0:8ce:e29b:6a91 with SMTP id 6a1803df08f44-8df927c4decmr137731436d6.42.1782078089211;
        Sun, 21 Jun 2026 14:41:29 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Sun, 21 Jun 2026 21:40:53 +0000
Message-Id: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMutMAAsau+h+NCwTUaeojoKaN8
 d8rdt3lSc49d4PoA/kIt2yD4FeKNA4HiEsGtjND65HcwSCY0EzzEuMyaEZoijxH1xu0QirFZcm
 1cnCspuAbep/FR/XjuNRPb+eUSUZHcR7D57xcefL+11eODJ2RtZZlYwth7m1v6HW1Yw/Vvu9fr
 Adhw8AAAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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
Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dma: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

