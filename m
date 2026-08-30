Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B43A2E0A
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105757; cv=none; b=keodmb7rFcYjJzWimTq2w0/y4Ih+dDyj+XtxSt5QBxMMq1uyI9tgjfC3xzEpFP2H3q7xhGvhYQgAZ2m/ZIwkMCnHJSk5pbDHMX1fxgm8xz5U8FAX3OoKElPXNTofpW564OWrCGAI9iTz3SCjU3d9/PL+Srir0Fye1iJUfPLk0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105757; c=relaxed/simple;
	bh=5I7WZk9Likezcszkxm2f5VMiSja2ZVMFwssHq+M2D28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sc1koMyGNb0aM40sEI+B6LtA0j4WdiZG4gVfNoIXXltO8K4LB920MTEo9knrOZDP6eFpeL0rveIVCFVYcVgxCrhkWgc0139I3dOaLXUYraaLmZUfzP0cEae5vFNF+dt5IAaSiHhR8ZK05eR5xrLA0svbFUomivqkkN3anrAOBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyksnbdq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyksnbdq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1823940b3a.3
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105754; x=1788710554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=kyksnbdqZ47+kSj+nWGucjW4eEB6AIvW9McJEgCa1C4c9Y1XcU78Nb9VGvvF8DLiVq
         UMRCJumCfZpR+TZupOv/RGjQxzVz3Udw4dvVYlKswWvSD++w1Oy2A/tPI5Km1z0KKMo5
         7NP/tPbKZ44VxYfno+ZpuLaoh2VncCJDsDxlUZSLQBU8MtA5GaNHSnsyNdGsHx7D13+e
         8f9fvprPZnmvgCAh2flwCH8o06sZ6p3h6dQWXYhZ945btkTetrqtBLekyrLsxFX9MQxx
         64mKJhh+mkuHTcUG7bO1tI7xHbbGYzi/br4Jl/D7XNhAOG4WS5D8Qx0CySOm2cUUBoG7
         9RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105754; x=1788710554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=HCOqBjgjQ2WxLcXAMG0vce+bG9bGZSCGX4l+f7n/gTOEBailJxB81u+lWmsng0H+9D
         UWnMavzxOE8HvzaELWFfC0Of11nEW5lwmx0dDlmTrhuXKzSOmmMkvLJsT6GUTB/C4ke2
         4HPShWughhB5+ZXkecCPi9fNZZiGlosS59YN6qLmxUIirxwmOW7sVrxLynvQtuRSLFJN
         OqjGlW5GeKQDFgfnD8+m7krHhw9UFdgbGrO9IijXU/NpetVGL6QjCD5c0cEFEaqfRss5
         qwHRqOQwjzWGvS/ICrbImtdaSG90lYthPPS17ZyP835nCqfyEnICNubOY5QyEXTt7EJY
         RGaw==
X-Gm-Message-State: AFuF++mpjROYlWRs8uB5r6zvSL5AAF+fXinWE106gjfSRJPa9Mc5bP8B
	OGJvdGsGWPMoZyyB6Fug3TF3dTFXI0C5YdqKJIFIOsRL9U/MztyV2V9V
X-Gm-Gg: AR+sD12bp+PYPIVvhpiKPxSApoJQiOoN1PDlz6w24sxgAWjJTE0aLR8YR+aEYVS2DE3
	v+i78M82HhbDJe6Lhda3os4lMUoursoFcLHFdhutKN9TCwEid7ztCmtbWvi9sk96rQTfYRNFovu
	BYnWfcDeJ6pTBmjaW+MiuksAet/YStl2EETtHetXpNjr6AqqVLIpxEq/ymt3Jlv4/+h54M+W7/Q
	Xj3Jxsq26OEUf6/s2yraBOKX/zX8sw8iJTSS1w+z9S9L4EU3bL3Q9sCKnt9cJG2CzjwpH7Rr/9D
	t9/aMU0lf/EdQINeBF/xFVKfF2m40s0YFgxm77Ctk1yLaLXhz8rmDNoFKXhjVUQCnv4mpfEEteV
	z6b/WTV4z9jVGnkjBmPof/EsMjduN7hoi0fAzdLxD/kzQtnocqbPAeB2tr3bdZbkuIfVHZFwb1e
	B6IQhPsgGZxdZEQyIIQmYrYyk5A3GyZGjeisHyd855Esxv6LGlotuacUVhwY5J3kZGgomLqmS41
	/lm/I0h3WYds5S0eQombqi9FuOUfr6dLRjbeCUMeI7HDlQqNSHrkQ==
X-Received: by 2002:a05:6a20:729b:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3d26615ece4mr29016741637.8.1788105754380;
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/5] fix and improve for Hi846
Date: Mon, 31 Aug 2026 00:00:20 +0800
Message-ID: <20260830160025.211384-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
- Add link freq check in filter for v4l2_find_nearest_size_conditional().
- Link to v5: https://lore.kernel.org/linux-media/20260712115012.91600-1-mitltlatltl@gmail.com

Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: Fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: Fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 370 ++++++++++++++----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.55.0

