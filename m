Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C252F8E9E;
	Tue,  7 Jul 2026 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439327; cv=none; b=JdYCEHZQyOvNJqI+PaB2zicz5//Wfqj/KAeIewP/kBthNsJfjkySHErFfQew9MmcujCqS/zQE/1WDq3t+UsrV/OXNbAKliz5Qt1xMolwq8Ww9iH+E8o5RW+MyskNqthpg2K747L0z90OXHdJZSnAib+UWbYGFSA512aUgBJsAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439327; c=relaxed/simple;
	bh=Mar/IjyYNl2k5CmvryGot5Czt1iXajxPeDD0/orHm60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDlNc/IqMJGkseTxe5VA4i8/Ioi1XmA8D5ggM5/ayXsPVDyJA4TD1IvJ7B1MaOlU+9M1/uTKgUS9YLnEHqYWFaVuP43n+47wBqoXAIp3aMrGmWaObzbmZxr9a1Ud1FSVHlQmJD5ibo0x7DceMPwXn5Z6pkgumNR4uUfx2aaM9l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HrmAgmSj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HrmAgmSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439324;
	bh=Mar/IjyYNl2k5CmvryGot5Czt1iXajxPeDD0/orHm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrmAgmSjnsXID9yOGAFl/PwNk65/CGCPxWHNqqOMyBJLLiJQpEmmTJsT4us9bOiQZ
	 R1s1evjNb2YBqKVeXPith7A6Y8fL17N+a6nmHQ1HiFl9Bor7oRA+UckGMgK0gXb4fc
	 SKdcnw5Hb3RPZCrIQHNUzWB2O28jQ46xVhN+Nwm+Z8ISipwSoiF7ndluEKmWbgBAw1
	 tlvTnRigUVCYm6ztqIS+bnR/MdiSxI21JByhT2Rex5bm8ZAxISiQMMAy2wPDTuNWPR
	 Kja1Vfxzoc4RwQm22AGg36sjOXsdYBRJOF7RuWPWimp4equHJCC6ZhlbFDyw7apOGD
	 1nfFprUo8/d5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E8FE217E00F6;
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
Subject: [PATCH v2 1/7] arm64: dts: mediatek: mt6795: Remove deprecated UART DMA property
Date: Tue,  7 Jul 2026 17:48:35 +0200
Message-ID: <20260707154841.198870-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
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

