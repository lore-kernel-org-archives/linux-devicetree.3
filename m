Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A378481AA5;
	Wed,  1 Jul 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908373; cv=none; b=jZmrD81zG6tbXtoUAO9OtZEOa+KO/FqjsGNj6x+PqhtLEVWvynp6SjMsi/56dx61AQnbR409nuhd1wpvoRfz+iElvz0mnevk88p+8N+aNMxoSbtYZI/I4b8sEKzTU66R/nGhLbz1JVwfIEPQVuBLBG9JE11SSyQ2mf7PpUsnvCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908373; c=relaxed/simple;
	bh=kbx+lTdyEsXZ3uWdB95PP/4FKwIOE+bfq+rrqsUS3DY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KjPn3IL/87LaxgPofp3ArGQy/FUbetgkrh3rT9Ikq3S2I9pAqCRRQfs7J0xZTN9PAOeHHN/6rgR21p0ejoHmj1w62GCQarhoh0HngfmrI0uwrxwNBB2dkMwaqHsClnCWChNW700Hyy48IOzmn1MFTGqVwYP+aVhpslrynXTSZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AYI/d8hC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AYI/d8hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908370;
	bh=kbx+lTdyEsXZ3uWdB95PP/4FKwIOE+bfq+rrqsUS3DY=;
	h=From:To:Cc:Subject:Date:From;
	b=AYI/d8hC9oZArEbIiw8Qcmcpl+xNDRhfM0pWFwibjUAx+K9pGxMbQlQ7KD09z2qRm
	 rpA09pW3tQujBGBMvjx/Chm5ShvccJmpjpOD0P8uk/8O8pgA5Jr9yg/0Wr31/G0xC2
	 g6IVZLgcOtV7rJHvVJ4b2fX5EVlDCPc7cuNmjX25eJwzMPWTb/QZ0XyWaYrKTpXxpy
	 S32+q5bz7jEKhFvJ8xJtv3UqCmiFqkq6n/J6dJALOdUGUDUjWU8CJhFRY7BUkG1ZYf
	 qH+8heL5W6MT1BEP7bcEJrUluTeA2G43BOlV6AvpLHN2V3AfWAjmF8vq77BpJfFi6u
	 SQKlM9KPSTIPg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 719DA17E0CA0;
	Wed,  1 Jul 2026 14:19:30 +0200 (CEST)
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
Subject: [PATCH 0/7] dts: Add and use UART AP_DMA controller on MTK SoCs
Date: Wed,  1 Jul 2026 14:19:22 +0200
Message-ID: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

