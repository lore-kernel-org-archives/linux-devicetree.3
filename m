Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460C448D12;
	Wed, 15 Jul 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116184; cv=none; b=dbCJirHsXQ/qMuB86NI0dWwx1Zr/enMe+nh5b/jqXdASBUad5YRdkVaiWyWtFHNMybPMRqJGJCiX2t3miAvdPkLu/mI6qWqFzf4SwbGPEeo9h99se5ncn8OuRLy64+gdDUfQiwixPcDU2OlgACT4xkLAn9YyeOEx578q6PitNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116184; c=relaxed/simple;
	bh=bJzAHl9f6sAB3taHCcx3NvxV8sE5Sshyk4ygxObu7Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkY6P5dUK4RzFXLMx4NcEYP4pd5uqlgZAifOyzRfxVo6nW9z6XaerZPZrlNFYPtvR9/NHsu3qrt17kbSjVbPeVtNOahCXt5EApGV2A2XSpb94KVK7yaQ3I30pJzdEtnyYQd5G3PFAEN7soJXdDDV8MPOuE83l17PyaNScQIwa20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hWfSjl+E; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hWfSjl+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116178;
	bh=bJzAHl9f6sAB3taHCcx3NvxV8sE5Sshyk4ygxObu7Ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWfSjl+EXNjyy65GV5EPT2WeQv42tzPD/cSOEZF3pJcK6pwLvQyJtCO0YyTE1Xxff
	 UD7s4Z0NhsQmH8E23wSIilgW6Th+JCCduPOIBaFBXNR8kIib2alHvbbOaMlUbPMLfb
	 L5d/dMkVky0h67OupPe+fffJF5XsOuBXJgLgEoKDzP316W5QgHuoP6XyteWdcQGdYF
	 EpLutAro4tWlq7RBYEsGGuAlorkivejis3U27N2l2ch/xIBjp9/FvSABQztK7QwPEs
	 gqOI7x3KGPY9JR/F/Nzlyndw/K1XhyhNDtpAfVRltCv8m/w4T2QQmGpEyOhH67y0Gj
	 TBpiaC2Xl6YbQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FFCF17E095B;
	Wed, 15 Jul 2026 13:49:37 +0200 (CEST)
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
Subject: [PATCH v5 10/11] dt-bindings: display: mediatek: wdma: Add compatibles for more SoCs
Date: Wed, 15 Jul 2026 13:49:15 +0200
Message-ID: <20260715114916.19690-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple MediaTek SoCs have the Write DMA hardware in their Display
Controller: add the missing compatibles for Dimensity 1200 (MT6893)
and for Kompanio 500/520/820/1200 (MT8183/MT8186/MT8192/MT8195).

Note that MT6893 is not compatible with MT8173 as it introduces
support for destination addresses larger than 32 bits by adding
one additional register for the upper 32 bits of the address.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 97d052b0fb61..c3ed867d058d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -22,11 +22,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6893-disp-wdma
           - mediatek,mt8173-disp-wdma
       - items:
           - enum:
               - mediatek,mt6795-disp-wdma
               - mediatek,mt8167-disp-wdma
+              - mediatek,mt8183-disp-wdma
+              - mediatek,mt8186-disp-wdma
+              - mediatek,mt8192-disp-wdma
+              - mediatek,mt8195-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.54.0

