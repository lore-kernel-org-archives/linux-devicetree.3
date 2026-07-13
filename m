Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE537A85E;
	Mon, 13 Jul 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939096; cv=none; b=cj9rI0n3hz7pNbE4gPHYEKPEZGkALX+0mOWJJoY9vUt7JYmOGyrbA7HQslhKpjpEcTQdfcZUjt506YmiBqth4TBq1+qgWoL9uAd8/+l4olUC/HgMN3xgeA0omx+ya6Gp331uKmHcZWQ8LHSoq5APzDy7rkypsCbmXMaWUY0cCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939096; c=relaxed/simple;
	bh=j5lGbsuNrMuX2/MBNskiphqCbXX2IsyCVQqLudRvkx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSp/620G/CuftuTeseXszCmEm8AWwEl7DpTXA/bIRegDAuZUEaNzYmbwxLuq2KUOhHtq9NK2tFq1lWqaQMBCvNoltJHAw5jWJjhcHHxhBklbS1WT7wwBKY6mUii9Dy6Ok+RDFF2mb7MpITgmbP05Uuf+5ZaYQYx1PQYEcpDxf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ip+OlFxP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ip+OlFxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783939093;
	bh=j5lGbsuNrMuX2/MBNskiphqCbXX2IsyCVQqLudRvkx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ip+OlFxPewx/MeOw5CRAZNfD9gBfEHDjiwiVUpBB3PKns7El48CnNmZxaus4X4+o4
	 PCq3cX9/B2rqMulQCnSO4OCfMKHzS/RmmsyVRrSRPLhyh9B8OTvijFfswPkUagItYU
	 ne/Ua18idlN1Fw0eMM34xzJDEQVhn0dvS8jeK9TNp7cXB+gghStUGyUKRJSUiv6cY0
	 DPj+I+shzwA/iPYwY1i+GSl/EF6HE5IWI4og+XSwz918rzaeQKHAMdo4A3kPzzXGev
	 hy1krySs+UafcBXjN6RSFhPLwmEHb7HxadC8le1YHvL10eoLoG+LT0fAnJaHT5XJoN
	 9OJaZe0gzNH9A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 810B517E0DE6;
	Mon, 13 Jul 2026 12:38:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	justin.yeh@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
Date: Mon, 13 Jul 2026 12:38:04 +0200
Message-ID: <20260713103805.23030-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MediaTek Kompanio Ultra (MT8196) SoC: this
chip features a DSI PHY that is similar to the one found in the
MT8183 SoC, but is a new (incremental) revision with a different
register layout.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index c6d0bbdbe0e2..9df1dbe1253b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - const: mediatek,mt2701-mipi-tx
       - const: mediatek,mt8173-mipi-tx
       - const: mediatek,mt8183-mipi-tx
+      - const: mediatek,mt8196-mipi-tx
 
   reg:
     maxItems: 1
-- 
2.54.0

