Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39147199D8;
	Sat,  8 Aug 2026 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176042; cv=none; b=M/HI9vV1F6J/t5PjBt3r8uJnnIlYjb0PNk2sMIrHhvhVRZBfwFfcY1WAcRmgr4R3e0qwMf/dDak8uXxsfbjR9VU4zkZUXv0XA8BgihDvsn9YDWroQ5WIjXUMZRRGv7+jTtNzwKYtqLW5otmTVHcpRR1sSPNrEcKq1pn9wylS0nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176042; c=relaxed/simple;
	bh=35ZKdjPmgK6cusKiwBXaavfDUH/4iE78oP3DaRArWqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lv7kwhXnlBQF5Oj8KQ7kMcUZtt8B7X2Wm7FmglrNGNOaw1BewNvDUXJ16T4UoftxV2pZj3Z4RfhR32o/IBMBqMDGoZVUUkvnmDV+KpZslIB8OtfoVvgZYIVZSa2LLiJY9nezopwLipXdMbetXjgVWfbZYwBfCG2S+GXhfrio+5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 494038e86;
	Sat, 8 Aug 2026 16:00:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Radxa E54C
Date: Sat,  8 Aug 2026 16:00:16 +0800
Message-Id: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fe0633abc03a2kunm975b5a9f61259
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHktJVk0aTExKHktDTB1JGFYeHw
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

Chukun Pan (2):
  dt-bindings: arm: rockchip: Add Radxa E54C
  arm64: dts: rockchip: Add Radxa E54C

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3582-radxa-e54c.dts   | 1182 +++++++++++++++++
 3 files changed, 1187 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts

-- 
2.34.1

