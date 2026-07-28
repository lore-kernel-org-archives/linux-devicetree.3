Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F4441D111
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230300; cv=none; b=eKGj/9c1oiVQElQ+WkStD1peizvv1moDaRf5ih23dPLpa8q0J7MP2lRchxj90bWT4MJpfx8AyxbHOtGuFG8RZV45yjPMEPZJVkoCoWxGRZ+3D7HcneJfx1UU/9f1iarpWEpHYtsAR2rxzp/GItT61KrPGd7PpgdAqpzy+/c3iLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230300; c=relaxed/simple;
	bh=CvGmTOjwKwuGUuEQE7R2xCU2vIxckDkn69CRfckAbFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IE20vKsz0lfKe1Q3Acj0t/XNucJ3pz1h/1HLYAHSg+H/I7TS/V4w6WVwXlyTkfIseXd+nzKIc/qtGhW6dsWdVrSMfyV5NMPfx9lRv6x7WSQ+PpDOuYK6MJshs6xktnBJ2VqS2Vaf+ydVEH/e3sCGT3MwH+71jtgp3x1clgCsDVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YXQh8TaN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YXQh8TaN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceaf8a1265so43657035ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230297; x=1785835097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I1AY9BLhfuJBpnfRkSYDGG1aWX86nocKReaece+rOM=;
        b=YXQh8TaNwmi4884vXptU7HIw8A2DCGzXQcZ9wCdOWprHqZVBzd+ja5BvICb4sfFFTs
         1xtrTeIGDGqXzgv+gEopuFGcjiInQq6BsJ+ZknE4QcXehgDYZ+dgTx7p4W5ql5S9njFK
         3y2+TqhVtBjhroMHjeVfkLYWhfMnemHvUlumM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230297; x=1785835097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I1AY9BLhfuJBpnfRkSYDGG1aWX86nocKReaece+rOM=;
        b=JAURMNC/pmV3zO8DlYmXr6eUDxPHxOCaJZT2COpZFav4iwCcy24+t+bj44O0CnV1pN
         8O/PPuGrzc1JMzOYRkTxkfcG8+H5mdJXuqu4QsKkjoc3SZvArg1eroV8D1+xxiWYfcWS
         aPyVxDahmv5s3aCR3aX/SQGZxHx/kGxoT8Y8XqVYWXGubSchVkBU7VkORWA4LohHiL2Z
         ceuZ89Q6Jw3T2k+0vxC9hQqVlsJ6YwgmmwL1DT3+CLCzJwCNQuCrZ3aNK6kuGfpfK1zE
         YhVBm9Rbkf1Yq3OvO9RDvWWYvdWdZ0sBqr0+TDKGIJsJboUDel8+KrML8GqvBm4nNgXp
         xqBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4k9oWgiURfCuHMUztr+JD4M4fuozvuD4TPoHkxVoIs9ZR4uOLL295kq/eJQaLJeQ1eCnikKVz7C+P@vger.kernel.org
X-Gm-Message-State: AOJu0YyCT7xnPVbC/62BaxsXJcLK486m/78JnRZd5r7S51iMV+jRoI1q
	9CwJtsRRBFLHHqIbG0/V0CVqr/oIaachdeHSXFY+y9lfoPNyj6o3iGSprCVwitm31A==
X-Gm-Gg: AR+sD13tOXL8yayFiepbqDiTuD11VpgmZXm722q45k4I6e13q5JDO7LQ6PCPNKfCpGc
	DOod4/flKdN4QvB7eZX8cnjH+qBCOmIU5/LSZn+0uipWCkSItYmOTOMeMBgZqVNaMtXJOJo42o2
	qBMcx8TeLfnobtjiPxoX+YCJbqS3g9rysWuTbv8ldtYrv1fB4oybwuw+3gxlMUFo1EzuoDqPCi/
	3FFlKcV/gHyHM8MfQyF/TA3cJ9jPZiGvBiKKij1VHzMfR6zhivwTvH2Q0JDSFZKRB3/2GSr3AS4
	S4W5B/g3ubHNzy12ZphMa22lUl+d2SpZMSJ+skDE+IGC0ahtjADhJbNOUGfX0BImxAXYeAiLCRL
	d2Jnxj6suJvD71BzWNx4kHbIa9rbbqAGDfqqQajBApeWTOvqDxVaWF4/TJNJKiDpGSVjbGfZI+4
	YoXeFkSGjxR67NkBz0p7TS3jpqbtKvzfeBPJuFdqmy3Y05OD8FHdr1Fe37KA8=
X-Received: by 2002:a17:902:e945:b0:2cf:477f:57c5 with SMTP id d9443c01a7336-2d015ac708bmr18332045ad.1.1785230297072;
        Tue, 28 Jul 2026 02:18:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 0/5] powervr: MT8173 GPU support
Date: Tue, 28 Jul 2026 17:17:58 +0800
Message-ID: <20260728091804.382753-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v4 of my MT8173 PowerVR GPU support series.

This time around Mesa was ready for basic testing, using both vulkanmark
and glmark2-es2-drm (with Zink). Details below.

Changes since v3 (all in the clk driver patch):
- Changed pm_runtime_put() to pm_runtime_put_sync()
- Added missing of_node_put() in remove function

Changes since v2 (all in the clk driver patch):
- Made COMMON_CLK_MT8173_MFGTOP depend on PM
  - Needed since the driver implements PM domains using the generic PM
    domain library, which also depends on PM
  - Fixes build breakage (kernel test robot)
- Fixed "RST_DELAY_CNT" name (Brian)
- Dropped unused mfg_desc (Brian)
- Added check of clk_prepare_enable()'s return value in
  clk_mt8173_mfgtop_power_on() (Brian)
- Saved error value for return in IS_ERR(data->clk_26m) branch
  (Dan Carpenter / kernel test robot w/ smatch)

Changes since v1:
- Adapted to changed DT bindings
- Dropped driver change
- Use same power domain for "a" and "b" GPU power domains


This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer, implemented as a clock driver
that also provides power domains.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 corrects the clock for the GPU (called MFG) power domain.

Patch 5 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
The "exp_hw_support" module parameter needs to be set for the driver to
probe successfully.

This was tested with Mesa 26.1.5 from Debian Forky. With this version
vkmark and glmark2-es2 (over Zink) both run fine. Mesa spits out a bunch
of warnings since the GX6250 core is not officially supported.

    # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 vkmark
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: FINISHME: Missing reset support for brn51764
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: FINISHME: Missing support for brn62269
    MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    =======================================================
	vkmark 2025.01
    =======================================================
	Vendor ID:      0x1010
	Device ID:      0x6250
	Device Name:    PowerVR Rogue GX6250
	Driver Version: 109056005
	Device UUID:    d04cd6f3a25fd4900f89c151bccfdfcf
    =======================================================
    [vertex] device-local=true: FPS: 251 FrameTime: 3.984 ms
    [vertex] device-local=false: FPS: 220 FrameTime: 4.545 ms
    [texture] anisotropy=0:^C FPS: 223 FrameTime: 4.484 ms
    =======================================================
				       vkmark Score: 231
    =======================================================

    # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=1 glmark2-es2-drm
    WARNING: powervr is not a conformant Vulkan implementation, testing use only.
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: FINISHME: Missing reset support for brn51764
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: FINISHME: Missing reset support for brn58839
    MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: FINISHME: Missing support for brn62269
    MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
    Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to 'mailbox' mode for SwapInterval(0).
    =======================================================
	glmark2 2023.01
    =======================================================
	OpenGL Information
	GL_VENDOR:      Mesa
	GL_RENDERER:    zink Vulkan 1.2(PowerVR Rogue GX6250 (IMAGINATION_OPEN_SOURCE_MESA))
	GL_VERSION:     OpenGL ES 2.0 Mesa 26.1.5-1
	Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0 samples=0
	Surface Size:   1366x768 fullscreen
    =======================================================
    [build] use-vbo=false: FPS: 49 FrameTime: 20.473 ms
    [build] use-vbo=true: FPS: 45 FrameTime: 22.660 ms
    [texture] texture-filter=nearest: FPS: 45 FrameTime: 22.642 ms
    [texture] texture-filter=linear:^C FPS: 50 FrameTime: 20.172 ms
    =======================================================
				      glmark2 Score: 46
    =======================================================


Please have a look.

Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr

Chen-Yu Tsai (5):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
 drivers/clk/mediatek/Kconfig                  |  10 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 242 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.55.0.229.g6434b31f56-goog

