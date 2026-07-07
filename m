Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D1733859C;
	Tue,  7 Jul 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439326; cv=none; b=jLskedFzIvGkJkKJk3ibtX9yNiUZAWpsHE97wjPhh3QThAYg6Z4rjJT/LrierKUlBNijGC44Fv+W+V3WLpW/AwEupAbGpMSarPtoO10kvkz6IjgyEghprsxWfyddYqDzV0klHkMTLOlq8XyEHEsE/To0sCHEq/X7zcgjPryn2ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439326; c=relaxed/simple;
	bh=8gT46EyjBlfYuZbNN5epCdtUQ9QymVpdD4NSdErheKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bnfY7GjUiTk18PJoSM2zjr2PwXxQWncK2fJLt7WxL5bA+1Vlvpv+F0TpVMoQbx2SzKmWKk5rBwM0Juz9tNkZH6HSof5shlkUJbDc9dgVQdoXEqVti/rzW9Rf+HXf4glDVNukbbTFFSPgYmzkuEjgxuBVM8xRW89laL7x/IiimuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NVXuIkGR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NVXuIkGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439323;
	bh=8gT46EyjBlfYuZbNN5epCdtUQ9QymVpdD4NSdErheKs=;
	h=From:To:Cc:Subject:Date:From;
	b=NVXuIkGRkNj8en88XgSrcPw2VkHfe04nh0XKpmCBqbvMIESGVjmvQjY6zDhgc/+m+
	 N9Tjh/g9flqlC51oawWu2bG1Q3Z02icaebkSrx3HNeqg1p+GbcUgNfWiCwRwv3IeXN
	 4MKe0U7EsHfY8qyN8RGavSfcO+I06MSOxY+erYNlhqYhN0wtL/av5wveT2hNy58iyL
	 nrYczeURKlipFYCYGKeC494q19UipLiQ9Nuhg0VWDQ7Q4u+dDjy+P6oqQjsos3sDcB
	 QBuGpK3HzIlxryifmr7NXEX+qFBTt1X/V/5kLX+yfJaRwhpeYqi9YwEJgshVYN8XZ9
	 uEcY9ADsoliIw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5669617E0076;
	Tue, 07 Jul 2026 17:48:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v2 0/7] dts: Add and use UART AP_DMA controller on MTK SoCs
Date: Tue,  7 Jul 2026 17:48:34 +0200
Message-ID: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed node ordering in mt8188
 - Fixed interrupts in mt8173
 - Fixed interrupt cells and fallback compatible in mt8186

First of all: not all of them will use this and that's sure - but the
devicetree describes hardware, and this hardware was not described on
any of the SoCs that support the UART AP_DMA controller.

Besides, there is also driver support for this controller for all SoCs!

Let's add support for this IP in all of the SoCs that have it.

AngeloGioacchino Del Regno (7):
  arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
  arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8183: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8188: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
  arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller

 arch/arm64/boot/dts/mediatek/mt6795.dtsi |  4 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 27 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 7 files changed, 159 insertions(+), 3 deletions(-)

-- 
2.54.0

