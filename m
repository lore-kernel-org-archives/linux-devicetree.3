Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8FB3E9C01;
	Wed, 10 Jun 2026 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085928; cv=none; b=fIE4+T0l2XaNNSmjGhWvWl4/G+QYim/8qKn/sFS7n6XtAUBMA9v8O2d/qJWEXeZjIB+O4eU8RxkxjCB3mY2Rl7BcmLiUyJUGoahf5idZ0XX2k+YM851eWhfKue7sze+co8bNlh0p4tAtWZqvRxJhHiRo4Bcc+f8Q7Cc0Qon9F94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085928; c=relaxed/simple;
	bh=tYSOZ/qMQmRababuU2dimq0ZCbW52Rb3Mm25vEKkM6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ejPEYt7+sb0uHwDYmZkCpm1IIegacLKshHk5QIbwMbkPvMphxNsS+kInOL2OwJDL5EKXlR0bxZ9EkUvv9dVa418KcY5uHiRKFhPZ9J6nTD2eZTf8MPSROKjTWdLDwNRm2VgGe41odgnR0gG9St/qJINsVehyXF2e3sP/0USSe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [113.80.141.92])
	by smtp.qiye.163.com (Hmail) with ESMTP id 41d5b4a75;
	Wed, 10 Jun 2026 18:00:10 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add HINLINK H28K
Date: Wed, 10 Jun 2026 18:00:04 +0800
Message-Id: <20260610100006.366963-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eb0f9a2f203a2kunmd062ac7916b4cd
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSh0ZVkkYGB8ZHUlCGB1JT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUJJWVdZFhoPEhUdFFlBWU9LSFVKS0hLSk
	xLVUpLS1VLWQY+

The HINLINK H28K is a dual-gigabit SBC based on the RK3528 SoC.

There is a version that SeeedStudio distributes called LinkStar-H28K.
It's no different from the HINLINK H28K. The schematic can be found here:

https://www.hinlink.cn/wp-content/uploads/2024/03/20240428015024130824.pdf
https://files.seeedstudio.com/wiki/H28K/Open_source/H28K-SCH.zip

The U-Boot patch will be sent after the kernel device tree is merged.

Changes in v2:
- Add USB 2.0 support
- Remove MangoPi patches
- Improve commit messages

Chukun Pan (2):
  dt-bindings: arm: rockchip: Add HINLINK H28K
  arm64: dts: rockchip: Add HINLINK H28K

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-hinlink-h28k.dts | 318 ++++++++++++++++++
 3 files changed, 324 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts

-- 
2.34.1

