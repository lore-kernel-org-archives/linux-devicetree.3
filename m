Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FD333ADA0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007272; cv=none; b=TuVgnluBSeTrUKpxyiOVS1oqSYtdX1/G+iFQtAjj7LtJXUDbsXxqvjKND/F7UG1tTBr+XxLt9JRrxOtAs63tuprXWWtGzCiKmp074BsoJzlA7gHzkiO/BUsWh1P3MrZzDX3vaHet/5Iyjr2eJxEiyCTLXAywz/kvSUxfP5YR6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007272; c=relaxed/simple;
	bh=8SEidWmBMJZw4ThA4G4JznuivXysAvp9/T05dl3c6/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBuqUhQo9k2Z9ip7oQitkOl37wYT4GG3e/Dvli/tsF6oXyZv1sQz3bZPNkCgGDzIbUVSzuwLM9ePtzPE2kkovVVHTBumNIT1niwbeJKUVmjzNXbup04odVfyhQro9cg6pgnF9644n5dDIhzFEUZUDCXpss36nT9iTRt2JxYfDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b17ZUTz7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b17ZUTz7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848643382fcso4332481b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007270; x=1784612070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pql5nZoyx4uigchL2F82l2cIvvuODWlbZIdBTSPz7E8=;
        b=b17ZUTz7De9qFBR1vpwjjaNKzBLrvSF4WiDL0UIoV439SNqJBWYYa1Ebnv/pbULJ7X
         8hdysoJBytwoRghSWQMAqixl5ETSqWUN5hIGZW0aLBNSCSwe52IikiKT5CwZGyhFnTbb
         3kK4veSm5kATxYoQ69AkBhBJEcMWIzO0vUrblKv9V7bobPpZsv/gVpTrzNMUzl2W2toa
         IEhdjLb1V0Z2/Za3sz9yh3yDVQ3atAF7iYHX/0VyHrgScAyu3PyCUPKoJ+e9FepkMMVk
         Q18Ro3TaO1Q5MwFqFj03u8Avfx2sdCS8w9iKpoxezP6rvMttgsqnw2BtmShwSh12g54b
         LNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007270; x=1784612070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pql5nZoyx4uigchL2F82l2cIvvuODWlbZIdBTSPz7E8=;
        b=JR5YeWvGXw8wLb7A+5VN2bJSk/Mzt+fYjOK/KUEcLlnas2xd2f0z910qvtZW9MxxiZ
         sG4a/RJO8FsJHJrnMjPi1i83vG4+Xbc6zYPCXqXD/FGgkMbxLLElEwDZJj3hcGAi+BV/
         A05ITIo5x6d1Mc9bp1ZDuKQC92s6ndMrcO8ihRaYjwr7pvAGMF6JUcgj0KnhGguMjRi4
         hUVeoLzAdglUVSuA8q9wfVH/vw227O7C2TikP02Kg1sfdZm4lYpYOCUyI1/ZNuzQe8nl
         IV9k5hN6NhhxTls+knPkDO7z3mVaH/239tKQLOLUehhPEaiZSE9GtBZxUjHNjLvrycZ3
         ULaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPviAmq3oKiK5VuyD2cLAQCGLutNSs/SYbJ/ApY1Z0azg6Yj0pLArj1oYylFDtvMR3Da2yFqJILwmo@vger.kernel.org
X-Gm-Message-State: AOJu0YyrF9DFX16dF2yeehTANaWqMZukUm229N2Oxy7ZL3hwQ5v0JWTc
	E2t4k07rq8g0s+iu/pm83RgISo87LEg+pIVgRSiur6nzii3M0eNfBskQwSc6rcTz
X-Gm-Gg: AfdE7ckDxlgXyrbZtJ8GOEm6Lwd0RBtm97Mo7l7avv5Lk+PWW6Vnasdxh1+VDQQnTJa
	3mrDJ4dTVgR/9ixW6XArNJ4fLx9Ar887grsO38wfKTAPoDV1e3MteKsigVeBtnD33LMB2KMyrrG
	ivnRAcPt+rFYzR28wuyCfr0IZZwyVoaVI13i0HN9t658kpgMEhuS2d4EcBOpgzm4cN0hECmmIkN
	1zdee29L5qD2mmpIK2sibGtgNs0CoyZ6YTlVlOERD/EEZz6O3F1rKMzk4LHjJ+9zPonZFNWtuB+
	FUUgCrwYv60wZcUMvsq3B71tRrinaya49NAJdeM3xmnzWm2UDGO7DuuJuCPgSpKRuVQ0DVneFvr
	wTyw0mNj2zkJrJvGvDh/qJ7vL0cXVVnk9ruYo+4SKbk0eiTM+bk2+j5qYG4K7FUrCD5sFuuXOUX
	3fAsDgJESKW0Th5bLk2CPl
X-Received: by 2002:a05:6a21:320b:b0:3c1:d78:6450 with SMTP id adf61e73a8af0-3c34d8bc7ccmr2897757637.66.1784007270055;
        Mon, 13 Jul 2026 22:34:30 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm33047165c88.6.2026.07.13.22.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:29 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v8 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Tue, 14 Jul 2026 11:04:17 +0530
Message-ID: <20260714053419.265523-1-hrushirajg23@gmail.com>
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

Note on vendor prefix: the 'vicharak' prefix was submitted separately
[1], and Krzysztof asked us to drop it from our series [2]. 

[1] https://lkml.org/lkml/2026/6/24/929
[2] https://lore.kernel.org/linux-rockchip/96c9b1eb-9f8e-430d-9c38-eb4d489d7d24@kernel.org/

Changes since v7:
- Renamed rk806 DVS pinctrl nodes to have '-pins' suffix to comply
  with the rockchip,rk806.yaml binding (e.g. 'dvs1-null-pins').
  Removed unused DVS pin state nodes (only the three dvs*-null-pins
  states actively used in pinctrl-0 are kept).
- Removed dangling pinctrl-1/pmic-power-off state after removing
  the unused dvs1-pwrdn node.
- Moved 'compatible' before 'reg' in the PMIC node per DT convention.
- Dropped vendor-prefixes.yaml patch (handled separately, see above).
- Verified with dtbs_check: no warnings.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: add Vicharak Axon board
  arm64: dts: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 860 ++++++++++++++++++
 3 files changed, 866 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

