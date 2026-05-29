Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F873E8C70
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780070155; cv=none; b=D/dWJxiprHRuBJp9joCyhPAoSJB+L8+l+XjiHW2zVQVE8hq4CW+alob3Wzb5H8ZcrbvR11InR0gkQydsX8dcicvbBVIqfs3wVW15sn4y3x+3z8MF+kEWLAVRcnL4VeIAvuLr70l87YKDt4+8y8lHn8UOZiEUhWoQ8iet5h7WytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780070155; c=relaxed/simple;
	bh=nB9HaeDrWuITyS8URCdNo1fLNmn/dD4gNLXmV9lf6is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z1RtAvpBvO4UmdxFhfgU36fFY5YKSAygZtBkxqFRtj1zjvvEADDA0x998XgGiIePg6ryAU1w8fVbVh0sKTtax2lGoCD8PUdoBubFjDMtmtxZvHwJZTyAXNss0pXdMVgzxKIchIA4fqrnXi1H3d7TvARZyfidYQngfYW/RIOofRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azxsCYiV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azxsCYiV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so69709855e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070152; x=1780674952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1egj7rvNz6E3Ee54JdqUG6bAMQYsYWlFR8JwRKRcg=;
        b=azxsCYiVjScy9jUaVTaaN8viDfL2n0mra1Im6rOG4tOQj32qPCxv6YP8DbvAVnDJCG
         YStuVwL7Dyce3FiFPvmyT8Ry0v6xx/QllQfQG4RzDmxWQggrzKMU5udrFaq1iNsQ/+4z
         k6H14YX5N9p92V6GNJOZK+oC/hlO67EMF0ozPu7ueyZ7Zpy6RKmP4N7TpN0DZbN6GgYy
         FP9/ooZh6sxk0OBGZeyFWdfOd4K7b+MSROE270aFb5l8Bphm/Xn3vTMLMGGodnBPM4uc
         GRfvqRkl+udjFrnorPIqxu4olJu5qkdkQJpvyqY2DEF30XBaZmgvzUmJi/pLsKGWlx3R
         en3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070152; x=1780674952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm1egj7rvNz6E3Ee54JdqUG6bAMQYsYWlFR8JwRKRcg=;
        b=gRuQroatHdQKY6ZsPf8EtN7bXOdH9s1SxMRJYLjdK+o6UeePmJHueSWXCAJm+4AX0a
         AuPuIJU7CTChXnz8YRY6jYNgBAT5WEFIiP0ZIOxSKCScgZr0jbA06l5xPOfhbs949ruG
         aYj7ichJNbUFlCCiwhKDzZjSu6fS7uwsD/OjpsYU9D0tJgf/HEtHM/Bp2c27XL61MfNP
         xdlUYc1m6/H2Oba+LOsE+rbB19vN8JHKCzCuUJ9QsE5c0YD1Z4TufeVgFTUp2IP0Vp/2
         IoDb/5vhmmA4Gnk6ks6XbTBb2I6XpIRTQl+mrpjEr3X3FqESa6nP6mOJZ/LBCdUA4xG5
         UsaA==
X-Forwarded-Encrypted: i=1; AFNElJ/LHTLhX8s7/zlOK60D6QDszFcT1nKREu06ko6fSVcCQnDMsjkcW50/hIaTrLsxbkFK71cpzF5kfsQN@vger.kernel.org
X-Gm-Message-State: AOJu0YxtvsaBx6KkcR73w6EZ9CP1t/EZIJ+TwFWVp3jQWDHt1ECkwrZg
	KTM47ixR3kfWc5/+aoKtayausUSv1T71msmQeas9Udois1mRbgo6AUhh
X-Gm-Gg: Acq92OG0rtIVokdbz8/Ij4y7Jcnpp4OROz8z6SmmG31A3A1UzYozln1bGej/L/x6Rlf
	iP5o+pLMcztqo5r1Bn4Flv+/xPTvr/+lthsiJrq7pDnOoo3fgsPo796mgo7xVvnHl9WDPQVxuID
	kGsABp5DxpqHjDBfAVhVfgFEnMtU62ZgcasfLfm9A1DMgrx3DOHk6/y2M1w+L+CNDt8q24gY47+
	kSDYKpWB2jc/woV2d3ptdNnHV5LRY2oYMbZknh3kRdghWR+7wiErxQNOgezcSJ8kyoj8mU5hzQw
	I7OWw2dilpIznM8zZoR/gAW7HOwexl/+Xf7vecVONhKXOwJrfrASzwGKs2aDaCPFugQk9Hy8Rqg
	UcDrgAzDUne7D81ocoCz1z5AFAFHzKopbbnrLYUr00KCuLHa+Zgc/Mc8FBx0rRJjztGEsnCXmj8
	eQ1JGP2by2VqK6bR9cH12MW8Cf9MnQLwuli/LWOMWjlkj+rgIuZdHcM2uFXLJaBPLrFDCNgHSNB
	dRCMCib7DKGVhHcyhJi+cyTR6EEm5nu0wSzgzfw
X-Received: by 2002:a05:600c:5254:b0:490:9e5b:9e31 with SMTP id 5b1f17b1804b1-490a28c4156mr5150045e9.0.1780070151955;
        Fri, 29 May 2026 08:55:51 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:55:51 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 0/4] accel: rocket: Add RK3568 NPU support
Date: Fri, 29 May 2026 17:58:20 +0200
Message-Id: <20260529155824.3099831-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

This series adds Rockchip RK3568 support to the upstream Rocket accel
driver (drivers/accel/rocket/), tested on a Radxa ROCK 3B board running
Linux 6.19-rc5.

The RK3568 carries a single NVDLA-derived NPU core (0.8 TOPS), the same
IP family as the three-core RK3588 NPU already supported by the driver.
The hardware register layout (pc/cna/core regions, interrupt, IOMMU) is
identical; the differences are:

  - 32-bit DMA address limit (NPU AXI bus and IOMMU page walker are 32-bit)
  - Requires explicit PVTPLL initialisation via two TF-A SCMI calls before
    the NPU NOC bus can be de-idled
  - Requires explicit PMU writes to power on the NPU domain (because the
    RK3568 power domain RK3568_PD_NPU is always_on so the generic
    pm-domains callback is a no-op) and de-idle the NPU NOC bus

Patch 1 introduces a per-SoC rocket_soc_data abstraction (dma_bits and
optional noc_init callback) plumbed via of_device_get_match_data(), and
adds RK3568 SoC support on top of it.  The DMA mask for the parent
DRM facade device is chosen based on the narrowest core present
(32-bit if any RK3568 core is in the system).

Patch 2 documents the new rk3568-rknn-core compatible and the
rockchip,pmu phandle that RK3568 requires; the sram-supply property
becomes conditional (RK3588-only).

Patches 3-4 add the RK3568 NPU and IOMMU nodes to rk356x-base.dtsi and
enable them on the Radxa ROCK 3B.

Verified on Radxa ROCK 3B (RK3568, 8 GB RAM):
  - /dev/accel/accel0 created at boot
  - dmesg: "Rockchip NPU core 0 version: 0"
  - IOMMU domain attached per open()
  - Job submission path complete: regcmd reaches the NPU's program
    controller, PC processes all 135 regcmd entries, broadcasts to
    sub-units, and advances to BSP-equivalent completion state
    (PC_TASKST=0x11000)

Status of end-to-end inference: NOT YET WORKING.  After 12 days of
investigation comparing rocket's behaviour against the vendor BSP RKNPU
driver, the NPU's MMIO state at submission time matches BSP byte-for-byte
(CNA configs, sub-unit OP_ENABLE registers, CBUF_CON0, etc.) but no
sub-unit transitions to its EXECUTER state and the completion IRQ never
fires.  The kernel driver and DT infrastructure in this series stand on
their own — the driver loads, IOMMU domain is attached, regcmd reaches
the NPU, PC state machine matches BSP — but a mesa-side regcmd issue
(or another piece we have not yet found) blocks the final conv firing.

I am sending this series now because the kernel and DT pieces are
self-contained, verifiable, and ready for review.  A separate RFC on
mesa-dev will follow with the userspace findings.  Detailed investigation
notes are available on request; relevant highlights for the maintainer:

1. Mesa rocket userspace (src/gallium/drivers/rocket/) targets RK3588.
   For RK3568, several encoded values need adjustment.  Most notably,
   sub-unit OP_ENABLE register offset on RK3568 is 0x_00c, not 0x_008.
   Mesa emits writes at 0x1008/0x2008/0x3008/0x4008/0x5008 — BSP regcmd
   captures show no writes at these offsets across two distinct conv
   shapes (YOLOv5s 6x6/s2 and MobileNet 3x3/s2).  BSP writes OP_ENABLE
   at offset 0x_00c with multi-bit values (CMAC=0x1, ACCU=0x0, DPU=0x108,
   DPU_RDMA=0x13f), not bit-0 booleans.  This and a handful of other
   shape-independent value differences will be filed as a mesa RFC.

2. The vendor BSP RKNPU driver writes the userspace task_base_addr to
   PC_DMA_BASE_ADDR (PC offset 0x34); the rocket driver did not.  PC's
   TASK_DMA engine reads struct rknpu_task descriptors from there.  With
   task_pp_en=1 in TASK_CON and a kernel-allocated descriptor BO,
   PC's task counter state machine advances from "stuck at 0xf000" to
   the BSP completion state.  This is the most invasive piece of the
   investigation and is held back for a follow-on patch (not in this
   series); the current series gets the driver to a working /dev/accel/
   node and an attached IOMMU domain, which is the right shape for v2.

3. The NPU's master AXI port is 32-bit, but dma_alloc_coherent() through
   the dma-iommu framework silently ignores GFP_DMA32 even with a 32-bit
   dma_mask set on the device.  When BOs for the NPU are allocated kernel-
   side, __get_free_pages(GFP_DMA32 | __GFP_ZERO, order) + dma_map_single()
   is the working pattern.  Not in this series, but might be a useful
   documentation note for other 32-bit AXI accelerators using dma-iommu.

This series builds against current v6.19-rc5 with no checkpatch warnings,
the dtb builds, and dtbs_check passes.  The April v1 series included a
fifth patch ("Use of_find_matching_node() instead of for_each_of_allnodes")
which is no longer required — upstream rocket already uses
for_each_compatible_node() since v6.19-rc5.

Changes since v1 (April 2026, never sent on-list):
  - Rebased to v6.19-rc5
  - Patch 1 absorbed v1 patch 1 (obsolete) and now includes the
    rocket_soc_data abstraction needed to support both RK3568 and
    RK3588 cores in the same driver
  - Cover letter expanded with current investigation status

Assisted by Claude Sonnet/Opus 4.x throughout the investigation.  All
findings empirically verified via BSP register captures and side-by-side
rocket execution traces on the same board.

Midgy BALON (4):
  accel: rocket: Add support for Rockchip RK3568
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
  arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable NPU

 Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml | 18 ++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi                        | 31 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts                      |  9 ++++++++
 drivers/accel/rocket/rocket_core.c                                   | 21 +++++++++++++++++-
 drivers/accel/rocket/rocket_core.h                                   | 18 ++++++++++++++--
 drivers/accel/rocket/rocket_device.c                                 | 23 +++++++++++++++++--
 drivers/accel/rocket/rocket_drv.c                                    | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 7 files changed, 192 insertions(+), 7 deletions(-)


Midgy BALON (4):
  accel: rocket: Add support for Rockchip RK3568
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568 support
  arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable NPU

 .../npu/rockchip,rk3588-rknn-core.yaml        | 18 ++++-
 .../boot/dts/rockchip/rk3568-rock-3b.dts      |  9 +++
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 ++++++++
 drivers/accel/rocket/rocket_core.c            | 18 ++++-
 drivers/accel/rocket/rocket_core.h            | 16 +++++
 drivers/accel/rocket/rocket_device.c          | 25 ++++++-
 drivers/accel/rocket/rocket_drv.c             | 71 ++++++++++++++++++-
 7 files changed, 182 insertions(+), 6 deletions(-)

-- 
2.39.5

