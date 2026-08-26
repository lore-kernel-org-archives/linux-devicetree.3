Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61111519B4
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707825; cv=none; b=oYBAg7UMSBbZt+k7j8TjNQrHPrzT3G+KmOg7yLCRIfJJw4IBZ698UrAMd+JEAFZMi8qqR97Pztg+DJZ8UirGu/J5P1VENdVIy5nS5i9P0+L526owopDSf0bncpuDYGNhqXJMG1zvQjHDqc42WRk3lpNhvQT+HjyNiapPhhKC0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707825; c=relaxed/simple;
	bh=beIIm8qKX5xAz1kaK23VPevYeR5bzySrtqmTuOgVCWk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HTQJ0akprg6qXKtey3/3eXmC2NILMgyPhUxxwVUwjJbjqGVcPZF8HAg+Rqkew7F9aNSv1dECGjogpzO1AC2L8/WrQM7R2XT8LHBN90rgyQ6X8prUTIIMl9EgsB6ps0NbMVw/nNuRwpby2QDQc5sBAe7oJMFJidiLpvCsSJjvRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9UfgDdN; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9UfgDdN"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e65e18969so35715685a.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707823; x=1788312623; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=j9UfgDdNXYwnq0quq6gL6uWpsN6sS1GqRR84UGJvjndL+gPbYtq1saHyStTygiwv0e
         vpNHJXCTHS7IXTnw1Y9lFTieKvTB0CrOtLLQjmU2Sq2zVKP5GyGI+0yqwJFg/z7GrxPK
         CX4B4fx7YGrqrYjFLViDKeXK5BJr9cSiNYGtIa3zsHPBd6kMF2e//nK94unRXAN3Xdty
         4Ztk6Kd19xXDkBcqtF6ayGXfT8yNzBNRIu1PTkqs2sAbGAC+E3HUcRsoXkRX7kTRtN+0
         91GbYJ08gq6/414S8gj2moiX7+NI9r+MV1NOQR+SAvGYAbB+Vxgzz2+wq0S3I+NY37Oi
         6WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707823; x=1788312623;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=THrETA2N0eAKIhx4aMOhxRcwbaDc4kqQdsr4gKiLsYPHjJtt2QTSsQDtxGeyZ88P9J
         Uk7J/jnCR/0jb/RPqH1dhqBaVYzNdRwxxPpI9y8Mcp2zf5TIT5s8NvM+RJgSEEqnYjHx
         T0mN6mDw/XBFSdHESbql37XUtLZ7avBR+sA27BYR2CkuilRpTzVuH0GByMr6uOyZUi+U
         WbJQkA7woHKyrd3JYWgC18yhgveWLzQbASurTByMKGuwK9n0T2a6P5FL3VQT3FrClS4S
         H/1+ZN/go/qRP+k5F7e80n5BvSLtX17ea9+s0CxL+8598JTI8+NJoTCmm7MPzQNodYO8
         7DXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqr84lfuIA10SMMBd3g/DlMnN05yImeLuZvvIs6kiIwgzdmp/zUJg2gk84z8OeLKqtHDLUVEZnXUbZy@vger.kernel.org
X-Gm-Message-State: AFuF++k0DyHWSknl4g6W8Toyl4+byglV8AHtmrgFryXx/G3W0ArjGyo5
	rlNMA5VBUymV5LOYoO2cI5BfpLXF7WGFaKz18yWsc0MEY3RqNry4+OyQ
X-Gm-Gg: AR+sD133czNPv0JN4thThMW17tm0akEQjvQtOiYuYpDHPevs9W6aOVY8ln6oVhtjKNE
	K3u35IzEO/tYvVnwqA0+grxUxNkOlLusNro8tnBdnsbmoxyh5Bo0IfWZER66T4SRRwod0aIE7Lp
	2Nl/N3x7X+j7ssSKdLPxhh/PF94Ikqp8kyP6q2YzIW0UbwHHeXxqBgNpCeD/WF3gYI3s+1JhoE4
	nRxh1jQVeRDXqvgobilUI181dLm9AsRWOYOHfLBaih1TfjZ7BNAghRk3i8iMrJO5GCvOIpVjiaJ
	FRvEHDWYVsSTOpveMd0W/PakwPqMS54X9gQi6ut/Hz9ZUisgAhoWRMkCK3LZL+y1EepTfYyz7I2
	Fn7bSj9eLIoryZqkod4Ju7+bv76QCFDfp0XVguJgtR78k1AmwvFtsMKpsr0NRrQGKHZAAeF0Tn3
	lIG9JLwoOR1WtAwMU8HSBrcDIiXQFEZlgw0eXRKYPk6Z/8a2VEhsmPLBfHZXojxw==
X-Received: by 2002:a05:620a:cc3:b0:936:ce17:7792 with SMTP id af79cd13be357-9376f3635ecmr870773685a.8.1787707822640;
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 01:30:02 +0000
Message-Id: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ppz9YV97DuCilhRoBQ6HRE
 O5uwQ1KXH7JPO+MKNjO24BOuxF1Nvrg2yYNvt8hU+mmtNgXaSMgIImkCoehkcRjnTGGi1pjA1w
 IyhWVokBJPTrr/HMpXq6fHYb8Zk0/Z+aLyoe+7V7Ly0jnu//1SDHBhea55MqZDPS5rLW/H0xbo
 7keYeWBbj0kzzhxQMRRUWN+PVt72HqWvJMqsw6UNPmXn6bpDUbPGuNAAQAA
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
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
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

