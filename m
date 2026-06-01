Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821D93A3E95
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320350; cv=none; b=mpLZr7jEPoEN+5JoExQRuWnzW9DUfqgqYOWdV65yaPhM0ONpZXoYK0WIvNfqzkhyxBxFy4+Sv7o1JOSNathYBycqSyFvmW2xv1Vkdcpm8J2f6jTVN5rHEdon3BRe4PcN7KBlYe4wHGrONfElswDvbFiEcePBLbaJZom7El+4DoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320350; c=relaxed/simple;
	bh=+KtJDTw3OjeQ7kvSgmwW4gBWZ+mKdjd9X0qCSN4+Els=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQZZCt8VuEts5EWcwzOM87N4OFu86HRsbAMENPbr2RpcoxlGIrE0AQBhfddbEQax3nQKqF7ypiPdXZUn0si+hUKCRxdCItvIaNy7ouK2aHNb4DafOKbwqwLeua+V8igud2zKwwhFi6dUYBSgUazb1Zw7561cUXlkHqNKuWS/tlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IloNb872; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IloNb872"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso3006161a91.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320349; x=1780925149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnHBZf9FwnOpjIKwf/TmkrH6aiNn+aT//tH7U9Z8tL0=;
        b=IloNb872ChD+6NYy+MeKTM1iOL/Mv7+UHev1CB29vIohCWoYj8INb67gKNNgvMn/a4
         XyElynRTZh1jEnoBw7NIH6Fp4YkSWL7KoTWChoV6yAYgMuVJ5WB8R4F5I0Ndt3KrdtGA
         lvH/an14qVzf0b+XK7F8j2J5VZdShHlth1WX3Y0WoMaplYCNr4Te3whiVKxnWMnsXwDs
         zWn6sNx8sipEEqj8ng7Hmec62uLSXhwMlg+iJOOOVIw468o1Al4TPy/czeE0iLB96Dj8
         lkmzMWh4bSpkaOcgIQxkaSIWTk65wUZYJCjkBrZSnh25Xb4EenDPgPtevxbfRTB0a4EP
         IfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320349; x=1780925149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnHBZf9FwnOpjIKwf/TmkrH6aiNn+aT//tH7U9Z8tL0=;
        b=KuAPiNyWdiOQn4lb4uoO8jC9LXQq3RhXJWemWpQjP2OwIoVXquoI2yrrjur7AoQyJL
         KcPHyQz3/B2Ak1i9kOdAP3FQgo24coJrMoAa6Rkgan3lgg9M2RoriWYnEyBp1lv2Guo6
         amkkOCzfob7J3FwAmwsmzY7EmUv3TTVH8BMWb+0BQSFDrjxXcCC/pPSZvbpkh4MrLlVN
         TQmysxPnwYYUPlrl/yKlsDcefWpPMDNicmooR6soOOCxK8VQMDxA+16RuWSXj2I55nJb
         fLdoIbk+TAy0OPbmGQnxBW4XZfpeoL4J+31Jk7HSrclTgch+xhrSLZdri4+wBQOZ4Y+p
         1gIA==
X-Forwarded-Encrypted: i=1; AFNElJ9b7c/hBJ5+lBDUK4XSRhhWr9QEcxXXAcJZyllzBkq8ucohfJQxhH+cflMs6W2UfpicrxNHt+C1wu1k@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJd1ahn7F0cYfNiDTJ8ExgmY68BVruj0FjUHoUh5qftdzE/ch
	EdWES3AuXLJ8tIWCnucBF+CWCLNPnQsgDi9grox/slPDJjpM91V2MvVG
X-Gm-Gg: Acq92OGhoonJHpIjK2UmrjwKUmrv5UOonA8d24fV/ERBYnvA2/rf9UpvhFfj4e9Hxr2
	k0nlWpxACasxdJRPAz1OeBtduHiqIcJVAWc8xHIn3eFxZ4QBJI0mD+un0l8XAYy8u77JN7MkCwQ
	M5g8YYQSs8y0tw52ePKjx2Gvu7Cr7txDUrc+HSGwNkQpklk5ZihvE31m6qDRG27YR0KkGG6/ZJA
	sCcL9cj0V+maOqqS+JRXYwnwi2UFYjKNbBvVILwj1vryFaWPss7gqY537lqmaWb4iR2ZX1xOG9q
	F0JyrycDZ9JlfT+XJt6K5bh55uUDp8A8YPMGuB3hVMTMzyaH0bVW2QzGlWCBQnBI/rVJtSoLBhe
	N4iQfQPRlzwg7NpKPAMGLW1bOwCntv8J/Ck5I5nKGazRFQPpQAztVu/BLKHR++pJOMOeGV8X4Hb
	cfyEmsiGWooLf6Bkm1Xe9sgISh3jJcs/xEz6kcXDEy
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr11081482a91.17.1780320348705;
        Mon, 01 Jun 2026 06:25:48 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02d0a22sm11444234a91.8.2026.06.01.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:25:46 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 18:55:27 +0530
Message-ID: <20260601132529.139172-1-hrushirajg23@gmail.com>
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

Hrushiraj Gandhi (2):
  arm64: dts: rockchip: add Vicharak Axon board
  dt-bindings: arm: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 1038 +++++++++++++++++
 4 files changed, 1046 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3

