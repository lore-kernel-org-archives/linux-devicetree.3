Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19462DF138
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330921; cv=none; b=i++ZBwFxBr4IWpFl2O9I0nBHV4F/ncmF/4R4gAcxdphE8Zm2QQdGMoK5aVOBwRPDZ0zIMNnO1F7qYuqEVhe6/PVcKfuoii1i4RomFjLjcdUYL9NqDxkG5M4W8Btn2d6qqCaIIuRDWSdGkXrRv+8V4X2iMLHH0nsnuH385kvJ71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330921; c=relaxed/simple;
	bh=iQIK8FSoNTkE8vkMZZi4lf/YigLKFU44ZupY86mGsCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzXVRv3ByMnJECnNditBnh4zrFXbd5AQxq4qL91ApvyXD17DdGKfKBS0Lpp3QrGUvx2krUF/537Mj1csNVx+p+NxBlRlWgkyK5W0NV7NDxcoRjZBun7rrkk719IIkskUWZ4UeoK0xlATHZ2mPJxjzwqQG8+W+8b6fudnd4A44z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7t3Vxo4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7t3Vxo4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf237e1433so33641555ad.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330919; x=1780935719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nC7fI2xlC+0mnJ55zqPpQ+tiYuAYGaZtwmTC8nFyd+Y=;
        b=a7t3Vxo4CiJBqlKUGxSAa57jC8MqUPA9tvxWkYn0gaCJS6RvZthIraNjM45GOoUJCv
         QXY0vbVib5TA56+hh8pQI79oy3OE8aLTiH9o1fq/afCvR1J/cqpt/9FKVoQfYyS8DguC
         6S8MpAECmURDrZ02mq5wkoEWuxyFwXqUcaUWftT7mhLquYYbkhZtJoEoDxPludeFcbAe
         FPvedDIy2iSRGWU2kEAYzcog3Fte5es35xCOicGtWzSdBYQEgkXzNnR4f0feZXZIWtR5
         nHGKh9bi+Taa79bp4qt2eAfqKCdq+ucXpv1o1k3vpuQBp5OQ12jA30XQzXyHaJoGLBa8
         u7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330919; x=1780935719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC7fI2xlC+0mnJ55zqPpQ+tiYuAYGaZtwmTC8nFyd+Y=;
        b=Qqytn6DV8PR2CK51IYVeiBM4Hli37vByE4r/Uf6ZKP2AuexugJtrtqeoB9kX5FjMRD
         t5mXhE7dauYmk74A95C7FbLxMvfeZP7iWKRSC/USpdjon1p1wqK6sET9PM5d60kebdBj
         czqu75IXsiZMLZ4t5aHaB7niPeDsCKnI2hN4CYaLUtDsiVP4cxD9bkNvYm0L9DMB+97Q
         NsLwh23Bn8ot4/2xsKt294paFiiyTqzgicDeswI0FeqzDZLOxoIuJEK1ptTXW3y15ozA
         TbPHjCH4+wRnBDKcMKN5kKEje6CeBaLwV7op5FoeIzc07fYATMnUNTtvHwMAEayOUiG1
         O3rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RKnpOYQPelFH5ZJJOd+/LmDopm7qT3HBqr49AJlJ9F5D/J2hnHh99ZfvslR+gRsLw9NEpBZqVLId4@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5vTsbl5FuxsTcdSprssomeb1WIkEX0FJoj3mJ852fj/VQ0zf
	MzTi3VjYX/3I4cztvpkdxTaThlGhePRwQZghR6FHy8Eds3ei/JaBXXw3
X-Gm-Gg: Acq92OFwVm/QYMClEB5M4A98ADEA8tt7fbScA3ePoiVO5wKm+Y+Vif+lQUmvfZgqQiI
	rhcboSYTz/5TUNR0vM35jeyPJZqV7vf4Uigj7wlGMUxHtxLqqf5f/R2XUCcyI1VQ/oonvbIo1Zz
	brx9D0G04cwTy1LSphv965e5aV71KIF5kmeJZWt+aYdSbZHXlznk1FYnXU07vJbLQR1jiwqY1iP
	1QJqtIgH9pjpAGY4ZFv5fvxXvrTHXnPP01x7SEBKHML1CDGb26BpDzADFXH7oIoa0hyxMikGvME
	VTItyxHKcPvmbXIPEEGXGLsxgreM8p5P4TpdxQkUbZ6aP7QqDfYJBipw8I89IZ3wYxP24V3/H2a
	EL0t0rT3cYLw1ZcG+QFDbfXz8ZRjcsIKptrAfSeb62N3tCpqTQhIUrlGSa/ia3WYrdz3wAM9YSH
	g0k2Z5qc4g+52mLXG6jZpv8nzLSJgYzU2crXpS89Yb
X-Received: by 2002:a17:902:e842:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c0dd75eaa8mr57620815ad.5.1780330918890;
        Mon, 01 Jun 2026 09:21:58 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm116647455ad.8.2026.06.01.09.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:21:58 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v6 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 21:51:39 +0530
Message-ID: <20260601162143.170030-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

Changes since v5:
- Enabled `i2s5_8ch` and `i2s6_8ch` CPU DAIs to resolve probe deferral issues for `hdmi0_sound` and `hdmi1_sound`.

Changes since v4:
- Re-enabled `combphy2_psu` which is a required PHY for `pcie2x1l1`. (It was incorrectly removed in v4 during the unused PHY cleanup).
- Fixed alphabetical sorting of `rk3588-vicharak-axon.dtb` in the Makefile.

Changes since v3:
- Completely removed `sdio_pwrseq` and `wireless-wlan` pinctrl nodes as Wi-Fi/SDIO was already removed.
- Removed unused `u2phy0`, `u2phy0_otg`, `u2phy1`, `u2phy1_otg` nodes to fix orphaned PHY warnings, since the USB 2.0 host ports utilize `u2phy2` and `u2phy3`.

Changes since v2:
- Split the dt-bindings patch into two separate patches: one for the vendor prefix and one for the board binding as requested by Heiko.
- Removed invalid `enable-gpios` property from HDMI nodes (ignored by dw-hdmi-qp binding)
- Fixed copy-paste error in `rk806_dvs1_null` pinctrl node (gpio_pwrctrl2 -> gpio_pwrctrl1)

Changes since v1:
- Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
- Added binding patches for the board (rockchip.yaml) and vendor (vendor-prefixes.yaml)
- Renamed regulator nodes to the standard `regulator-name` pattern
- Removed `mem-supply` properties and phandles from cpu nodes (vendor-kernel specific)
- Fixed pcie20_avdd0v85 vin-supply mismatch
- Removed obsolete `regulator-compatible` property
- Removed invalid `regulator-init-microvolt` property
- Removed dangling `enable-active-high` properties from fixed regulators
- Cleaned up unneeded i2c3 / es8388 nodes
- Added missing `vpcie3v3-supply` properties to PCIe nodes

Hrushiraj Gandhi (3):
  dt-bindings: vendor-prefixes: add vicharak
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 991 ++++++++++++++++++
 4 files changed, 999 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

