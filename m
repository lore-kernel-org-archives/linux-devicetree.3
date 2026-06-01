Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A8199FAB
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324253; cv=none; b=h/QnUIV3EyqpNBVK9dvpE18+D5asEcgWM8rUr5dVI9fzFV/Hr+XbRBOjvEJ5AA5EWsXH8OLzzpbCThc8lQEYnFE6HRYddx+CIUESkN6sSyOTPYy8PV6NBLoP+jhIbCZ+R0UxSbrBVCGaRXmB+hTghkUB25dACfJg72aBcotoTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324253; c=relaxed/simple;
	bh=CfhSBXawLCIw5pAgjog9utwi2GWS8lPWYm1QsPdmDv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APdDAIeqp2tedm+vjJbjFGkRFyGROsiWkahdokl4ITOjZ8rF6Hm+a47FJ2Urxn7mDYuDYgRQQibUk4bbexcePbD6W/FmRMcgBMjQU/W+KdRvgALrmPuC7VehXNNwGRr5tDmLzmcm1vibe6XcXvbD5lrouHcjQdK8ZxozQ6nlZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mypftgpv; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mypftgpv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso943763b3a.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780324251; x=1780929051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuTeNvgytd5DXSE+aALIJm7Hb07s4LTBSmvksBZA7tU=;
        b=mypftgpvG13XiuOLJbo4XjFK6AmblAxOl+RbneSjccYWqvHLcZj0yNQrCZL0+5qdaI
         R69+mFAbdRaK5a0Hq0ToNUF1LAUB0abepUnu2X9LqA2dWgnFTCdZ6tjYSE7xk3RevJfc
         VNDd61NCZLErRSEGiL0lSlw+YBMgkrxVxysjxY2+BCqu/CoEdX4vQTsmww/MxUGaiWtV
         AGCvdvXYn4vcWR8qV+5IbS4yz0tVMp2wSmdvBPg36v4QayWTAyt4Y0/AffBpjjI8NEUx
         rynOOsmZCYfvkUZVahro3UoyJSSCYY7OKJjtcyPHKG/79DoPSjw5WmL5aCkevLjCg0Sz
         o84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324251; x=1780929051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuTeNvgytd5DXSE+aALIJm7Hb07s4LTBSmvksBZA7tU=;
        b=m1QrWwzxT6V2QFjrwZyicOS5YpllMV78dfLZis3/26LZHT5hSdnP1qFEZiORKcTYCV
         cjN8gbPQqnqjBOXXWEDi7Libq8mBvytQbtModuxUFcu8rtyFl3foXXsB6MMty7TtIq8P
         /nmELB4cAD2+8OyLjaTeJxeiob9AnUc7tbnZxV1jf/KHcWhuVhxyyeKHg8tprTTtNF5h
         TScy8zuwRBWyqUl8cuJv+bw+xHbK+T36xG8dv/QWKgD+eJKnlZX1NV1u/8dZcyz/zD4i
         hGX6c3j7pSsmpA0SA0GvQY6j2q+vMvp6bD4hKNsFCTg6TyjgEf2JICjvknsLzLBJ0MQy
         exbg==
X-Forwarded-Encrypted: i=1; AFNElJ+dTmOyQFNSsc2Hzjgww/pBYngtRjVH4H5UQ5FYRcnmb5pBie7+cf6wdvQHhNiKi+Nd+9dz+hJspx5e@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1IwrbNRkS3CLb01Oc2KZD/sc2bobbb2Je9fjUABDdO2qKQbv
	N+xoV/51enAMen9b7/s2r1X89camVHrQp2o6xJ96nyazy6HukT06+7aj
X-Gm-Gg: Acq92OFRtqBJ83CX0EKFdwursx+E75SYDqZ0wzFuXS06sNL6Xmbs/Op7gBk3gmRexRu
	/DvasSUFYSAXL2MTl5Z5wFmDBbU5svsaezk7HfRV4X0ZTMChpxpP1eSx99tdjJHI6Xg1VALWcTT
	39qU6MtliWtcvhkNMpSVIeVsp1Wsem8cWBYAACwfPeR1Wlqtk9gF0nRMSskOhvUx3QIYUPjc9H5
	+coGG9fzCNc85EujlYdRVN+yCBYcpxjkykuyW/Qhdu68jJQ7H4qu1zhXd31IzVDlx03ye9gxFKy
	oyViAGpypzRXK2nWiUfU04CriOGO4iu/fD5yniCXSdJjfE38LCO3HEnebQiozGr9+cSshM7OeIK
	DBiibQfCLsVwJAVJ1zqCqFm8DtO9DgxKzLnSJmGOWtryvzL0ayNwB5pt5WA/Hn2QHCUA9NBvSAP
	pKuY8Z/2wAmP0s2d9yN6XKEABPJ74Hi1RULWAoBwb9
X-Received: by 2002:a05:6a00:3d0c:b0:842:51af:b3af with SMTP id d2e1a72fcca58-84251afbb8fmr4269863b3a.3.1780324251185;
        Mon, 01 Jun 2026 07:30:51 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842498819e3sm4910786b3a.34.2026.06.01.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:30:50 -0700 (PDT)
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
Subject: [PATCH v3 0/3] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 20:00:19 +0530
Message-ID: <20260601143022.153941-1-hrushirajg23@gmail.com>
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
  - SDIO Wi-Fi
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

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

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 1036 +++++++++++++++++
 4 files changed, 1044 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

