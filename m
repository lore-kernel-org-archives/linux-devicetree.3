Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D613793BB
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143789; cv=none; b=e6qMPI9BTG3MCoZpqI5o9873s5VWtlrx4OVbwXzOKR2c7UlB+SSNNTpmtIjf5N7rIVKqiIaD6hJg6Ygjdf7IMz5brAZbI8CYBfXC1KBZRvXk7T/iHjALP56ONc/tun+2+ENx1L4FMm41iyPyqYW6FmF4n9wU1xrrX+7T1LcHL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143789; c=relaxed/simple;
	bh=mIKw7TlqgzZYAMXbesAtGbPoHY6vE12XtCAZu7o+ORc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LapGPFsJTCJtaGGG5fjO19ve5ZAkGiUDrmjr1v4I2tJwhFaB7G9QDCwdtaCr+yRxjtkB8f0iHk46VovtC6jtNj67r2Fb6dHlN+Am8KjxPR6nj2EIN/ixtUYIe8gk2HH/p8HtWvoRsXW7Z+pGadK4N7Dvuf6VPbKMn0x1pKxghRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cBr6ijoV; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cBr6ijoV"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1684354a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143786; x=1785748586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wN/kx/SBk8bE5KK0ql4+gLcojF8uiq2QeEJ40jwABjk=;
        b=cBr6ijoVG17VY8VXpdoJA3vVfrnWdGbEaxSrmHkju0lQ5epA124g/qLBb5y6fxcsUe
         5tMHU5/MOh4Lh3vIQo3I4mNTE+aO+zFZdqB/F6pghWEZ47ERmQIQxo6NTqrHujZwG+HE
         BCzylK2Rsu2vh5rAXcRb1br3zNxz1F400oQxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143786; x=1785748586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wN/kx/SBk8bE5KK0ql4+gLcojF8uiq2QeEJ40jwABjk=;
        b=hN2+boifZIZc2KfdcfWlnGMQ4Mhs5RHwkrBNx2GIo5vhvvMfJ2i52PQ/XS9pXO3Mnd
         /LeiWPMb3NyPCOFMvAwOK3oPcJNF1w+mO6OCwj5ykykIyjUi3UC+ui8y2i1z6u99vhKY
         2y0F9eJaxKJ5L9adeemNzxYchFuzkvmWPulITLBpmLoEkG3lsJnRhfSa515g/w1G0NHY
         KyuzRVUN7wb2oYIe98zk7aiVvMrqEHE2h9DZs6BjaSQQ6kXbzuNZW7ZULX0kpIylY3d+
         VF1ouZRnaMq7v5ZO+VG6hprMAuyh6wCg0YFgelcYfg6WUIiyZFjrxoGW7Q2o44lh98Yg
         7J/A==
X-Forwarded-Encrypted: i=1; AHgh+RqH0I4ePvg7G5N1qDkymeErMplu49RuUY1wqrF68rS380LzECDf/5thHpGDQ8U6VwT7pXrTC6tzlnwu@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhS24ezZaDuqFvGPR4lTZQE4PQ00FfBPTPsd6m/cPsXhjNH8+
	QsayeWnGUlVUXdIrLDV7wwRnL10eVCkkn4VDB2r9czPU6aX6SZElT7tB7Pj0Px2eUw==
X-Gm-Gg: AR+sD12k7g0nlgLXwceq1R/cjfTkvPtmm0ODifUtstS8/1XPEYaMhcMs5agZ+UTbH44
	diVjxZXBuFKM9ydmYnl+c+jbldhBUH32QhqkYrXQ3TKjCMT5NcuDiVcKhqcwKR4hMLQIjNS/gX2
	ixq1vZNMaP+42hSbnatYxpeX1sC0PkR7rImPz7pZsbcw002IbDNyQKUi58fX7/rl05JrYhqjmQ5
	68egAaIaORcmY1SFxIzAUqIe4IzSDrhknIpSJOx4qdbF7+AVo1EqznWVnYoTf5sRFMaisQkOfr1
	WasDOAdsU8oM8lmUjeWU3iFjEiPN6Kl5ju8KdGdkd5mkxbQApdwg+UX7eikE6+EuEImqKyJVeM2
	ef/4MdYz+HPmcPzd0neg6BT4ev6hz3rYqJWMpABG7j8x7lQh2Pm3O8tMBKljOZ/A+NmHsdYWkKI
	qbqBZEfGG03TASdfkFZAbM8gUodq/YnzWa4k397nygyy5wRnDzsTUinEUH8g==
X-Received: by 2002:a05:6a20:6a09:b0:3c3:b5db:cd93 with SMTP id adf61e73a8af0-3c67d9b3da3mr7135247637.13.1785143785620;
        Mon, 27 Jul 2026 02:16:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:25 -0700 (PDT)
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v3 0/5] powervr: MT8173 GPU support
Date: Mon, 27 Jul 2026 17:15:49 +0800
Message-ID: <20260727091555.1023910-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my MT8173 PowerVR GPU support series.

I got another inquiry on the status of this patch series, so I thought
I'd dig it out, fix all the issues and send another version.

This time around Mesa was ready for basic testing, using both vulkanmark
and glmark2-es2-drm (with Zink). Details below.

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
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 241 ++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 7 files changed, 362 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

-- 
2.55.0.229.g6434b31f56-goog

