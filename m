Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBAE481244;
	Wed,  1 Jul 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908375; cv=none; b=jkof3jfWaO4ghvWGaj6W1a4Nuf8IngViAjdAwKs3QDU3ZSNKCs1Sw3dYEADUXUaNGHMw8bhng3lvTb64ASY3T+I92SqNywU4Zw0NcEDyf1NX99Bpmisb1+8OWb5WRfwGWPm9LfT8mxIimdF6OhHlcYI6xWAoBvQMJWaord9bvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908375; c=relaxed/simple;
	bh=k8gRabJ0ojQ3AdJqjRNNwX5ZebkOglKCv5qFLpZE2uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQ7LBQ+UG7bZDSFycdDcCb/YouDMsQuzZnHHTdExKWj0niFpoKQD8jxtChj8J3K4a/U6O9g4lViqzj0IR6RFVe2iByUiyIySmwAdxcuJlODm9/pnLZiUVOnMpfQg5QeyIczW4Rtsg5yQ+336sZVUSuVnt3eE+ykrCy1RtVzFjio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LwYCS+xt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LwYCS+xt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908371;
	bh=k8gRabJ0ojQ3AdJqjRNNwX5ZebkOglKCv5qFLpZE2uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwYCS+xtgmjY7nAF2fOKzDYcu3vi751HRewIZlIlHjXwAIlFCf/q9M+rAXyxwLVFV
	 3WF29bZlbF48NYN81gUWjaxJBEOqKY2i9CZYsVfyaQeSXtZxzb1ol85uFCKTTr70NZ
	 fbEpuF3dxJr1NPRVD04SEy48qklQAY8MqUWLtE7IIBCNt4Y0EI8dY+vaqHy7jcryB0
	 tByGNzFeSuVggPfQ+OY3pTKl/wTKH8yfBfUZuyI55KSGlFxG2F6IowFXL4LpeoKNgh
	 ii1b+E8rkJo9fPgl2rdDuTlI9rAOE75fRVa1/nYoCjoKGSiYG7YQonfkipjdLfp8V9
	 gt6xsxmVRaqAg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1700517E0D72;
	Wed,  1 Jul 2026 14:19:31 +0200 (CEST)
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
Subject: [PATCH 1/7] arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
Date: Wed,  1 Jul 2026 14:19:23 +0200
Message-ID: <20260701121929.19374-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
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
index dcbb7495835c..2d3db0c6fcf5 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -548,8 +548,7 @@ uart1: serial@11003000 {
 		};
 
 		apdma: dma-controller@11000380 {
-			compatible = "mediatek,mt6795-uart-dma",
-				     "mediatek,mt6577-uart-dma";
+			compatible = "mediatek,mt6795-uart-dma";
 			reg = <0 0x11000380 0 0x60>,
 			      <0 0x11000400 0 0x60>,
 			      <0 0x11000480 0 0x60>,
@@ -569,7 +568,6 @@ apdma: dma-controller@11000380 {
 			dma-requests = <8>;
 			clocks = <&pericfg CLK_PERI_AP_DMA>;
 			clock-names = "apdma";
-			mediatek,dma-33bits;
 			#dma-cells = <1>;
 		};
 
-- 
2.54.0

