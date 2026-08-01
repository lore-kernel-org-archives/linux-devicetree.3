Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927B38B14F;
	Sat,  1 Aug 2026 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571286; cv=none; b=HsfyZbdZ4kjwOE03DeMiX9/f4wlL/wz+BRUNW/2VC5uDqcvsyqVqKhnd2ohtmI0zh2VOSxvBwgC95Seb0p8T2Ql84RNOXBDz2DAcLgPGDQjfWBvVVIKSyVq1Sx3+5JJlHKW/iNGbtT6F3atFZmMm7Rm15uP0ZL2VC6dUb81JlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571286; c=relaxed/simple;
	bh=z3sGawLud+l4FA2CXrq68PbtEUCIJ7UPG+vM6A+KmCY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n12v5jlobYKq4vllHiI7jBdHruhQxA57BB6tv1sDYmhk0sVB68MQGe8vwrclBR5cu6hAo3deMU/FeKWQwuyco7QXQVPq7BHOAvrPmZuWuv554N0mljiG/zN+3f0BTuwCr+Fz/XnVBOYTkl/NRbkIdVWho6ascBZcw2rbLnCI1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4866afe8d;
	Sat, 1 Aug 2026 16:01:10 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add MangoPi M28K
Date: Sat,  1 Aug 2026 16:00:16 +0800
Message-Id: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fbc575e8f03a2kunmbde8614f2070e1
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkxJVhoZSEkYHxoYTR5PHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+

Information about the MangoPi M28K is here: https://widora.cn/m28k

MangoPi also has a version called "M28K Pro", which replaces the
RTL8111H with the RTL8125B.

Changes in v2:
- Add USB 2.0 support
- Remove merged patch

Chukun Pan (2):
  dt-bindings: arm: rockchip: Add MangoPi M28K
  arm64: dts: rockchip: Add MangoPi M28K

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-mangopi-m28k.dts | 412 ++++++++++++++++++
 3 files changed, 418 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dts

-- 
2.34.1

