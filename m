Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F52D5C7A;
	Thu, 20 Aug 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220040; cv=none; b=VUU9WgZVHfQP9mpdwBHn4Vz9L4W4AdS8MjDXZzPmGJj9lZNlfvnVwOfKD7IKCwb1fLelM0Cst1wvz1RiNw0j2b/0POhzYAcd5gtwmUbATujgvXkdt6TKx9DuWflE1O450i1MS60WOGIkSzY2Hs/pjduQg5anXL6VVj+p7v2kAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220040; c=relaxed/simple;
	bh=CBsVOGG5n6M4H7yBLQxcxoo1yl03McYSyvh64RwqlXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kSnnG1EXjmz2RGnrK9tEGTQBTV1i0I42wDmQmJu51GrTXA0w4oc/3psVD4a7nHmg4jMPdIsQ17s4cfAl48czfvj5Fiq5U9Bs8MXt1r3S2imVanWopS+K6rav+ZQYoNVMn3x91oXBfCupzGpPRfXspC1w7sGGW4fI74ova56pCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ab3c2730;
	Thu, 20 Aug 2026 18:00:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add Radxa E54C
Date: Thu, 20 Aug 2026 18:00:18 +0800
Message-Id: <20260820100020.3370385-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01e9d73d203a2kunm5b0a804aa4754
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkJOVkxMSEgfTktDH0xPGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG

This series requires the following commit in Linux v7.2 to make the
switch work: https://github.com/torvalds/linux/commit/9da2c8672f77

There was a conflict between eMMC and SPI Flash, so the unmounted
eMMC was disabled. The schematic can be found below:
https://dl.radxa.com/e/e54c/hw/radxa_e54c_v1.2_schematic.pdf

The following functions were tested:
- Boot from SD card using generic-rk3588 u-boot
- USB Type-C connection to RTL8153 network card
- USB Type-C connection to USB 3.0 drive
- 2x USB 2.0 and 1x USB 3.0 Type-A HOST
- RTL8367RB 4-Port Gigabit Switch
- HDMI 1080P Output
- Button and LED
- PCIe NVMe SSD

Changes in v2:
  Collect Reviewed-by
  Fix adc button voltage
  Add domain-supply to NPU
  Update phy-mode for switch

Chukun Pan (2):
  dt-bindings: arm: rockchip: Add Radxa E54C
  arm64: dts: rockchip: Add Radxa E54C

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3582-radxa-e54c.dts   | 1184 +++++++++++++++++
 3 files changed, 1189 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts

-- 
2.34.1

