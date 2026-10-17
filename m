Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDD3C345F
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260108; cv=none; b=YD3FnDXoLJFrFw05kYNv9pnfX8YqvTB2qqy2LRNFSC0kQEa8ip9EXhWSkPnArSmC74k+8gK3JORJ1tvEfURiXP0hih0qiHfW1M1uw4J/gMtlJAnAIoYbVGyG8X5apJGwAv6J0OGeLmGjjS7lz/3wkWOQYpUow7dEXkgN9rCm3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260108; c=relaxed/simple;
	bh=OC28K9DeVAvdNt2i4HLQhvj/9KpHA1D851pZfGYKe8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLjsYZwZR/nXh5GLAjELYj1Ax3s2LIm8mY/Cc1vh8nZO/+nHFXdJaCH29qky6fztKc+HTj5rIJk503/6gkAAXgZH4FNeH5TbVoVKvsPBzua7QAlz90OH727I9BtOk+7HQAR8uD1tql2BWttUjOkZs8hAsDefrlDN7MKXQOF+YOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+cWFWCd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+cWFWCd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so4167225ad.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260107; x=1792864907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=A+cWFWCdgw4rdM/pG6koANtVAvZ0B8JEN3xJ4Cdoz2SnR7QhCFGVoKJgalJsq1CQJ9
         mczG4P90fCEKKj8xwxykbNN4L/ILvGabfR1u7q+RRPmOMHzAAe0YP9epGl9XEPpOlrvI
         x5eVe72vgkO2kdsJNS7qqRVF8dcJ8qtBaYPJgtRPvzh5Yoi05bQzbQYPXtKIP2Btm0Do
         K8voe9TzJH+4mWfuEGZSd7VgtsqLHcbwpGg4dYED/X89dGX9/yQU2hKWrGvpbw9HD1YH
         zKg5SJbtHqXbjFuPel52Bws4l8KbzvUAcK/ZOKHAB36MhXw/If1XxAx2/ZlytesGzc3r
         lJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260107; x=1792864907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=bumewyee+Uw70WMOqNjvIDu0nAeeRi3HfTu0bM35Mw9RpcDuiRvuQgGARpQJAooglz
         AWzqdDmJm3NWs7xn30JYrmjWbemt6AlrVw+bhIdqC0gRVjTgjglAtmyjvEn4s+eMercA
         3Zsim1kBwA6ef17Ix+olX0gdauuU9p01QEfNkZb3db5phD/mvnZMR9CNYnCiO2ugJOee
         DB9C3KTZm8HQWPilaQqSKElttOqwo4EIkXYSUBfvSk+wyc9CNel7R07majTl6RgcGsTR
         0KswH14SYhlDBrUKqKrdiRXQCL/1xvAibvAIFLHfMBGuKWUDnpbRzbFSzhtk+K/USvMF
         qRQw==
X-Forwarded-Encrypted: i=1; AKwUvBwah46xWa8hv61/F30OIkgpb65MuJ79GJUJ+zV0kzcLot0197d4WFJsE3Jbcgt/NuRm/nlhCfyndPWK@vger.kernel.org
X-Gm-Message-State: AFq9FYLLngVSH54ndXe7tnTVKqWfZEba19Hm3HBvIv+PEUHtHwZQ1+6O
	SvBzGQXUDX0jqUBQD2AtF/WKqzQD2dTFwehi+qHS8UhoNXl2ndVRtDKv
X-Gm-Gg: AYBFou1jVK25JmhUmDvLGHELdiedOK10ay6hyuIGUbdpWalzfqKYxm6t0rO1PFOFOq5
	2LfDOn/OBHtanZjhFlIVYHTYdf0Jqa3tCIO0SkrsZGVrpQOyCbk9iuX8kVBro+Kv/inazpJQgMB
	rL8jKuBRCMyGRirBi2AZtayxdPmE7e0reQJ/pKcCPhOhgq6NwCM127yxfOfNY21Ytm89C+PTDHi
	FejQWm7nfm4+wh/xKY1EtVO1pcPtUG2UluzPMijUgzTpwzJocVRLyhSDx7KMFbx/CpjC1hBFgjc
	kQpP5tth9c+vU9ZdLONfoII/A+b1S17DKzxLR2tiJsCfQTjwEcYBMrTQZCOMJa9UM26FOZ7zsCv
	YLE5Wa+0fCUZkB+nMM80dZN8Cg6tbIAg/5UiZmEaDXhLN+/HM6R7VsygQ/FR0yD+sYYV40rP/OW
	bsJzm++pC51jWBJ+iFb8o/GrhrzxWnGT57QuWfmcy9GbHNj4cmGVEPUyUG50U1Rlnvjnk+J/8Rw
	Su5zTgz6tHUBFOxYHhu0l34W4qOsWXO0qbfbNqlD21QygGWoSriETL+BkQQ3kgsmFxhl91YDgZh
	Fb3rdn8xk+E5dNajPridnedmJNUo9SEX30qixf4Ny5Cj/9AXmbZwxw==
X-Received: by 2002:a17:903:a90:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e9a6833906mr30171515ad.3.1792260106924;
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:39 +0800
Message-ID: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi, including i2c8, which every K1
board uses for the PMIC. Patch 2 tags the board-specific EEPROM and its
bus, the PMIC rails and the SPI NOR on the boards that have them. The
set of nodes matches what the mainline U-Boot SPL tags for the BPI-F3
and MusePi Pro. Pin control and regulator supplies are left untagged:
the K1 SPL does not enable SPL_PINCTRL, and neither the P1 PMIC driver
nor the SPI NOR and EEPROM drivers look up supplies there.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch, where buck1 now carries
  the buck1_0v9 label on musepi-pro and the OrangePi boards
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  4 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 13 +++++++++++++
 7 files changed, 48 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0

