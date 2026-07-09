Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3843DB31B;
	Thu,  9 Jul 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588176; cv=none; b=YEmY0prN+goITaUVwsIWs0T2xwIpWKLfPjRxaCmSnJMrwLG8KxXIHEAMpPPrdKx81tSyLVwXiLDTDefUGfZhJG+36w0svww5hdr45b4kITArgsYhIuziozj+3jmPclGVo+DtMy41sOUy/ITYv8Cymu5QAaV05l7WFRBQ3/qzcRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588176; c=relaxed/simple;
	bh=c8jG8dKuHKzZNHv5reXxu0tytMV65aXZ7vtITaZALMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ukT1aekPPRWoaKLcUMrmyZe0EDdon67pFmOeba8tS06r3tLmk3PPNupJ+Ex/+71WaYpXoSyVPm1N29YrxxuvMOTSe7h7xuP9ciM3p+XWlfrqxX8BK0MPE3hcIUjVAf77l6WXiC6Qozyl9V6WZlJdSlpW4EZ70dC04UvO5E2hjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZGXZP0+9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZGXZP0+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588173;
	bh=c8jG8dKuHKzZNHv5reXxu0tytMV65aXZ7vtITaZALMU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZGXZP0+9ha1Cms0Ij3L+Ocz5rsL26qRbEQdewRYk+M5utd2LnhM04Dju/kDNiZvvI
	 zlJY/Juxs+xXvjW8sNT8CS3gQGttOqk52szKRwOYOg6bKuA0PsksrSTENFe9xPZiqK
	 dMZkWjlIU1Gq4zH+2yBuQjxwka3f/XzCoIYfw4t9S472vFml4x5bpWrIKDYsmD+/sW
	 zQz4neVhhwqeGCZjzNiJiY8qDnD2dQ1/xUFmYrZW7J2CQQOO2iJTJ1WwmwkS4mBrOg
	 Fmvan/lhSu3Q/81wYNBlSK9Yxz+xMYAzOH6NtnaX8cSxAAlZ/3WsWsix9A8wqequqc
	 ejDhhA3LEykpA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E65C17E0564;
	Thu, 09 Jul 2026 11:09:33 +0200 (CEST)
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
Subject: [PATCH v3 0/7] Add and use UART AP_DMA controller on MTK SoCs
Date: Thu,  9 Jul 2026 11:09:17 +0200
Message-ID: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
 - MT8173: Removed first DMA as it clashes with the I2C4 DMA
 - MT8186: Fixed IRQ levels
 - MT8195: Reordered apdma node (same as mt8188)

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
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 7 files changed, 154 insertions(+), 3 deletions(-)

-- 
2.54.0

