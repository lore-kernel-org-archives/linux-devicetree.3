Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83BF296BBC
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 07:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425507; cv=none; b=lVpc/yvgcamB9WAUMAU1gbdm/PyW0wdl0qR849OzDDeJBuSCl6iLD2pqY2lR+rahy1M8RfWxxUIFoGFyqSRPRR5OYPGjsQ+iVbVE4PhWHOJo/yfOpSFeIv23oZY5YfUe79hHpcJr7K5A28RoHD1tWjkxEIHeyH8I1hS/ge9XLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425507; c=relaxed/simple;
	bh=pgBo8/Kx1aaY0ic9ZG8/TNmyttEXy1UGyzChAT/giXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eo0Ze8H2xhoFoaMF7SF71ciRxOAp/5o34ZQTRg5DcCu+6HtRnYVHgXxOh6lpXjXgzsNs+mFfXskRhYMawrpcZn5N6+lPWT8I+ZqqumAdTGkgyWmZSALDL8sXJ8D8J7aqYYC8fJsr2M0sNalu4VIOXi4zFBwUEi7xjfX/7X1x4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mq6qVMEh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mq6qVMEh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2aaed195901so26385425ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425504; x=1775030304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=mq6qVMEhWYYMrxeYG6I8mn+BihrtdvNvHJPY0D6Wvg9E29829Ii/j1FFb88h4usj0Z
         /7FzGMrGFqCUAy1GpY2JvdbUmTcnhhOfZZq4ohw0XxB+pBOOyw17pcvqTyRLh4HO+yve
         7nBwBCFXiDITG70W+luVhfAYUIQqjDkbmy39M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425504; x=1775030304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzYr866Y+nhDeVzwxBplwIhb3zjPYVx7VrTJzl9KpOQ=;
        b=L4FHwdO2iwGkR7RYsV1w6ZyFm5zgfdpnj9rnMRp34W83aqdaT1OtnnGV5SNNYWeFrc
         FS8g90Hydv7HlhYYjaPIobKU5GmF4yCxbcCon5ZPggtbdF5aUOP7RkOarsSIUgNK4BrG
         RAjmtsV3MH7+qNPJK2na5dH6y127dKdid8NpLqdGbLpXHclKep8YUtiXI6msMIbSgazo
         owozWdPE1Mw/yhL0cdoj0/ht7+qrW3hijALduT75ZDQvDiTmV0c+tfOtrpmo4kc1YiOj
         Pu1i08koR5JcWorlcQmw6blkKcBjLh0bGKc+0cd2Ij3oytLlXV7H4IGcDZUWgOuFwqQV
         msLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2HO34+fsF2mQysN1BxwPuIUNS7LmNCN5BcDI7/9Aqg22FPYZD9AU/ef9MAV2L4veAZ+2eX33brG1r@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMsc9qryEQERmd1XNCY5b29SSAMYC9vTetglktd5sQB2p6M6o
	c782QB+TkUa4KDCF0HomT9AcS1OjfWb04FEc0L2Q5oPh8yQ3lwJ/PGouqLepmN2O6w==
X-Gm-Gg: ATEYQzy+0fmfLoT+DUaXXoLbkUDi8ix66qDnYZz6lQiii7DuWpTyxbsRrcLw5UD3v4Y
	I679aT23t40oiUS1LUBCf5UHgviCqdPCV2ZLpYjcYI5rR3dYvoXDhA5s3BUAiEGDh6bkoWyoU+U
	Y92D5D/AUjZfNvkDHHg7vk7G0pGjGm/MlL+gP/dCO8tEwozQpKLPNudmU6zKXojUyKYcf2Zakpy
	z8DDrJoP9iAHcJxcnxtAwPG0IBCwk1oeCnva11J/PEA2jI+1CrX6D6pzUulGNI2H7U/ugwiSQro
	I/x5HPhcicLQDV4/mVJlM/6loOHubMxV6dNe1xSxFHx5eZQUuHkjQeLOnL0ltFuB7n7MyFIjsNq
	dfL3wbalJIavN9Fw9YFDKAPQpIVFhSK+ix0OA8sWHtp+j9bqRM3nGUUKdiv/9EA2vqyUyrwrWxA
	NSnuEGArne+sbhHCIOyPj84A0IzYywOKFcZP9xjNGEFT7LuoeCSdpPVw5UgngXrJ23kRJ6dhHNY
	qpZd5I=
X-Received: by 2002:a17:903:37c3:b0:2b0:5aab:c40a with SMTP id d9443c01a7336-2b0b0af4c01mr28590075ad.31.1774425503648;
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] powervr: MT8173 GPU support
Date: Wed, 25 Mar 2026 15:19:44 +0800
Message-ID: <20260325071951.544031-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of my MT8173 PowerVR GPU support series.

Changes since v1:
- Adapted to changed DT bindings
- Dropped driver change
- Use same power domain for "a" and "b" GPU power domains

This update was requested by Icenowy.


This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.

Patch 5 corrects the clock for the GPU (called MFG) power domain.

Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

Patch 2 and 6 depend on patch 1 to build. I suppose some common
immutable tree would be needed from the MediaTek maintainers.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
the powervr vulkan driver enabled. `vulkaninfo` gives some information
about the GPU (attached at the end), but running the `triangle` example
from the Sascha Willems demos [3] with -DUSE_D2D_WSI=ON as recommended [4]
failed with:

    Can't find a display and a display mode!

Same program worked correctly on a BeaglePlay and displayed a color
gradient triangle. Not sure what went wrong here.

Anyway, please have a look and test.


Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[3] https://github.com/SaschaWillems/Vulkan
[4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com/

Chen-Yu Tsai (5):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.53.0.1018.g2bb0e51243-goog

