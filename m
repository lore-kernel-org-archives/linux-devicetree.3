Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C7403B1B;
	Mon,  3 Aug 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760824; cv=none; b=lrCAhnJYplc2TYqlG2Fl0nXBe09dsmypIxc7wz9JFb9c5LTPJu8mbFpR+2NwuLfZlQGKvs0aGN8d1RLD1jR9uEyi3NvyTZSpigevSJ7u9id/7sDAOkCLiOEra881u4U004EMWvL2WRYbLyvDBwC3pe1ngbykddQv0r4Ynr4BEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760824; c=relaxed/simple;
	bh=1fPHYSPWlpVGJCK9eX/ujdFr83qCBTf/PIroRGp2Nmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QYcsQtVUsrwuAp1c619rYbNw1kRDbswwLIHkQtJK5rMPOPdiaoaRWlLDv/dgYGZR20SeRecdXLIRV6YP6Kpc1eCLFgBC2ICF0vOh2V1+PibKqHp+uQZ/lLhMAdmRyTF0+NwFfG4pd7T8dNQ8sELYylWgtC0dH3oStCyY16UxpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4895a4bee;
	Mon, 3 Aug 2026 20:40:09 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: zyheihei_123@163.com
Cc: amadeus@jmu.edu.cn,
	andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH] arm64: dts: rockchip: H28K: release RTL8211F reset before MDIO probing
Date: Mon,  3 Aug 2026 20:40:00 +0800
Message-Id: <20260803124000.840861-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803104646.26836-1-zyheihei_123@163.com>
References: <20260803104646.26836-1-zyheihei_123@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fc7a3819d03a2kunm7af09f8f2859a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE1CVkhLHkxLQkJOGklIH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG

Hi,

> Release the reset from the MAC node via snps,reset-gpios so it is
> deasserted before MDIO scanning, and drop the PHY-node reset-gpios (a
> second consumer on the same GPIO is rejected with -EBUSY).

This is incorrect. Has your uboot's DT been synchronized with the kernel?
Normally, U-Boot will reset this GPIO. Another way to solve your problem
is to hardcode the PHY ID here. However, considering that manufacturers
might use either RTL8211F or YT8531, it's best to let U-Boot handle it.

For reference: https://github.com/openwrt/openwrt/commit/384127320e0b

By the way, you sent this patch twice within two hours...
