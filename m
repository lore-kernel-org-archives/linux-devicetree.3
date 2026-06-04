Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1800E47D959
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581180; cv=none; b=HASTbiffUaugq1el7TQtiA3HzCCz7EbB4hTxJ6EO07UxX321ogd2uy4Hn8UWqsNCMjlur222GVfb1Qi+21OUIGethnlbt2xp9s39qlLVu74Mn0butLdVmufsdqjeHnysvGClogqulvRCdl9lQhXnT5sk2x0uc8/ONMajc6y9eqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581180; c=relaxed/simple;
	bh=kkzZiYCkVSfi8f32iqCAQiR0M1Dy/LFi3mdUSO+/GKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eulCO7r7sWWrekIA8lMtQWnp/gbA6gsbGdwFfITvYMYRVn9atD3mTXgvuzaeMnfySV48SPPzsrIRDzKB4lrYiPn/se2QxxJUHQsDoimo7q3W/9dBujTF84MTIKCejm+RaxgX04uMM226/BRnHEusrnVGL6YBXUrMJZe1lZX/V8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgxSYSGq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgxSYSGq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac357c55so9033645e9.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581177; x=1781185977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpNHefKtZBMcFXf5tGwuXkoAaa88dbJ1eJ42SBDaonY=;
        b=KgxSYSGqR08iSNGPXOBRK6Rl37exonDLodjn2yM9UaoveRUPFGX0GqLqbgh8ZYfZYB
         MPNOKRPO7gxt7MAOBhPGjcTLig1hMGKCrjPWbbuNfE9cNacVw87a5xByg+rDQ9zrPSXX
         kP7pQ/ynvlWXhEaZhnwL+lWvworNZ8GEbRGj5pXGoq1dT++W3Zvaff51oBY4EwnHGvzK
         5CnxOUXpWAFlPvn/g07sm6WFLN7Y7+yR2SI6SSj5PtkAlKTdNpz6XlO+x91BsZOTVDm+
         VX0OhuN73/lKCZyxOnyuz0xFr0MTzxAB+Fbd/66AeCG6zNsbXAGa4blOr/Ok+VxbLZdG
         ma1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581177; x=1781185977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpNHefKtZBMcFXf5tGwuXkoAaa88dbJ1eJ42SBDaonY=;
        b=QQ771Yp1mSZGgc2vJmbmwMuMUcb7FXXjsEgb+ikFWNMXX9FMbggkDcXkns1O8mwNo2
         P53SutRFEN8Ecs21Ax26x7t9oi8F0PFP0iXMNtL8VGTxrpWzT2hwl9C5odyt58PD0D4p
         c4IoN/z7DG4BEpoYpyzPsA4E46zkhqWUJHROWxs6kBZtyZ3j+prYgKU7eQ6EKwyliYCD
         FroLTsZqNW23yXJcYvcmmWnv92gCpAreLnsM/SqXUlVapmEEPfHDkEflk4zpWXAUNX9q
         Zkwfd8PaBvfbI4kAgkDchLXV/dTDXs77mdlYdFFF6ImApXKotnunLzJ65ZxlqLtu79Zi
         Be0g==
X-Forwarded-Encrypted: i=1; AFNElJ/qbd1mAmXGHYNXDZJaw0dBylvTaGp0qw+tiYiqH/g6W7YbOQ8Nsv9EIGtNN/vYFPizspGnfLWFEle4@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAC//q0taJLZ/nMMxCzBVCO7XPb1Qc76vbJtTACNU2XHBC7wY
	l+YYPb8OKto0ezwf9E3EbdkNUfXNFX8m0Zl+rHMsQhX8iENEs6oio+kXF8Mu8gD4KmvJOg==
X-Gm-Gg: Acq92OFV3YLUDXGylk5TebIoQ8/OnHpGy8cBnDUt4CGfqSdHM1aGR2HHpmBxd8NYnwk
	2enJ5Uz98PR2nQtYZKB8g4fEBvBOa5v636GO21CdKopvXEOdiZMY7Hmb3AtA8faTubFUCmleNx4
	LQxXzfFye+gaZf6pwCJL9vMde7VQ3CvAHpU54ffO1pIVmMvRl8UFcCbfK1IRShUgokj9Dito5EO
	K0MLetg1sLx9HHHCKPu9DVNLpGSbn6UWm5NMCSJjL5TeOGtpGzJVUqUzO2dmNLwHhtdF3aYYD0V
	Qd+1oqxiIjp9jUIS3Z/9yyK+/KspK2FgtBClwJST9hkbnxhil9EUV79xnmq+2Mqp/Oc5rMZzKUO
	8Mfqv+PYFKGAyTRzWQFIFFUOLHkM011VIT4km0PSZGI+NYiU/PCaWoQnbB2xnPoYqjMgxdx2AO5
	gTTXdHmTFaqtWvO1OrHA44WkBrGakXk2d5oNabXqabfA+BPfabYtfD+z3V1trMulpyDwTPwTCTT
	Q==
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b5ed43cbmr130379805e9.20.1780581177177;
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:52:56 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 0/9] accel: rocket: Add RK3568 NPU support
Date: Thu,  4 Jun 2026 13:52:46 +0000
Message-Id: <20260604135255.62682-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFC, not for merge. End-to-end inference does not produce correct output
yet (see Status), so per the v2 discussion this is a request for design
feedback. It now probes, attaches, and submits cleanly on a stock
v7.1-rc6 tree; what remains is one hardware-internal issue.

The RK3568 has a single NVDLA-derived NPU core, the same IP family as the
RK3588 NPU the driver already supports; the register layout matches. The
RK3568 differences are a 32-bit NPU AXI/IOMMU (vs 40-bit) and explicit
PVTPLL/PMU bring-up to power and de-idle the NPU before it is reachable.

Patches:
  1-2  rocket: per-SoC data struct, then derive DMA width and core count
       from match data (refactors, no functional change).
  3    rocket: RK3568 SoC data + PVTPLL/PMU/NOC bring-up.
  4    rocket: reset the NPU before detaching the IOMMU on a job timeout
       (the detach otherwise stalls a wedged AXI master and WARNs).
  5    rocket: keep the IOMMU domain attached across jobs instead of
       re-attaching per job (the per-job rk_iommu handshake on the idle
       NPU MMU is slow and noisy).
  6    iommu/rockchip: clear AUTO_GATING bit 1 on the RK356x v1 IOMMU so
       the page-walker keeps its clock (else a TLB-miss walk never
       completes).
  7    dt-bindings: add the RK3568 NPU compatible.
  8-9  arm64 dts: add the NPU and its IOMMU, and enable them on ROCK 3B.

Dependency. The NPU MMU is rockchip-iommu v1 (32-bit) while the rest of
the RK3568 uses v2 (40-bit). They cannot coexist until the driver carries
per-device ops; this series is developed on top of Simon Xue's
"iommu/rockchip: Drop global rk_ops in favor of per-device ops" [1].
Without it the NPU IOMMU fails to probe on a full RK3568 boot.

Power bring-up. The NPU is brought up through the power-domain layer (no
driver hack): the NPU power-domain keeps its clocks but drops the pm_qos
phandle (qos_npu sits behind the gated NPU NoC, so genpd's power-off QoS
save faults reading it), and vdd_npu is marked always-on so the rail is
up before genpd de-idles the NoC at power-on. The PMU de-idle then ACKs
without PVTPLL running; PVTPLL is only needed for compute.

Status. On v7.1-rc6 the driver probes, creates /dev/accel/accel0,
attaches an IOMMU domain, and submits jobs; the program controller
fetches and broadcasts the command list. Inference output is still wrong,
and the cause is split across three layers:
  - kernel (this series): the RK3568 differences appear handled;
  - mesa/Teflon userspace: still emits RK3588-tuned config, wrong for
    RK3568 (to be filed separately on mesa-dev);
  - hardware: with corrected config the NPU's DMA reads the full input
    and weight tensors (confirmed via its DMA bandwidth counters), but
    the MAC/output stage never completes, the job times out, and the
    output stays at the buffer's zero-point. I have not found the missing
    step; it is not in the command list (replaying the vendor's
    byte-exact command list behaves the same). Pointers welcome,
    especially from anyone with RK3568 NPU experience.

Known residual. On the first IOMMU attach the NPU MMU is idle with paging
already enabled; the rk_iommu stall/reset handshake does not complete in
that state and logs one burst of timeouts before the (kept) domain
settles. It is harmless here because the job times out regardless, but it
points at an idle-MMU reconfiguration corner the rk_iommu code does not
handle on this block.

[1] https://lore.kernel.org/linux-rockchip/20260310105303.128859-1-xxm@rock-chips.com/

Changes since v2:
  - Tagged RFC; now tested on a stock v7.1-rc6 tree.
  - Bring-up moved into the power-domain/DT layer (no initcall hack).
  - Added the IOMMU detach-on-timeout and attach-once driver fixes.
  - Split the driver patch (Heiko): soc_data / match-data / RK3568.
  - Derive DMA width and core count from match data; drop the DT rescans.
  - Binding describes the hardware; added the missing $ref on rockchip,pmu.
  - Disclosed the per-device-ops IOMMU dependency.

Midgy BALON (9):
  accel: rocket: Introduce per-SoC rocket_soc_data
  accel: rocket: Derive DMA width and core count from match data
  accel: rocket: Add RK3568 SoC support
  accel: rocket: Reset the NPU before detaching the IOMMU on timeout
  accel: rocket: Keep the IOMMU domain attached across jobs
  iommu/rockchip: Clear AUTO_GATING bit 1 on the RK356x v1 IOMMU
  dt-bindings: npu: rockchip,rk3588-rknn-core: Add RK3568
  arm64: dts: rockchip: rk356x: Add the NPU and its IOMMU
  arm64: dts: rockchip: rk3568-rock-3b: Enable the NPU

 .../npu/rockchip,rk3588-rknn-core.yaml        | 18 ++++-
 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 14 +++-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 38 +++++++++++
 drivers/accel/rocket/rocket_core.c            | 22 ++++++-
 drivers/accel/rocket/rocket_core.h            | 19 ++++++
 drivers/accel/rocket/rocket_device.c          | 15 ++---
 drivers/accel/rocket/rocket_device.h          |  3 +-
 drivers/accel/rocket/rocket_drv.c             | 66 ++++++++++++++++++-
 drivers/accel/rocket/rocket_job.c             | 35 ++++++++--
 drivers/iommu/rockchip-iommu.c                | 12 ++++
 10 files changed, 219 insertions(+), 23 deletions(-)


base-commit: 52c800fdcf11888ebeb50c3d707f782cc15b66eb
-- 
2.39.5

