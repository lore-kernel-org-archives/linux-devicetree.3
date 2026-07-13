Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472183E5A2B;
	Mon, 13 Jul 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936729; cv=none; b=pjouWtg0h+hh75Dl2QRhU2PUiBXQIP5dcGAy+rXsqW10oLjVQkxIOzCNrqTIMBG3poxDAfmHKd6iksTGB45qzD1vUEaLMyHFP0VcxC9rnHsdh9NR/i0vz4V8LlB1ejyeCBDAN20KZ3QH+6HKtbDIm14QYuU/TaaiyC1LpTXP6KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936729; c=relaxed/simple;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHV6iost2OwPg3hX9Zx2uPD8X2hA1iSDv/VfAe9Jhqajp6qZZIXpfXse/eSiqQ1C+0RcuihBs42aPMTWpfw26CLgtVnESQ8I3wEZDJ/CV9JwxEmzMEtEn5vVnbcT1SbE17vZpFN6d9Ge0c/LsKrRPE/Aavh0+xlL65sov7rxbpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MC1sbQ6S; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MC1sbQ6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783936726;
	bh=xUmbeuNXP/vmDishEba9WwlN8rEC1bG4DX5W2fr1jPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MC1sbQ6SSTPjGiZQ2lqHm+GGPQA+35rRh0X1GQyNILe5VWyGJ6qypAOvsr4Rff9Og
	 Itf8KRLfcJHWPN9XwbtRPcaZX+oeQpycfZvjrTVgP16cyZfhaudSI3E8AB3eOOUWzz
	 47EgEW+XkN6486SsT1ykgHYpwM/CLRzSSZVTUZ/sBCCwVP4sIdlBRJHda6bIwJyOJr
	 0qra65lCvWSiBBvzYOLSKRN1GjE0oOwSmgy9YAlfYKQVtK7W/9f6reEJpDQ/oFvc3M
	 Oylup+hbU1acaU1d55SkPsjuWHAOIEqHjUeg2OrkpyGxmh4A+IBox/FAOBtfk3Op/R
	 q9RwNwrcxlI1g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E56F517E0DE6;
	Mon, 13 Jul 2026 11:58:45 +0200 (CEST)
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
Subject: [PATCH v2 03/10] dt-bindings: display: mediatek: dsi: Document MT8189 and MT8196
Date: Mon, 13 Jul 2026 11:58:30 +0200
Message-ID: <20260713095837.16590-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
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

