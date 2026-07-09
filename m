Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1223E9284;
	Thu,  9 Jul 2026 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588177; cv=none; b=B725Nysp8qpAJg/pweGeatua/kX2qPVwQhdlMKtuIKN6yp5+I+UFKg/nsNYga070c8jQVOXWphX7xqHljSD77HHuLokFIKAQGXZokIiTU2SXhfpjqBHTMPaEkHG65hjzlsSDUbrdyhHxRreL2tdbN7u9xoeD3dLrXYl3pK9U5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588177; c=relaxed/simple;
	bh=Mar/IjyYNl2k5CmvryGot5Czt1iXajxPeDD0/orHm60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANe9Xtxp/mDOB+YQayi11hNqJEQHhdTQhjpxj8N4cZX3TAbfDIXoQIng/uqs/HTe5LKal1zx5TLEEPNf8wKWy30hHmoWa7SQRKe8an8qGs1iOYbopliWDiNLfPu9TiwzcFWMCwqjxWJzb5jGJ830QKQ3YhCPWn3nZ0MZE8Iv8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UscovhSE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UscovhSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588174;
	bh=Mar/IjyYNl2k5CmvryGot5Czt1iXajxPeDD0/orHm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UscovhSEgE9OWFcvoR/LAjwxZriz4UfJVXiKh1xC5NLQ9z5dVWzAkuOevR6Qzj8qp
	 KypZGBCFsayu4wLO2la9xvWqg3T0bq+t+nnfmUdoFYTwzpbKb1qbW3Da9aajkb71Rz
	 w9+sCHgLPVP4uHkxwn5PHoMr1Ks1GUSg9gZJgOHfUAg28UTs6tr6Famu8UfFkccSfj
	 rECcv1LGnFej3/z4hOfpoLWh6cCZ/+9HQFR8CylW9VimPOoXVcOjOPrcLEjVX71124
	 gGtul7dfRbpUE9GtsGB2DTFhi2gn1jIDQgGqjsceVf7IXlNbttRHKH62JA1Hzz/P1V
	 Hjxj7zsmP9fPg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1D8717E05E8;
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
Subject: [PATCH v3 1/7] arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
Date: Thu,  9 Jul 2026 11:09:18 +0200
Message-ID: <20260709090924.27056-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
References: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the mediatek,dma-33bits property as it is now deprecated
and, while at it, also remove the fallback compatible as it was
not entirely right to use anyway, because this IP is not fully
compatible with the one found in MT6577 and would create more
issues than the ones it could resolve (as in - it's better to
not probe the controller than to probe it and manage it in some
incorrect way).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 134cfa77e3b1..6dd706b27830 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -547,8 +547,7 @@ uart1: serial@11003000 {
 		};
 
 		apdma: dma-controller@11000380 {
-			compatible = "mediatek,mt6795-uart-dma",
-				     "mediatek,mt6577-uart-dma";
+			compatible = "mediatek,mt6795-uart-dma";
 			reg = <0 0x11000380 0 0x60>,
 			      <0 0x11000400 0 0x60>,
 			      <0 0x11000480 0 0x60>,
@@ -568,7 +567,6 @@ apdma: dma-controller@11000380 {
 			dma-requests = <8>;
 			clocks = <&pericfg CLK_PERI_AP_DMA>;
 			clock-names = "apdma";
-			mediatek,dma-33bits;
 			#dma-cells = <1>;
 		};
 
-- 
2.54.0

