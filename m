Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60800334C3D;
	Wed, 15 Jul 2026 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123833; cv=none; b=LPKzW9yGKSIeI3XpiEdzkJyCFawUBi28u9RXXgM5dFQ4uzfmnTIz2Sh3LvZNKjkBMy16/099n15I3E8J/pXCbGE4GghZ1i2X/CclxleomrPfD1/uhYtSoFZKzEswB/439LXxS5pT/+l3lpC7kCOJJ231B5jsjFLckZJ+3ZTgjTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123833; c=relaxed/simple;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jvtht/ITMyi7nGFy/8l8reyPIBYb/NjZq4x7TWpwnd934nJN+IdMhPFVtUmmgz4txApnmItH1Noq4317OCBqkbjtMevy0k1CNL3+me+DXheozZXHc/IHZnwuNuDTgLFlmU738c4GVIUmovOVlli4EktlNnjRHsIQgpnBocXa2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LJWH9mZu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LJWH9mZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784123830;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJWH9mZu3kWNHz2+QFo8/yqku09LMK/QMYUiDkq/mh9qONdpfko0lC+03HrJCcl7v
	 haFs/7BNrB+A7Pzo7NZA3qt1MeLuOWf4jRwdtgC2SjL17ptQd8vEBClKFvSIiWHF0t
	 hwuBxSlbVOi055ccpHHyakRdwJRUotL/AGCVFZxHwgeSc8MPAMgireMvhNwZ0VY5oM
	 PVChOMjdGjQfvLvC1ybtG/Y4QLXyRrCbIq5PTBZ4Iu1epItLi5hEucfdyaEo5RPmDe
	 Ipx96EfSUQbvGdXP6hoC0sxhbMRKrUO45X5zFqcpVii89quvKZEhBDtxB6towk/D9e
	 p9N9f7ElGh17w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BB1F517E0DFB;
	Wed, 15 Jul 2026 15:57:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 03/11] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Wed, 15 Jul 2026 15:56:55 +0200
Message-ID: <20260715135703.46540-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible strings for MT8189 and MT8196 SoCs.
These are compatible with the DSI IPs found in the MT8188/95 and
others, but with differences making them not fully compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 27ffbccc2a08..b5cdfe0eaca4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -30,6 +30,8 @@ properties:
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
           - mediatek,mt8188-dsi
+          - mediatek,mt8189-dsi
+          - mediatek,mt8196-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.54.0

